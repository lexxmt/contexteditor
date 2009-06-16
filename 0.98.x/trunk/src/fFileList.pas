// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFileList;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uMultiLanguage;

type
  TfmFileList = class(TForm)
    lb: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    eName: TEdit;
    procedure FormShow(Sender: TObject);
    procedure eNameChange(Sender: TObject);
    procedure eNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure lbClick(Sender: TObject);
  private
    FSelectedEditor :TObject;

    procedure FilesToList;
    procedure IncPosition(Count:integer);
    procedure DecPosition(Count:integer);
    procedure SelectedItemToEdit;
  public
    property SelectedEditor :TObject read FSelectedEditor write FSelectedEditor;
  end;


implementation

{$R *.DFM}

uses
  fMain, fEditor;


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileList.FilesToList;
var
  n  :integer;
  ed :TfmEditor;
begin
  n:=0;
  while fmMain.Enum(ed,n) do begin
    lb.Items.AddObject(ExtractFileName(ed.FileName),ed);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileList.SelectedItemToEdit;
begin
  if (lb.ItemIndex<>-1) then begin
    eName.Text:=lb.Items[lb.ItemIndex];
    eName.SelectAll;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileList.IncPosition(Count:integer);
begin
  if (lb.ItemIndex<lb.Items.Count-Count) then
    lb.ItemIndex:=lb.ItemIndex+Count
  else
    lb.ItemIndex:=lb.Items.Count-1;
  SelectedItemToEdit;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileList.DecPosition(Count:integer);
begin
  if (lb.ItemIndex>Count-1) then
    lb.ItemIndex:=lb.ItemIndex-Count
  else
    lb.ItemIndex:=0;
  SelectedItemToEdit;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileList.btnOKClick(Sender: TObject);
begin
  if (lb.ItemIndex<>-1) then
    SelectedEditor:=lb.Items.Objects[lb.ItemIndex];
  ModalResult:=mrOK;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileList.eNameChange(Sender: TObject);
var
  n     :integer;
  s     :string;
  found :boolean;
begin
  s:=UpperCase(eName.Text);

  found:=FALSE;
  if (Length(s)>0) then begin
    n:=0;
    while (n<lb.Items.Count) do begin
      if (UpperCase(Copy(lb.Items[n],1,Length(s)))=s) then begin
        lb.ItemIndex:=n;
        found:=TRUE;
        BREAK;
      end;
      inc(n);
    end;
  end;

  if not found then
    lb.ItemIndex:=-1;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileList.eNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift=[]) then begin
    case Key of
      VK_DOWN:
        begin
          IncPosition(1);
          Key:=0;
        end;
      VK_UP:
        begin
          DecPosition(1);
          Key:=0;
        end;
      VK_NEXT:
        begin
          IncPosition((lb.Height div lb.ItemHeight)-1);
          Key:=0;
        end;
      VK_PRIOR:
        begin
          DecPosition((lb.Height div lb.ItemHeight)-1);
          Key:=0;
        end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileList.lbClick(Sender: TObject);
begin
  SelectedItemToEdit;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileList.FormShow(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  FilesToList;

  if Assigned(SelectedEditor) then begin
    lb.ItemIndex:=lb.Items.IndexOfObject(SelectedEditor);
    SelectedItemToEdit;
  end;
end;
//------------------------------------------------------------------------------------------

end.
