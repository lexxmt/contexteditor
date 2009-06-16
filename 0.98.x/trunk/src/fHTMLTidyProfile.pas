// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fHTMLTidyProfile;

interface

{$I ConTEXT.inc}

{$IFDEF SUPPORTS_HTML_TIDY}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TidyLib, TidyGlobal, uHTMLTidy, ComCtrls, StdCtrls, TidyEnums,
  uCommon;

type
  TfmHTMLTidyProfile = class(TForm)
    pcProfile: TPageControl;
    pgMarkup: TTabSheet;
    pgPrettyPrint: TTabSheet;
    pgDiagnostics: TTabSheet;
    pgEncoding: TTabSheet;
    eAltText: TEdit;
    eDoctype: TEdit;
    eBlockTags: TEdit;
    eEmptyTags: TEdit;
    eInlineTags: TEdit;
    ePreTags: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbBreakBeforeBR: TCheckBox;
    cbDropEmptyParas: TCheckBox;
    cbDropFontTags: TCheckBox;
    cbDropPropAttrs: TCheckBox;
    cbEncloseBlockText: TCheckBox;
    cbEncloseBodyText: TCheckBox;
    cbFixComments: TCheckBox;
    cbFixUri: TCheckBox;
    cbHideComments: TCheckBox;
    cbHideEndTags: TCheckBox;
    cbJoinClasses: TCheckBox;
    cbJoinStyles: TCheckBox;
    cbLogicalEmphasis: TCheckBox;
    cbLowerLiterals: TCheckBox;
    cbMakeBare: TCheckBox;
    cbMakeClean: TCheckBox;
    cbNcr: TCheckBox;
    cbNumEntities: TCheckBox;
    cbQuoteAmpersand: TCheckBox;
    cbQuoteMarks: TCheckBox;
    cbQuoteNbsp: TCheckBox;
    cbReplaceColor: TCheckBox;
    cbBodyOnly: TCheckBox;
    cbUpperCaseAttrs: TCheckBox;
    cbUpperCaseTags: TCheckBox;
    cbWord2000: TCheckBox;
    Label7: TLabel;
    cbDuplicateAttrs: TComboBox;
    pgXMLMarkup: TTabSheet;
    cbXmlDecl: TCheckBox;
    cbXmlPIs: TCheckBox;
    cbXmlSpace: TCheckBox;
    cbXmlTags: TCheckBox;
    cbEscapeCdata: TCheckBox;
    cbIndentCdata: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    eIndentSpaces: TEdit;
    eTabSize: TEdit;
    eWrapLen: TEdit;
    cbIndentContent: TComboBox;
    cbIndentAttributes: TCheckBox;
    cbLiteralAttribs: TCheckBox;
    cbShowMarkup: TCheckBox;
    cbWrapAsp: TCheckBox;
    cbWrapAttVals: TCheckBox;
    cbWrapJste: TCheckBox;
    cbWrapPhp: TCheckBox;
    cbWrapScriptlets: TCheckBox;
    cbWrapSection: TCheckBox;
    cbFixBackslash: TCheckBox;
    btnOK: TButton;
    btnCancel: TButton;
    cbAsciiChars: TCheckBox;
    cbCharEncoding: TComboBox;
    cbInCharEncoding: TComboBox;
    cbOutCharEncoding: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    labProfileName: TLabel;
    eProfileName: TEdit;
    procedure btnOKClick(Sender: TObject);
  private
    fProfile: TTidyConfiguration;
    fProfileName: string;
    fOriginalProfileName: string;
    procedure CreateEnums;
    procedure OptionsToForm;
    procedure FormToOptions;
  public
    constructor Create(AOwner: TComponent; AProfile: TTidyConfiguration; ProfileName: string); reintroduce;
    destructor Destroy; override;
    property Profile: TTidyConfiguration read fProfile;
  end;

{$ENDIF}

implementation

{$IFDEF SUPPORTS_HTML_TIDY}
{$R *.dfm}


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyProfile.CreateEnums;
var
  EncodingID: TidyEncodingID;
  DupAttrModes: TidyDupAttrModes;
  TidyTriState: TTidyTriState;
