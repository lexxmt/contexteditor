// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFileCompareResults;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ActnList, uCommon, ImgList, Registry,
  fFileCompareSettings, JclFileUtils, uMultiLanguage, ExtCtrls, TB2Item,
  TBX, TB2Dock, TB2Toolbar, rmMyDiff;

type
  TFileCompareInfo = class
  private
    fFileName: string;
    fSource: TFileCompareFileSelection;
    fEditor: TObject;
    fValid: boolean;
  public
    constructor Create(FileName: string; Source: TFileCompareFileSelection; Editor: TObject);
    property FileName: string read fFileName;
    property Source: TFileCompareFileSelection read fSource;
    property Editor: TObject read fEditor;
    property Valid: boolean read fValid write fValid;
  end;

  TfmFileCompareResults = class(TForm)
    pbDiff: TProgressBar;
    alCompareResults: TActionList;
    acFirst: TAction;
    acLast: TAction;
    acNext: TAction;
    acPrev: TAction;
    acClose: TAction;
    acRecompare: TAction;
    TBXDock1: TTBXDock;
    TBXToolbar1: TTBXToolbar;
    TBXItem1: TTBXItem;
    TBXItem2: TTBXItem;
    TBXItem3: TTBXItem;
    TBXItem4: TTBXItem;
    TBXItem5: TTBXItem;
    TBXItem6: TTBXItem;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBXSeparatorItem2: TTBXSeparatorItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acFirstExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acPrevExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRecompareExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    fDiffEngine: TrmMyDiffEngine;
    fDiffViewer: TrmMyDiffViewer;
    fFile1: TStream;
    fFile2: TStream;
    fFile1Info: TFileCompareInfo;
    fFile2Info: TFileCompareInfo;
    fExecuting: boolean;

    procedure OnListControlDblClick(Sender: TObject; Panel: TDiffPanel; DiffLine: TrmDiffLine);
    procedure OnDiffProgressEvent(PercentComplete: integer);
    procedure DoEditorOpeningNotification(Editor: TObject);
    procedure DoEditorClosingNotification(Editor: TObject);
    procedure LoadSettings;
    procedure SaveSettings;
    function  CreateStreams: boolean;
    function  CreateStream(Selection: TFileCompareFileSelection; EditingFileName: string; FileFromDiskName: string; Editor: TObject): TStream;
    procedure SetFile1Name(const Value: string);
    procedure SetFile2Name(const Value: string);
    procedure SetFile1Info(const Value: TFileCompareInfo);
    procedure SetFile2Info(const Value: TFileCompareInfo);
    procedure SetExecuting(const Value: boolean);

    property File1Name: string write SetFile1Name;
    property File2Name: string write SetFile2Name;
    property Executing: boolean read fExecuting write SetExecuting;
  protected
    fSettings: TFileCompareSettings;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SettingsToDiffEngine;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute(const Settings: TFileCompareSettings = nil);

    property File1Info: TFileCompareInfo read fFile1Info write SetFile1Info;
    property File2Info: TFileCompareInfo read fFile2Info write SetFile2Info;
  end;

var
  fmFileCompareResults: TfmFileCompareResults;

implementation

uses
  fMain, fEditor;

{$R *.dfm}

type
  TMyForm = class(TForm);

////////////////////////////////////////////////////////////////////////////////////////////
//                                     Static
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function CreateFileNameCaption(Value: TFileCompareInfo): string;
begin
  if Assigned(Value) then begin
    result:=Value.FileName;
    if (Value.Source in [fsCurrent, fsEditingFile]) then
      result:=result+' [EDITOR]';
  end else
    result:='';
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Messages
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_ACTIVATE_MAIN_WINDOW:
      SetActiveWindow(fmMain.Handle);
    WM_EDITING_FILE_OPENING:
      DoEditorOpeningNotification(TObject(Message.LParam));
    WM_EDITING_FILE_CLOSING:
      DoEditorClosingNotification(TObject(Message.LParam));
    else
      inherited;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFileCompareInfo.Create(FileName: string; Source: TFileCompareFileSelection; Editor: TObject);
