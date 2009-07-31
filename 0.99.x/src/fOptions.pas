// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fOptions;

interface

{$I ConTEXT.inc}

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  StdCtrls,
  SynEditHighlighter,
  HexEdits,
  ExtCtrls,
  Registry,
  FontCtls,
  SynEdit,
  uCommon,
  MILAssociate,
  FileCtrl,
  uMultiLanguage,
  MainInstance,
  ColorPicker,
  Buttons,
  SynHighlighterMyGeneral;

type
  TfmOptions = class(TForm)
    pcOptions: TPageControl;
    pgGeneral: TTabSheet;
    pgColors: TTabSheet;
    pgEditor: TTabSheet;
    btnOK: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    lbHLItems: TListBox;
    cbHL: TComboBox;
    labHighlighter: TLabel;
    cbAutoIndent: TCheckBox;
    cbFindTextAtCursor: TCheckBox;
    labTabWidth: TLabel;
    eTabWidth: THexEdit;
    spinTabWidth: TUpDown;
    labInsertCaret: TLabel;
    cbInsertCaretShape: TComboBox;
    cbEditorFont: TFontComboBox;
    labFont: TLabel;
    labFontSize: TLabel;
    eFontSize: THexEdit;
    spinFontSize: TUpDown;
    pnFontSample: TPanel;
    cbDragDropEditing: TCheckBox;
    labOverwriteCaret: TLabel;
    cbOverwriteCaretShape: TComboBox;
    spinExtraLineSpacing: TUpDown;
    eExtraLineSpacing: THexEdit;
    labLineSpacing: TLabel;
    labRightMargin: TLabel;
    eRightEdge: THexEdit;
    spinRightEdge: TUpDown;
    cbBackupFile: TCheckBox;
    pnSampleColor: TPanel;
    labBlockIndent: TLabel;
    eBlockIndent: THexEdit;
    spinBlockIndent: TUpDown;
    cbSaveFilePositions: TCheckBox;
    pgExecKeys: TTabSheet;
    btnExecExtAdd: TButton;
    btnExecExtDelete: TButton;
    Bevel1: TBevel;
    labExecOptParameters: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    labExecParam_ff: TLabel;
    labExecParam_f: TLabel;
    labExecParam_n: TLabel;
    labExecParam_opt1: TLabel;
    Label27: TLabel;
    btnExecExtEdit: TButton;
    treeExec: TTreeView;
    assExt: TMILAssociate;
    cbLineNumbers: TCheckBox;
    cbUndoAfterSave: TCheckBox;
    labExecParam_p: TLabel;
    Label31: TLabel;
    labExecParam_percent: TLabel;
    Label24: TLabel;
    cbDetectFileChanges: TCheckBox;
    cbUnderline: TCheckBox;
    cbItalic: TCheckBox;
    cbBold: TCheckBox;
    cbHighlightCurrentLine: TCheckBox;
    cbShowFindReplaceInfoDlg: TCheckBox;
    cbAutoUpdateChangedFiles: TCheckBox;
    cbCursorAfterEOL: TCheckBox;
    cbEnhanceHomeKey: TCheckBox;
    labLanguage: TLabel;
    cbLanguage: TComboBox;
    pgAssociations: TTabSheet;
    gbFileAssociations: TGroupBox;
    labFileAssociationsHelp: TLabel;
    lbAssoc: TListBox;
    btnExtAdd: TButton;
    btnExtRemove: TButton;
    pnAssocWait: TPanel;
    cbMinimizeIfNoFiles: TCheckBox;
    labTabsMode: TLabel;
    cbTabsMode: TComboBox;
    cbFgColor: TColorBtn;
    cbBgColor: TColorBtn;
    labFg: TLabel;
    labBg: TLabel;
    pgMisc: TTabSheet;
    eBackupDir: TEdit;
    btnBackupDirBrowse: TButton;
    rbBackupDirCurrent: TRadioButton;
    rbBackupDirSelect: TRadioButton;
    cbHideMouseWhenTyping: TCheckBox;
    labDefaultSQLDialect: TLabel;
    cbSQLDialect: TComboBox;
    labCJavaBlockIndent: TLabel;
    spinCJavaBlockIndent: TUpDown;
    eCJavaBlockIndent: THexEdit;
    cbShowExecInfoDlg: TCheckBox;
    gbHelpFiles: TGroupBox;
    lvHelpFiles: TListView;
    btnHelpFileEdit: TButton;
    cbRememberLastDir: TCheckBox;
    cbAllowMultipleInstances: TCheckBox;
    pnExecEditControls: TPanel;
    labExecute: TLabel;
    labExecParameters: TLabel;
    labExecHint: TLabel;
    labExecWindow: TLabel;
    labExecStartDir: TLabel;
    btnExecBrowse: TButton;
    eExecParams: TEdit;
    eExecHint: TEdit;
    cbExecWindow: TComboBox;
    eExecStartDir: TEdit;
    cbExecCaptureOutput: TCheckBox;
    cbExecUseShortNames: TCheckBox;
    cbMinimizeToTray: TCheckBox;
    cbVisibleFileTabsIcons: TCheckBox;
    Label1: TLabel;
    labExecParam_s: TLabel;
    cbRememberFindOptions: TCheckBox;
    eExecCommand: TEdit;
    cbMultiLineTabs: TCheckBox;
    eCompilerParserRule: TEdit;
    labExecParserRule: TLabel;
    btnCompilerParserRuleHelp: TSpeedButton;
    cbDosBackupFilename: TCheckBox;
    btnHelpFileClear: TButton;
    labExecSave: TLabel;
    cbExecSaveMode: TComboBox;
    imgExternalHL: TImage;
    imgInternalHL: TImage;
    Label3: TLabel;
    labExecParam_e: TLabel;
    Label4: TLabel;
    labExecParam_c: TLabel;
    Label6: TLabel;
    labExecParam_l: TLabel;
    Label8: TLabel;
    labExecParam_w: TLabel;
    gbNewDocSettings: TGroupBox;
    labNewDocHighlighter: TLabel;
    cbNewDocHighlighter: TComboBox;
    labNewDocFileFormat: TLabel;
    cbNewDocFormat: TComboBox;
    cbTrimTrailingSpaces: TCheckBox;
    Label5: TLabel;
    labExecParam_pp: TLabel;
    cbOverrideTxtFgColor: TCheckBox;
    gbGutter: TGroupBox;
    labGutterWidth: TLabel;
    eGutterWidth: THexEdit;
    spinGutterWidth: TUpDown;
    cbGutterVisible: TCheckBox;
    labFont2: TLabel;
    labFontSize2: TLabel;
    cbGutterFont: TFontComboBox;
    eGutterFontSize: THexEdit;
    spinGutterFontSize: TUpDown;
    labWhenStarted: TLabel;
    cbWhenStarted: TComboBox;
    cbExecScrollConsole: TCheckBox;
    labHLBlockBegin: TLabel;
    eHLBlockBegin: TEdit;
    labHLBlockEnd: TLabel;
    eHLBlockEnd: TEdit;
    cbHLBlockAutoindent: TCheckBox;
    cbGroupUndo: TCheckBox;
    cbSmartTabs: TCheckBox;
    cbTabIndent: TCheckBox;
    labHighlighterDescription: TLabel;
    memoHighlighterDescription: TMemo;
    cbShiftClickClosesFileTab: TCheckBox;
    cbExecPauseAfter: TCheckBox;
    cbExecIdlePriority: TCheckBox;
    cbWordwrapByDefault: TCheckBox;
    cbShowWordwrapGlyph: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbHLChange(Sender: TObject);
    procedure lbHLItemsClick(Sender: TObject);
    procedure cbEditorFontChange(Sender: TObject);
    procedure eFontSizeChange(Sender: TObject);
    procedure cbFontStyleChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecExtAddClick(Sender: TObject);
    procedure btnExecExtEditClick(Sender: TObject);
    procedure btnExecExtDeleteClick(Sender: TObject);
    procedure eExecCommandChange(Sender: TObject);
    procedure eExecParamsChange(Sender: TObject);
    procedure cbExecWindowChange(Sender: TObject);
    procedure eExecHintChange(Sender: TObject);
    procedure treeExecClick(Sender: TObject);
    procedure btnExecBrowseClick(Sender: TObject);
    procedure btnExtAddClick(Sender: TObject);
    procedure btnExtRemoveClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cbFgColorDefaultSelect(Sender: TObject);
    procedure cbBgColorDefaultSelect(Sender: TObject);
    procedure eExecStartDirChange(Sender: TObject);
    procedure treeExecChange(Sender: TObject; Node: TTreeNode);
    procedure cbHighlightCurrentLineClick(Sender: TObject);
    procedure cbExecCaptureOutputClick(Sender: TObject);
    procedure pcOptionsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBackupDirBrowseClick(Sender: TObject);
    procedure rbBackupDirCurrentClick(Sender: TObject);
    procedure cbExecUseShortNamesClick(Sender: TObject);
    procedure btnHelpFileEditClick(Sender: TObject);
    procedure eCompilerParserRuleChange(Sender: TObject);
    procedure btnCompilerParserRuleHelpClick(Sender: TObject);
    procedure btnHelpFileClearClick(Sender: TObject);
    procedure cbExecSaveModeChange(Sender: TObject);
    procedure cbHLDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbOverrideTxtFgColorClick(Sender: TObject);
    procedure cbExecScrollConsoleClick(Sender: TObject);
    procedure eHLBlockBeginChange(Sender: TObject);
    procedure eHLBlockEndChange(Sender: TObject);
    procedure cbHLBlockAutoindentClick(Sender: TObject);
    procedure SetEnables(Sender: TObject);
    procedure cbExecPauseAfterClick(Sender: TObject);
    procedure cbExecIdlePriorityClick(Sender: TObject);
  private
    UserExecSetCount: integer;
    ExecRootNode: TTreeNode;
    ChangedExtSettings: boolean;
    LanguageList: TStringList;
    RegistryScanned: boolean;
    HLChangedFlag: array[0..MAX_HIGHLIGHTERS_COUNT - 1] of boolean;

    function SelectedAttrToCurrAttr: TSynHighlighterAttributes;
    procedure DefineSelectedColors;
    procedure SetCurrHighlightedChanged;
    procedure SetCurrHelpFileChanged;

    procedure ApplyHLAttr;
    procedure UserExecSetToTree;
    procedure TreeToUserExecSet;
    procedure ReleaseExecTreeItems;
    procedure ClearExecParams;
    procedure EnableExecControls(Value: boolean);

    procedure AssocReadFromRegistry;
    procedure AssocWriteToRegistry;

    procedure ShowAllLang;
    procedure SelectCurrentLang;
    procedure ApplyLanguage;

    procedure HelpFilesToForm;
    procedure FormToHelpFiles;

    procedure SetFont(cbFont: TFontComboBox; pnPreview: TPanel; spinSize: TUpDown; eSize: THexEdit; font_name: string; font_size: integer);

    procedure InstanceFileOpenNotify(var Msg: tMessage); message wmMainInstanceOpenFile;
    procedure SetCaptureConsoleOutputChecked(const Value: boolean);

    property CaptureConsoleOutputChecked: boolean write SetCaptureConsoleOutputChecked;
  public
    ActiveHighlighter: pointer;
  end;

