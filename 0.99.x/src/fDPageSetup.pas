// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fDPageSetup;

interface

{$I ConTEXT.inc}

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  ExtCtrls, ComCtrls, ActnList,
  SynEditPrintTypes, SynEditPrint, SynEditPrintMargins,
  SynEditPrintHeaderFooter, ColorPicker, Dialogs, uMultiLanguage, HexEdits,
  FontCtls, TB2Dock, TB2Toolbar, SpTBXItem, TB2Item;

type
  TfmPageSetup = class(TForm)
    PageControl: TPageControl;
    pgMargins: TTabSheet;
    pgHeaderFooter: TTabSheet;
    Image1: TImage;
    labMLeft: TLabel;
    labMRight: TLabel;
    labMTop: TLabel;
    labMBottom: TLabel;
    labUnits: TLabel;
    labMHeader: TLabel;
    labMFooter: TLabel;
    labMHFInternal: TLabel;
    labMHFTLeftIndent: TLabel;
    labMHFTRightIndent: TLabel;
    labGutter: TLabel;
    cbMirrorMargins: TCheckBox;
    eLeft: TEdit;
    eRight: TEdit;
    eTop: TEdit;
    eBottom: TEdit;
    eGutter: TEdit;
    eHeader: TEdit;
    eFooter: TEdit;
    eHFInternalMargin: TEdit;
    eLeftHFTextIndent: TEdit;
    eRightHFTextIndent: TEdit;
    cbUnits: TComboBox;
    FontDialog: TFontDialog;
    Bevel1: TBevel;
    labHeader: TLabel;
    labHeadLeft: TLabel;
    labHeadCenter: TLabel;
    labHeadRight: TLabel;
    reHeaderLeft: TRichEdit;
    reHeaderCenter: TRichEdit;
    reHeaderRight: TRichEdit;
    cbHeadMirror: TCheckBox;
    labFooter: TLabel;
    Bevel2: TBevel;
    labFootLeft: TLabel;
    labFootCenter: TLabel;
    labFootRight: TLabel;
    reFooterLeft: TRichEdit;
    reFooterCenter: TRichEdit;
    reFooterRight: TRichEdit;
    cbFootMirror: TCheckBox;
    btnCancel: TButton;
    btnOK: TButton;
    cbHeadLine: TCheckBox;
    cbHeadBox: TCheckBox;
    cbHeadShadow: TCheckBox;
    cbFootLine: TCheckBox;
    cbFootBox: TCheckBox;
    cbFootShadow: TCheckBox;
    btnHeadLineCol: TColorBtn;
    btnHeadShadowCol: TColorBtn;
    btnFootLineCol: TColorBtn;
    btnFootShadowCol: TColorBtn;
    labHeadLineColor: TLabel;
    labHeadShadowColor: TLabel;
    labFootShadowColor: TLabel;
    labFootLineColor: TLabel;
    pgGeneral: TTabSheet;
    gbOptions: TGroupBox;
    cbLineNumbers: TCheckBox;
    cbLineNumbersInMargin: TCheckBox;
    cbSyntaxPrint: TCheckBox;
    cbColors: TCheckBox;
    cbWrap: TCheckBox;
    gbTextOptions: TGroupBox;
    labFont: TLabel;
    labFontSize: TLabel;
    cbFont: TFontComboBox;
    eFontSize: THexEdit;
    spinFontSize: TUpDown;
    TBXDock1: TSpTBXDock;
    TBXToolbar1: TSpTBXToolbar;
    ActionList1: TActionList;
    acPageNum: TAction;
    acNumOfPages: TAction;
    acTime: TAction;
    acDate: TAction;
    acTitle: TAction;
    acFont: TAction;
    acBold: TAction;
    acItalic: TAction;
    acUnderline: TAction;
    TBXItem1: TSpTBXItem;
    TBXItem2: TSpTBXItem;
    TBXItem3: TSpTBXItem;
    TBXItem4: TSpTBXItem;
    TBXItem5: TSpTBXItem;
    TBXSeparatorItem1: TSpTBXSeparatorItem;
    TBXItem6: TSpTBXItem;
    TBXItem7: TSpTBXItem;
    TBXItem8: TSpTBXItem;
    TBXItem9: TSpTBXItem;
    procedure PageNumCmdExecute(Sender: TObject);
    procedure PagesCmdExecute(Sender: TObject);
    procedure TimeCmdExecute(Sender: TObject);
    procedure DateCmdExecute(Sender: TObject);
    procedure FontCmdExecute(Sender: TObject);
    procedure BoldCmdExecute(Sender: TObject);
    procedure ItalicCmdExecute(Sender: TObject);
    procedure UnderlineCmdExecute(Sender: TObject);
    procedure reHeaderLeftEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure reHeaderLeftSelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbUnitsChange(Sender: TObject);
    procedure TitleCmdExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure reHeaderLeftExit(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
  private
    { Private declarations }
    Editor: TRichEdit;
    CharPos: TPoint;
    OldStart: Integer;
    FMargins: TSynEditPrintMargins;
    FInternalCall: Boolean;
    procedure UpdateCursorPos;
    procedure SelectLine(LineNum: Integer);
    function CurrText: TTextAttributes;
    procedure SetMargins(SynEditMargins: TSynEditPrintMargins);
    procedure GetMargins(SynEditMargins: TSynEditPrintMargins);
    procedure SelectNone;

    procedure CfgToForm;
    function  FormToCfg:boolean;
  public
  end;

var
  fmPageSetup: TfmPageSetup;

implementation

uses
  fMain, RichEdit, ShellAPI, Messages, uPrinting;

{$R *.DFM}

//------------------------------------------------------------------------------------------
procedure TfmPageSetup.reHeaderLeftEnter(Sender: TObject);
begin
  Editor := Sender as TRichEdit;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.reHeaderLeftExit(Sender: TObject);
begin
  Editor:=nil;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.reHeaderLeftSelectionChange(Sender: TObject);
begin
  UpdateCursorPos;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.UpdateCursorPos;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  CharPos.X := (Editor.SelStart - SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.SelectLine(LineNum: Integer);
begin
  OldStart := Editor.SelStart;
  Editor.SelStart := SendMessage(Editor.Handle, EM_LINEINDEX, LineNum, 0);
  Editor.SelLength := Length(Editor.Lines[LineNum]);
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.SelectNone;
begin
  Editor.SelStart := OldStart;
  Editor.SelLength := 0;
end;
//------------------------------------------------------------------------------------------
function TfmPageSetup.CurrText: TTextAttributes;
begin
  Result := Editor.SelAttributes;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var
  EditorFocused: boolean;
begin
  EditorFocused:=Assigned(Editor) and Editor.Focused;

  acPageNum.Enabled:=EditorFocused;
  acNumOfPages.Enabled:=EditorFocused;
  acTime.Enabled:=EditorFocused;
  acDate.Enabled:=EditorFocused;
  acTitle.Enabled:=EditorFocused;
  acFont.Enabled:=EditorFocused;
  acBold.Enabled:=EditorFocused;
  acItalic.Enabled:=EditorFocused;
  acUnderline.Enabled:=EditorFocused;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.PageNumCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$PAGENUM$';
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.PagesCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$PAGECOUNT$';
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.TimeCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$TIME$';
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.DateCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$DATE$';
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.TitleCmdExecute(Sender: TObject);
begin
  Editor.SelText := '$TITLE$';
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.FontCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  FontDialog.Font.Assign(CurrText);
  if FontDialog.Execute then
    CurrText.Assign(FontDialog.Font);
  SelectNone;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.BoldCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  if fsBold in CurrText.Style then
    CurrText.Style := CurrText.Style - [fsBold]
  else
    CurrText.Style := CurrText.Style + [fsBold];
  SelectNone;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.ItalicCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  if fsItalic in CurrText.Style then
    CurrText.Style := CurrText.Style - [fsItalic]
  else
    CurrText.Style := CurrText.Style + [fsItalic];
  SelectNone;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.UnderlineCmdExecute(Sender: TObject);
begin
  SelectLine(CharPos.y);
  if fsUnderLine in CurrText.Style then
    CurrText.Style := CurrText.Style - [fsUnderLine]
  else
    CurrText.Style := CurrText.Style + [fsUnderLine];
  SelectNone;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.GetMargins(SynEditMargins: TSynEditPrintMargins);
var
  CurEdit: TEdit;
  function StringToFloat(Edit: TEdit): Double;
  begin
    CurEdit := Edit;
    Result := StrToFloat(Edit.Text);
  end;
begin
  with SynEditMargins do begin
    if not FInternalCall then
      UnitSystem := TUnitSystem(CBUnits.ItemIndex);
    try
      Left := StringToFloat(eLeft);
      Right := StringToFloat(eRight);
      Top := StringToFloat(eTop);
      Bottom := StringToFloat(eBottom);
      Gutter := StringToFloat(eGutter);
      Header := StringToFloat(eHeader);
      Footer := StringToFloat(eFooter);
      LeftHFTextIndent := StringToFloat(eLeftHFTextIndent);
      RightHFTextIndent := StringToFloat(eRightHFTextIndent);
      HFInternalMargin := StringToFloat(eHFInternalMargin);
    except
      MessageDlg(mlStr(ML_PRN_INVALID_NUM,'Invalid number')+'!', mtError, [mbOk], 0);
      CurEdit.SetFocus;
    end;
    MirrorMargins := CBMirrorMargins.Checked;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.SetMargins(SynEditMargins: TSynEditPrintMargins);
begin
  with SynEditMargins do begin
    CBUnits.ItemIndex := Ord(UnitSystem);
    eLeft.Text := FloatToStr(Left);
    eRight.Text := FloatToStr(Right);
    eTop.Text := FloatToStr(Top);
    eBottom.Text := FloatToStr(Bottom);
    eGutter.Text := FloatToStr(Gutter);
    eHeader.Text := FloatToStr(Header);
    eFooter.Text := FloatToStr(Footer);
    eLeftHFTextIndent.Text := FloatToStr(LeftHFTextIndent);
    eRightHFTextIndent.Text := FloatToStr(RightHFTextIndent);
    eHFInternalMargin.Text := FloatToStr(HFInternalMargin);
    CBMirrorMargins.Checked := MirrorMargins;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.cbUnitsChange(Sender: TObject);
begin
  FInternalCall := True;
  GetMargins(FMargins);
  FInternalCall := False;
  FMargins.UnitSystem := TUnitSystem(CBUnits.ItemIndex);
  SetMargins(FMargins);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.btnOKClick(Sender: TObject);
begin
  if FormToCfg then
    Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.btnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Transfer functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.CfgToForm;
var
  AFont :TFont;

  procedure SetFont(AFont:TFont; FontData:TFontData);
  begin
    AFont.Name:=FontData.Name;
    AFont.Size:=FontData.Size;
    AFont.Style:=FontData.Style;
  end;

  procedure SetHFLines(AFont:TFont; HFLines:THFLines; Count:integer; re:TRichEdit);
  var
    i, n :integer;
  begin
    Editor:=re;
    for i:=0 to Count-1 do begin
      n:=re.Lines.Add(HFLines[i].Line);
      SelectLine(n);
      SetFont(AFont,HFLines[i].Font);
      CurrText.Assign(AFont);
      SelectNone;
    end;
  end;

begin
  PrnConfigLoad;

  AFont:=TFont.Create;

  // options
  with PrnCfg do begin
    cbLineNumbers.Checked:=LineNumbers;
    cbLineNumbersInMargin.Checked:=LineNumInMargin;
    cbSyntaxPrint.Checked:=Highlight;
    cbColors.Checked:=Colors;
    cbWrap.Checked:=Wrap;
//    LineOffset      :integer;
//    PageOffset      :integer;
//    TabWidth        :integer;
  end;

  // margins
  with PrnCfg.Margins do begin
    cbUnits.ItemIndex:=Ord(UnitSystem);
    eLeft.Text:=FloatToStr(Left);
    eRight.Text:=FloatToStr(Right);
    eTop.Text:=FloatToStr(Top);
    eBottom.Text:=FloatToStr(Bottom);
    eGutter.Text:=FloatToStr(Gutter);
    eHeader.Text:=FloatToStr(Header);
    eFooter.Text:=FloatToStr(Footer);
    eLeftHFTextIndent.Text:=FloatToStr(LeftHFTextIndent);
    eRightHFTextIndent.Text:=FloatToStr(RightHFTextIndent);
    eHFInternalMargin.Text:=FloatToStr(HFInternalMargin);
    cbMirrorMargins.Checked:=MirrorMargins;
  end;

  // header
  with PrnCfg.Header do begin
    SetFont(reHeaderLeft.Font,Font);
    reHeaderCenter.Font.Assign(reHeaderLeft.Font);
    reHeaderRight.Font.Assign(reHeaderLeft.Font);

    cbHeadLine.Checked:=ftLine in FrameTypes;
    cbHeadBox.Checked:=ftBox in FrameTypes;
    cbHeadShadow.Checked:=ftShaded in FrameTypes;

    btnHeadLineCol.ActiveColor:=LineColor;
    btnHeadLineCol.TargetColor:=LineColor;
    btnHeadShadowCol.ActiveColor:=ShadedColor;
    btnHeadShadowCol.TargetColor:=ShadedColor;

    cbHeadMirror.Checked:=MirrorPosition;

    SetHFLines(AFont, LeftLines, LeftLinesCount, reHeaderLeft);
    SetHFLines(AFont, MiddleLines, MiddleLinesCount, reHeaderCenter);
    SetHFLines(AFont, RightLines, RightLinesCount, reHeaderRight);
  end;

  // footer
  with PrnCfg.Footer do begin
    SetFont(reFooterLeft.Font,Font);
    reFooterCenter.Font.Assign(reFooterLeft.Font);
    reFooterRight.Font.Assign(reFooterLeft.Font);

    cbFootLine.Checked:=ftLine in FrameTypes;
    cbFootBox.Checked:=ftBox in FrameTypes;
    cbFootShadow.Checked:=ftShaded in FrameTypes;

    btnFootLineCol.ActiveColor:=LineColor;
    btnFootLineCol.TargetColor:=LineColor;
    btnFootShadowCol.ActiveColor:=ShadedColor;
    btnFootShadowCol.TargetColor:=ShadedColor;

    cbFootMirror.Checked:=MirrorPosition;

    SetHFLines(AFont, LeftLines, LeftLinesCount, reFooterLeft);
    SetHFLines(AFont, MiddleLines, MiddleLinesCount, reFooterCenter);
    SetHFLines(AFont, RightLines, RightLinesCount, reFooterRight);
  end;

  // font
  cbFont.Rebuild;
  cbFont.ItemIndex:=cbFont.Items.IndexOf(PrnCfg.Font.Name);
  if (cbFont.ItemIndex<0) then cbFont.ItemIndex:=0;

  eFontSize.Value:=PrnCfg.Font.Size;
  spinFontSize.Position:=PrnCfg.Font.Size;

  AFont.Free;
end;
//------------------------------------------------------------------------------------------
function TfmPageSetup.FormToCfg:boolean;
var
  AFont :TFont;

  function SetMargins:boolean;
  var
    CurEdit: TEdit;

    function StringToFloat(Edit: TEdit): Double;
    begin
      CurEdit := Edit;
      Result := StrToFloat(Edit.Text);
    end;
    
  begin
    result:=TRUE;
    
    with PrnCfg.Margins do begin
      UnitSystem:=TUnitSystem(cbUnits.ItemIndex);

      try
        Left:=StringToFloat(eLeft);
        Right:=StringToFloat(eRight);
        Top:= StringToFloat(eTop);
        Bottom:=StringToFloat(eBottom);
        Gutter:=StringToFloat(eGutter);
        Header:=StringToFloat(eHeader);
        Footer:=StringToFloat(eFooter);
        LeftHFTextIndent:=StringToFloat(eLeftHFTextIndent);
        RightHFTextIndent:=StringToFloat(eRightHFTextIndent);
        HFInternalMargin:=StringToFloat(eHFInternalMargin);
      except
        MessageDlg(mlStr(ML_PRN_INVALID_NUM,'Invalid number')+'!', mtError, [mbOk], 0);
        CurEdit.SetFocus;
        result:=FALSE;
      end;
      MirrorMargins:=cbMirrorMargins.Checked;
    end;
  end;

  procedure SetFont(AFont:TFont; var FontData:TFontData);
  begin
    FontData.Name:=AFont.Name;
    FontData.Size:=AFont.Size;
    FontData.Style:=AFont.Style;
  end;

  procedure SetHFLines(AFont:TFont; var HFLines:THFLines; var Count:integer; re:TRichEdit);
  var
    i :integer;
  begin
    while (re.Lines.Count>0) and (Length(re.Lines[re.Lines.Count-1])=0) do
      re.Lines.Delete(re.Lines.Count-1);

    Editor:=re;
    for i:=0 to re.Lines.Count-1 do begin
      SelectLine(i);
      AFont.Assign(CurrText);
      SetFont(AFont,HFLines[i].Font);
      HFLines[i].Line:=re.Lines[i];
    end;
    Count:=re.Lines.Count;
  end;

begin
  result:=SetMargins;
  if not result then EXIT;

  PrnCfgChanged:=TRUE;

  AFont:=TFont.Create;

  // options
  with PrnCfg do begin
    LineNumbers:=cbLineNumbers.Checked;
    LineNumInMargin:=cbLineNumbersInMargin.Checked;
    Highlight:=cbSyntaxPrint.Checked;
    Colors:=cbColors.Checked;
    Wrap:=cbWrap.Checked;
//    LineOffset      :integer;
//    PageOffset      :integer;
//    TabWidth        :integer;
  end;

  // header
  with PrnCfg.Header do begin
    SetFont(reHeaderLeft.Font,Font);

    FrameTypes:=[];
    if cbHeadLine.Checked then Include (FrameTypes,ftLine);
    if cbHeadBox.Checked then Include (FrameTypes,ftBox);
    if cbHeadShadow.Checked then Include (FrameTypes,ftShaded);

    LineColor:=btnHeadLineCol.TargetColor;
    ShadedColor:=btnHeadShadowCol.TargetColor;
    MirrorPosition:=cbHeadMirror.Checked;

    SetHFLines(AFont, LeftLines, LeftLinesCount, reHeaderLeft);
    SetHFLines(AFont, MiddleLines, MiddleLinesCount, reHeaderCenter);
    SetHFLines(AFont, RightLines, RightLinesCount, reHeaderRight);
  end;

  // footer
  with PrnCfg.Footer do begin
    SetFont(reFooterLeft.Font,Font);

    FrameTypes:=[];
    if cbFootLine.Checked then Include (FrameTypes,ftLine);
    if cbFootBox.Checked then Include (FrameTypes,ftBox);
    if cbFootShadow.Checked then Include (FrameTypes,ftShaded);

    LineColor:=btnFootLineCol.TargetColor;
    ShadedColor:=btnFootShadowCol.TargetColor;
    MirrorPosition:=cbFootMirror.Checked;

    SetHFLines(AFont, LeftLines, LeftLinesCount, reFooterLeft);
    SetHFLines(AFont, MiddleLines, MiddleLinesCount, reFooterCenter);
    SetHFLines(AFont, RightLines, RightLinesCount, reFooterRight);
  end;

  if (cbFont.ItemIndex<>-1) then
    PrnCfg.Font.Name:=cbFont.Items[cbFont.ItemIndex];
  PrnCfg.Font.Size:=eFontSize.Value;

  AFont.Free;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.FormCreate(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  FMargins := TSynEditPrintMargins.Create;
  FInternalCall := False;

  acPageNum.Hint:=mlStr(ML_PRN_HINT_PAGE_NUM,'Page number');
  acNumOfPages.Hint:=mlStr(ML_PRN_HINT_TOTAL_PAGES,'Total pages count');
  acTime.Hint:=mlStr(ML_PRN_HINT_TIME,'Time');
  acDate.Hint:=mlStr(ML_PRN_HINT_DATE,'Date');
  acTitle.Hint:=mlStr(ML_PRN_HINT_FILENAME,'File name');
  acFont.Hint:=mlStr(ML_PRN_HINT_FONT,'Font');
  acBold.Hint:=mlStr(ML_PRN_HINT_BOLD,'Bold');
  acItalic.Hint:=mlStr(ML_PRN_HINT_ITALIC,'Italic');
  acUnderline.Hint:=mlStr(ML_PRN_HINT_UNDERLINE,'Underline');
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.FormDestroy(Sender: TObject);
begin
  FMargins.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmPageSetup.FormShow(Sender: TObject);
begin
  Editor:=REHeaderLeft;
  PageControl.ActivePage:=pgGeneral;
  UpdateCursorPos;

  CfgToForm;
end;
//------------------------------------------------------------------------------------------

end.


