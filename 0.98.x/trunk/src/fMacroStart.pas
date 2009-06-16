// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fMacroStart;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, fEditor, Menus, uMultiLanguage, ExtCtrls;

type
  TMSRDlgTyp = (msrStart, msrEdit);

  TfmMacroStartRecording = class(TForm)
    labName: TLabel;
    eName: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    hkMacro: THotKey;
    labHotkey: TLabel;
    cbEnabled: TCheckBox;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
  public
    editor       :TfmEditor;
    modal_result :TModalResult;
    Key          :word;
    Shift        :TShiftState;
    MacroName    :string;
    Disabled     :boolean;

    DlgTyp       :TMSRDlgTyp;
  end;

implementation

uses
  uMacros, fMain;

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroStartRecording.btnOKClick(Sender: TObject);
var
  mac :pTMacro;
begin
  if (Assigned(editor) and (editor.memo.Keystrokes.FindShortcut(hkMacro.HotKey)<>-1)) or
     fmMain.IsMenuShortcut(hkMacro.HotKey) then begin
    MessageDlg(mlStr(ML_MACRO_START_HOTKEY_USED,'This hotkey is used by editor.'),
               mtError,[mbOK],0);
    hkMacro.SetFocus;
    EXIT;
  end;

  mac:=fmMain.Macros.FindMacroWithShortcut(hkMacro.HotKey);
  if Assigned(mac) and (hkMacro.HotKey<>ShortCut(Key,Shift)) then begin
    if (MessageDlg(mlStr(ML_MACRO_START_HOTKEY_DEFINED,'Macro with this hotkey is already defined. Should it be overwritten?'),
                   mtWarning,[mbOK,mbCancel],0)=mrOK) then begin
      fmMain.Macros.DeleteMacro(mac);
    end else begin
      hkMacro.SetFocus;
      EXIT;
    end;
  end;

  ShortCutToKey(hkMacro.HotKey,Key,Shift);
  MacroName:=Trim(eName.Text);

  Disabled:=not cbEnabled.Checked;

  modal_result:=mrOK;
  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroStartRecording.btnCancelClick(Sender: TObject);
begin
  modal_result:=mrCancel;
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroStartRecording.FormShow(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  case DlgTyp of
    msrStart:
      begin
        Caption:=mlStr(ML_MACROSTART_CAPT,'Start Macro Recording');

        eName.Text:='';
        hkMacro.HotKey:=0;
      end;
    msrEdit:
      begin
        Caption:=mlStr(ML_MACROEDIT_CAPT,'Edit Macro');

        eName.Text:=MacroName;
        hkMacro.HotKey:=ShortCut(Key,Shift);
        cbEnabled.Checked:=not Disabled;
      end;
  end;

  cbEnabled.Visible:=(DlgTyp=msrEdit);
end;
//------------------------------------------------------------------------------------------
end.
