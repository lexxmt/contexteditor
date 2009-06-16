// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fCustomizeFileTypes;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uCommon, SynEditHighlighter, uMultiLanguage, MainInstance;

type
  TItem = class
  private
    fHL :pTHighlighter;
  public
    Modified :boolean;
    constructor Create(HL:pTHighlighter);
    property HL :pTHighlighter read fHL;
  end;

  TfmCustomizeType = class(TForm)
    lbHL: TListBox;
    labHighlighters: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    btnEdit: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lbHLDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnEditClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    TabPos1 :integer;

    procedure Clear;
    procedure RefreshList;
    procedure InstanceFileOpenNotify(var Msg: tMessage); message wmMainInstanceOpenFile;
  public
    modal_result :TModalResult;
  end;

var
  fmCustomizeType: TfmCustomizeType;

implementation

uses
  fMain;

{$R *.DFM}

const
  COL1_WIDTH_FACTOR = 0.35;



////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TItem.Create(HL:pTHighlighter);
begin
  fHL:=HL;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Messages
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.InstanceFileOpenNotify(var Msg: tMessage);
begin
  fmMain.InstanceFileOpenNotify(Msg);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function ExtToStr(ext:string):string;
var
  i :integer;
begin
  result:='';

  while (Length(ext)>0) do begin
    ext:=TrimLeft(ext);
    if (Pos('*.',ext)=1) then
      Delete(ext,1,2);

    i:=1;
    while (i<=Length(ext)) and (ext[i]<>';') do
      inc(i);

    if (Length(result)>0) then
      result:=result+', ';
    result:=result+Copy(ext,1,i-1);

    Delete(ext,1,i);
  end;
end;
//------------------------------------------------------------------------------------------
function StrToExt(s:string):string;
var
  i :integer;
begin
  result:='';

  while (Length(s)>0) do begin
    i:=1;
    while (i<=Length(s)) and (s[i]<>',') do
      inc(i);

    result:=result+'*.'+Trim(Copy(s,1,i-1))+';';
    Delete(s,1,i);
  end;

  if ((Length(result)>0) and (result[Length(result)]=';')) then
    SetLength(result,Length(result)-1);
end;
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.Clear;
var
  i :integer;
begin
  for i:=0 to lbHL.Items.Count-1 do
    TItem(lbHL.Items.Objects[i]).Free;
  lbHL.Items.Clear;
end;
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.RefreshList;
var
  i    :integer;
begin
  Clear;

  for i:=1 to HIGHLIGHTERS_COUNT-1 do begin
    lbHL.Items.AddObject(Highlighters[i].Name+#09+ExtToStr(Highlighters[i].Ext),
                         TItem.Create(@Highlighters[i]));
  end;

  lbHL.ItemIndex:=0;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.btnOKClick(Sender: TObject);
var
  i    :integer;
  s    :string;
  Item :TItem;
begin
  for i:=0 to lbHL.Items.Count-1 do begin
    s:=lbHL.Items[i];
    Item:=TItem(lbHL.Items.Objects[i]);

    if Item.Modified then begin
      Item.HL^.Ext:=StrToExt(Copy(s,Pos(#09,s)+1,Length(s)));
      CopyExtToDefaultFilter(Item.HL);
      Item.HL^.ChangedAttr:=TRUE;
    end;
  end;

  OptionsChanged:=TRUE;

  modal_result:=mrOK;
  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.btnCancelClick(Sender: TObject);
begin
  modal_result:=mrCancel;
  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.btnEditClick(Sender: TObject);
var
  s    :string;
  Item :TItem;
begin
  if (lbHL.ItemIndex=-1) then EXIT;

  s:=lbHL.Items[lbHL.ItemIndex];
  s:=Copy(s,Pos(#09,s)+1,Length(s));
  Item:=TItem(lbHL.Items.Objects[lbHL.ItemIndex]);

  if InputQuery(mlStr(ML_CUSTTYP_EXT_EDIT_CAPTION,'Extension edit')+' - '+Item.HL^.Name,
                mlStr(ML_CUSTTYP_EXT_EDIT_TEXT,'Enter extensions separated with commas')+':',s) then begin
    lbHL.Items[lbHL.ItemIndex]:=Item.HL^.Name+#09+s;
    Item.Modified:=TRUE;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    OnDraw
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.lbHLDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  name  :string;
  ext   :string;
  s     :string;
begin
  s:=lbHL.Items[Index];
  name:=Copy(s,1,Pos(#09,s)-1);
  ext:=Copy(s,Pos(#09,s)+1,Length(s));

  with TListBox(Control).Canvas do begin
    FillRect(Rect);

    if (odSelected in State) then
      Font.Color:=clHighLightText;

    TextOut(4, Rect.top, name);
    TextOut(TabPos1+2, Rect.top, ext);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.FormShow(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  TabPos1:=Round(lbHL.Width*COL1_WIDTH_FACTOR);

  lbHL.ItemHeight:=fmMain.DefaultlbItemHeight;
  RefreshList;
end;
//------------------------------------------------------------------------------------------
procedure TfmCustomizeType.FormDestroy(Sender: TObject);
begin
  Clear;
end;
//------------------------------------------------------------------------------------------

end.