implementation

uses
  fMain,
  fEditor,
  fBottomWindowOutputConsole,
  SynHighlighterSQL,
  uEnvOptions;

{$R *.DFM}

var
  aColorCurrLines: array[0..MAX_HIGHLIGHTERS_COUNT - 1] of boolean;
  aOverrideTxtFgColor: array[0..MAX_HIGHLIGHTERS_COUNT - 1] of boolean;
  aHLBlockAutoIndent: array[0..MAX_HIGHLIGHTERS_COUNT - 1] of boolean;
  aHLBlockBegStr: array[0..MAX_HIGHLIGHTERS_COUNT - 1] of string;
  aHLBlockEndStr: array[0..MAX_HIGHLIGHTERS_COUNT - 1] of string;

  ////////////////////////////////////////////////////////////////////////////////////////////
  //                                  Messages
  ////////////////////////////////////////////////////////////////////////////////////////////
  //------------------------------------------------------------------------------------------

procedure TfmOptions.InstanceFileOpenNotify(var Msg: tMessage);
begin
  fmMain.InstanceFileOpenNotify(Msg);
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.SetCaptureConsoleOutputChecked(const Value: boolean);
begin
  cbExecCaptureOutput.Checked := Value;

  cbExecScrollConsole.Enabled := Value;
  labExecParserRule.Enabled := Value;
  eCompilerParserRule.Enabled := Value;
  cbExecPauseAfter.Enabled := not Value;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

function TfmOptions.SelectedAttrToCurrAttr: TSynHighlighterAttributes;
var
  Attr: TSynHighlighterAttributes;
  AttrStyle: TFontStyles;
begin
  if (lbHLItems.Items.Count = 0) then
  begin
    result := nil;
    EXIT;
  end;

  Attr := TSynHighlighterAttributes(lbHLItems.Items.Objects[lbHLItems.ItemIndex]);

  if assigned(Attr) then
  begin
    Attr.Foreground := cbFgColor.TargetColor;
    Attr.Background := cbBgColor.TargetColor;

    AttrStyle := [];
    if cbBold.Checked then
      Include(AttrStyle, fsBold);
    if cbItalic.Checked then
      Include(AttrStyle, fsItalic);
    if cbUnderLine.Checked then
      Include(AttrStyle, fsUnderline);
    Attr.Style := AttrStyle;
  end;

  result := Attr;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.ApplyHLAttr;
