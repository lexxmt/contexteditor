// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFind;

interface

{$I ConTEXT.inc}

uses
  SysUtils, WinProcs, Classes, Dialogs, Messages, 
  Forms, StdCtrls, uCommon, Registry, SynEdit, Controls, SynEditSearch,
  uMultiLanguage, MainInstance, SynEditTypes, ConTEXTSynEdit, 
  SynEditRegexSearch, SynEditMiscClasses;

type
  TfmFind = class(TForm)
    gbOptions: TGroupBox;
    btnClose: TButton;
    btnFindNext: TButton;
    btnReplace: TButton;
    cbCase: TCheckBox;
    cbWholeWords: TCheckBox;
    cbReplace: TComboBox;
    labReplace: TLabel;
    cbFind: TComboBox;
    labFind: TLabel;
    cbBackward: TCheckBox;
    btnReplaceAll: TButton;
    gbOrigin: TGroupBox;
    rbOriginFromCursor: TRadioButton;
    rbOriginFromBeginning: TRadioButton;
    gbScope: TGroupBox;
    rbScopeFile: TRadioButton;
    rbScopeAllFiles: TRadioButton;
    rbScopeSelection: TRadioButton;
    cbRegExp: TCheckBox;
    SearchEngine: TSynEditSearch;
    RegExpSearchEngine: TSynEditRegexSearch;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewSearchClick(Sender: TObject);
    procedure btnFindNextClick(Sender: TObject);
    procedure AddItemToHistory;
    procedure ClearHistoryList;
    procedure cbFindChange(Sender: TObject);
    procedure btnReplaceAllClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbOriginFromBeginningClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    first_find             :boolean;
    strEditors             :TStringList;
    CurrEditor             :integer;
    LanguageApplied        :boolean;
    DlgFindCfg             :TFindDlgCfg;
    fReplaceInSelection: boolean;
    fSelBegin: TBufferCoord;
    fSelEnd: TBufferCoord;

    procedure ReplaceReset;
    function  ReplaceAll(memo:TConTEXTSynEdit):integer;
    procedure ControlsToFindCfg(var Cfg:TFindDlgCfg);
    procedure FindCfgToControls(Cfg:TFindDlgCfg);
    function  SwitchNextEditor(var memo:TConTEXTSynEdit):boolean;
    procedure InstanceFileOpenNotify(var Msg: tMessage); message wmMainInstanceOpenFile;
  public
    FindCfg                :TFindDlgCfg;
    replace_dlg            :boolean;
    F3_find                :boolean;
    last_found             :boolean;
    editor                 :TObject;
    modal_result           :TModalResult;
    MacroFindString        :string;
    LastSearchString       :string;
    UseRegExp: boolean;             

    procedure LoadConfig(root:string);
    procedure SaveConfig(reg:TRegistry; root:string);
    procedure DoFindNext(Direction:TFindDirection);
  end;

var
  fmFind          :TfmFind;

const
  from_beginning :boolean = false;

implementation

uses
  fMain, fEditor, fBottomWindowContainer, uEnvOptions;

{$R *.DFM}


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Messages
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFind.InstanceFileOpenNotify(var Msg: tMessage);
begin
  fmMain.InstanceFileOpenNotify(Msg);
end;
//------------------------------------------------------------------------------------------


