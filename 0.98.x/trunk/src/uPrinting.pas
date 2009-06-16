// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uPrinting;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, fEditor, ExtCtrls, Registry, SynEdit, SynEditHighlighter, Printers,
  uCommon, StdCtrls, SynEditPrint, SynEditPrintTypes, SynEditPrintHeaderFooter, SynEditPrintMargins,
  SynHighlighterMyGeneral;

const
  MAX_HF_LINES = 10;

type
  TFontData    = record
                   Name            :string;
                   Size            :integer;
                   Style           :TFontStyles;
                 end;

  THFLine      = record
                   Line            :string;
                   Font            :TFontData;
                 end;

  THFLines     = array[0..MAX_HF_LINES-1] of THFLine;

  TMarginsRec  = record
                   Left             :double;
                   Top              :double;
                   Right            :double;
                   Bottom           :double;
                   Footer           :double;
                   Gutter           :double;
                   Header           :double;
                   HFInternalMargin :double;
                   LeftHFTextIndent :double;
                   RightHFTextIndent:double;
                   UnitSystem       :TUnitSystem;
                   MirrorMargins    :boolean;
                 end;

  TPrnHeadFoot = record
                   Font            :TFontData;
                   FrameTypes      :TFrameTypes;
                   LineColor       :TColor;
                   ShadedColor     :TColor;
                   MirrorPosition  :boolean;
                   RomanNumbers    :boolean;
                   LeftLinesCount  :integer;
                   MiddleLinesCount:integer;
                   RightLinesCount :integer;
                   LeftLines       :THFLines;
                   MiddleLines     :THFLines;
                   RightLines      :THFLines;
                 end;

  TPrnConfig   = record
//                   DocTitle        :string;
//                   Title           :string;
                   LineOffset      :integer;
                   PageOffset      :integer;
                   TabWidth        :integer;
                   Font            :TFontData;
                   Footer          :TPrnHeadFoot;
                   Header          :TPrnHeadFoot;
                   Margins         :TMarginsRec;
                   Colors          :boolean;
                   Highlight       :boolean;
                   LineNumbers     :boolean;
                   LineNumInMargin :boolean;
                   Wrap            :boolean;
                 end;

  pTPrnConfig = ^TPrnConfig;

  TPrn = class
  private
    SynPrn            :TSynEditPrint;
    fSrcEditor        :TfmEditor;
    fHL               :TSynCustomHighlighter;
    MM                :TSynEdit;

    procedure CfgToSynPrn;
  public
    constructor Create(ed:TfmEditor);
    destructor Destroy; override;

    function  DoPrintDialog:boolean;
    procedure Preview;
    procedure Print;
  end;

var
  PrnCfg        :TPrnConfig;
  PrnCfgChanged :boolean;

function  CheckPrinterValidity:boolean;
procedure PrnConfigLoad;
procedure PrnConfigSave;

implementation

uses
  uMultiLanguage, fDTestPrintPreview, fMain;

type
  TmyCustomHighLighter = class(TSynCustomHighLighter);

var
  CfgLoaded  :boolean;


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function CheckPrinterValidity:boolean;
begin
  result:=(Printer.Printers.Count>0);

  if not result then
    MessageDlg(mlStr(ML_PRN_NO_DRIVER,'There is no printer currently selected! To enable printing, please install printer driver and restart ConTEXT.'),
               mtError,[mbOK],0);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                              Printing config functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure PrnConfigLoad;
