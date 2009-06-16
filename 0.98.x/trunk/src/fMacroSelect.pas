// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fMacroSelect;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, uMacros, uMultiLanguage,
  MainInstance, uCommon;

type
  TfmMacroSelect = class(TForm)
    lvMacros: TListView;
    btnCancel: TButton;
    labMessage: TLabel;
    btnPlay: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure lvMacrosDblClick(Sender: TObject);
  private
    procedure InstanceFileOpenNotify(var Msg: tMessage); message wmMainInstanceOpenFile;
  public
    SelectedMacro :pTMacro;
  end;

implementation

uses
  fMain;

{$R *.DFM}


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Messages
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroSelect.InstanceFileOpenNotify(var Msg: tMessage);
begin
  fmMain.InstanceFileOpenNotify(Msg);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroSelect.btnSelectAllClick(Sender: TObject);
var
  i :integer;
begin
  for i:=0 to lvMacros.Items.Count-1 do
    lvMacros.Items[i].Checked:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroSelect.btnPlayClick(Sender: TObject);
begin
  if Assigned(lvMacros.Selected) then
    SelectedMacro:=pTMacro(lvMacros.Selected.Data);

  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroSelect.lvMacrosDblClick(Sender: TObject);
begin
  if Assigned(lvMacros.Selected) then
    btnPlayClick(SELF);
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroSelect.btnCancelClick(Sender: TObject);
begin
  SelectedMacro:=nil;

  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroSelect.FormShow(Sender: TObject);
var
  i   :integer;
  mac :pTMacro;
begin
  mlApplyLanguageToForm(SELF, Name);
  lvMacros.Columns[0].Caption:=mlStr(ML_MACRO_MANAGE_LV_CAPT_NAME,'Name');
  lvMacros.Columns[1].Caption:=mlStr(ML_MACRO_MANAGE_LV_CAPT_SHORTCUT,'Shortcut');

  lvMacros.Items.BeginUpdate;

  try
    lvMacros.Items.Clear;
    for i:=0 to fmMain.Macros.Count-1 do begin
      mac:=pTMacro(fmMain.Macros.strMacros.Objects[i]);
      if Assigned(mac) then begin
        with lvMacros.Items.Add do begin
          Caption:=fmMain.Macros.strMacros[i];
          SubItems.Add(ShortcutToText(Shortcut(mac^.Key,mac^.Shift)));
          Data:=mac;
        end;
      end;
    end;
  finally
    lvMacros.Items.EndUpdate;
  end;

  if (lvMacros.Items.Count>0) then
    lvMacros.Selected:=lvMacros.Items[0];

  lvMacros.SetFocus;
end;
//------------------------------------------------------------------------------------------
end.

