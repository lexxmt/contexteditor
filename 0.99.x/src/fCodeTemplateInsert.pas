// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fCodeTemplateInsert;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SynEditTypes;

type
  TfmCTInsert = class;

  TCTNotifyEvent = procedure(Sender: TfmCTInsert; ItemSelected:boolean; Item:string) of object;

  TfmCTInsert = class(TForm)
    lbCT: TListBox;
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbCTDblClick(Sender: TObject);
    procedure lbCTKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbCTDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    str                :TStringList;
    MaxLStrLen         :integer;
    MaxRStrLen         :integer;
    FClosing           :boolean;
    fOnCTSelect: TCTNotifyEvent;
    fSavedCaretPosition: TBufferCoord;

    procedure SelectItem;
    procedure Cancel;
    function  GetSelectedItem(Index:integer):string;
  public
    procedure InitItems;
    procedure AddItem(Completion, Comment:string);
    function  GetWinWidth:integer;

    property OnCTSelect: TCTNotifyEvent read fOnCTSelect write fOnCTSelect;
    property SavedCaretPosition: TBufferCoord read fSavedCaretPosition write fSavedCaretPosition;
  end;

var
  fmCTInsert: TfmCTInsert;

implementation

uses
  fMain;

{$R *.DFM}

const
  ITEM_SEPARATOR = #09;

  L_MARGIN       =   4;
  MIDDLE_SPACE   =  20;
  R_MARGIN       =  20;
  MAX_WIDTH      = 400;

////////////////////////////////////////////////////////////////////////////////////////////
//                                      Public functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.InitItems;
begin
  str.BeginUpdate;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.AddItem(Completion, Comment:string);
var
  W1, W2 :integer;
begin
  str.Add(Completion+ITEM_SEPARATOR+Comment);

  W1:=lbCT.Canvas.TextWidth(Completion);
  W2:=lbCT.Canvas.TextWidth(Comment);

  if (MaxLStrLen<W1) then MaxLStrLen:=W1;
  if (MaxRStrLen<W2) then MaxRStrLen:=W2;
end;
//------------------------------------------------------------------------------------------
function TfmCTInsert.GetWinWidth:integer;
begin
  result:=L_MARGIN+MaxLStrLen+MIDDLE_SPACE+MaxRStrLen+R_MARGIN;

  if result>MAX_WIDTH then
    result:=MAX_WIDTH;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                      Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TfmCTInsert.GetSelectedItem(Index:integer):string;
begin
  if (Index>-1) and (Index<lbCT.Items.Count) then
    result:=Copy(lbCT.Items[Index],1,Pos(ITEM_SEPARATOR,lbCT.Items[Index])-1)
  else
    result:='';
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.SelectItem;
begin
  if Assigned(fOnCTSelect) then
    OnCTSelect(SELF, TRUE, GetSelectedItem(lbCT.ItemIndex));

  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.Cancel;
begin
  if Assigned(fOnCTSelect) then
    OnCTSelect(SELF, FALSE, '');

  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     ListBox events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.lbCTDblClick(Sender: TObject);
begin
  SelectItem;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.lbCTKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      SelectItem;
    VK_ESCAPE:
      Cancel;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.lbCTDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  s                :string;
  s1, s2           :string;
  bEnd             :integer;
  l_pos            :integer;
begin
  s:=TListBox(Control).Items[Index];

  bEnd:=Pos(ITEM_SEPARATOR,s);

  s1:=Copy(s,1,bEnd-1);
  s2:=Copy(s,bEnd+1,Length(s));

  with TListBox(Control).Canvas do begin
    FillRect(Rect);

    l_pos:=L_MARGIN;

    Font.Style:=[fsBold];
    TextOut(l_pos, Rect.top, s1);

    Font.Style:=[];
    TextOut(l_pos+MaxLStrLen+MIDDLE_SPACE, Rect.top, s2);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.FormCreate(Sender: TObject);
begin
  str:=TStringList.Create;
  lbCT.ItemHeight:=fmMain.DefaultlbItemHeight;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.FormShow(Sender: TObject);
begin
  str.Sort;
  str.EndUpdate;

  lbCT.Items.Assign(str);
  lbCT.ItemIndex:=0;

  FClosing:=FALSE;

  if (lbCT.Items.Count=1) then
    SelectItem;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.FormDeactivate(Sender: TObject);
begin
  if not FClosing then
    Cancel;
end;
//------------------------------------------------------------------------------------------
procedure TfmCTInsert.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FClosing:=TRUE;
  str.Free;

  Action:=caFree;
end;
//------------------------------------------------------------------------------------------

end.