var
  reg :TRegistry;

  procedure ReadFontData(KeyName:string; var FData:TFontData);
  begin
    FData.Name:=ReadRegistryString(reg,KeyName+'FontName','Courier New');
    FData.Size:=ReadRegistryInteger(reg,KeyName+'FontSize',10);
    FData.Style:=[];
    if ReadRegistryBool(reg,KeyName+'FontBold',FALSE) then Include(FData.Style,fsBold);
    if ReadRegistryBool(reg,KeyName+'FontItalic',FALSE) then Include(FData.Style,fsItalic);
    if ReadRegistryBool(reg,KeyName+'FontUnderline',FALSE) then Include(FData.Style,fsUnderline);
  end;

  procedure ReadHFLines(KeyName:string; Count:integer; var HFLines:THFLines);
  var
    i :integer;
  begin
    if (Count>MAX_HF_LINES) then
      Count:=MAX_HF_LINES;

    for i:=0 to Count-1 do begin
      HFLines[i].Line:=ReadRegistryString(reg,KeyName+'Line'+IntToStr(i),'');
      ReadFontData(KeyName+'LineFont'+IntToStr(i),HFLines[i].Font);
    end;
  end;

  procedure ReadHFData(KeyName:string; var HF:TPrnHeadFoot);
  begin
    ReadFontData(KeyName,HF.Font);
    HF.FrameTypes:=[];
    if ReadRegistryBool(reg,KeyName+'FrameLine',TRUE) then Include(HF.FrameTypes,ftLine);
    if ReadRegistryBool(reg,KeyName+'FrameBox',FALSE) then Include(HF.FrameTypes,ftBox);
    if ReadRegistryBool(reg,KeyName+'FrameShaded',FALSE) then Include(HF.FrameTypes,ftShaded);
    HF.LineColor:=ReadRegistryInteger(reg,KeyName+'LineColor',clBlack);
    HF.ShadedColor:=ReadRegistryInteger(reg,KeyName+'ShadedColor',clSilver);
    HF.MirrorPosition:=ReadRegistryBool(reg,KeyName+'MirrorPosition',FALSE);
    HF.RomanNumbers:=ReadRegistryBool(reg,KeyName+'RomanNumbers',FALSE);

    HF.LeftLinesCount:=ReadRegistryInteger(reg,KeyName+'LeftLinesCount',0);
    HF.MiddleLinesCount:=ReadRegistryInteger(reg,KeyName+'MiddleLinesCount',0);
    HF.RightLinesCount:=ReadRegistryInteger(reg,KeyName+'RightLinesCount',0);
    ReadHFLines(KeyName+'Left',HF.LeftLinesCount,HF.LeftLines);
    ReadHFLines(KeyName+'Middle',HF.MiddleLinesCount,HF.MiddleLines);
    ReadHFLines(KeyName+'Right',HF.RightLinesCount,HF.RightLines);
  end;

  procedure ReadMarginsData(KeyName:string; var MD:TMarginsRec);
  begin
    MD.Left:=ReadRegistryFloat(reg,KeyName+'Left',25);
    MD.Top:=ReadRegistryFloat(reg,KeyName+'Top',20);
    MD.Right:=ReadRegistryFloat(reg,KeyName+'Right',15);
    MD.Bottom:=ReadRegistryFloat(reg,KeyName+'Bottom',20);
    MD.Footer:=ReadRegistryFloat(reg,KeyName+'Footer',15);
    MD.Gutter:=ReadRegistryFloat(reg,KeyName+'Gutter',0);
    MD.Header:=ReadRegistryFloat(reg,KeyName+'Header',15);
    MD.HFInternalMargin:=ReadRegistryFloat(reg,KeyName+'HFInternalMargin',0.5);
    MD.LeftHFTextIndent:=ReadRegistryFloat(reg,KeyName+'LeftHFTextIndent',2);
    MD.RightHFTextIndent:=ReadRegistryFloat(reg,KeyName+'RightHFTextIndent',2);
    MD.UnitSystem:=TUnitSystem(ReadRegistryInteger(reg,KeyName+'UnitSystem',ord(usMM)));
    MD.MirrorMargins:=ReadRegistryBool(reg,KeyName+'MirrorMargins',FALSE);
  end;

