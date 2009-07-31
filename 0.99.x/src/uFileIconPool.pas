// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uFileIconPool;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  ImgList, uCommon;

type
  TFileIconPoolItem = class
  private
    FIndex     :integer;
    FExtension :string;
  public
    constructor Create(Extension:string; Index:integer);
    property Index     :integer read FIndex;
    property Extension :string read FExtension;
  end;

  TFileIconPool = class
  private
    FImageList :TImageList;
    FItems     :TList;

    function GetItem(Index:integer):TFileIconPoolItem;
    function GetItemCount: integer;
    function FindFileIndex(FileName:string):integer;
    function GetNewFileIndex: integer;
    function GetUnexistantFileIndex: integer;
    function GetFolderClosedIndex: integer;
    procedure CreateImages;
  public
    constructor Create;
    destructor Destroy; override;

    function  GetIconIndex(FileName:string):integer;
    procedure Clear;

    property ItemCount: integer read GetItemCount;
    property Items[Index:integer]: TFileIconPoolItem read GetItem;
    property ImageList: TImageList read FImageList;
    property NewFileIndex: integer read GetNewFileIndex;
    property UnexistantFileIndex: integer read GetUnexistantFileIndex;
    property FolderClosedIndex: integer read GetFolderClosedIndex;
  end;

implementation

const
  NEW_FILE_INDEX        = 0;
  UNEXISTANT_FILE_INDEX = 1;
  CLOSED_FOLDER_INDEX   = 2;


////////////////////////////////////////////////////////////////////////////////////////////
//				     TFileIconPoolItem
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFileIconPoolItem.Create(Extension:string; Index:integer);
begin
  FIndex:=Index;
  FExtension:=UpperCase(Extension);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//				   Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TFileIconPool.GetItem(Index:integer):TFileIconPoolItem;
begin
  if (Index>=0) and (Index<ItemCount) then
    result:=FItems[Index]
  else
    result:=nil;
end;
//------------------------------------------------------------------------------------------
function TFileIconPool.GetItemCount: integer;
begin
  result:=FItems.Count;
end;
//------------------------------------------------------------------------------------------
function TFileIconPool.GetNewFileIndex: integer;
begin
  result:=NEW_FILE_INDEX;
end;
//------------------------------------------------------------------------------------------
function TFileIconPool.GetUnexistantFileIndex: integer;
begin
  result:=UNEXISTANT_FILE_INDEX;
end;
//------------------------------------------------------------------------------------------
function TFileIconPool.GetFolderClosedIndex: integer;
begin
  result:=CLOSED_FOLDER_INDEX;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//				      Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TFileIconPool.Clear;
var
  i :integer;
begin
  for i:=0 to ItemCount-1 do
    Items[i].Free;

  FItems.Clear;
end;
//------------------------------------------------------------------------------------------
function TFileIconPool.GetIconIndex(FileName: string): integer;
var
  n    :integer;
  Item :TFileIconPoolItem;
  icon :TIcon;
  attr :integer;
begin
  if (Length(FileName)>0) then begin
    attr:=FileGetAttr(FileName);

    if (attr<>-1) and ((attr and faDirectory)>0) then begin
      result:=FolderClosedIndex;
    end else begin
      if FileExists(FileName) then begin
        n:=FindFileIndex(FileName);
        if (n=-1) then begin
          Item:=TFileIconPoolItem.Create(ExtractFileExt(FileName), FImageList.Count);
          icon:=Get16x16FileIcon(FileName);
          FItems.Add(Item);
          result:=FImageList.AddIcon(icon);
          icon.Free;
        end else
          result:=n;
      end else
        result:=UNEXISTANT_FILE_INDEX;
    end;
  end else
    result:=-1;
end;
//------------------------------------------------------------------------------------------
function TFileIconPool.FindFileIndex(FileName:string):integer;
var
  i   :integer;
  ext :string;
begin
  ext:=UpperCase(ExtractFileExt(FileName));

  result:=-1;
  i:=0;
  while i<ItemCount do begin
    if (Items[i].Extension=ext) then begin
      result:=Items[i].Index;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TFileIconPool.CreateImages;
begin
  AddIconToImageList(FImageList, 'ICO_NEW_FILE');
  AddIconToImageList(FImageList, 'ICO_FILE_MISSING');
  AddBitmapToImageList(FImageList, 'BMP_FOLDER_CLOSE', clAqua);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//				   Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFileIconPool.Create;
begin
  FItems:=TList.Create;
  FImageList:=TImageList.Create(nil);
  FImageList.AllocBy:=32;

  CreateImages;
end;
//------------------------------------------------------------------------------------------
destructor TFileIconPool.Destroy;
begin
  Clear;
  FItems.Free;
  FImageList.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------

end.

