// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFileCompareSettings;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, uCommon, rmMyDiff, StdCtrls, ActnList, ExtCtrls,
  ColorPicker, uMultiLanguage, ComCtrls, HexEdits, FontCtls;

type
  TFileCompareFileSelection = (fsCurrent, fsEditingFile, fsFileFromDisk);

  TFileCompareSettings = class
  private
    fFile2FromDiskFileName: string;
    fFile1FromDiskFileName: string;
    fFile1EditingFileName: string;
    fFile2EditingFileName: string;
    fFile2Selection: TFileCompareFileSelection;
    fFile1Selection: TFileCompareFileSelection;
    fIgnoreLeadingWhiteSpace: boolean;
    fIgnoreCharacters: boolean;
    fCaseSensitive: boolean;
    fIgnoreTrailingWhiteSpace: boolean;
    fIgnoreCharactersStr: string;
    fLineNumbers: boolean;
    fMatchDepth: integer;
    fSimpleViewer: boolean;
    fEmptyBGColor: TColor;
    fInsertedTextColor: TColor;
    fChangedTextColor: TColor;
    fDeletedTextColor: TColor;
    fChangedBGColor: TColor;
    fInsertedBGColor: TColor;
    fDeletedBGColor: TColor;
    fFontSize: integer;
    fFontName: string;
    fEditor1: TObject;
    fEditor2: TObject;
    procedure LoadSettings;
    procedure SaveSettings;
  public
    constructor Create; 
    destructor Destroy; override;
    procedure Assign(Source: TFileCompareSettings);
      
    property File1Selection: TFileCompareFileSelection read fFile1Selection write fFile1Selection;
    property File1EditingFileName: string read fFile1EditingFileName write fFile1EditingFileName;
    property File1FromDiskFileName: string read fFile1FromDiskFileName write fFile1FromDiskFileName;
    property Editor1: TObject read fEditor1 write fEditor1;
    property File2Selection: TFileCompareFileSelection read fFile2Selection write fFile2Selection;
    property File2EditingFileName: string read fFile2EditingFileName write fFile2EditingFileName;
    property File2FromDiskFileName: string read fFile2FromDiskFileName write fFile2FromDiskFileName;
    property Editor2: TObject read fEditor2 write fEditor2;

    property CaseSensitive: boolean read fCaseSensitive write fCaseSensitive;
    property IgnoreCharacters: boolean read fIgnoreCharacters write fIgnoreCharacters;
    property IgnoreTrailingWhiteSpace: boolean read fIgnoreTrailingWhiteSpace write fIgnoreTrailingWhiteSpace;
    property IgnoreLeadingWhiteSpace: boolean read fIgnoreLeadingWhiteSpace write fIgnoreLeadingWhiteSpace;
    property LineNumbers: boolean read fLineNumbers write fLineNumbers;
    property IgnoreCharactersStr: string read fIgnoreCharactersStr write fIgnoreCharactersStr;
    property MatchDepth: integer read fMatchDepth write fMatchDepth;

    property SimpleViewer: boolean read fSimpleViewer write fSimpleViewer;
    property ChangedTextColor: TColor read fChangedTextColor write fChangedTextColor;
    property ChangedBGColor: TColor read fChangedBGColor write fChangedBGColor;
    property DeletedTextColor: TColor read fDeletedTextColor write fDeletedTextColor;
    property DeletedBGColor: TColor read fDeletedBGColor write fDeletedBGColor;
    property InsertedTextColor: TColor read fInsertedTextColor write fInsertedTextColor;
    property InsertedBGColor: TColor read fInsertedBGColor write fInsertedBGColor;
    property EmptyBGColor: TColor read fEmptyBGColor write fEmptyBGColor;

    property FontName: string read fFontName write fFontName;
    property FontSize: integer read fFontSize write fFontSize;
  end;


  TfmFileCompareSettings = class(TForm)
    cbCaseSensitive: TCheckBox;
    cbIgnoreTrailingWhiteSpace: TCheckBox;
    cbIgnoreLeadingWhiteSpace: TCheckBox;
    cbLineNumbers: TCheckBox;
    cbIgnoreCharacters: TCheckBox;
    eIgnoreCharacters: TEdit;
    gbColors: TGroupBox;
    btnOK: TButton;
    btnCancel: TButton;
    cbDifferentBg: TColorBtn;
    cbDifferentFg: TColorBtn;
    alCompareSettings: TActionList;
    acOK: TAction;
    acCancel: TAction;
    labDifferentLines: TLabel;
    labEmptyLines: TLabel;
    cbEmptyBg: TColorBtn;
    cbSimpleColors: TCheckBox;
    labInsertedLines: TLabel;
    cbInsertedFg: TColorBtn;
    cbInsertedBg: TColorBtn;
    labDeletedLines: TLabel;
    cbDeletedFg: TColorBtn;
    cbDeletedBg: TColorBtn;
    cbFont: TFontComboBox;
    labFont: TLabel;
    Bevel1: TBevel;
    labFontSize: TLabel;
    eFontSize: THexEdit;
    spinFontSize: TUpDown;
    labMatchDepth: TLabel;
    spinMatchDepth: TUpDown;
    eMatchDepth: THexEdit;
    procedure acOKExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure alCompareSettingsUpdate(Action: TBasicAction;
      var Handled: Boolean);
  private
    fSettings: TFileCompareSettings;
    procedure ApplyMultilanguage;
    procedure SettingsToForm;
    procedure FormToSettings;
  public
    constructor Create(AOwner: TComponent; Settings: TFileCompareSettings); reintroduce;
  end;

