// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fHTMLTidyManageProfiles;

interface

{$I ConTEXT.inc}

{$IFDEF SUPPORTS_HTML_TIDY}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ActnList, StdCtrls, TB2Item, TBX, TB2Dock, TB2Toolbar;

type
  TfmHTMLTidyManageProfiles = class(TForm)
    lvProfiles: TListView;
    Button1: TButton;
    alTidyProfiles: TActionList;
    acNew: TAction;
    acEdit: TAction;
    acDelete: TAction;
    TBXToolbar1: TTBXToolbar;
    TBXItem1: TTBXItem;
    TBXItem2: TTBXItem;
    TBXItem3: TTBXItem;
    acClose: TAction;
    procedure acNewExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure alTidyProfilesUpdate(Action: TBasicAction;
      var Handled: Boolean);
  private
    procedure ProfilesToForm;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure CreateHTMLTidyManageProfilesDialog;

{$ENDIF}

implementation

{$IFDEF SUPPORTS_HTML_TIDY}
{$R *.dfm}

uses
  fMain, uHTMLTidy, fHTMLTidyProfile;


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure CreateHTMLTidyManageProfilesDialog;
begin
  with TfmHTMLTidyManageProfiles.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyManageProfiles.ProfilesToForm;
var
  strNames: TStringList;
  strFiles: TStringList;
  i: integer;
begin
  strNames:=HTMLTidy.ProfileList;
  strFiles:=HTMLTidy.ProfileFileList;

  lvProfiles.Items.BeginUpdate;
  try
    lvProfiles.Items.Clear;

    for i:=0 to strNames.Count-1 do begin
      with lvProfiles.Items.Add do begin
        Caption:=strNames[i];
        SubItems.Add(strFiles[i]);
      end;
    end;
  finally
    lvProfiles.Items.EndUpdate;
    strNames.Free;
    strFiles.Free;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyManageProfiles.alTidyProfilesUpdate(Action: TBasicAction;
  var Handled: Boolean);
var
  selected: boolean;  
begin
  selected:=Assigned(lvProfiles.Selected);
  acEdit.Enabled:=selected;
  acDelete.Enabled:=selected;
end;
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyManageProfiles.acNewExecute(Sender: TObject);
begin
  HTMLTidy.SetDefaults;

  with TfmHTMLTidyProfile.Create(SELF, HTMLTidy.Profile, '') do
    try
      if (ShowModal=mrOK) then
        ProfilesToForm;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyManageProfiles.acEditExecute(Sender: TObject);
begin
  if Assigned(lvProfiles.Selected) then begin
    with TfmHTMLTidyProfile.Create(SELF, HTMLTidy.Profile, lvProfiles.Selected.Caption) do
      try
        if (ShowModal=mrOK) then
          ProfilesToForm;
      finally
        Free;
      end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyManageProfiles.acDeleteExecute(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------------------
procedure TfmHTMLTidyManageProfiles.acCloseExecute(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TfmHTMLTidyManageProfiles.Create(AOwner: TComponent);
begin
  inherited;
  ProfilesToForm;
end;
//------------------------------------------------------------------------------------------
destructor TfmHTMLTidyManageProfiles.Destroy;
begin
  inherited;
end;
//------------------------------------------------------------------------------------------

{$ENDIF}


end.
