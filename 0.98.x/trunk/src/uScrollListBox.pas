// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uScrollListBox;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, uCommon;

type  
  THScrollListBox = class(TListBox)
  private
    MaxExtent: integer;     { maximum length of the strings in the listbox (in pixel) }
    function GetStringExtent( s: string ): integer;
  protected
    procedure OnCustomDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
  public
    constructor Create( AOwner: TComponent ); override;
    function  InsertString(Index:integer; s:string; Data:TObject):integer;
    function  AddString(s:string; Data:TObject):integer;
    procedure DeleteString(i:integer);
    procedure ClearList;
    procedure AdjustWidth;
  published
  end;

  TFileData = record
                FileName    :string[255];
                IsDirectory :boolean;
                Icon        :TBitmap;
              end;

  pTFileData = ^TFileData;



implementation

////////////////////////////////////////////////////////////////////////////////////////////
//				       THScrollListBox
////////////////////////////////////////////////////////////////////////////////////////////

constructor THScrollListBox.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  OnDrawItem:=OnCustomDrawItem;
  MaxExtent := 0;
end;


function THScrollListBox.GetStringExtent( s: string ): integer;
var
  dwExtent:	      DWORD;
  hDCListBox:	      HDC;
  hFontOld, hFontNew: HFONT;
  tm:		      TTextMetric;
  Size: 	      TSize;
begin
  hDCListBox := GetDC( Handle );
  hFontNew := SendMessage( Handle, WM_GETFONT, 0, 0 );
  hFontOld := SelectObject( hDCListBox, hFontNew );
  GetTextMetrics( hDCListBox, tm );

  { the following two lines should be modified for Delphi 1.0: call GetTextExtent }
  GetTextExtentPoint32( hDCListBox, PChar(s), Length(s), Size );
  dwExtent := Size.cx + tm.tmAveCharWidth;

  SelectObject( hDCListBox, hFontOld );
  ReleaseDC( Handle, hDCListBox );

  GetStringExtent := LOWORD( dwExtent );
end;

procedure THScrollListBox.OnCustomDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  bmp	    :TBitmap;
  ofs	    :Integer;
  rec	    :pTFileData;
begin
  bmp:=nil;

  with Canvas do begin
    FillRect(Rect);
    ofs:=2;
    rec:=pTFileData(Items.Objects[Index]);

    if Assigned(rec^.Icon) then
      bmp:=rec^.Icon;

    if (bmp<>nil) then begin
      BrushCopy(Bounds(Rect.Left + 2, Rect.Top+1, bmp.Width, bmp.Height),
		bmp, Bounds(0, 0, bmp.Width, bmp.Height), BMP_MASK);
      ofs:=bmp.width+6;
    end;
    TextOut(Rect.Left+ofs,Rect.Top+2, Items[Index])
  end;
end;

function THScrollListBox.InsertString(Index:integer; s:string; Data:TObject):integer;
var
  StrExtent: integer;
begin
  StrExtent := GetStringExtent( s );
  if StrExtent > MaxExtent then
  begin
    MaxExtent := StrExtent;
    SendMessage( Handle, LB_SETHORIZONTALEXTENT, MaxExtent, 0 );
  end;

  { adds the string to the listbox }
  Items.InsertObject(Index, s, Data);
  result:=Index;
end;

function THScrollListBox.AddString(s:string; Data:TObject):integer;
begin
  result:=InsertString(Items.Count, s, Data);
end;

procedure THScrollListBox.DeleteString(i:integer);
begin
  Items.Delete(i);
  AdjustWidth;
end;

procedure THScrollListBox.ClearList;
begin
  MaxExtent := 0;
	SendMessage( Handle, LB_SETHORIZONTALEXTENT, 0, 0 );

	{ scrolls the listbox to the left }
	SendMessage( Handle, WM_HSCROLL, SB_TOP, 0 );

  { clears the listbox }
  Items.Clear;
  AdjustWidth;
end;

procedure THScrollListBox.AdjustWidth;
var
  i		 :integer;
  StrExtent	 :integer;
begin
  SendMessage( Handle, WM_HSCROLL, SB_TOP, 0 );

  MaxExtent:=0;
  i:=0;
  while (i<Items.Count) do begin
    StrExtent:=GetStringExtent(Items[i]);
    if (StrExtent>MaxExtent) then
      MaxExtent := StrExtent;
    inc(i);
  end;

  SendMessage( Handle, LB_SETHORIZONTALEXTENT, MaxExtent, 0 );
end;

end.