var
  i, ii: integer;
  HL: TSynCustomHighLighter;
  Attr: TSynHighlighterAttributes;
  str: TStringList;
begin
  for i := 0 to cbHL.Items.Count - 1 do
  begin
    if HLChangedFlag[i] then
    begin
      HL := TSynCustomHighLighter(cbHL.Items.Objects[i]);
      if Assigned(HL) then
      begin
        str := TStringList(cbHL.Items.Objects[i]);

        if Assigned(str) then
          for ii := 0 to str.Count - 1 do
          begin
            Attr := TSynHighlighterAttributes(str.Objects[ii]);
            HighLighters[i].HL.Attribute[ii].Foreground := Attr.Foreground;
            HighLighters[i].HL.Attribute[ii].Background := Attr.Background;
            HighLighters[i].HL.Attribute[ii].Style := Attr.Style;
          end;
      end;
      HighLighters[i].ColorCurrentLine := aColorCurrLines[i];
      HighLighters[i].OverrideTxtFgColor := aOverrideTxtFgColor[i];
      HighLighters[i].BlockAutoindent := aHLBlockAutoIndent[i];
      HighLighters[i].BlockBegStr := aHLBlockBegStr[i];
      HighLighters[i].BlockEndStr := aHLBlockEndStr[i];
      HighLighters[i].ChangedAttr := TRUE;
    end;
  end;

  fmMain.ApplyOtherColors;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.SetFont(cbFont: TFontComboBox; pnPreview: TPanel; spinSize: TUpDown; eSize: THexEdit; font_name: string; font_size: integer);
begin
  cbFont.Rebuild;
  cbFont.ItemIndex := cbFont.Items.IndexOf(font_name);
  if (cbFont.ItemIndex < 0) then
    cbFont.ItemIndex := 0;

  if Assigned(pnPreview) then
  begin
    pnPreview.Font.Name := font_name;
    pnPreview.Font.Size := font_size;
  end;

  eSize.Value := font_size;
  spinSize.Position := font_size;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.SetEnables(Sender: TObject);
begin
  cbTabIndent.Enabled := cbTabsMode.ItemIndex = 0;

  eBlockIndent.Enabled := not (cbTabIndent.Enabled and cbTabIndent.Checked);
  labBlockIndent.Enabled := eBlockIndent.Enabled;
  spinBlockIndent.Enabled := eBlockIndent.Enabled;

  eCJavaBlockIndent.Enabled := not (cbTabIndent.Enabled and cbTabIndent.Checked);
  labCJavaBlockIndent.Enabled := eCJavaBlockIndent.Enabled;
  spinCJavaBlockIndent.Enabled := eCJavaBlockIndent.Enabled;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.UserExecSetToTree;
var
  CurrDef, Def: pTUserExecDef;
  n, i: integer;
  NodeSet: TTreeNode;
  CurrentNode: TTreeNode;
  ed: TfmEditor;
begin
  UserExecSetCount := EditorCfg.UserExecSetCount;

  ExecRootNode := treeExec.Items.AddChild(nil, mlStr(ML_OPT_USER_EXEC_KEYS, 'User exec keys'));
  CurrentNode := nil;

  ed := fmMain.ActiveEditor;
  if Assigned(ed) then
    CurrDef := GetExecDef(0, ed.FileName)
  else
    CurrDef := nil;

  for n := 0 to UserExecSetCount - 1 do
  begin
    NodeSet := treeExec.Items.AddChild(ExecRootNode, string(EditorCfg.UserExecCfg[n].Ext));
    for i := 0 to MAX_USEREXEC_KEYS_COUNT - 1 do
    begin
      Def := AllocMem(SizeOf(TUserExecDef));
      Move(EditorCfg.UserExecCfg[n].Def[i], Def^, SizeOf(TUserExecDef));
      treeExec.Items.AddChildObject(NodeSet, 'F' + IntToStr(9 + i), Def);

      if not Assigned(CurrentNode) and (CurrDef = @EditorCfg.UserExecCfg[n].Def[i]) then
        CurrentNode := NodeSet;
    end;
  end;

  ExecRootNode.Expand(TRUE);

  if Assigned(CurrentNode) then
  begin
    treeExec.Selected := CurrentNode;
    treeExec.Selected.MakeVisible;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.TreeToUserExecSet;
var
  i, ii: integer;
  Node: TTreeNode;
  s: string;
begin
  FillChar(EditorCfg.UserExecCfg, SizeOf(EditorCfg.UserExecCfg), 0);
  EditorCfg.UserExecSetCount := 0;

  for i := 0 to ExecRootNode.Count - 1 do
  begin
    Node := ExecRootNode[i];

    // pobriši sve razmake u ekstenziji
    s := Node.Text;
    while (Pos(' ', s) > 0) do
      Delete(s, Pos(' ', s), 1);

    if (Length(s) > 0) then
    begin
      EditorCfg.UserExecCfg[EditorCfg.UserExecSetCount].Ext := ShortString(s);

      for ii := 0 to Node.Count - 1 do
      begin
        if Assigned(Node[ii].Data) then
          Move(pTUserExecDef(Node[ii].Data)^,
            EditorCfg.UserExecCfg[EditorCfg.UserExecSetCount].Def[ii],
            SizeOf(TUserExecDef));
      end;
      inc(EditorCfg.UserExecSetCount);
    end;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.ReleaseExecTreeItems;
var
  Node: TTreeNode;
begin
  while (ExecRootNode.Count > 0) do
  begin
    Node := ExecRootNode[0];
    while (Node.Count > 0) do
    begin
      if Assigned(Node[0].Data) then
        FreeMem(pTUserExecDef(Node[0].Data));
      Node[0].Free;
    end;
    Node.Free;
  end;

  ExecRootNode.Free;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.ClearExecParams;
begin
  eExecCommand.Text := '';
  eExecStartDir.Text := '';
  eExecParams.Text := '';
  cbExecWindow.ItemIndex := -1;
  eExecHint.Text := '';
  eCompilerParserRule.Text := '';
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.EnableExecControls(Value: boolean);
var
  i: integer;
begin
  for i := 0 to pnExecEditControls.ControlCount - 1 do
    pnExecEditControls.Controls[i].Enabled := Value;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.HelpFilesToForm;
var
  i: integer;
begin
  lvHelpFiles.Items.BeginUpdate;

  try
    lvHelpFiles.Items.Clear;

    for i := 0 to HIGHLIGHTERS_COUNT - 1 do
    begin
      with lvHelpFiles.Items.Add do
      begin
        Caption := HighLighters[i].Name;
        SubItems.Add(HighLighters[i].HelpFile);
        Data := @HighLighters[i];
      end;
    end;
  finally
    lvHelpFiles.Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.FormToHelpFiles;
var
  i: integer;
begin
  for i := 0 to lvHelpFiles.Items.Count - 1 do
  begin
    pTHighlighter(lvHelpFiles.Items[i].Data)^.HelpFile := lvHelpFiles.Items[i].SubItems[0];
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnExecExtAddClick(Sender: TObject);
var
  i: integer;
  Node: TTreeNode;
  Def: pTUserExecDef;