const
  FILE_COMPARE_REG_KEY = CONTEXT_REG_KEY+'Compare\';

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////////////////
//                                   TFileCompareSettings
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFileCompareSettings.Create;
begin
  LoadSettings;
end;
//------------------------------------------------------------------------------------------
destructor TFileCompareSettings.Destroy;
begin
  SaveSettings;
  inherited;
end;
//------------------------------------------------------------------------------------------
procedure TFileCompareSettings.LoadSettings;
var
  Reg: TRegistry;
begin
  Reg:=TRegistry.Create;

  if Reg.OpenKey(FILE_COMPARE_REG_KEY, TRUE) then begin
    fFile1Selection:=TFileCompareFileSelection(ReadRegistryInteger(Reg, 'File1Selection', ord(fsCurrent)));
    fFile1FromDiskFileName:=ReadRegistryString(Reg, 'File1FromDiskFileName', '');
    fFile1EditingFileName:=ReadRegistryString(Reg, 'File1EditingFileName', '');
    fFile2Selection:=TFileCompareFileSelection(ReadRegistryInteger(Reg, 'File2Selection', ord(fsCurrent)));
    fFile2FromDiskFileName:=ReadRegistryString(Reg, 'File2FromDiskFileName', '');
    fFile2EditingFileName:=ReadRegistryString(Reg, 'File2EditingFileName', '');

    fIgnoreLeadingWhiteSpace:=ReadRegistryBool(Reg, 'IgnoreLeadingWhiteSpace', FALSE);
    fIgnoreCharacters:=ReadRegistryBool(Reg, 'IgnoreCharacters', FALSE);
    fCaseSensitive:=ReadRegistryBool(Reg, 'CaseSensitive', TRUE);
    fIgnoreTrailingWhiteSpace:=ReadRegistryBool(Reg, 'IgnoreTrailingWhiteSpace', TRUE);
    fIgnoreCharactersStr:=ReadRegistryString(Reg, 'IgnoreCharactersStr', '');
    fLineNumbers:=ReadRegistryBool(Reg, 'LineNumbers', TRUE);
    fMatchDepth:=ReadRegistryInteger(Reg, 'MatchDepth', 1);

    fSimpleViewer:=ReadRegistryBool(Reg, 'SimpleViewer', TRUE);
    fChangedTextColor:=ReadRegistryInteger(Reg, 'ChangedTextColor', clBlue);
    fChangedBGColor:=ReadRegistryInteger(Reg, 'ChangedBGColor', clYellow);
    fInsertedTextColor:=ReadRegistryInteger(Reg, 'InsertedTextColor', clRed);
    fInsertedBGColor:=ReadRegistryInteger(Reg, 'InsertedBGColor', clWindow);
    fDeletedTextColor:=ReadRegistryInteger(Reg, 'DeletedTextColor', clGray);
    fDeletedBGColor:=ReadRegistryInteger(Reg, 'DeletedBGColor', clWindow);
    fEmptyBGColor:=ReadRegistryInteger(Reg, 'EmptyBGColor', clBtnFace);

    fFontName:=ReadRegistryString(Reg, 'FontName', 'Courier New');
    fFontSize:=ReadRegistryInteger(Reg, 'FontSize', 9);
  end;

  Reg.Free;
