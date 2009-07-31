// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fExport;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ColorPicker, ComCtrls, HexEdits,
  uCommon, uMultiLanguage, fEditor, SynExportRTF,
  SynEditExport, SynExportHTML;

type
  TExportFormat = (efNone, efRTF, efHTML);

  TfmExport = class(TForm)
    btnExport: TButton;
    btnCancel: TButton;
    labTitle: TLabel;
    eTitle: TEdit;
    dlgSave: TSaveDialog;
    expHTML: TSynExporterHTML;
    expRTF: TSynExporterRTF;
    dlgFont: TFontDialog;
    gbOptions: TGroupBox;
    cbSelectedOnly: TCheckBox;
    cbCreateFragment: TCheckBox;
    cbExportToClipboard: TCheckBox;
    gbTextSettings: TGroupBox;
    labBackground: TLabel;
    labFont: TLabel;
    cbBgColor: TColorBtn;
    btnSetFont: TButton;
    labFontName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSetFontClick(Sender: TObject);
  private
    procedure RefreshFontLabel;
  public
    ExportFormat :TExportFormat;
    Editor       :TfmEditor;
  end;

implementation

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////////////////
//                                    Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmExport.RefreshFontLabel;
begin
  labFontName.Caption:=Format('%s, %dpt',[dlgFont.Font.Name, dlgFont.Font.Size]);
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmExport.btnSetFontClick(Sender: TObject);
begin
  if dlgFont.Execute then begin
    RefreshFontLabel;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmExport.btnExportClick(Sender: TObject);
var
  Exporter     :TSynCustomExporter;
  SelectedOnly :boolean;
  ok           :boolean;
label
  EXECUTE_DIALOG;
begin
  Exporter:=nil;

  case ExportFormat of
    efRTF:
      begin
        dlgSave.DefaultExt:='rtf';
        Exporter:=expRTF;
      end;
    efHTML:
      begin
        with expHTML do begin
          CreateHTMLFragment:=cbCreateFragment.Checked;
        end;
        dlgSave.DefaultExt:='htm';
        Exporter:=expHTML;
      end;
  end;

  SelectedOnly:=cbSelectedOnly.Enabled and cbSelectedOnly.Checked;
  ok:=TRUE;

  if Assigned(Exporter) then begin

    with Exporter do begin
      Font.Assign(dlgFont.Font);
      Color:=cbBgColor.TargetColor;
      dlgSave.Filter:=DefaultFilter;
      Title:=eTitle.Text;
      ExportAsText:=TRUE;
      Highlighter:=Editor.memo.Highlighter;
    end;

    if SelectedOnly then
      Exporter.ExportRange(Editor.memo.Lines, Editor.memo.BlockBegin, Editor.memo.BlockEnd)
    else
      Exporter.ExportAll(Editor.memo.Lines);

    if (cbExportToClipboard.Checked) then begin
      Exporter.CopyToClipboard;
    end else begin
      EXECUTE_DIALOG:
        if dlgSave.Execute then begin
          if DlgReplaceFile(dlgSave.FileName) then begin
            try
              Exporter.SaveToFile(dlgSave.FileName);
            except
              ok:=FALSE;
              DlgErrorSaveFile(dlgSave.FileName);
            end;
          end else
            goto EXECUTE_DIALOG;
        end;
    end;
  end;

  if ok then Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmExport.btnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmExport.FormCreate(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  ExportFormat:=efNone;

  cbBgColor.OtherBtnCaption:=mlStr(ML_OPT_FGBG_CAPT1,'&Custom color');
  cbBgColor.AutoBtnCaption:=mlStr(ML_OPT_FGBG_CAPT2,'&Default color');
end;
//------------------------------------------------------------------------------------------
procedure TfmExport.FormShow(Sender: TObject);
begin
  cbSelectedOnly.Enabled:=Editor.memo.SelAvail;
  cbCreateFragment.Visible:=ExportFormat=efHTML;

  cbBgColor.ActiveColor:=Editor.memo.Highlighter.WhitespaceAttribute.Background;
  cbBgColor.TargetColor:=cbBgColor.ActiveColor;

  // iskopiraj postavke fonta u dlgFont
  dlgFont.Font.Assign(Editor.memo.Font);

  RefreshFontLabel;
end;
//------------------------------------------------------------------------------------------
end.