begin
  fFileName:=FileName;
  fSource:=Source;
  fEditor:=Editor;
  fValid:=TRUE;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SetFile1Name(const Value: string);
begin
  fDiffViewer.Src1Label:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SetFile2Name(const Value: string);
begin
  fDiffViewer.Src2Label:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SetFile1Info(const Value: TFileCompareInfo);
begin
  if (fFile1Info<>Value) then begin
    if Assigned(fFile1Info) then
      FreeAndNil(fFile1Info);
    fFile1Info:=Value;
    File1Name:=CreateFileNameCaption(Value);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SetFile2Info(const Value: TFileCompareInfo);
begin
  if (fFile2Info<>Value) then begin
    if Assigned(fFile2Info) then
      FreeAndNil(fFile2Info);
    fFile2Info:=Value;
    File2Name:=CreateFileNameCaption(Value);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SetExecuting(const Value: boolean);
begin
  if (fExecuting<>Value) then begin
    fExecuting:=Value;

    if Value then
      Screen.Cursor:=crHourGlass
    else
      Screen.Cursor:=crDefault;

    acRecompare.Enabled:=not Value;
    acFirst.Enabled:=not Value;
    acLast.Enabled:=not Value;
    acNext.Enabled:=not Value;
    acPrev.Enabled:=not Value;

    pbDiff.Position:=0;
    pbDiff.Visible:=Value;
    Application.ProcessMessages;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.LoadSettings;
var
  WinPos: TWindowPlacement;
  Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
  if Reg.OpenKey(FILE_COMPARE_REG_KEY, TRUE) then begin
    WinPos.length:=SizeOf(TWindowPlacement);
    GetWindowPlacement(Handle, @WinPos);
    with WinPos.rcNormalPosition do begin
      Left:=ReadRegistryInteger(Reg, 'Left', Left);
      Top:=ReadRegistryInteger(Reg, 'Top', Top);
      Right:=ReadRegistryInteger(Reg, 'Width', Width)+Left;
      Bottom:=ReadRegistryInteger(Reg, 'Height', Height)+Top;
    end;
    WinPos.showCmd:=SW_HIDE;       // da ne bljesne pri maksimizaciji
    SetWindowPlacement(Handle, @WinPos);

    if ReadRegistryBool(Reg, 'Maximized', WindowState=wsMaximized) then
      WindowState:=wsMaximized;
  end;
  Reg.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SaveSettings;
var
  WinPos: TWindowPlacement;
begin
  with TRegistry.Create do
    try
      if OpenKey(FILE_COMPARE_REG_KEY, TRUE) then begin
        WinPos.length:=SizeOf(TWindowPlacement);
        GetWindowPlacement(Handle, @WinPos);
        with WinPos.rcNormalPosition do begin
          WriteInteger('Left', Left);
          WriteInteger('Top', Top);
          WriteInteger('Width', Right-Left);
          WriteInteger('Height', Bottom-Top);
          WriteBool('Maximized', WindowState=wsMaximized);
        end;
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.SettingsToDiffEngine;
var
  diff_options: TrmDiffOptions;
  ignore_chars: TrmCharacterSet;
  i: integer;
begin
  with fDiffEngine do begin
    diff_options:=[];
    if fSettings.CaseSensitive then Include(diff_options, fdoCaseSensitive);
    if fSettings.IgnoreCharacters then Include(diff_options, fdoIgnoreCharacters);
    if fSettings.IgnoreTrailingWhiteSpace then Include(diff_options, fdoIgnoreTrailingWhiteSpace);
    if fSettings.IgnoreLeadingWhiteSpace then Include(diff_options, fdoIgnoreLeadingWhiteSpace);
    DiffOptions:=diff_options;

    LineNumbers:=fSettings.LineNumbers;
    // property IgnoreCharactersStr: string read fIgnoreCharactersStr write fIgnoreCharactersStr;
    MatchDepth:=fSettings.MatchDepth;

    ignore_chars:=[];
    for i:=1 to Length(fSettings.IgnoreCharactersStr) do
      Include(ignore_chars, fSettings.IgnoreCharactersStr[i]);
    IgnoreCharacters:=ignore_chars;

    TabWidth:=EditorCfg.TabWidth;
  end;

  with fDiffViewer do begin
    SimpleDiffViewer:=fSettings.SimpleViewer;
    ChangedTextColor:=fSettings.ChangedTextColor;
    ChangedBGColor:=fSettings.ChangedBGColor;
    DeletedTextColor:=fSettings.DeletedTextColor;
    DeletedBGColor:=fSettings.DeletedBGColor;
    InsertedTextColor:=fSettings.InsertedTextColor;
    InsertedBGColor:=fSettings.InsertedBGColor;
    EmptyBGColor:=fSettings.EmptyBGColor;
    Font.Name:=fSettings.FontName;
    Font.Size:=fSettings.FontSize;
  end;