begin
  if (UserExecSetCount > MAX_USEREXEC_SET_COUNT) then
    EXIT;

  Node := treeExec.Items.AddChild(ExecRootNode, '');

  for i := 0 to MAX_USEREXEC_KEYS_COUNT - 1 do
  begin
    Def := AllocMem(SizeOf(TUserExecDef));
    treeExec.Items.AddChildObject(Node, 'F' + IntToStr(9 + i), Def);
  end;

  ExecRootNode.Expand(TRUE);
  treeExec.Selected := Node;

  btnExecExtEditClick(SELF);

  inc(UserExecSetCount);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnExecExtEditClick(Sender: TObject);
var
  Node: TTreeNode;
  s: string;
begin
  if not Assigned(treeExec.Selected) or (treeExec.Selected = ExecRootNode) then
    EXIT;

  if Assigned(treeExec.Selected.Data) then
    Node := treeExec.Selected.Parent
  else
    Node := treeExec.Selected;

  s := Node.Text;
  if InputQuery(mlStr(ML_OPT_USER_EXT_EDIT_CAPT, 'Extension edit'),
    mlStr(ML_OPT_USER_EXT_EDIT_TEXT, 'Enter extensions separated with commas:'), s) then
    Node.Text := s;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnExecExtDeleteClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  if not Assigned(treeExec.Selected) or (treeExec.Selected = ExecRootNode) then
    EXIT;

  if Assigned(treeExec.Selected.Data) then
    Node := treeExec.Selected.Parent
  else
    Node := treeExec.Selected;

  if (MessageDlg(Format(mlStr(ML_OPT_USER_DEL_USR_CMD, 'Delete user commands associated with ''%s''?'), [Node.Text]),
    mtWarning, [mbOK, mbCancel], 0) = mrOK) then
  begin
    Node.DeleteChildren;
    Node.Free;
    ClearExecParams;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnApplyClick(Sender: TObject);

  procedure SetOption(Option: TSynEditorOption; Value: boolean);
  begin
    if Value then
      Include(EditorCfg.Options, Option)
    else
      Exclude(EditorCfg.Options, Option);
  end;

begin
  SetLengthyOperation(TRUE);
  try
    ApplyHLAttr;
    TreeToUserExecSet;

    // general
    with EnvOptions do
    begin
      BackupFile := cbBackupFile.Checked;
      BackupDOSFileName := cbDosBackupFilename.Checked;
      DetectFileChanges := cbDetectFileChanges.Checked;
      AutoUpdateChangedFiles := cbAutoUpdateChangedFiles.Checked;
      MinimizeIfNoFiles := cbMinimizeIfNoFiles.Checked;
      StartAction := TStartAction(cbWhenStarted.ItemIndex);
      RememberLastDir := cbRememberLastDir.Checked;
      RememberFindCfg := cbRememberFindOptions.Checked;
      MultipleInstances := cbAllowMultipleInstances.Checked;
      MinimizeToTray := cbMinimizeToTray.Checked;
      ShiftClickClosesFileTab := cbShiftClickClosesFileTab.Checked;
    end;

    EditorCfg.ShowExecInfoDlg := cbShowExecInfoDlg.Checked;
    EditorCfg.ShowFindReplaceInfoDlg := cbShowFindReplaceInfoDlg.Checked;
    fmMain.VisibleFileTabIcons := cbVisibleFileTabsIcons.Checked;
    fmMain.MultilineTabs := cbMultiLineTabs.Checked;
    fmMain.FilePosHistory.Enabled := cbSaveFilePositions.Checked;

    // backup
    if (rbBackupDirCurrent.Checked) then
      EnvOptions.BackupDir := ''
    else
      EnvOptions.BackupDir := eBackupDir.Text;

    // editor options
    SetOption(eoAutoIndent, cbAutoIndent.Checked);
    SetOption(eoDragDropEditing, cbDragDropEditing.Checked);
    SetOption(eoScrollPastEol, cbCursorAfterEOL.Checked);
    SetOption(eoEnhanceHomeKey, cbEnhanceHomeKey.Checked);
    SetOption(eoSmartTabs, cbSmartTabs.Checked);
    EditorCfg.TrimTrailingSpaces := cbTrimTrailingSpaces.Checked;
    SetOption(eoGroupUndo, cbGroupUndo.Checked);
    SetOption(eoTabIndent, cbTabIndent.Checked);
    EditorCfg.FindTextAtCursor := cbFindTextAtCursor.Checked;
    EditorCfg.LineNumbers := cbLineNumbers.Checked;
    EditorCfg.UndoAfterSave := cbUndoAfterSave.Checked;
    EditorCfg.HideMouseWhenTyping := cbHideMouseWhenTyping.Checked;
    EditorCfg.GutterVisible := cbGutterVisible.Checked;
    EditorCfg.ExtraLineSpacing := eExtraLineSpacing.Value;
    EditorCfg.TabWidth := eTabWidth.Value;
    EditorCfg.BlockIndent := eBlockIndent.Value;
    EditorCfg.C_BlockIndent := eCJavaBlockIndent.Value;

    EditorCfg.RightEdge := eRightEdge.Value;
    EditorCfg.GutterWidth := eGutterWidth.Value;
    EditorCfg.InsertCaret := TSynEditCaretType(cbInsertCaretShape.ItemIndex);
    EditorCfg.OverwriteCaret := TSynEditCaretType(cbOverwriteCaretShape.ItemIndex);
    EditorCfg.TabsMode := TTabsMode(cbTabsMode.ItemIndex);

    if (cbEditorFont.ItemIndex <> -1) then
      EditorCfg.FontName := cbEditorFont.Items[cbEditorFont.ItemIndex];
    EditorCfg.FontSize := eFontSize.Value;

    if (cbGutterFont.ItemIndex <> -1) then
      EditorCfg.GutterFontName := cbGutterFont.Items[cbGutterFont.ItemIndex];
    EditorCfg.GutterFontSize := eGutterFontSize.Value;

    EditorCfg.WordwrapByDefault := cbWordwrapByDefault.Checked;
    EditorCfg.ShowWordwrapGlyph := cbShowWordwrapGlyph.Checked;

    // misc
    EnvOptions.SQLDialect := TSQLDialect(cbSQLDialect.ItemIndex);

    // new document defaults
    EditorCfg.DefaultHighlighter := cbNewDocHighlighter.Text;
    EditorCfg.DefaultTextFormat := TTextFormat(cbNewDocFormat.ItemIndex);

    fmMain.ApplyEditorOptions;
    AssocWriteToRegistry;

    FormToHelpFiles;
    ApplyLanguage;
    OptionsChanged := TRUE;
    EnvOptions.Modified := TRUE;
  finally
    SetLengthyOperation(FALSE);
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnExecBrowseClick(Sender: TObject);
var
  dlgOpen: TOpenDialog;
