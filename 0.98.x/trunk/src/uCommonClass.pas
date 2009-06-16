// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uCommonClass;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ImgList, uCommon, SynEditTypes, uSafeRegistry;

type
  TFileData = class
  private
    fIconIndex   :integer;
    fIsDirectory :boolean;
    fFileName    :string;

    procedure SetFileName(Value:string);
  public
    constructor Create(AFileName:string); virtual;
    property FileName    :string read fFileName write SetFileName;
    property IconIndex   :integer read fIconIndex;
    property IsDirectory :boolean read fIsDirectory;
  end;


  TBookmark = class
    Index :integer;
    X     :integer;
    Y     :integer;
    function GetFormattedString:string;
  end;


  TBookmarkList = class
  private
    FItems :TList;
    function GetItem(Index: integer): TBookmark;
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(Index,X,Y:integer);
    procedure Clear;
    function  SaveToFormattedList:TStringList;

    property Count                :integer read GetCount;
    property Items[Index:integer] :TBookmark read GetItem; default;
  end;


  TFindTextResult = class
  private
    fFileName: string;
    fPosition: TBufferCoord;
    fLine: string;
    fLen: integer;
    fFormattedLine: string;
    fOriginalLine: string;
  public
    constructor Create(FileName, Line: string; Position: TBufferCoord; Len: integer);

    property FileName: string read fFileName;
    property Line: string read fLine;
    property FormattedLine: string read fFormattedLine write fFormattedLine;
    property OriginalLine: string read fOriginalLine write fOriginalLine;
    property Position: TBufferCoord read fPosition;
    property Len: integer read fLen;
  end;

  TFindTextResultList = class(TList)
  private
    fSharedItems: boolean;
    function Get(Index: integer): TFindTextResult;
    procedure Put(Index: integer; const Value: TFindTextResult);
  public
    procedure Clear; override;
    property SharedItems: boolean read fSharedItems write fSharedItems;
    property Items[Index: integer]: TFindTextResult read Get write Put; default;
  end;

  TEditorOptions = class
  private
  public
  end;


implementation

uses
  fMain;


////////////////////////////////////////////////////////////////////////////////////////////
//				      TFileData
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFileData.Create(AFileName:string);
begin
  FileName:=AFileName;
  fIsDirectory:=(FileGetAttr(FileName) and faDirectory)>0;
end;
//------------------------------------------------------------------------------------------
procedure TFileData.SetFileName(Value:string);
begin
  if (fFileName<>Value) then begin
    fFileName:=Value;
    fIconIndex:=fmMain.FileIconPool.GetIconIndex(FileName);
  end;
end;
//------------------------------------------------------------------------------------------



////////////////////////////////////////////////////////////////////////////////////////////
//                                      TBookmark
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TBookmark.GetFormattedString: string;
begin
  result:=Format('(%d:%d,%d);',[Index,X,Y]);
end;
//------------------------------------------------------------------------------------------



////////////////////////////////////////////////////////////////////////////////////////////
//                                      TBookmark
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TBookmarkList.Create;
begin
  FItems:=TList.Create;
end;
//------------------------------------------------------------------------------------------
destructor TBookmarkList.Destroy;
begin
  Clear;
  FItems.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------
function TBookmarkList.GetCount: integer;
begin
  result:=FItems.Count;
end;
//------------------------------------------------------------------------------------------
function TBookmarkList.GetItem(Index: integer): TBookmark;
begin
  if (Index>=0) and (Index<Count) then
    result:=FItems[Index]
  else
    result:=nil;
end;
//------------------------------------------------------------------------------------------
procedure TBookmarkList.Add(Index, X, Y: integer);
var
  bm :TBookmark;
begin
  bm:=TBookmark.Create;
  bm.Index:=Index;
  bm.X:=X;
  bm.Y:=Y;

  FItems.Add(bm);
end;
//------------------------------------------------------------------------------------------
procedure TBookmarkList.Clear;
var
  i :integer;
begin
  for i:=0 to Count-1 do
    Items[i].Free;

  FItems.Clear;
end;
//------------------------------------------------------------------------------------------
function TBookmarkList.SaveToFormattedList:TStringList;
var
  str    :TStringList;
  i      :integer;
  bm     :TBookmark;
begin
  str:=TStringList.Create;

  str.Add('BookmarkCount='+IntToStr(Count));

  for i:=0 to Count-1 do begin
    bm:=Items[i];
    str.Add(Format('Bookmark%dIndex=%d',[i,bm.Index]));
    str.Add(Format('Bookmark%dX=%d',[i,bm.X]));
    str.Add(Format('Bookmark%dY=%d',[i,bm.Y]));
  end;

  result:=str;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  TFindTextResult
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFindTextResult.Create(FileName, Line: string; Position: TBufferCoord; Len: integer);
begin
  fFileName:=FileName;
  fPosition:=Position;
  fLine:=Line;
  fLen:=Len;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  TFindTextResultList
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TFindTextResultList.Clear;
var
  i: integer;
begin
  if not fSharedItems then
    for i:=0 to Count-1 do
      Items[i].Free;

  inherited;
end;
//------------------------------------------------------------------------------------------
function TFindTextResultList.Get(Index: integer): TFindTextResult;
begin
  result:=inherited Get(Index);
end;
//------------------------------------------------------------------------------------------
procedure TFindTextResultList.Put(Index: integer; const Value: TFindTextResult);
begin
  inherited Put(Index, Value);
end;
//------------------------------------------------------------------------------------------

end.

