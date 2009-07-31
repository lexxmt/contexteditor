// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fBottomWindowOutputConsole;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fBottomWindowPage, StdCtrls, DosCommand, JclStrings, uCommon,
  ActnList, TB2Item, SpTBXItem, Menus, Clipbrd, uCommonClass, uMultiLanguage,
  ScrollListBox, JclFileUtils, uSafeRegistry, ShellAPI, fEditor;

type
  TCompilerOutputParsedLine = class
  private
    fFileName: string;
    fPosition: TPoint;
  public
    property FileName: string read fFileName write fFileName;
    property Position: TPoint read fPosition write fPosition;
  end;

  TfmBottomWindowOutputConsole = class(TfmBottomWindowPage)
    btnTerminate: TButton;
    acSetFont: TAction;
    TBXItem6: TSpTBXItem;
    TBXSeparatorItem3: TSpTBXSeparatorItem;
    lb: THScrollListBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure acSetFontExecute(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);
  private
    fExecTerminatedByUser :boolean;
    fScrollToLastLine: boolean;
    fParserRule: string;
    fDosCommand: TDosCommand;
    fExecuting: boolean;
    fSettingsModified: boolean;
    fListBoxFont: TFont;

    procedure OnExecNewLine(Sender: TObject; NewLine: string; OutputType: TOutputType);
    procedure OnExecTerminated(Sender: TObject);

    procedure ApplyFontSettings;
  protected
    procedure LoadSettings; override;
    procedure SaveSettings; override;

    procedure JumpToLineInSource; override;
    procedure CopySelectedLineToClipboard; override;
    procedure CopyAllToClipboard; override;
    procedure ClearContents; override;

    function JumpToLineInSourceEnabled:boolean; override;
    function CopySelectedLineToClipboardEnabled:boolean; override;
    function CopyAllToClipboardEnabled:boolean; override;
    function ClearContentsEnabled:boolean; override;
  public
    class function GetDefaultCaption:string; override;

    procedure ExecuteCommand(CmdLine:string; StartInDirectory:string);
    procedure StopExecution;

    procedure JumpToFirstLine;
    procedure JumpToLastLine;
    procedure Clear(FreeObjects: boolean);
    procedure AddCompilerMessage(s:string; IgnoreForParsing:boolean);

    property ScrollToLastLine: boolean read fScrollToLastLine write fScrollToLastLine;
    property ParserRule: string read fParserRule write fParserRule;
    property Executing: boolean read fExecuting;
  end;

procedure ExecUserCommand(ed:TfmEditor; MemoLines:TStrings; n:integer; FileName:string);
function  ExecUserGetHint(n:integer; FileName:string):string;
function GetExecDef(n:integer; FileName:string):pTUserExecDef;

implementation

uses
  fMain,
  fBottomWindowContainer;

{$R *.dfm}

const
  OUTPUT_CONSOLE_REG_KEY = BOTTOM_WINDOW_OPTIONS_REG_KEY+'OutputConsole\';


////////////////////////////////////////////////////////////////////////////////////////////
//                                Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function ExecUserGetHint(n:integer; FileName:string):string;
var
  Def   :pTUserExecDef;
begin
  Def:=GetExecDef(n, FileName);

  if not Assigned(Def) then begin
    result:='';
    EXIT;
  end;

  result := string(Def^.Hint);
end;
//------------------------------------------------------------------------------------------
function GetExecDef(n:integer; FileName:string):pTUserExecDef;
var
  ext   :string;
  s     :string;
  i     :integer;
  found :boolean;