begin
  if CfgLoaded then EXIT;

  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;

  reg.OpenKey(CONTEXT_REG_KEY+'Printing',TRUE);
  with PrnCfg do begin
    LineOffset:=ReadRegistryInteger(reg,'LineOffset',0);
    PageOffset:=ReadRegistryInteger(reg,'PageOffset',0);
    TabWidth:=ReadRegistryInteger(reg,'TabWidth',8);
    Colors:=ReadRegistryBool(reg,'Colors',TRUE);
    Highlight:=ReadRegistryBool(reg,'Highlight',TRUE);
    LineNumbers:=ReadRegistryBool(reg,'LineNumbers',FALSE);
    LineNumInMargin:=ReadRegistryBool(reg,'LineNumInMargin',FALSE);
    Wrap:=ReadRegistryBool(reg,'Wrap',TRUE);
    ReadFontData('',Font);
    ReadHFData('Header',Header);
    ReadHFData('Footer',Footer);
    ReadMarginsData('Margins',Margins);
  end;

  reg.Free;
  CfgLoaded:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure PrnConfigSave;
var
  reg :TRegistry;

  procedure WriteFontData(KeyName:string; FData:TFontData);
  begin
    reg.WriteString(KeyName+'FontName',FData.Name);
    reg.WriteInteger(KeyName+'FontSize',FData.Size);
    reg.WriteBool(KeyName+'FontBold',fsBold in FData.Style);
    reg.WriteBool(KeyName+'FontItalic',fsItalic in FData.Style);
    reg.WriteBool(KeyName+'FontUnderline',fsUnderline in FData.Style);
  end;

  procedure WriteHFLines(KeyName:string; Count:integer; HFLines:THFLines);
  var
    i :integer;
  begin
    for i:=0 to Count-1 do begin
      reg.WriteString(KeyName+'Line'+IntToStr(i),HFLines[i].Line);
      WriteFontData(KeyName+'LineFont'+IntToStr(i),HFLines[i].Font);
    end;
  end;

  procedure WriteHFData(KeyName:string; HF:TPrnHeadFoot);
  begin
    WriteFontData(KeyName,HF.Font);
    reg.WriteBool(KeyName+'FrameLine',ftLine in HF.FrameTypes);
    reg.WriteBool(KeyName+'FrameBox',ftBox in HF.FrameTypes);
    reg.WriteBool(KeyName+'FrameShaded',ftShaded in HF.FrameTypes);
    reg.WriteInteger(KeyName+'LineColor',HF.LineColor);
    reg.WriteInteger(KeyName+'ShadedColor',HF.ShadedColor);
    reg.WriteBool(KeyName+'MirrorPosition',HF.MirrorPosition);
    reg.WriteBool(KeyName+'RomanNumbers',HF.RomanNumbers);

    reg.WriteInteger(KeyName+'LeftLinesCount',HF.LeftLinesCount);
    reg.WriteInteger(KeyName+'MiddleLinesCount',HF.MiddleLinesCount);
    reg.WriteInteger(KeyName+'RightLinesCount',HF.RightLinesCount);

    WriteHFLines(KeyName+'Left',HF.LeftLinesCount,HF.LeftLines);
    WriteHFLines(KeyName+'Middle',HF.MiddleLinesCount,HF.MiddleLines);
    WriteHFLines(KeyName+'Right',HF.RightLinesCount,HF.RightLines);
  end;

  procedure WriteMarginsData(KeyName:string; MD:TMarginsRec);
  begin
    reg.WriteFloat(KeyName+'Left',MD.Left);
    reg.WriteFloat(KeyName+'Top',MD.Top);
    reg.WriteFloat(KeyName+'Right',MD.Right);
    reg.WriteFloat(KeyName+'Bottom',MD.Bottom);
    reg.WriteFloat(KeyName+'Footer',MD.Footer);
    reg.WriteFloat(KeyName+'Gutter',MD.Gutter);
    reg.WriteFloat(KeyName+'Header',MD.Header);
    reg.WriteFloat(KeyName+'HFInternalMargin',MD.HFInternalMargin);
    reg.WriteFloat(KeyName+'LeftHFTextIndent',MD.LeftHFTextIndent);
    reg.WriteFloat(KeyName+'RightHFTextIndent',MD.RightHFTextIndent);
    reg.WriteInteger(KeyName+'UnitSystem',ord(MD.UnitSystem));
    reg.WriteBool(KeyName+'MirrorMargins',MD.MirrorMargins);
  end;