{/////////////////////////////////////////////////////////////////
                         Functions
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure ShowMessage(s:string; ed:TfmEditor; TextNotFound:boolean);
begin
  if not fmMain.Macros.Playing then begin
    ed.StatusMsg:=' '+s;

    if EditorCfg.ShowFindReplaceInfoDlg then
      MessageDlg(s,mtInformation,[mbOK],0);
  end else begin
    if TextNotFound then begin
      if (MessageDlg(s+' '+mlStr(ML_FIND_MACROSTOP,'Stop macro execution?'),mtWarning,[mbYES,mbNO],0)=mrYES) then
        fmMain.Macros.StopPlayMacro;
    end;
  end;
end;
{----------------------------------------------------------------}
procedure TfmFind.ControlsToFindCfg(var Cfg:TFindDlgCfg);
begin
  if fmMain.Macros.Playing then EXIT;

  with Cfg do begin
    if rbOriginFromCursor.Checked then
      Origin:=foFromCursor
    else
      Origin:=foFromTop;

    if rbScopeSelection.Checked then
      Scope:=fsSelection
    else if rbScopeAllFiles.Checked then
      Scope:=fsAllFiles
    else
      Scope:=fsCurrentFile;

    fReplaceInSelection:=replace_dlg and (Scope=fsSelection);

    CaseSensitive:=cbCase.Checked;
    WholeWords:=cbWholeWords.Checked;
    RegExp:=cbRegExp.Checked;
    UseRegExp:=RegExp;

    if cbBackward.Checked then
      Direction:=fdPrev
    else
      Direction:=fdNext;
  end;
end;
{----------------------------------------------------------------}
procedure TfmFind.FindCfgToControls(Cfg:TFindDlgCfg);
begin
  FindCfg:=Cfg;

  with Cfg do begin
    case Origin of
      foFromCursor : rbOriginFromCursor.Checked:=TRUE;
      foFromTop    : rbOriginFromBeginning.Checked:=TRUE;
    end;

    case Scope of
      fsSelection   : rbScopeSelection.Checked:=TRUE;
      fsCurrentFile : rbScopeFile.Checked:=TRUE;
      fsAllFiles    : rbScopeAllFiles.Checked:=TRUE;
    end;

    cbCase.Checked:=CaseSensitive;
    cbWholeWords.Checked:=WholeWords;
    cbBackward.Checked:=Direction=fdPrev;
    cbRegExp.Checked:=RegExp;
  end;
end;
{----------------------------------------------------------------}


{/////////////////////////////////////////////////////////////////
                         History
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure TfmFind.LoadConfig(root:string);
var
  i   :integer;
  s   :string;
  reg :TRegistry;
begin
  ClearHistoryList;

  reg:=TRegistry.Create;

  try
    // Find history
    reg.OpenKey(root+'FindHistory',TRUE);
    for i:=0 to 7 do begin
      s:=ReadRegistryString(reg,IntToStr(i),'');
      if (s<>'') then cbFind.Items.Add(s);
    end;

    reg.OpenKey(root+'ReplaceHistory',TRUE);
    for i:=0 to 7 do begin
      s:=ReadRegistryString(reg,IntToStr(i),'');
      if (s<>'') then cbReplace.Items.Add(s);
    end;

    if EnvOptions.RememberFindCfg then begin
      // config
      reg.OpenKey(root+'Find',TRUE);
      with DlgFindCfg do begin
        Origin:=TFindOrigin(ReadRegistryInteger(reg,'Origin',0));
        Scope:=TFindScope(ReadRegistryInteger(reg,'Scope',1));
        CaseSensitive:=ReadRegistryBool(reg,'CaseSensitive',FALSE);
        WholeWords:=ReadRegistryBool(reg,'WholeWords',FALSE);
        RegExp:=ReadRegistryBool(reg,'RegExp',FALSE);
        Direction:=TFindDirection(ReadRegistryInteger(reg,'Direction',0));
      end;
    end;
  finally
    reg.Free;
  end;

  UseRegExp:=DlgFindCfg.RegExp;

  if (cbFind.Items.Count>0) then begin
    cbFind.Text:=cbFind.Items[0];
    LastSearchString:=cbFind.Items[0];
  end else begin
    cbFind.Text:='';
    LastSearchString:='';
  end;
end;
{----------------------------------------------------------------}
procedure TfmFind.SaveConfig(reg:TRegistry; root:string);
var
  i :integer;
  s :string;
begin
  // Find history
  reg.OpenKey(root+'FindHistory',TRUE);
  for i:=0 to 7 do begin
    s:='';
    if (i+1<=cbFind.Items.Count) then s:=cbFind.Items[i];
    reg.WriteString(IntToStr(i),s);
  end;

  // Replace history
  reg.OpenKey(root+'ReplaceHistory',TRUE);
  for i:=0 to 7 do begin
    s:='';
    if (i+1<=cbReplace.Items.Count) then s:=cbReplace.Items[i];
    reg.WriteString(IntToStr(i),s);
  end;

  if EnvOptions.RememberFindCfg then begin
    // config
    reg.OpenKey(root+'Find',TRUE);
    with DlgFindCfg do begin
      reg.WriteInteger('Origin',ord(Origin));
      reg.WriteInteger('Scope',ord(Scope));
      reg.WriteInteger('Direction',ord(Direction));
      reg.WriteBool('CaseSensitive',CaseSensitive);
      reg.WriteBool('WholeWords',WholeWords);
      reg.WriteBool('RegExp',RegExp);
    end;
  end;
end;
{----------------------------------------------------------------}
procedure TfmFind.ClearHistoryList;
begin
  cbFind.Clear;
  cbReplace.Clear;
  LastSearchString:='';
end;
{----------------------------------------------------------------}
procedure TfmFind.AddItemToHistory;
var
  i, ii :integer;
  found :boolean;
  s     :string;
  Combo :TComboBox;
begin
  LastSearchString:=cbFind.Text;
  for ii:=0 to 1 do begin
    if ii=0 then Combo:=cbFind else Combo:=cbReplace;
    s:=Combo.Text;
    if (Trim(s)<>'') then begin
      i:=0;
      found:=false;
      while not found and (i<=Combo.Items.Count) do begin
        found:=(s=Combo.Items[i]);
        if not found then inc(i);
      end;
      if found then Combo.Items.Delete(i);
      Combo.Items.Insert(0,s);
      Combo.Text:=s;
      while Combo.Items.Count>8 do Combo.Items.Delete(Combo.Items.Count-1);
    end;
  end;
end;
{----------------------------------------------------------------}


{/////////////////////////////////////////////////////////////////
                       Replace functions
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure TfmFind.ReplaceReset;
begin
  btnFindNext.Caption:=mlStr(ML_FIND_FIND_BTN_CAPTION, '&Find');
end;
{----------------------------------------------------------------}
function TfmFind.ReplaceAll(memo:TConTEXTSynEdit):integer;
var
  opt            :TSynSearchOptions;
  XY             :TBufferCoord;
  TopLine        :integer;
  SelBeg, SelEnd :TBufferCoord;
  LastLineLen    :integer;
  dX             :integer;
begin
  { TODO -cTEST : function TfmFind.ReplaceAll(memo:TSynEdit):integer; }
  if not Assigned(memo) then begin
    result:=0;
    EXIT;
  end;

  XY:=memo.CaretXY;
  TopLine:=memo.TopLine;
  SelBeg:=memo.BlockBegin;
  SelEnd:=memo.BlockEnd;
  LastLineLen:=Length(memo.Lines[memo.BlockEnd.Line-1]);

  opt:=[ssoReplaceAll];

  ControlsToFindCfg(FindCfg);

  if rbOriginFromBeginning.Checked then
    memo.CaretXY:=BufferCoord(1, 1);

  if FindCfg.CaseSensitive then Include(opt, ssoMatchCase);
  if FindCfg.WholeWords then Include(opt, ssoWholeWord);
  if (FindCfg.Scope=fsSelection) then Include(opt, ssoSelectedOnly);

  if FindCfg.RegExp then
    memo.SearchEngine:=RegExpSearchEngine
  else
    memo.SearchEngine:=SearchEngine;

  SetLengthyOperation(TRUE);
  try
    memo.LockPaint(TRUE);
    result:=memo.SearchReplace(cbFind.Text, cbReplace.Text,opt);
  finally
    memo.LockPaint(FALSE);
    SetLengthyOperation(FALSE);
  end;

  memo.CaretXY:=XY;
  memo.TopLine:=TopLine;
  dX:=(Length(memo.Lines[SelEnd.Line-1])-LastLineLen);

  if (FindCfg.Scope=fsSelection) then begin
    memo.BlockBegin:=SelBeg;
    memo.BlockEnd:=BufferCoord(SelEnd.Char+dX, SelEnd.Line);
    if (XY.Line=SelEnd.Line) then
      memo.CaretXY:=BufferCoord(XY.Char+dX, XY.Line);
  end;
end;
{----------------------------------------------------------------}
function TfmFind.SwitchNextEditor(var memo:TConTEXTSynEdit):boolean;
begin
  { TODO -cTEST : function TfmFind.SwitchNextEditor(var memo:TSynEdit):boolean; }
  result:=CurrEditor<strEditors.Count-1;
  if result then begin

    with TfmEditor(editor).memo do
      BlockEnd:=BlockBegin;    

    inc(CurrEditor);
    editor:=strEditors.Objects[CurrEditor];
    memo:=TfmEditor(editor).memo;
    TfmEditor(editor).BringToFront;

    memo.CaretXY:=BufferCoord(1, 1);
  end;
end;
{----------------------------------------------------------------}

{/////////////////////////////////////////////////////////////////
                         Button events
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure TfmFind.DoFindNext(Direction:TFindDirection);
var
  opt      :TSynSearchOptions;
  memo     :TConTEXTSynEdit;
  n: integer;
  ed       :TfmEditor;
  find_all :boolean;
  SelMode  :TSynSelectionMode;
begin
  memo:=TfmEditor(editor).memo;
  memo.DisableAutoTrimLine:=TRUE;

  if (first_find and (FindCfg.Origin=foFromTop) and not F3_find) then begin
    memo.CaretXY:=BufferCoord(1, 1);
  end else begin
    if (memo.SelAvail) and (UpperCase(memo.SelText)=UpperCase(cbFind.Text)) then begin
      case Direction of
        fdNext:
          memo.CaretXY:=memo.BlockEnd;
        fdPrev:
          memo.CaretXY:=memo.BlockBegin;
      end;
    end;
  end;

  TfmEditor(editor).RemoveSelection;
  SelMode:=memo.SelectionMode;
  memo.SelectionMode:=smNormal;

  first_find:=FALSE;

  opt:=[];
  if FindCfg.CaseSensitive then
    Include(opt, ssoMatchCase);

  if FindCfg.WholeWords then
    Include(opt, ssoWholeWord);

  if (Direction=fdPrev) then
    Include(opt, ssoBackwards);

  if FindCfg.RegExp then begin
    memo.SearchEngine:=RegExpSearchEngine;
    Include(opt, ssoRegExp);
  end else
    memo.SearchEngine:=SearchEngine;

  find_all:=(FindCfg.Scope=fsAllFiles) and not F3_find and not replace_dlg;
  LastSearchString:=cbFind.Text;

  if not find_all then begin
    if (FindCfg.Scope=fsAllFiles) and not F3_find then begin
      repeat
        last_found:=memo.SearchReplace(cbFind.Text,'',opt)>0;
      until last_found or not SwitchNextEditor(memo);
    end else
      last_found:=memo.SearchReplace(cbFind.Text,'',opt)>0;

    if last_found then begin
      if (FindCfg.Direction=fdNext) then begin
        // ako je rezultat u donjoj petini ekrana, centriraj prikaz
        TfmEditor(editor).SetCursorPosNice;
      end else
        memo.EnsureCursorPosVisible
    end;

  end else begin
    last_found:=FALSE;
    fmMain.ShowBottomWindow(bwSearchResults);
    fmBottomWindowContainer.SearchResults.ClearContents;
    n:=0;
    while fmMain.Enum(ed,n) do begin
      if FindCfg.RegExp then
        ed.memo.SearchEngine:=RegExpSearchEngine
      else
        ed.memo.SearchEngine:=SearchEngine;

      if ed.FindAllOccurences(cbFind.Text, opt) then
        last_found:=TRUE;
    end;

    fmBottomWindowContainer.SearchResults.SelectFirstItem;
  end;

  if not last_found then
    ShowMessage(Format(mlStr(ML_FIND_NOT_FOUND,'Search string ''%s'' not found.'),[MakeDoubleAmpersand(cbFind.Text)]),TfmEditor(editor), TRUE);

  AddItemToHistory;
  if not replace_dlg then begin
    if fmFind.Showing then
      Close;
  end else
    btnFindNext.Caption:=mlStr(ML_FIND_FINDNEXT_BTN_CAPTION,'&Find Next');

  memo.SelectionMode:=SelMode;

  memo.DisableAutoTrimLine:=FALSE;
end;
{----------------------------------------------------------------}
procedure TfmFind.btnFindNextClick(Sender: TObject);
begin
  ControlsToFindCfg(FindCfg);
  DoFindNext(FindCfg.Direction);
{
  if fReplaceInSelection then begin
    with TfmEditor(editor).memo do begin
      if (RowColToCharIndex(CaretXY)>=RowColToCharIndex(fSelEnd)) then
        last_found:=FALSE;
    end;
  end;
}  
end;
{----------------------------------------------------------------}
procedure TfmFind.btnReplaceClick(Sender: TObject);
var
  XY: TBufferCoord;
  old_ShowFindReplaceInfoDlg: boolean;
begin
  if last_found then
    with TfmEditor(editor).memo do begin
      SelText:=cbReplace.Text;
      BlockBegin:=CaretXY;
      XY:=BlockBegin;
      dec(XY.Char, Length(cbReplace.Text));
      BlockEnd:=XY;

      old_ShowFindReplaceInfoDlg:=EditorCfg.ShowFindReplaceInfoDlg;
      EditorCfg.ShowFindReplaceInfoDlg:=FALSE;

      CaretXY:=BlockEnd;
      btnFindNextClick(SELF);

      EditorCfg.ShowFindReplaceInfoDlg:=old_ShowFindReplaceInfoDlg;
    end;
end;
{----------------------------------------------------------------}
procedure TfmFind.btnReplaceAllClick(Sender: TObject);
var
  n,count        :integer;
  ed             :TfmEditor;
begin
  if rbScopeAllFiles.Checked then begin
    rbOriginFromBeginning.Checked:=TRUE;

    n:=0;
    count:=0;
    while fmMain.Enum(ed,n) do
      count:=count+ReplaceAll(ed.memo);
  end else begin
    count:=ReplaceAll(TfmEditor(editor).memo);
  end;

  if (count=0) then
    ShowMessage(Format(mlStr(ML_FIND_NOT_FOUND,'Search string ''%s'' not found.'),[MakeDoubleAmpersand(cbFind.Text)]),TfmEditor(editor), TRUE)
  else
    ShowMessage(Format(mlStr(ML_FIND_REPLACE_REPORT,'Replaced %d occurences of ''%s'' with ''%s''.'),
                       [count, MakeDoubleAmpersand(cbFind.Text), MakeDoubleAmpersand(cbReplace.Text)]),TfmEditor(editor), FALSE);
end;
{----------------------------------------------------------------}
procedure TfmFind.btnNewSearchClick(Sender: TObject);
begin
  AddItemToHistory;
  cbFind.Text:='';
  cbReplace.Text:='';
  cbFindChange(self);
  cbFind.SetFocus;
end;
{----------------------------------------------------------------}
procedure TfmFind.btnCloseClick(Sender: TObject);
begin
  modal_result:=mrCancel;

  AddItemToHistory;
  Close;
end;
{----------------------------------------------------------------}


{/////////////////////////////////////////////////////////////////
                         Other events
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure TfmFind.cbFindChange(Sender: TObject);
begin
  btnFindNext.Enabled:=Length(cbFind.Text)>0;
  ReplaceReset;
end;
{----------------------------------------------------------------}
procedure TfmFind.rbOriginFromBeginningClick(Sender: TObject);
begin
  first_find:=TRUE;
end;
{----------------------------------------------------------------}



{/////////////////////////////////////////////////////////////////
                         Form events
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure TfmFind.FormCreate(Sender: TObject);
begin
end;
{----------------------------------------------------------------}
procedure TfmFind.FormShow(Sender: TObject);
var
  ss :string;
  ed :TfmEditor;
  n  :integer;

  function GetSelectedTextForSearch:string;
  var
    s:string;
  begin
    s:=TfmEditor(editor).memo.SelText;
    if (Length(s)>0) and (Pos(#13#10,s)>0) then
      s:='';
    result:=s;
  end;

  // koristimo ovu funkciju jer nam treba case-insensitive pretraga
  function GetFindComboStringIndex(S: string): integer;
  var
    i: integer;
  begin
    i:=0;
    result:=-1;
    while (i<cbFind.Items.Count) do begin
      if (S=cbFind.Items[i]) then begin
        result:=i;
        BREAK;
      end;
      inc(i);
    end;
  end;

begin
  if not LanguageApplied then begin
    mlApplyLanguageToForm(SELF, Name);
    LanguageApplied:=TRUE;
  end;

  cbReplace.Visible:=replace_dlg;
  btnReplace.Visible:=replace_dlg;
  btnReplaceAll.Visible:=replace_dlg;
  labReplace.Visible:=btnReplace.Visible;
  cbBackward.Visible:=not replace_dlg;

  if replace_dlg then begin
    Caption:=mlStr(ML_FIND_CAPT_REPLACE,'Replace Text');
    gbOptions.Top:=cbReplace.Top+cbReplace.Height+5;
    btnReplaceAll.Top:=btnReplace.Top+btnReplace.Height+5;
    btnClose.Top:=btnReplaceAll.Top+btnReplaceAll.Height+5;
  end else begin
    Caption:=mlStr(ML_FIND_CAPT_FIND,'Find Text');
    gbOptions.Top:=cbReplace.Top;
    btnClose.Top:=btnFindNext.Top+btnFindNext.Height+5;
  end;

  FindCfgToControls(DlgFindCfg);
  rbScopeSelection.Enabled:=replace_dlg and (TfmEditor(editor).SelAvail);

  if rbScopeSelection.Enabled then begin
    fSelBegin:=TfmEditor(editor).memo.BlockBegin;
    fSelEnd:=TfmEditor(editor).memo.BlockEnd;
  end else begin
    fSelBegin:=BufferCoord(0, 0);
    fSelEnd:=BufferCoord(0, 0);
  end;

  if rbScopeSelection.Enabled then
    rbScopeSelection.Checked:=TRUE
  else
    rbScopeFile.Checked:=TRUE;

  gbOrigin.Top:=gbOptions.Top;
  gbScope.Top:=gbOptions.Top+gbOptions.Height-gbScope.Height;

  ClientHeight:=gbOptions.Top+gbOptions.Height+8;

  ReplaceReset;

  F3_find:=FALSE;
  first_find:=TRUE;
  btnNewSearchClick(SELF);

  if (Length(MacroFindString)=0) then begin
    ss:=GetSelectedTextForSearch;
    if (Length(ss)=0) and EditorCfg.FindTextAtCursor then
      ss:=TfmEditor(editor).GetWordUnderCursor;

    if (Length(ss)=0) then
      ss:=LastSearchString;
  end else
    ss:=MacroFindString;

  n:=GetFindComboStringIndex(ss);
  if (n>-1) then
    cbFind.ItemIndex:=n
  else
    cbFind.Text:=ss;

  cbReplace.ItemIndex:=0;

  cbFindChange(SELF);

  cbFind.SetFocus;
  cbFind.SelectAll;

  strEditors:=TStringList.Create;
  n:=0;
  while fmMain.Enum(ed,n) do
    strEditors.AddObject('',ed);
  CurrEditor:=0;

  modal_result:=mrOK;
end;
{----------------------------------------------------------------}
procedure TfmFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DlgFindCfg:=FindCfg;

  if Assigned(strEditors) then begin
    strEditors.Free;
    strEditors:=nil;
  end;

  MacroFindString:='';
end;
{----------------------------------------------------------------}

end.