begin
  cbDuplicateAttrs.Items.Clear;
  cbIndentContent.Items.Clear;
  cbCharEncoding.Items.Clear;

  for EncodingID:=Low(TidyEncodingID) to High(TidyEncodingID) do
    cbCharEncoding.Items.AddObject(STR_TIDY_ENCODING_ID[EncodingID], pointer(EncodingID));

  for TidyTriState:=Low(TTidyTriState) to High(TTidyTriState) do
    cbIndentContent.Items.AddObject(STR_TIDY_TRISTATE[TidyTriState], pointer(TidyTriState));

  for DupAttrModes:=Low(TidyDupAttrModes) to High(TidyDupAttrModes) do
    cbDuplicateAttrs.Items.AddObject(STR_TIDY_DUP_ATTR_MODES[DupAttrModes], pointer(DupAttrModes));

  cbInCharEncoding.Items.Assign(cbCharEncoding.Items);
  cbOutCharEncoding.Items.Assign(cbCharEncoding.Items);
end;
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyProfile.OptionsToForm;
begin
  with fProfile do begin
    // markup properties
    eAltText.Text:=AltText;
    eDoctype.Text:=Doctype;
    eBlockTags.Text:=BlockTags;
    eEmptyTags.Text:=EmptyTags;
    eInlineTags.Text:=InlineTags;
    ePreTags.Text:=PreTags;
    cbBreakBeforeBR.Checked:=BreakBeforeBR;
    cbDropEmptyParas.Checked:=DropEmptyParas;
    cbDropFontTags.Checked:=DropFontTags;
    cbDropPropAttrs.Checked:=DropPropAttrs;
    cbEncloseBlockText.Checked:=EncloseBlockText;
    cbEncloseBodyText.Checked:=EncloseBodyText;
    cbFixComments.Checked:=FixComments;
    cbFixUri.Checked:=FixUri;
    cbHideComments.Checked:=HideComments;
    cbHideEndTags.Checked:=HideEndTags;
    cbJoinClasses.Checked:=JoinClasses;
    cbJoinStyles.Checked:=JoinStyles;
    cbLogicalEmphasis.Checked:=LogicalEmphasis;
    cbLowerLiterals.Checked:=LowerLiterals;
    cbMakeBare.Checked:=MakeBare;
    cbMakeClean.Checked:=MakeClean;
    cbNcr.Checked:=Ncr;
    cbNumEntities.Checked:=NumEntities;
    cbQuoteAmpersand.Checked:=QuoteAmpersand;
    cbQuoteMarks.Checked:=QuoteMarks;
    cbQuoteNbsp.Checked:=QuoteNbsp;
    cbReplaceColor.Checked:=ReplaceColor;
    cbBodyOnly.Checked:=BodyOnly;
    cbUpperCaseAttrs.Checked:=UpperCaseAttrs;
    cbUpperCaseTags.Checked:=UpperCaseTags;
    cbWord2000.Checked:=Word2000;
    cbDuplicateAttrs.ItemIndex:=cbDuplicateAttrs.Items.IndexOfObject(pointer(DuplicateAttrs));

    // xml markup properties
    cbXmlDecl.Checked:=XmlDecl;
    cbXmlPIs.Checked:=XmlPIs;
    cbXmlSpace.Checked:=XmlSpace;
    cbXmlTags.Checked:=XmlTags;
    cbEscapeCdata.Checked:=EscapeCdata;
    cbIndentCdata.Checked:=IndentCdata;

    // pretty print
    cbIndentContent.ItemIndex:=cbIndentContent.Items.IndexOfObject(pointer(IndentContent));
    cbIndentAttributes.Checked:=IndentAttributes;
    eIndentSpaces.Text:=IntToStr(IndentSpaces);
    cbLiteralAttribs.Checked:=LiteralAttribs;
    cbShowMarkup.Checked:=ShowMarkup;
    eTabSize.Text:=IntToStr(TabSize);
    eWrapLen.Text:=IntToStr(WrapLen);
    cbWrapAsp.Checked:=WrapAsp;
    cbWrapAttVals.Checked:=WrapAttVals;
    cbWrapJste.Checked:=WrapJste;
    cbWrapPhp.Checked:=WrapPhp;
    cbWrapScriptlets.Checked:=WrapScriptlets;
    cbWrapSection.Checked:=WrapSection;
    cbFixBackslash.Checked:=FixBackslash;

    // encoding
    cbAsciiChars.Checked:=AsciiChars;
    cbCharEncoding.ItemIndex:=cbCharEncoding.Items.IndexOfObject(pointer(CharEncoding));
    cbInCharEncoding.ItemIndex:=cbInCharEncoding.Items.IndexOfObject(pointer(InCharEncoding));
    cbOutCharEncoding.ItemIndex:=cbOutCharEncoding.Items.IndexOfObject(pointer(OutCharEncoding));
