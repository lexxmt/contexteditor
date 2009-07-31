// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fMacroManage;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, uMacros, uMultiLanguage,
  MainInstance, uCommon, fMacroStart;

type
  TfmMacroManage = class(TForm)
    lvMacros: TListView;
    btnCancel: TButton;
    btnOK: TButton;
    btnDelete: TButton;
    btnEdit: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure lvMacrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FChanged :boolean;

    procedure InstanceFileOpenNotify(var Msg: tMessage); message wmMainInstanceOpenFile;

    procedure MacroToForm(name:string; mac:pTMacro; n:integer);
    procedure SelectItem(n:integer);
  public
  end;

implementation

uses
  fMain;

{$R *.DFM}


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Messages
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.InstanceFileOpenNotify(var Msg: tMessage);
begin
  fmMain.InstanceFileOpenNotify(Msg);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.MacroToForm(name:string; mac:pTMacro; n:integer);
var
  shcut, en :string;
begin
  if Assigned(mac) then begin
      shcut:=ShortcutToText(Shortcut(mac^.Key,mac^.Shift));

      if not mac^.Disabled then
        en:='Yes'
      else
        en:='No';

    if (n<lvMacros.Items.Count) then with lvMacros.Items[n] do begin
      Caption:=name;
      SubItems[0]:=shcut;
      SubItems[1]:=en;
      Data:=mac;
    end else with lvMacros.Items.Add do begin
      Caption:=name;
      SubItems.Add(shcut);
      SubItems.Add(en);
      Data:=mac;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.SelectItem(n:integer);
begin
  if (n>-1) then begin
    if not (n<lvMacros.Items.Count) then
      n:=lvMacros.Items.Count-1;

    if (n>-1) then begin
      lvMacros.Selected:=lvMacros.Items[n];
      lvMacros.ItemFocused:=lvMacros.Selected;
    end;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.btnEditClick(Sender: TObject);
var
  fmMacroStartRecording :TfmMacroStartRecording;
  mac                   :pTMacro;
begin
  if not Assigned(lvMacros.Selected) or not Assigned(lvMacros.Selected.Data) then EXIT;

  mac:=pTMacro(lvMacros.Selected.Data);

  fmMacroStartRecording:=TfmMacroStartRecording.Create(Application);

  with fmMacroStartRecording do begin
    try
      DlgTyp:=msrEdit;

      MacroName:=lvMacros.Selected.Caption;
      Key:=mac^.Key;
      Shift:=mac^.Shift;
      Disabled:=mac^.Disabled;

      ShowModal;

      if (modal_result=mrOK) then begin
        mac^.Key:=Key;
        mac^.Shift:=Shift;
        mac^.Disabled:=Disabled;

        MacroToForm(MacroName,mac,lvMacros.Selected.Index);
        FChanged:=TRUE;
      end;
    finally
      Free;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.btnDeleteClick(Sender: TObject);
var
  n :integer;
begin
  if not Assigned(lvMacros.Selected) then EXIT;

  n:=lvMacros.Selected.Index;

  FreeMacro(pTMacro(lvMacros.Selected.Data));
  lvMacros.Selected.Delete;

  FChanged:=TRUE;
  SelectItem(n);
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.btnOKClick(Sender: TObject);
var
  i   :integer;
begin
  if FChanged then begin
    fmMain.Macros.Clear;

    for i:=0 to lvMacros.Items.Count-1 do begin
      if Assigned(lvMacros.Items[i].Data) then
        fmMain.Macros.AddMacro(lvMacros.Items[i].Caption, DuplicateMacro(lvMacros.Items[i].Data));
    end;
  end else begin
    for i:=0 to lvMacros.Items.Count-1 do
      FreeMacro(pTMacro(lvMacros.Items[i].Data));
  end;

  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.btnCancelClick(Sender: TObject);
var
  i :integer;
begin
  for i:=0 to lvMacros.Items.Count-1 do
    FreeMacro(lvMacros.Items[i].Data);

  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.lvMacrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DELETE:
      if (Shift=[]) then begin
        btnDeleteClick(SELF);
        Key:=0;
      end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmMacroManage.FormShow(Sender: TObject);
var
  i   :integer;
begin
  mlApplyLanguageToForm(SELF, Name);
  lvMacros.Columns[0].Caption:=mlStr(ML_MACRO_MANAGE_LV_CAPT_NAME,'Name');
  lvMacros.Columns[1].Caption:=mlStr(ML_MACRO_MANAGE_LV_CAPT_SHORTCUT,'Shortcut');
  lvMacros.Columns[2].Caption:=mlStr(ML_MACRO_MANAGE_LV_CAPT_ENABLED,'Enabled');

  lvMacros.Items.BeginUpdate;
  try
    lvMacros.Items.Clear;
    for i:=0 to fmMain.Macros.Count-1 do begin
      MacroToForm(fmMain.Macros.strMacros[i], DuplicateMacro(pTMacro(fmMain.Macros.strMacros.Objects[i])), i);
    end;
  finally
    lvMacros.Items.EndUpdate;
  end;

  FChanged:=FALSE;
  SelectItem(0);
end;
//------------------------------------------------------------------------------------------
end.