begin
  if not (CfgLoaded and PrnCfgChanged) then EXIT;

  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;

  reg.OpenKey(CONTEXT_REG_KEY+'Printing',TRUE);
  with PrnCfg do begin
    reg.WriteInteger('LineOffset',LineOffset);
    reg.WriteInteger('PageOffset',PageOffset);
    reg.WriteInteger('TabWidth',TabWidth);
    reg.WriteBool('Colors',Colors);
    reg.WriteBool('Highlight',Highlight);
    reg.WriteBool('LineNumbers',LineNumbers);
    reg.WriteBool('LineNumInMargin',LineNumInMargin);
    reg.WriteBool('Wrap',Wrap);
    WriteFontData('',Font);
    WriteHFData('Header',Header);
    WriteHFData('Footer',Footer);
    WriteMarginsData('Margins',Margins);
  end;

  reg.Free;
  PrnCfgChanged:=FALSE;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TPrn.CfgToSynPrn;

  procedure SetFont(Font:TFont; FontRec:TFontData);
  begin
    Font.Name:=FontRec.Name;
    Font.Size:=FontRec.Size;
    Font.Style:=FontRec.Style;
  end;

  procedure SetHFLines(HF:THeaderFooter; HFLines:THFLines; Count:integer; Align:TAlignment);
  var
    i     :integer;
    AFont :TFont;
  begin
    AFont:=TFont.Create;
    for i:=0 to Count-1 do begin
      SetFont(AFont, HFLines[i].Font);
      HF.Add(HFLines[i].Line, AFont, Align, i+1);
    end;
    AFont.Free;
  end;

  procedure SetHF(HF:THeaderFooter; HFRec:TPrnHeadFoot);
  begin
    HF.Clear;

    SetFont(HF.DefaultFont, HFRec.Font);
    HF.FrameTypes:=HFRec.FrameTypes;
    HF.LineColor:=HFRec.LineColor;
    HF.ShadedColor:=HFRec.ShadedColor;
    HF.MirrorPosition:=HFRec.MirrorPosition;
    HF.RomanNumbers:=HFRec.RomanNumbers;

    SetHFLines(HF, HFRec.LeftLines, HFRec.LeftLinesCount, taLeftJustify);
    SetHFLines(HF, HFRec.MiddleLines, HFRec.MiddleLinesCount, taCenter);
    SetHFLines(HF, HFRec.RightLines, HFRec.RightLinesCount, taRightJustify);
  end;

  procedure SetMargins(Margins:TSynEditPrintMargins; MR:TMarginsRec);
  begin
    with MR do begin
      Margins.UnitSystem:=UnitSystem;
      Margins.Left:=Left;
      Margins.Top:=Top;
      Margins.Right:=Right;
      Margins.Bottom:=Bottom;
      Margins.Footer:=Footer;
      Margins.Gutter:=Gutter;
      Margins.Header:=Header;
      Margins.HFInternalMargin:=HFInternalMargin;
      Margins.LeftHFTextIndent:=LeftHFTextIndent;
      Margins.RightHFTextIndent:=RightHFTextIndent;
      Margins.MirrorMargins:=MirrorMargins;
    end;
  end;