//    OutputBom
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyProfile.FormToOptions;
begin
  with fProfile do begin
    // markup properties
    AltText:=eAltText.Text;
    Doctype:=eDoctype.Text;
    BlockTags:=eBlockTags.Text;
    EmptyTags:=eEmptyTags.Text;
    InlineTags:=eInlineTags.Text;
    PreTags:=ePreTags.Text;
    BreakBeforeBR:=cbBreakBeforeBR.Checked;
    DropEmptyParas:=cbDropEmptyParas.Checked;
    DropFontTags:=cbDropFontTags.Checked;
    DropPropAttrs:=cbDropPropAttrs.Checked;
    EncloseBlockText:=cbEncloseBlockText.Checked;
    EncloseBodyText:=cbEncloseBodyText.Checked;
    FixComments:=cbFixComments.Checked;
    FixUri:=cbFixUri.Checked;
    HideComments:=cbHideComments.Checked;
    HideEndTags:=cbHideEndTags.Checked;
    JoinClasses:=cbJoinClasses.Checked;
    JoinStyles:=cbJoinStyles.Checked;
    LogicalEmphasis:=cbLogicalEmphasis.Checked;
    LowerLiterals:=cbLowerLiterals.Checked;
    MakeBare:=cbMakeBare.Checked;
    MakeClean:=cbMakeClean.Checked;
    Ncr:=cbNcr.Checked;
    NumEntities:=cbNumEntities.Checked;
    QuoteAmpersand:=cbQuoteAmpersand.Checked;
    QuoteMarks:=cbQuoteMarks.Checked;
    QuoteNbsp:=cbQuoteNbsp.Checked;
    ReplaceColor:=cbReplaceColor.Checked;
    BodyOnly:=cbBodyOnly.Checked;
    UpperCaseAttrs:=cbUpperCaseAttrs.Checked;
    UpperCaseTags:=cbUpperCaseTags.Checked;
    Word2000:=cbWord2000.Checked;
    DuplicateAttrs:=TidyDupAttrModes(cbDuplicateAttrs.ItemIndex);

    // xml markup properties
    XmlDecl:=cbXmlDecl.Checked;
    XmlPIs:=cbXmlPIs.Checked;
    XmlSpace:=cbXmlSpace.Checked;
    XmlTags:=cbXmlTags.Checked;
    EscapeCdata:=cbEscapeCdata.Checked;
    IndentCdata:=cbIndentCdata.Checked;

    // pretty print
    IndentContent:=TTidyTriState(cbIndentContent.ItemIndex);
    IndentAttributes:=cbIndentAttributes.Checked;
    IndentSpaces:=StrToIntDef(eIndentSpaces.Text, 2);
    LiteralAttribs:=cbLiteralAttribs.Checked;
    ShowMarkup:=cbShowMarkup.Checked;
    TabSize:=StrToIntDef(eTabSize.Text, 4);
    WrapLen:=StrToIntDef(eWrapLen.Text, 68);
    WrapAsp:=cbWrapAsp.Checked;
    WrapAttVals:=cbWrapAttVals.Checked;
    WrapJste:=cbWrapJste.Checked;
    WrapPhp:=cbWrapPhp.Checked;
    WrapScriptlets:=cbWrapScriptlets.Checked;
    WrapSection:=cbWrapSection.Checked;
    FixBackslash:=cbFixBackslash.Checked;

    // encoding
    AsciiChars:=cbAsciiChars.Checked;
    CharEncoding:=TidyEncodingID(cbCharEncoding.ItemIndex);
    InCharEncoding:=TidyEncodingID(cbInCharEncoding.ItemIndex);
    OutCharEncoding:=TidyEncodingID(cbOutCharEncoding.ItemIndex);
//    OutputBom
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyProfile.btnOKClick(Sender: TObject);
var
  ProfileName: string;
  FileName: string;
begin
  FormToOptions;

  ProfileName:=Trim(eProfileName.Text);
  if (ProfileName<>fOriginalProfileName) then begin
  end;

  FileName:=MakeProfileFilename(ProfileName);
  if not HTMLTidy.SaveToFile(FileName) then begin
    DlgErrorSaveFile(FileName);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TfmHTMLTidyProfile.Create(AOwner: TComponent; AProfile: TTidyConfiguration; ProfileName: string);
begin
  inherited Create(AOwner);
  fProfile:=AProfile;
  fOriginalProfileName:=ProfileName;
  eProfileName.Text:=ProfileName;

  pcProfile.ActivePageIndex:=0;

  CreateEnums;
  OptionsToForm;
end;
//------------------------------------------------------------------------------------------
destructor TfmHTMLTidyProfile.Destroy;
begin
  inherited;
end;
//------------------------------------------------------------------------------------------

{$ENDIF}

end.