begin
  result:=nil;

  ext:=UpperCase(ExtractFileExt(FileName));
  if (Length(ext)>0) then begin
    if (ext[1]='.') then
      Delete(ext,1,1);
  end else
    EXIT;

  i:=0;
  while (i<EditorCfg.UserExecSetCount) do begin
    s:=','+UpperCase(string(EditorCfg.UserExecCfg[i].Ext))+',';
    found:=(Pos(','+ext+',',s)>0);
    if found then begin
      result:=@EditorCfg.UserExecCfg[i].Def[n];
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
function ResolveParams(ed:TfmEditor; MemoLines:TStrings; FileName:string; StartInDir, Params:string; UseShortName:boolean):string;
var
  n        :integer;
  s        :string;
  buff     :array[0..255] of char;
  p        :PChar;
  rec      :WIN32_FIND_DATA;
  X,Y      :integer;

const
  LastPromptParams :string ='';  

  procedure Replace(SubStr,NewStr:string; var Dest:string);
  var
    n        :integer;
    min_pos  :integer;
    finished :boolean;
  begin
    min_pos:=1;
    repeat
      n:=Pos(SubStr,Dest);
      finished:=(n<min_pos);
      if not finished then begin
        Delete(Dest,n,Length(SubStr));
        Insert(NewStr,Dest,n);
        min_pos:=n+Length(NewStr);
      end;
    until finished;
  end;

  function GetFileSpecificParameters:string;
  var
    s, ss :string;
    n     :integer;
    p     :PChar;
  begin
    ss:='';
    if (MemoLines.Count>0) then begin
      s:=MemoLines[0];
      n:=Pos('%PARAMETERS',UpperCase(s));
      if (n>0) then begin
        p:=@s[n];
        while not CharInSet(p^, [#13,#10,'"',#0]) do inc(p);
        if (p^='"') then begin
          inc(p);
          while not CharInSet(p^, [#13,#10,'"',#0]) do begin
            if (p^='\') and CharInSet((p+1)^, ['\','"']) then
              inc(p);
            ss:=ss+p^;
            inc(p);
          end;
        end;
      end;
    end;

    result:=ss;
  end;

begin
  if (UseShortName) then begin
    // ime fajla
    FillChar(rec,SizeOf(rec),#0);
    FindFirstFile(PChar(FileName),rec);

    FillChar(buff,SizeOf(buff),#0);
    p:=buff;
    FileName:=ExtractFilePath(FileName);
    GetShortPathName(PChar(FileName),@buff,SizeOf(buff));

    FileName:='';
    n:=0;
    while (n<13) and (rec.cAlternateFileName[n]<>#0) do begin
      FileName:=FileName+rec.cAlternateFileName[n];
      inc(n);
    end;

    // u slucaju da je ipak kratko ime fajla
    if (Length(FileName)=0) then begin
      n:=0;
      while (n<13) and (rec.cFileName[n]<>#0) do begin
        FileName:=FileName+rec.cFileName[n];
        inc(n);
      end;
    end;

    FileName:=string(p)+FileName;
  end else begin
    Params:=' '+Params+' ';
    Replace(' %n ',' "%n" ',Params);
    Replace(' %f ',' "%f" ',Params);
    Replace(' %p ',' "%p" ',Params);
    Replace(' %s ',' "%s" ',Params);

    Params:=Trim(Params);
  end;

  Replace('%%',#255,Params);
  Replace('%n',FileName,Params);
  Replace('%f',ExtractFileName(FileName),Params);

  if (Pos('%P',Params)>0) then begin
    s:=GetFileSpecificParameters;
    Replace('%P', s, Params);
  end;

  if (Pos('%F',Params)>0) then begin
    s:=ExtractFileName(FileName);
    SetLength(s,Length(s)-Length(ExtractFileExt(FileName)));
    Replace('%F',s,Params);
  end;

  Replace('%s',StartInDir,Params);
  Replace('%p',ExtractFilePath(FileName),Params);

  if (Pos('%e',Params)>0) then begin
    s:=ExtractFileExt(FileName);
    if (Pos('.',s)=1) then Delete(s,1,1);
    Replace('%e',s,Params);
  end;

  if Assigned(ed) and ((Pos('%c',Params)>0) or (Pos('%l',Params)>0)) then begin
    ed.GetCursorPos(X,Y);
    Replace('%c',IntToStr(X+1),Params);
    Replace('%l',IntToStr(Y+1),Params);
  end;

  if Assigned(ed) then
    Replace('%w',ed.GetWordUnderCursor,Params);

  Replace(#255,'%',Params);

  repeat
    n:=Pos('%?',Params);
    if (n>0) then begin
      Delete(Params,n,2);
      s:=InputBox(mlStr(ML_USREXEC_ERR_PARAM_CAPT, 'Enter optional parameter'),
                  mlStr(ML_USREXEC_ERR_PARAM_TEXT, 'Parameter:'), LastPromptParams);
      Insert(s,Params,n);
      LastPromptParams:=s;
    end;
  until (n=0);

  result:=Params;
end;
//------------------------------------------------------------------------------------------
function Execute(App, Param, Dir :string; Window:integer):boolean;
const
  win :array[0..2] of integer = (SW_SHOWNORMAL, SW_SHOWMINIMIZED, SW_SHOWMAXIMIZED);
begin
  ShellExecute(0, 'open', PChar(App), PChar(Param), PChar(Dir), win[Window]);
  result:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure ExecUserCommand(ed:TfmEditor; MemoLines:TStrings; n:integer; FileName:string);
var
  Def     :pTUserExecDef;
  App     :string;
  Param   :string;
  StartIn :string;
  ok      :boolean;
  CurrDir :string;
  ConExecParams: string;
begin
  Def:=GetExecDef(n, FileName);
  if not Assigned(Def) or (Length(Trim(string(Def^.ExecCommand)))=0) then begin
    MessageDlg(Format(mlStr(ML_USREXEC_ERR_NO_ASSOCIATON,
                            'No user command associated with extension ''%s''.'#13#10'Use ''Environment Options / Execute Keys dialog'' to assign commands.')
                            ,[ExtractFileExt(FileName)]),
                            mtWarning,[mbOK],0);
    EXIT;
  end;

  case Def^.SaveMode of
    uesCurrentFile:
      if Assigned(ed) and ed.Modified then ed.Save;
    uesAllFiles:
      fmMain.acSaveAllFilesExecute(nil);
    uesNone:
      ;
  end;

  CurrDir:=GetCurrentDir;

  App:=QuoteFilename(ResolveParams(ed, MemoLines, FileName, StartIn, string(Def^.ExecCommand), Def^.UseShortName));
  Param:=ResolveParams(ed, MemoLines, FileName, StartIn, string(Def^.Params), Def^.UseShortName);
  StartIn:=RemoveQuote(ResolveParams(ed, MemoLines, FileName, string(Def^.StartDir), string(Def^.StartDir), Def^.UseShortName));

  if (Length(StartIn)=0) or not SetCurrentDir(StartIn) then
    StartIn:=ExtractFilePath(FileName);

  SetCurrentDir(StartIn);

  ConExecParams:='';
  if (Def^.PauseAfterExecution and not Def^.CaptureOutput) then
    ConExecParams:=ConExecParams+'-p ';
  if Def^.IdlePriority then
    ConExecParams:=ConExecParams+'-i ';

  if Def^.CaptureOutput then begin
    fmMain.ShowBottomWindow(bwOutputConsole);
    with fmBottomWindowContainer.OutputConsole do begin
      Clear(TRUE);
      ParserRule:=string(Def^.ParserRule);
      ExecuteCommand(ApplicationDir+'ConExec.exe '+ConExecParams+App+' '+Param, StartIn);

      ScrollToLastLine:=Def^.ScrollConsole;
    end;
    ok:=TRUE;
  end else begin
    if (Length(ConExecParams)=0) then
      ok:=Execute(App, Param, StartIn, Def^.Window)
    else
      ok:=Execute(ApplicationDir+'ConExec.exe', ConExecParams+App+' '+Param, StartIn, Def^.Window);
  end;

  SetCurrentDir(CurrDir);

  if not ok then begin
    ; // error
  end else begin
    if EditorCfg.ShowExecInfoDlg then begin
      MessageDlg(Format(mlStr(ML_USREXEC_FINISHED_DLG,'Finished executing ''%s''.'),[App+' '+Param]),mtInformation,[mbOK],0);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure ParseCompilerOutput(ErrLine, ParserRule:string; ParsedLine:TCompilerOutputParsedLine);
var
  ptr          :pChar;
  s,ss         :string;
  ch           :char;
  lPosition: TPoint;
  lFileName: string;

  function MatchString:boolean;
  var
    n :integer;
  begin
    if (Length(s)>0) then begin
      n:=Pos(s,ErrLine);

      if (n>0) then begin
        Delete(ErrLine,1,n+Length(s)-1);
        s:='';
      end;
    end else
      n:=1;

    result:=n>0;
  end;

  function GetStringUntilChar(chars:string):string;
  var
    n :integer;
  begin
    result:=''; n:=1;
    while (n<=Length(ErrLine)) and
          ((Pos(ErrLine[n],chars)=0) or
           ((ErrLine[n]=':') and (n+1<=Length(ErrLine)) and (ErrLine[n+1]='\'))
          ) do begin
      result:=result+ErrLine[n];
      inc(n);
    end;

    if (Length(result)>0) then
      Delete(ErrLine,1,Length(result));
  end;

  function GetLineNumber(StopChar:char):integer;
  var
    s :string;
  begin
    s:=GetStringUntilChar(StopChar+#00);
    while (Length(s)>0) and not CharInSet(s[Length(s)],['0'..'9']) do
      SetLength(s,Length(s)-1);
    result:=StrToIntDef(s,-1);
  end;

  function DeleteStringUntilStr(str:string):boolean;
  var
    n :integer;
  begin
    n:=Pos(str, ErrLine);
    result:=(Length(str)=0) or (n>0);

    if result then
      Delete(ErrLine, 1, n-1);
  end;

  function GetNextRuleChar:char;
  begin
    if (ptr^='\') then
      inc(ptr);
    result:=ptr^
  end;

begin
  lFileName:='';
  lPosition:=Point(-1, -1);

  ptr:=PChar(ParserRule);

  s:='';
  while (ptr^<>#00) and (Length(ErrLine)>0) do begin
    case ptr^ of
      '*': begin
             ss:='';
             while not CharInSet((ptr+1)^,[#00,'*','?','%']) do begin
               inc(ptr);
               ss:=ss+GetNextRuleChar;
             end;

             if DeleteStringUntilStr(ss) then
               Delete(ErrLine, 1, Length(ss))
             else
               BREAK;
           end;
      '?': begin

           end;
      '%': begin
             if ((ptr+1)^<>#00) then begin

               inc(ptr);
               case UpCase(ptr^) of
                 'N': begin
                        if MatchString then begin
                          inc(ptr);
                          ch:=GetNextRuleChar; // znak kod kojeg æemo se zaustaviti s kopiranjem
                          dec(ptr);
                          lFileName:=GetStringUntilChar(ch+#00);
                        end else
                          BREAK;
                      end;
                 'L': begin
                        if MatchString then begin
                          // (ptr+1)^ = znak kod kojeg æemo se zaustaviti s kopiranjem
                          lPosition.Y:=GetLineNumber((ptr+1)^);
                        end else
                          BREAK;
                      end;
                 'C': begin
//                        if MatchString then begin
                          // (ptr+1)^ = znak kod kojeg æemo se zaustaviti s kopiranjem
                          lPosition.X:=GetLineNumber((ptr+1)^);
//                        end else
//                          BREAK;
                      end;
               end;
             end;
           end;
      else begin
        s:=s+GetNextRuleChar;
      end;

    end;
    inc(ptr);
  end;

  ParsedLine.Position:=lPosition;
  ParsedLine.FileName:=lFileName;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
class function TfmBottomWindowOutputConsole.GetDefaultCaption: string;
begin
  result:=mlStr(ML_USREXEC_PANEL_CAPTION, 'Output Console');
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.AddCompilerMessage(s: string; IgnoreForParsing: boolean);
var
  Line: TCompilerOutputParsedLine;
begin
  // ekspandirajmo tabove
  StrReplace(s, #09, '        ', [rfReplaceAll]);

  if (not IgnoreForParsing) and (Length(s)>0) then begin
    Line:=TCompilerOutputParsedLine.Create;
    ParseCompilerOutput(s, fParserRule, Line);

    if (Length(Line.FileName)>0) then begin
      if (Length(ExtractFilePath(Line.FileName))=0) then
        Line.FileName:=PathAddSeparator(fDosCommand.CurrentDir)+Line.FileName;
    end else
      FreeAndNil(Line);
  end else
    Line:=nil;

  try
    lb.AddString(s, Line);
  except
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.Clear(FreeObjects: boolean);
var
  i: integer;
begin
  if FreeObjects then
    for i:=0 to lb.Items.Count-1 do
      if Assigned(lb.Items.Objects[i]) then
        TCompilerOutputParsedLine(lb.Items.Objects[i]).Free;

  lb.ClearList;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.ExecuteCommand(CmdLine:string; StartInDirectory:string);
begin
  if fExecuting then EXIT;
  fExecuting:=TRUE;

  { TODO : [ml] }
  AddCompilerMessage('> '+'Executing'+': '+CmdLine,TRUE);
  AddCompilerMessage('',TRUE);

  btnTerminate.Visible:=(Win32Platform=VER_PLATFORM_WIN32_NT);
  fExecTerminatedByUser:=FALSE;

  with fDosCommand do begin
    CommandLine:=CmdLine;
    CurrentDir:=StartInDirectory;
    Priority:=NORMAL_PRIORITY_CLASS;
    Execute;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.StopExecution;
begin
  fExecTerminatedByUser:=TRUE;
  fDosCommand.Stop;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.JumpToFirstLine;
begin
  if (lb.Items.Count>0) then
    lb.ItemIndex:=0;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.JumpToLastLine;
begin
  if (lb.Items.Count>0) then
    lb.ItemIndex:=lb.Items.Count-1;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.LoadSettings;
var
  reg: TSafeRegistry;
begin
  reg:=TSafeRegistry.Create;

  with reg do
    try
      if OpenKey(OUTPUT_CONSOLE_REG_KEY, FALSE) then begin
        ReadFontData('Font', fListBoxFont);
      end;
    finally
      Free;
    end;

  fSettingsModified:=FALSE;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.SaveSettings;
var
  reg: TSafeRegistry;
begin
  if fSettingsModified then begin
    reg:=TSafeRegistry.Create;

    with reg do
      try
        OpenKey(OUTPUT_CONSOLE_REG_KEY, TRUE);
        WriteFontData('Font', fListBoxFont);
      finally
        Free;
      end;
  end;
  fSettingsModified:=FALSE;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.ApplyFontSettings;
var
  str: TStringList;
  n: integer;
begin
  str:=TStringList.Create;
  try
    n:=lb.ItemIndex;
    str.Assign(lb.Items);
    Clear(FALSE);

    lb.Font.Assign(fListBoxFont);
    lb.ItemHeight:=lb.Canvas.TextHeight('Ty')+1;
    lb.Repaint;

    lb.Items.Assign(str);
    lb.ItemIndex:=n;
  finally
    str.Free;
  end;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowOutputConsole.ClearContentsEnabled: boolean;
begin
  result:=lb.Items.Count>0;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowOutputConsole.CopyAllToClipboardEnabled: boolean;
begin
  result:=lb.Items.Count>0;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowOutputConsole.CopySelectedLineToClipboardEnabled: boolean;
begin
  result:=lb.ItemIndex<>-1;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowOutputConsole.JumpToLineInSourceEnabled: boolean;
begin
  result:=(lb.ItemIndex<>-1) and Assigned(lb.Items.Objects[lb.ItemIndex]);
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.ClearContents;
begin
  Clear(TRUE);
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.CopyAllToClipboard;
var
  buff :PChar;
  str  :TStringList;
begin
  str:=TStringList.Create;
  str.Assign(lb.Items);

  if (str.Count>0) then begin
    buff:=str.GetText;
    Clipboard.SetTextBuf(buff);
    StrDispose(buff);
  end;

  str.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.CopySelectedLineToClipboard;
var
  buff :PChar;
  str  :TStringList;
begin
  if (lb.ItemIndex<>-1) then begin
    str:=TStringList.Create;
    str.Add(lb.Items[lb.ItemIndex]);
    buff:=str.GetText;
    Clipboard.SetTextBuf(buff);
    StrDispose(buff);
    str.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.JumpToLineInSource;
var
  ParsedOutput: TCompilerOutputParsedLine;
  Editor: TfmEditor;
begin
  if (lb.ItemIndex<>-1) then begin
    ParsedOutput:=TCompilerOutputParsedLine(lb.Items.Objects[lb.ItemIndex]);

    if Assigned(ParsedOutput) and fmMain.OpenFile(ParsedOutput.FileName) then begin
      Editor:=fmMain.ActiveEditor;
      if Assigned(Editor) then begin
        Editor.SetCursorPos(0, ParsedOutput.Position.Y-1);

        Editor.SetCursorPosNice;
        Editor.SetCursorOnFirstNonBlank;

        SendMessage(Editor.Handle, WM_MDIACTIVATE, Editor.Handle, 0);
        Editor.memo.SetFocus;
      end;
    end;

  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.acSetFontExecute(Sender: TObject);
begin
  with TFontDialog.Create(SELF) do
    try
      Options:=Options-[fdEffects];
      Font.Assign(fListBoxFont);
      if Execute then begin
        fListBoxFont.Assign(Font);
        ApplyFontSettings;
        fSettingsModified:=TRUE;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.OnExecNewLine(Sender: TObject; NewLine: string; OutputType: TOutputType);
begin
  if (OutputType=otEntireLine) {and (Length(NewLine)>0)} then
    AddCompilerMessage(NewLine, FALSE);
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.btnTerminateClick(Sender: TObject);
begin
  StopExecution;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.OnExecTerminated(Sender: TObject);
begin
  btnTerminate.Visible:=FALSE;

  { TODO : [ml] }
  if not fExecTerminatedByUser then
    AddCompilerMessage('> '+'Execution finished.',TRUE)
  else
    AddCompilerMessage('> '+'Execution terminated by user.',TRUE);

  if Showing then lb.SetFocus;

  if ScrollToLastLine then
    JumpToLastLine
  else
    JumpToFirstLine;

  fmMain.OnApplicationActivate(SELF);
  fExecuting:=FALSE;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.OnMouseDownEvent(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  XY :TPoint;
begin
  if (Button=mbRight) then begin
    lb.ItemIndex:=lb.ItemAtPos(Point(X,Y),FALSE);

    XY:=lb.ClientToScreen(Point(X,Y));

    if Assigned(lb.PopupMenu) then
      lb.PopupMenu.Popup(XY.X, XY.Y);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.FormCreate(Sender: TObject);
begin
  fListBoxFont:=TFont.Create;
  inherited;

  fDosCommand:=TDosCommand.Create(SELF);
  with fDosCommand do begin
    OnNewLine:=OnExecNewLine;
    OnTerminated:=OnExecTerminated;
  end;

  acSetFont.Caption:=mlStr(ML_EXEC_POP_SET_FONT, acSetFont.Caption);

  ApplyFontSettings;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowOutputConsole.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDosCommand);
  Clear(TRUE);
  inherited;

  FreeAndNil(fListBoxFont);
end;
//------------------------------------------------------------------------------------------

end.