end;
//------------------------------------------------------------------------------------------
function TfmFileCompareResults.CreateStream(Selection: TFileCompareFileSelection; EditingFileName: string; FileFromDiskName: string; Editor: TObject): TStream;
var
  FileName: string;
begin
  result:=nil;
  FileName:='';

  case Selection of
    fsCurrent:
      if (fmMain.ActiveEditor<>nil) then begin
        result:=TStringStream.Create(fmMain.ActiveEditor.memo.Lines.Text);
        FileName:=fmMain.ActiveEditor.FileName;
      end;
    fsEditingFile:
      begin
        if Assigned(Editor) then begin
          result:=TStringStream.Create(TfmEditor(Editor).memo.Lines.Text);
        end;
        {
        FileName:=GetFileLongName(EditingFileName);
        ed:=fmMain.FindOpenedFile(FileName);
        if (ed<>nil) then
          result:=TStringStream.Create(ed.memo.Lines.Text);
        }
      end;
    fsFileFromDisk:
      begin
        FileName:=FileFromDiskName;
        if FileExists(FileName) then begin
          try
            result:=TFileStream.Create(FileName, fmOpenRead+fmShareDenyNone);
          except
            FreeAndNil(result);
          end;
        end;
        if not Assigned(result) then
          DlgErrorOpenFile(FileName, Handle);
      end;
  end;
end;
//------------------------------------------------------------------------------------------
function TfmFileCompareResults.CreateStreams: boolean;

  procedure CheckFileInfo(FileInfo: TFileCompareInfo);
  begin
    if (not FileInfo.Valid) and (FileInfo.Source=fsEditingFile) then begin
      fmMain.OpenFile(FileInfo.FileName);
      SetFocus;
    end;
  end;

begin
  result:=FALSE;
  if Assigned(fSettings) then begin

    CheckFileInfo(File1Info);
    CheckFileInfo(File2Info);

    with fSettings do begin
      fFile1:=CreateStream(File1Selection, File1EditingFileName, File1FromDiskFileName, fFile1Info.Editor);
      if Assigned(fFile1) then begin
        fFile2:=CreateStream(File2Selection, File2EditingFileName, File2FromDiskFileName, fFile2Info.Editor);
        if not Assigned(fFile2) then begin
          FreeAndNil(fFile1);
          // error stream 2
        end else
          result:=TRUE;
      end else begin
        // error stream 1
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.Execute(const Settings: TFileCompareSettings = nil);
begin
  if Assigned(Settings) then
    fSettings.Assign(Settings);

  SettingsToDiffEngine;

  if CreateStreams then begin
    Executing:=TRUE;
    try
      fDiffEngine.CompareStreams(fFile1, fFile2);

      if Assigned(fFile1) then
        FreeAndNil(fFile1);
      if Assigned(fFile2) then
        FreeAndNil(fFile2);
    finally
      Executing:=FALSE;
    end;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.acFirstExecute(Sender: TObject);
begin
  fDiffViewer.FirstDiff;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.acLastExecute(Sender: TObject);
begin
  fDiffViewer.LastDiff;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.acNextExecute(Sender: TObject);
begin
  fDiffViewer.NextDiff;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.acPrevExecute(Sender: TObject);
begin
  fDiffViewer.PrevDiff;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.acRecompareExecute(Sender: TObject);