begin
  dlgOpen := TOpenDialog.Create(SELF);

  try
    dlgOpen.DefaultExt := 'exe';
    dlgOpen.Filter := 'Executable files|*.exe;*.com;*.bat|All files (*.*)|*.*';

    if (dlgOpen.Execute) then
      eExecCommand.Text := dlgOpen.FileName;
  finally
    dlgOpen.Free;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnOKClick(Sender: TObject);
begin
  btnApplyClick(SELF);
  Close;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnBackupDirBrowseClick(Sender: TObject);
var
  dir: string;
begin
  if SelectDirectory(mlStr(ML_OPT_SELECT_BACKUP_DIR, 'Select backup directory'), '', dir) then
  begin
    eBackupDir.Text := dir;
    cbBackupFile.Checked := TRUE;
    rbBackupDirSelect.Checked := TRUE;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.SetCurrHelpFileChanged;
var
  HL: pTHighlighter;
  i: integer;
begin
  if not Assigned(lvHelpFiles.Selected) then
    EXIT;
  HL := pTHighlighter(lvHelpFiles.Selected.Data);

  i := 0;
  while (i < HIGHLIGHTERS_COUNT) do
  begin
    if (@Highlighters[i] = HL) then
    begin
      HLChangedFlag[i] := TRUE;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnHelpFileEditClick(Sender: TObject);
var
  dlgOpen: TOpenDialog;
  HL: pTHighlighter;
begin
  if not Assigned(lvHelpFiles.Selected) then
    EXIT;

  dlgOpen := TOpenDialog.Create(SELF);

  try
    with dlgOpen do
    begin
      HL := pTHighlighter(lvHelpFiles.Selected.Data);
      dlgOpen.Filter := 'All files (*.*)|*.*|Help files (*.hlp)|*.hlp|HTML help files (*.chm)|*.chm';
      dlgOpen.Options := [ofHideReadOnly, ofEnableSizing, ofAllowMultiSelect];
      dlgOpen.DefaultExt := 'hlp';
      dlgOpen.FilterIndex := 2;
      dlgOpen.FileName := HL^.HelpFile;

      if dlgOpen.Execute then
      begin
        lvHelpFiles.Selected.SubItems[0] := dlgOpen.FileName;
        SetCurrHelpFileChanged;
      end;
    end;
  finally
    dlgOpen.Free;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnHelpFileClearClick(Sender: TObject);
begin
  if not Assigned(lvHelpFiles.Selected) then
    EXIT;
  lvHelpFiles.Selected.SubItems[0] := '';
  SetCurrHelpFileChanged;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnCompilerParserRuleHelpClick(Sender: TObject);
