// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fCodeTemplateEdit;

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
  StdCtrls,
  uMultiLanguage;

type
  TfmCodeTemplateEdit = class(TForm)
    labShortcut: TLabel;
    eShortcut: TEdit;
    labDescription: TLabel;
    eDescr: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eShortcutChange(Sender: TObject);
  private
  public
    modal_result: TModalResult;
    ShShortcut: string;
    ShDescr: string;
  end;

implementation

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmCodeTemplateEdit.btnOKClick(Sender: TObject);
begin
  ShShortcut := eShortcut.Text;
  ShDescr := eDescr.Text;

  modal_result := mrOK;
  Close;
end;
//------------------------------------------------------------------------------------------

procedure TfmCodeTemplateEdit.btnCancelClick(Sender: TObject);
begin
  modal_result := mrCancel;
  Close;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                    Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmCodeTemplateEdit.eShortcutChange(Sender: TObject);
var
  ok: boolean;
  i: integer;
begin
  ok := (Length(eShortcut.Text) > 0);

  i := 1;
  while ok and (i < Length(eShortcut.Text)) do
  begin
    ok := ok and CharInSet(eShortcut.Text[i], ['a'..'z', 'A'..'Z', '_', '0'..'9']);
    inc(i);
  end;

  btnOK.Enabled := ok;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                    Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TfmCodeTemplateEdit.FormShow(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  modal_result := mrCancel;

  eShortcut.Text := ShShortcut;
  eDescr.Text := ShDescr;

  eShortcut.SetFocus;
  eShortcut.SelectAll;
end;
//------------------------------------------------------------------------------------------

end.