begin
  Execute(nil);
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.acCloseExecute(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.OnDiffProgressEvent(PercentComplete: integer);
begin
  pbDiff.Position:=PercentComplete;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.OnListControlDblClick(Sender: TObject;
  Panel: TDiffPanel; DiffLine: TrmDiffLine);
var
  ed: TfmEditor;
  ok: boolean;
begin
  if Assigned(DiffLine) then begin
    if (Panel=dpLeft) then begin
      if Assigned(File1Info.Editor) and (File1Info.Valid) then begin
        BringEditorToFront(TfmEditor(File1Info.Editor));
        ok:=TRUE;
      end else
        ok:=fmMain.OpenFile(File1Info.FileName)
    end else begin
      if Assigned(File2Info.Editor) and (File2Info.Valid) then begin
        BringEditorToFront(TfmEditor(File2Info.Editor));
        ok:=TRUE;
      end else
        ok:=fmMain.OpenFile(File2Info.FileName)
    end;

    if ok then begin
      ed:=fmMain.ActiveEditor;
      if Assigned(ed) then begin
        ed.SetCursorPos(0, DiffLine.Index-1);
        ed.SetCursorPosNice;
        ed.SetCursorOnFirstNonBlank;
        PostMessage(Handle, WM_ACTIVATE_MAIN_WINDOW, 0, 0);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.DoEditorOpeningNotification(Editor: TObject);

  procedure CheckFileInfo(FileInfo: TFileCompareInfo);
  begin
    if Assigned(Editor) and Assigned(FileInfo) and (FileInfo.Source=fsEditingFile) and
       (UpperCase(FileInfo.FileName)=UpperCase(TfmEditor(Editor).FileName)) then begin
      FileInfo.fEditor:=Editor;
      FileInfo.Valid:=TRUE;
    end;
  end;

begin
  CheckFileInfo(File1Info);
  CheckFileInfo(File2Info);
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.DoEditorClosingNotification(Editor: TObject);

  procedure CheckFileInfo(FileInfo: TFileCompareInfo);
  begin
    if Assigned(Editor) and Assigned(FileInfo) and (FileInfo.Editor=Editor) then
      FileInfo.Valid:=FALSE;
  end;

begin
  CheckFileInfo(File1Info);
  CheckFileInfo(File2Info);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent:=GetDesktopWindow;
end;
//------------------------------------------------------------------------------------------
constructor TfmFileCompareResults.Create(AOwner: TComponent);
begin
  inherited;
  mlApplyLanguageToForm(SELF, Name);

  fSettings:=TFileCompareSettings.Create;

  fDiffEngine:=TrmMyDiffEngine.Create(SELF);
  with fDiffEngine do begin
    OnDiffProgress:=OnDiffProgressEvent;
  end;

  fDiffViewer:=TrmMyDiffViewer.Create(SELF);
  with fDiffViewer do begin
    DiffEngine:=fDiffEngine;
    OnDblClick:=OnListControlDblClick;
    Align:=alClient;
    Parent:=SELF;
    Loaded;
  end;

  LoadSettings;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.FormActivate(Sender: TObject);
begin
  // nešto se èudno dogaða kad se fokusira kontrola, zbrljave se scrollbarovi
 //fDiffViewer.UpdateScrollBars;
  // pogubi se fokus i ne radi mousewheel pa s ovim krpamo
  PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareResults.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;
//------------------------------------------------------------------------------------------
destructor TfmFileCompareResults.Destroy;
begin
  SaveSettings;

  FreeAndNil(fDiffViewer);
  FreeAndNil(fDiffEngine);
  FreeAndNil(fSettings);

  fmFileCompareResults:=nil;

  if Assigned(fFile1Info) then
    FreeAndNil(fFile1Info);

  if Assigned(fFile2Info) then
    FreeAndNil(fFile2Info);

  if Assigned(fFile1) then
    FreeAndNil(fFile1);

  if Assigned(fFile2) then
    FreeAndNil(fFile2);

  inherited;
end;
//------------------------------------------------------------------------------------------

end.