begin
  Application.HelpJump('20');
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                    Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbEditorFontChange(Sender: TObject);
begin
  if (TFontComboBox(Sender).ItemIndex < 0) then
    EXIT;

  pnFontSample.Font.Name := cbEditorFont.Items[cbEditorFont.ItemIndex];
  pnSampleColor.Font.Name := cbEditorFont.Items[cbEditorFont.ItemIndex];
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eFontSizeChange(Sender: TObject);
begin
  pnFontSample.Font.Size := eFontSize.Value;
  pnSampleColor.Font.Size := eFontSize.Value;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eExecCommandChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.ExecCommand := ShortString(eExecCommand.Text);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eExecStartDirChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.StartDir := ShortString(eExecStartDir.Text);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eExecParamsChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.Params := ShortString(eExecParams.Text);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecWindowChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.Window := cbExecWindow.ItemIndex;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eExecHintChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.Hint := ShortString(eExecHint.Text);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecSaveModeChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.SaveMode := TUserExecSaveMode(cbExecSaveMode.ItemIndex);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecCaptureOutputClick(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.CaptureOutput := cbExecCaptureOutput.Checked;

  CaptureConsoleOutputChecked := cbExecCaptureOutput.Checked;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecScrollConsoleClick(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.ScrollConsole := cbExecScrollConsole.Checked;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecPauseAfterClick(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.PauseAfterExecution := cbExecPauseAfter.Checked;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecIdlePriorityClick(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.IdlePriority := cbExecIdlePriority.Checked;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eCompilerParserRuleChange(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.ParserRule := ShortString(eCompilerParserRule.Text);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbExecUseShortNamesClick(Sender: TObject);
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
    pTUserExecDef(treeExec.Selected.Data)^.UseShortName := cbExecUseShortNames.Checked;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.treeExecClick(Sender: TObject);
var
  Def: pTUserExecDef;
begin
  if Assigned(treeExec.Selected) and Assigned(treeExec.Selected.Data) then
  begin
    EnableExecControls(TRUE);
    Def := pTUserExecDef(treeExec.Selected.Data);
    eExecCommand.Text      := string(Def^.ExecCommand);
    eExecStartDir.Text     := string(Def^.StartDir);
    eExecParams.Text       := string(Def^.Params);
    cbExecWindow.ItemIndex := Def^.Window;
    eExecHint.Text         := string(Def^.Hint);
    cbExecSaveMode.ItemIndex    := ord(Def^.SaveMode);
    CaptureConsoleOutputChecked := Def^.CaptureOutput;
    cbExecScrollConsole.Checked := Def^.ScrollConsole;
    cbExecPauseAfter.Checked    := Def^.PauseAfterExecution;
    cbExecIdlePriority.Checked  := Def^.IdlePriority;
    cbExecUseShortNames.Checked := Def^.UseShortName;
    eCompilerParserRule.Text    := string(Def^.ParserRule);
  end
  else
  begin
    EnableExecControls(FALSE);
    ClearExecParams;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.treeExecChange(Sender: TObject; Node: TTreeNode);
begin
  treeExecClick(SELF);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.pcOptionsChange(Sender: TObject);
var
  t: dword;
begin
  if (pcOptions.ActivePage = pgAssociations) then
  begin
    if not RegistryScanned then
    begin
      pnAssocWait.Visible := TRUE;
      t := GetTickCount;
      while (GetTickCount < t + 500) do
        Application.ProcessMessages;
      AssocReadFromRegistry;
      RegistryScanned := TRUE;
    end;
    pnAssocWait.Visible := FALSE;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.rbBackupDirCurrentClick(Sender: TObject);
begin
  cbBackupFile.Checked := TRUE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbHLDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  s: string;
  Y_ofs: integer;
  bmp: TBitmap;
  pHL: pTHighlighter;
begin
  s := TComboBox(Control).Items[Index];

  with TComboBox(Control).Canvas do
  begin
    FillRect(Rect);

    pHL := @Highlighters[Index];

    if Assigned(pHL) and (pHL^.Custom) then
      bmp := imgExternalHL.Picture.Bitmap
    else
      bmp := imgInternalHL.Picture.Bitmap;

    BrushCopy(Bounds(Rect.Left + 2, Rect.Top, bmp.Width, bmp.Height), bmp, Bounds(0, 0, bmp.Width, bmp.Height), clAqua);
    Y_ofs := (Rect.Bottom - Rect.Top - TextHeight('Ty')) div 2;
    TextOut(22, Rect.top + Y_ofs, s);
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                File associations
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.AssocReadFromRegistry;
var
  str: TStringList;
begin
  assExt.Shell := Application.ExeName + ' "%1"';
  str := assExt.Enumerate;

  try
    lbAssoc.Items.Assign(str);
  finally
    str.Free;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.AssocWriteToRegistry;
var
  i: integer;
begin
  if not ChangedExtSettings then
    EXIT;

  with assExt do
  begin
    KeyName := 'ConTEXT';
    PathToApp := Application.ExeName;
    IconPath := ParamStr(0);
    Icon := 1;
    ShellCmd := 'Open';
    Shell := Application.ExeName + ' "%1"';
    TypeName := Application.Title + ' document';
    ShowInNew := False;
    QuickView := True;

    RegisterApp;
  end;

  for i := 0 to lbAssoc.Items.Count - 1 do
  begin
    try
      assExt.Associate(lbAssoc.Items[i]);
    except
      ;
    end;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnExtAddClick(Sender: TObject);
var
  s: string;
begin
  s := '';
  if InputQuery(mlStr(ML_OPT_ASSOC_CAPT, 'ConTEXT associations'),
    mlStr(ML_OPT_ASSOC_TEXT, 'Enter file extension:'), s) then
  begin
    s := Trim(s);
    while (Length(s) > 0) and (s[1] = '.') do
      Delete(s, 1, 1);
    if (Length(s) > 0) then
    begin
      if (UpperCase(s) = 'EXE') or (UpperCase(s) = 'BAT') or (UpperCase(s) = 'PIF') or (UpperCase(s) = 'COM') then
      begin
        MessageDlg(mlStr(ML_OPT_ASSOC_EXEFILES_NOT_ALLOWED, 'Associating executable files isn''t allowed.'), mtWarning, [mbOK], 0);
      end
      else
      begin
        lbAssoc.Items.Add('.' + LowerCase(s));
        ChangedExtSettings := TRUE;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.btnExtRemoveClick(Sender: TObject);
var
  s: string;
begin
  if (lbAssoc.ItemIndex = -1) then
    EXIT;

  s := lbAssoc.Items[lbAssoc.ItemIndex];
  if (MessageDlg(Format(mlStr(ML_OPT_ASSOC_DEL, 'Delete association ''%s''? Operation cannot be undone.'), [s]),
    mtWarning, [mbOK, mbCancel], 0) = mrOK) then
  begin
    assExt.Unassociate(s);
    AssocReadFromRegistry;
    ChangedExtSettings := TRUE;
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                 Color selection
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbHLChange(Sender: TObject);
var
  str: TStringList;
  n: integer;
begin
  str := TStringList(cbHL.Items.Objects[cbHL.ItemIndex]);

  lbHLItems.Items.Clear;

  if Assigned(str) then
    lbHLItems.Items.Assign(str);

  n := cbHL.ItemIndex;

  cbHighlightCurrentLine.Checked := aColorCurrLines[n];
  cbOverrideTxtFgColor.Checked := aOverrideTxtFgColor[n];
  cbHLBlockAutoindent.Checked := aHLBlockAutoIndent[n];
  eHLBlockBegin.Text := aHLBlockBegStr[n];
  eHLBlockEnd.Text := aHLBlockEndStr[n];

  if (Highlighters[n].HL is TSynMyGeneralSyn) then
    memoHighlighterDescription.Text := TSynMyGeneralSyn(Highlighters[n].HL).Description
  else
    memoHighlighterDescription.Text := 'Internal highlighter';

  lbHLItems.ItemIndex := 0;
  lbHLItemsClick(SELF);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.lbHLItemsClick(Sender: TObject);
var
  Attr: TSynHighlighterAttributes;
  old_changed: boolean;
begin
  if (lbHLItems.Items.Count = 0) then
    EXIT;

  Attr := TSynHighlighterAttributes(lbHLItems.Items.Objects[lbHLItems.ItemIndex]);

  if assigned(Attr) then
  begin
    cbFgColor.ActiveColor := Attr.Foreground;
    cbFgColor.TargetColor := Attr.Foreground;

    cbBgColor.ActiveColor := Attr.Background;
    cbBgColor.TargetColor := Attr.Background;

    cbBold.OnClick := nil;
    cbItalic.OnClick := nil;
    cbUnderLine.OnClick := nil;

    cbBold.Checked := (fsBold in Attr.Style);
    cbItalic.Checked := (fsItalic in Attr.Style);
    cbUnderLine.Checked := (fsUnderline in Attr.Style);

    cbBold.OnClick := cbFontStyleChange;
    cbItalic.OnClick := cbFontStyleChange;
    cbUnderLine.OnClick := cbFontStyleChange;
    cbFontStyleChange(SELF);

    old_changed := HLChangedFlag[cbHL.ItemIndex];
    DefineSelectedColors;
    HLChangedFlag[cbHL.ItemIndex] := old_changed;
  end;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.SetCurrHighlightedChanged;
begin
  HLChangedFlag[cbHL.ItemIndex] := TRUE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.DefineSelectedColors;
begin
  pnSampleColor.Font.Color := cbFgColor.TargetColor;
  pnSampleColor.Color := cbBgColor.TargetColor;
  SelectedAttrToCurrAttr;
  SetCurrHighlightedChanged;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbFgColorDefaultSelect(Sender: TObject);
begin
  cbFgColor.AutomaticColor := clWindowText;
  SetCurrHighlightedChanged;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbBgColorDefaultSelect(Sender: TObject);
begin
  cbBgColor.AutomaticColor := clWindow;
  SetCurrHighlightedChanged;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbFontStyleChange(Sender: TObject);
begin
  pnSampleColor.Font.Style := SelectedAttrToCurrAttr.Style;
  SetCurrHighlightedChanged;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbHighlightCurrentLineClick(Sender: TObject);
begin
  aColorCurrLines[cbHL.ItemIndex] := cbHighlightCurrentLine.Checked;
  HLChangedFlag[cbHL.ItemIndex] := TRUE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbOverrideTxtFgColorClick(Sender: TObject);
begin
  aOverrideTxtFgColor[cbHL.ItemIndex] := cbOverrideTxtFgColor.Checked;
  HLChangedFlag[cbHL.ItemIndex] := TRUE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.cbHLBlockAutoindentClick(Sender: TObject);
begin
  aHLBlockAutoIndent[cbHL.ItemIndex] := cbHLBlockAutoindent.Checked;
  HLChangedFlag[cbHL.ItemIndex] := TRUE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eHLBlockBeginChange(Sender: TObject);
begin
  aHLBlockBegStr[cbHL.ItemIndex] := eHLBlockBegin.Text;
  HLChangedFlag[cbHL.ItemIndex] := TRUE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.eHLBlockEndChange(Sender: TObject);
begin
  aHLBlockEndStr[cbHL.ItemIndex] := eHLBlockEnd.Text;
  HLChangedFlag[cbHL.ItemIndex] := TRUE;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                               Language select
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.ShowAllLang;
var
  i: integer;
begin
  cbLanguage.Clear;
  cbLanguage.Items.AddObject('English', nil);

  LanguageList := mlEnumerateAllLanguages(ApplicationDir + LANGUAGE_DIR);
  for i := 0 to LanguageList.Count - 1 do
    cbLanguage.Items.AddObject(LanguageList[i], LanguageList.Objects[i]);

  SelectCurrentLang;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.SelectCurrentLang;
var
  i: integer;
  found: boolean;
begin
  i := 0;
  found := FALSE;
  while not found and (i < cbLanguage.Items.Count) do
  begin
    found := Assigned(cbLanguage.Items.Objects[i]) and
      (UpperCase(pString(cbLanguage.Items.Objects[i])^) = UpperCase(EditorCfg.Language));
    if found then
      cbLanguage.ItemIndex := i;
    inc(i);
  end;

  if not found and (cbLanguage.Items.Count > 0) then
    cbLanguage.ItemIndex := 0;

  cbLanguage.Tag := cbLanguage.ItemIndex; // u .Tag pospremimo inicijalnu vrijednost
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.ApplyLanguage;
begin
  if (cbLanguage.ItemIndex <> cbLanguage.Tag) then
  begin
    if Assigned(cbLanguage.Items.Objects[cbLanguage.ItemIndex]) then
      EditorCfg.Language := pString(cbLanguage.Items.Objects[cbLanguage.ItemIndex])^
    else
      EditorCfg.Language := '';
    mlLoadLanguageFile(EditorCfg.Language);
    cbLanguage.Tag := cbLanguage.ItemIndex;

    MessageDlg(mlStr(ML_OPT_LANGUAGE_CHANGE, 'Language will be changed when ConTEXT is restarted.'),
      mtWarning, [mbOK], 0);
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmOptions.FormActivate(Sender: TObject);
const
  IsFirst: boolean = TRUE;
begin
  if not IsFirst then
    DefineSelectedColors;

  IsFirst := FALSE;
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  (*
    Key:=TranslateShortcut(Msg,ss);

    case Key of
      ord('F'):
        if (ss=[ssAlt]) and (pcOptions.ActivePage=pgColors) then begin
  //!!        cbFgColor.DroppedDown:=TRUE;
          Handled:=TRUE;
        end;
      ord('C'):
        if (ss=[ssAlt]) and (pcOptions.ActivePage=pgColors) then begin
  //!!        cbBgColor.DroppedDown:=TRUE;
          Handled:=TRUE;
        end;
    end;
    *)
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.FormCreate(Sender: TObject);
begin
  // language
  mlApplyLanguageToForm(SELF, Name);
  labFont2.Caption := labFont.Caption;
  labFontSize2.Caption := labFontSize.Caption;

  with cbInsertCaretShape.Items do
  begin
    Clear;
    Add(mlStr(ML_OPT_CURSOR_SHAPE1, 'Vertical'));
    Add(mlStr(ML_OPT_CURSOR_SHAPE2, 'Horizontal'));
    Add(mlStr(ML_OPT_CURSOR_SHAPE3, 'Half block'));
    Add(mlStr(ML_OPT_CURSOR_SHAPE4, 'Block'));
  end;
  cbOverwriteCaretShape.Items.Assign(cbInsertCaretShape.Items);

  with cbTabsMode.Items do
  begin
    Clear;
    Add(mlStr(ML_OPT_TABSMODE1, 'Hard tabs'));
    Add(mlStr(ML_OPT_TABSMODE2, 'Tabs to spaces'));
  end;

  lvHelpFiles.Columns[0].Caption := mlStr(ML_OPT_HELP_LV_FILETYPE, 'File type');
  lvHelpFiles.Columns[1].Caption := mlStr(ML_OPT_HELP_LV_HELPFILE, 'Help file');

  cbFgColor.OtherBtnCaption := mlStr(ML_OPT_FGBG_CAPT1, '&Custom color');
  cbFgColor.AutoBtnCaption := mlStr(ML_OPT_FGBG_CAPT2, '&Default color');
  cbBgColor.OtherBtnCaption := cbFgColor.OtherBtnCaption;
  cbBgColor.AutoBtnCaption := cbFgColor.AutoBtnCaption;

  cbExecSaveMode.Items.Add(mlStr(ML_OPT_EXEC_SAVE_CURRENT, 'Current file before execution'));
  cbExecSaveMode.Items.Add(mlStr(ML_OPT_EXEC_SAVE_ALL, 'All files before execution'));
  cbExecSaveMode.Items.Add(mlStr(ML_OPT_EXEC_SAVE_NONE, 'Nothing'));

  cbWhenStarted.Items.Add(mlStr(ML_OPT_ONSTART_NOTHING, 'Do nothing'));
  cbWhenStarted.Items.Add(mlStr(ML_OPT_ONSTART_CREATE_BLANK_FILE, 'Create blank file'));
  cbWhenStarted.Items.Add(mlStr(ML_OPT_ONSTART_OPEN_LAST_FILE, 'Open last file/project'));
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.FormShow(Sender: TObject);
var
  i, ii: integer;
  strAttrNames: TStringList;
  Attr: TSynHighlighterAttributes;
begin
  // large fonts support
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TComboBox) then
      TComboBox(Components[i]).ItemHeight := Canvas.TextHeight('Ty') + 3;

  ////////////////
  cbHL.Clear;

  for i := 0 to HIGHLIGHTERS_COUNT - 1 do
  begin
    //    if not (HighLighters[i].Custom) and not (HighLighters[i].Multi) then begin
    strAttrNames := TStringList.Create;
    cbHL.Items.AddObject(HighLighters[i].Name, strAttrNames);
    aColorCurrLines[i] := HighLighters[i].ColorCurrentLine;
    aOverrideTxtFgColor[i] := HighLighters[i].OverrideTxtFgColor;
    aHLBlockAutoindent[i] := HighLighters[i].BlockAutoindent;
    aHLBlockBegStr[i] := HighLighters[i].BlockBegStr;
    aHLBlockEndStr[i] := HighLighters[i].BlockEndStr;

    cbNewDocHighlighter.Items.Add(HighLighters[i].Name);
  end;

  // selektiraj aktivni highlighter
  cbHL.ItemIndex := 0;
  i := 0;
  while (i < HIGHLIGHTERS_COUNT) do
  begin
    //    if ((ActiveHighlighter=HighLighters[i].HL) and not HighLighters[i].Custom) and not (HighLighters[i].Multi) then begin
    if (ActiveHighlighter = HighLighters[i].HL) then
    begin
      cbHL.ItemIndex := i;
      BREAK;
    end;
    inc(i);
  end;
  cbHLChange(SELF);
  ////////////////

  // new document defaults
  with cbNewDocHighlighter do
  begin
    ItemIndex := Items.IndexOf(EditorCfg.DefaultHighlighter);
    if (ItemIndex = -1) then
      ItemIndex := Items.IndexOf(HighLighters[0].Name);
  end;
  cbNewDocFormat.ItemIndex := ord(EditorCfg.DefaultTextFormat);

  for i := 0 to cbHL.Items.Count - 1 do
  begin
    if Assigned(cbHL.Items.Objects[i]) then
    begin
      strAttrNames := TStringList(cbHL.Items.Objects[i]);
      for ii := 0 to HighLighters[i].HL.AttrCount - 1 do
      begin
        Attr := TSynHighlighterAttributes.Create(HighLighters[i].HL.Attribute[ii].Name, HighLighters[i].HL.Attribute[ii].Name);
        Attr.Foreground := HighLighters[i].HL.Attribute[ii].Foreground;
        Attr.Background := HighLighters[i].HL.Attribute[ii].Background;
        Attr.Style := HighLighters[i].HL.Attribute[ii].Style;

        strAttrNames.AddObject(Attr.Name, Attr);
      end;
    end;
  end;

  // global options
  with EnvOptions do
  begin
    eBackupDir.Text := BackupDir;
    rbBackupDirCurrent.Checked := (Length(BackupDir) = 0);
    cbBackupFile.Checked := BackupFile;
    cbDosBackupFilename.Checked := BackupDOSFileName;

    cbDetectFileChanges.Checked := DetectFileChanges;
    cbAutoUpdateChangedFiles.Checked := AutoUpdateChangedFiles;
    cbMinimizeIfNoFiles.Checked := MinimizeIfNoFiles;
    cbWhenStarted.ItemIndex := ord(StartAction);
    cbRememberLastDir.Checked := RememberLastDir;
    cbRememberFindOptions.Checked := RememberFindCfg;
    cbAllowMultipleInstances.Checked := MultipleInstances;
    cbMinimizeToTray.Checked := MinimizeToTray;
    cbShiftClickClosesFileTab.Checked := ShiftClickClosesFileTab;
  end;

  cbShowFindReplaceInfoDlg.Checked := EditorCfg.ShowFindReplaceInfoDlg;
  cbShowExecInfoDlg.Checked := EditorCfg.ShowExecInfoDlg;
  cbSaveFilePositions.Checked := fmMain.FilePosHistory.Enabled;
  cbVisibleFileTabsIcons.Checked := fmMain.VisibleFileTabIcons;
  cbMultiLineTabs.Checked := fmMain.MultilineTabs;

  ShowAllLang;

  // colors
  cbHLChange(SELF);

  // editor options
  cbAutoIndent.Checked := eoAutoIndent in EditorCfg.Options;
  cbDragDropEditing.Checked := eoDragDropEditing in EditorCfg.Options;
  cbCursorAfterEOL.Checked := eoScrollPastEol in EditorCfg.Options;
  cbEnhanceHomeKey.Checked := eoEnhanceHomeKey in EditorCfg.Options;
  cbSmartTabs.Checked := eoSmartTabs in EditorCfg.Options;
  cbTrimTrailingSpaces.Checked := EditorCfg.TrimTrailingSpaces;
  cbGroupUndo.Checked := eoGroupUndo in EditorCfg.Options;
  cbFindTextAtCursor.Checked := EditorCfg.FindTextAtCursor;
  cbLineNumbers.Checked := EditorCfg.LineNumbers;
  cbUndoAfterSave.Checked := EditorCfg.UndoAfterSave;
  cbHideMouseWhenTyping.Checked := EditorCfg.HideMouseWhenTyping;
  cbGutterVisible.Checked := EditorCfg.GutterVisible;
  cbTabIndent.Checked := eoTabIndent in EditorCfg.Options;

  eExtraLineSpacing.Value := EditorCfg.ExtraLineSpacing;
  spinExtraLineSpacing.Position := EditorCfg.ExtraLineSpacing;
  eTabWidth.Value := EditorCfg.TabWidth;
  spinTabWidth.Position := EditorCfg.TabWidth;
  eBlockIndent.Value := EditorCfg.BlockIndent;
  spinBlockIndent.Position := EditorCfg.BlockIndent;
  eCJavaBlockIndent.Value := EditorCfg.C_BlockIndent;
  spinCJavaBlockIndent.Position := EditorCfg.C_BlockIndent;
  eRightEdge.Value := EditorCfg.RightEdge;
  spinRightEdge.Position := EditorCfg.RightEdge;
  eGutterWidth.Value := EditorCfg.GutterWidth;
  spinGutterWidth.Position := EditorCfg.GutterWidth;

  cbInsertCaretShape.ItemIndex := ord(EditorCfg.InsertCaret);
  cbOverwriteCaretShape.ItemIndex := ord(EditorCfg.OverwriteCaret);
  cbTabsMode.ItemIndex := ord(EditorCfg.TabsMode);

  cbWordwrapByDefault.Checked := EditorCfg.WordwrapByDefault;
  cbShowWordwrapGlyph.Checked := EditorCfg.ShowWordwrapGlyph;

  // misc
  SetFont(cbGutterFont, nil, spinGutterFontSize, eGutterFontSize, EditorCfg.GutterFontName, EditorCfg.GutterFontSize);
  SetFont(cbEditorFont, pnFontSample, spinFontSize, eFontSize, EditorCfg.FontName, EditorCfg.FontSize);
  cbEditorFontChange(cbEditorFont);

  cbSQLDialect.ItemIndex := ord(EnvOptions.SQLDialect);

  HelpFilesToForm;

  UserExecSetToTree;

  ChangedExtSettings := FALSE;

  pcOptions.ActivePage := pgGeneral;
  RegistryScanned := FALSE;
  EnableExecControls(FALSE);

  FillChar(HLChangedFlag, SizeOf(HLChangedFlag), 0);
  SetEnables(SELF);
end;
//------------------------------------------------------------------------------------------

procedure TfmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i, ii: integer;
  HL: TSynCustomHighLighter;
  str: TStringList;
begin
  ReleaseExecTreeItems;

  for i := 0 to cbHL.Items.Count - 1 do
  begin
    HL := TSynCustomHighLighter(cbHL.Items.Objects[i]);
    if Assigned(HL) then
    begin
      str := TStringList(cbHL.Items.Objects[i]);

      if Assigned(str) then
      begin
        for ii := 0 to str.Count - 1 do
        begin
          TSynHighlighterAttributes(str.Objects[ii]).Free;
        end;
        str.Free;
      end;
    end;
  end;

  mlEnumerateDispose(LanguageList);
end;
//------------------------------------------------------------------------------------------

end.