begin
  with PrnCfg do begin
    SynPrn.Color:=clWhite;
    SynPrn.Colors:=Colors;
    SynPrn.Title:=fSrcEditor.FileName;
    SynPrn.DocTitle:=ExtractFileName(fSrcEditor.FileName);
    SynPrn.LineOffset:=LineOffset;
    SynPrn.PageOffset:=PageOffset;
    SynPrn.TabWidth:=TabWidth;
    SynPrn.Colors:=Colors;
    SynPrn.Highlight:=Highlight;
    SynPrn.LineNumbers:=LineNumbers;
    SynPrn.LineNumbersInMargin:=LineNumInMargin;
    SynPrn.Wrap:=Wrap;
    SetFont(SynPrn.Font, Font);
    SetHF(SynPrn.Header, Header);
    SetHF(SynPrn.Footer, Footer);
    SetMargins(SynPrn.Margins, Margins);
    SynPrn.Header.FixLines;
    SynPrn.Footer.FixLines;
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                 Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TPrn.Create(ed:TfmEditor);

  procedure ApplyMemoSettings;
  var
    i    :integer;
    edHL :TSynCustomHighlighter;
  begin
    fHL:=(ed.memo.Highlighter.ClassType.Create as TSynCustomHighlighter).Create(nil);

    MM.Font.Name:=PrnCfg.Font.Name;
    MM.Font.Size:=PrnCfg.Font.Size;
    MM.Font.Style:=PrnCfg.Font.Style;

    AddAdditionalToHighlighter(fHL);
    edHL:=ed.memo.Highlighter;

    for i:=0 to fHL.AttrCount-1 do begin
      if Assigned(ed.memo.Highlighter.Attribute[i]) then begin
        fHL.Attribute[i].Style:=ed.memo.Highlighter.Attribute[i].Style;

        if (edHL.Attribute[i].ForeGround<>clWhite) and (edHL.Attribute[i].ForeGround<>clWindow) then
          fHL.Attribute[i].ForeGround:=edHL.Attribute[i].ForeGround
        else
          fHL.Attribute[i].ForeGround:=clBlack;

        fHL.Attribute[i].Background:=clWhite;
      end;
    end;

    if (fHL is TSynMyGeneralSyn) then
      TSynMyGeneralSyn(ed.memo.Highlighter).AssignPropertiesTo(TSynMyGeneralSyn(fHL));

    MM.Highlighter:=fHL;
    MM.TabWidth:=ed.memo.TabWidth;
  end;                   

begin
  PrnConfigLoad;

  fSrcEditor:=ed;

  MM:=TSynEdit.Create(nil);
  ApplyMemoSettings;

  SynPrn:=TSynEditPrint.Create(Application);
  CfgToSynPrn;
  SynPrn.Highlighter:=fHL;
end;
//------------------------------------------------------------------------------------------
destructor TPrn.Destroy;
begin
//!!  fHL.Free;
  SynPrn.Free;
  MM.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Print functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TPrn.DoPrintDialog:boolean;
var
  dlg :TPrintDialog;
begin
  MM.Lines.Assign(fSrcEditor.memo.Lines);
  SynPrn.SynEdit:=MM;

  dlg:=TPrintDialog.Create(Application);

  try
   with dlg do begin
     MinPage:=1;
     MaxPage:=SynPrn.PageCount;
     FromPage:=MinPage;
     ToPage:=MaxPage;

     Options:=[poPageNums];
     if fSrcEditor.SelAvail then begin
       PrintRange:=prSelection;
       Options:=Options+[poSelection];
     end;

     result:=Execute;
     if result then begin
       SynPrn.Copies:=Copies;

       case PrintRange of
         prAllPages:
           SynPrn.Print;
         prPageNums:
           SynPrn.PrintRange(FromPage, ToPage);
         prSelection:
           begin
             MM.Lines.Text:=fSrcEditor.memo.SelText;
             SynPrn.SynEdit:=MM;
             SynPrn.Print;
           end;
       end;
     end;
   end;
  finally
    dlg.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TPrn.Preview;
var
  fmPrintPreview    :TfmPrnPreview;
begin
  fmPrintPreview:=TfmPrnPreview.Create(Application);

  try
    MM.Lines.Assign(fSrcEditor.memo.Lines);
    SynPrn.SynEdit:=MM;
    fmPrintPreview.SynEditPrintPreview.SynEditPrint:=SynPrn;
    fmPrintPreview.Prn:=SELF;
    fmPrintPreview.ShowModal;
  finally
    fmPrintPreview.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TPrn.Print;
begin
  DoPrintDialog;
end;
//------------------------------------------------------------------------------------------

initialization

finalization
  PrnConfigSave;

end.