end;
//------------------------------------------------------------------------------------------
procedure TFileCompareSettings.SaveSettings;
begin
  with TRegistry.Create do
    try
      if OpenKey(FILE_COMPARE_REG_KEY, TRUE) then begin
        WriteInteger('File1Selection', ord(fFile1Selection));
        WriteString('File1FromDiskFileName', fFile1FromDiskFileName);
        WriteString('File1EditingFileName', fFile1EditingFileName);
        WriteInteger('File2Selection', ord(fFile2Selection));
        WriteString('File2FromDiskFileName', fFile2FromDiskFileName);
        WriteString('File2EditingFileName', fFile2EditingFileName);

        WriteBool('IgnoreLeadingWhiteSpace', fIgnoreLeadingWhiteSpace);
        WriteBool('IgnoreCharacters', fIgnoreCharacters);
        WriteBool('CaseSensitive', fCaseSensitive);
        WriteBool('IgnoreTrailingWhiteSpace', fIgnoreTrailingWhiteSpace);
        WriteString('IgnoreCharactersStr', fIgnoreCharactersStr);
        WriteBool('LineNumbers', fLineNumbers);
        WriteInteger('MatchDepth', fMatchDepth);

        WriteBool('SimpleViewer', fSimpleViewer);
        WriteInteger('ChangedTextColor', fChangedTextColor);
        WriteInteger('ChangedBGColor', fChangedBGColor);
        WriteInteger('InsertedTextColor', fInsertedTextColor);
        WriteInteger('InsertedBGColor', fInsertedBGColor);
        WriteInteger('DeletedTextColor', fDeletedTextColor);
        WriteInteger('DeletedBGColor', fDeletedBGColor);
        WriteInteger('EmptyBGColor', fEmptyBGColor);

        WriteString('FontName', fFontName);
        WriteInteger('FontSize', fFontSize);
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TFileCompareSettings.Assign(Source: TFileCompareSettings);
begin
  fFile1Selection:=Source.File1Selection;
  fFile1EditingFileName:=Source.File1EditingFileName;
  fFile1FromDiskFileName:=Source.File1FromDiskFileName;
  fEditor1:=Source.Editor1;
  fEditor2:=Source.Editor2;
  fFile2Selection:=Source.File2Selection;
  fFile2EditingFileName:=Source.File2EditingFileName;
  fFile2FromDiskFileName:=Source.File2FromDiskFileName;
  fCaseSensitive:=Source.CaseSensitive;
  fIgnoreCharacters:=Source.IgnoreCharacters;
  fIgnoreTrailingWhiteSpace:=Source.IgnoreTrailingWhiteSpace;
  fIgnoreLeadingWhiteSpace:=Source.IgnoreLeadingWhiteSpace;
  fLineNumbers:=Source.LineNumbers;
  fIgnoreCharactersStr:=Source.IgnoreCharactersStr;
  fMatchDepth:=Source.MatchDepth;
  fSimpleViewer:=Source.SimpleViewer;
  fChangedTextColor:=Source.ChangedTextColor;
  fChangedBGColor:=Source.ChangedBGColor;
  fDeletedTextColor:=Source.DeletedTextColor;
  fDeletedBGColor:=Source.DeletedBGColor;
  fInsertedTextColor:=Source.InsertedTextColor;
  fInsertedBGColor:=Source.InsertedBGColor;
  fEmptyBGColor:=Source.EmptyBGColor;
  fFontName:=Source.FontName;
  fFontSize:=Source.FontSize;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareSettings.ApplyMultilanguage;
var
  cust_color, def_color: string;

  procedure SetColorButton(Btn: TColorBtn);
  begin
    Btn.OtherBtnCaption:=cust_color;
    Btn.AutoBtnCaption:=def_color;
  end;

begin
  cust_color:=mlStr(ML_OPT_FGBG_CAPT1, '&Custom color');
  def_color:=mlStr(ML_OPT_FGBG_CAPT2, '&Default color');

  SetColorButton(cbDifferentFg);
  SetColorButton(cbDifferentBg);
  SetColorButton(cbEmptyBg);
  SetColorButton(cbInsertedFg);
  SetColorButton(cbInsertedBg);
  SetColorButton(cbDeletedFg);
  SetColorButton(cbDeletedBg);
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareSettings.SettingsToForm;

  procedure SetColorButton(Btn: TColorBtn; Color: TColor);
  begin
    Btn.ActiveColor:=Color;
    Btn.TargetColor:=Color;
  end;

begin
  with fSettings do begin
    cbCaseSensitive.Checked:=CaseSensitive;
    cbIgnoreTrailingWhiteSpace.Checked:=IgnoreTrailingWhiteSpace;
    cbIgnoreLeadingWhiteSpace.Checked:=IgnoreLeadingWhiteSpace;
    cbLineNumbers.Checked:=LineNumbers;
    cbIgnoreCharacters.Checked:=IgnoreCharacters;
    eIgnoreCharacters.Text:=IgnoreCharactersStr;

    eMatchDepth.Value:=MatchDepth;
    spinMatchDepth.Position:=MatchDepth;

    cbSimpleColors.Checked:=SimpleViewer;
    SetColorButton(cbDifferentFg, ChangedTextColor);
    SetColorButton(cbDifferentBg, ChangedBGColor);
    SetColorButton(cbEmptyBg, EmptyBGColor);
    SetColorButton(cbInsertedFg, InsertedTextColor);
    SetColorButton(cbInsertedBg, InsertedBGColor);
    SetColorButton(cbDeletedFg, DeletedTextColor);
    SetColorButton(cbDeletedBg, DeletedBGColor);

    cbFont.Rebuild;
    cbFont.ItemIndex:=cbFont.Items.IndexOf(FontName);
    if (cbFont.ItemIndex<0) then cbFont.ItemIndex:=0;

    eFontSize.Value:=FontSize;
    spinFontSize.Position:=FontSize;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareSettings.FormToSettings;
begin
  with fSettings do begin
    CaseSensitive:=cbCaseSensitive.Checked;
    IgnoreTrailingWhiteSpace:=cbIgnoreTrailingWhiteSpace.Checked;
    IgnoreLeadingWhiteSpace:=cbIgnoreLeadingWhiteSpace.Checked;
    LineNumbers:=cbLineNumbers.Checked;
    IgnoreCharacters:=cbIgnoreCharacters.Checked;
    IgnoreCharactersStr:=eIgnoreCharacters.Text;
    MatchDepth:=eMatchDepth.Value;

    SimpleViewer:=cbSimpleColors.Checked;
    ChangedTextColor:=cbDifferentFg.TargetColor;
    ChangedBGColor:=cbDifferentBg.TargetColor;
    EmptyBGColor:=cbEmptyBg.TargetColor;
    InsertedTextColor:=cbInsertedFg.TargetColor;
    InsertedBGColor:=cbInsertedBg.TargetColor;
    DeletedTextColor:=cbDeletedFg.TargetColor;
    DeletedBGColor:=cbDeletedBg.TargetColor;

    if (cbFont.ItemIndex<>-1) then
      FontName:=cbFont.Items[cbFont.ItemIndex];
    FontSize:=eFontSize.Value;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompareSettings.alCompareSettingsUpdate(Action: TBasicAction; var Handled: Boolean);
begin

end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareSettings.acOKExecute(Sender: TObject);
begin
  FormToSettings;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompareSettings.acCancelExecute(Sender: TObject);
begin
  //
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TfmFileCompareSettings.Create(AOwner: TComponent; Settings: TFileCompareSettings);
begin
  fSettings:=Settings;
  inherited Create(AOwner);

  mlApplyLanguageToForm(SELF, Name);
  ApplyMultilanguage;
  SettingsToForm;
end;
//------------------------------------------------------------------------------------------

end.
