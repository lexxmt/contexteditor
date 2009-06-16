// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uFileHist;

interface

{$I ConTEXT.inc}

uses
  Windows, SysUtils, Classes, Menus, uCommon, Registry, SynEdit, uCommonClass, Dialogs;

type
  TFilePosRec = class
  private
    FBookmarks :TList;
    fWordwrap: boolean;
    fY: integer;
    fTopLine: integer;
    fX: integer;
    fHighlighterName: string;
    function GetBookmark(Index: integer): TBookmark;
    function GetBookmarkCount: integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddBookmark(Index,X,Y:integer);
    procedure Clear;
    function GetFormattedString:string;

    property BookmarkCount            :integer read GetBookmarkCount;
    property Bookmarks[Index:integer] :TBookmark read GetBookmark;
    property Wordwrap: boolean read fWordwrap write fWordwrap;
    property TopLine: integer read fTopLine write fTopLine;
    property X: integer read fX write fX;
    property Y: integer read fY write fY;
    property HighlighterName: string read fHighlighterName write fHighlighterName;
  end;

type
  TFilePosHistory = class(TStringList)
  private
    FEnabled             :boolean;
    FLoaded              :boolean;
    FChanged             :boolean;

    procedure SetEnabled(Value:boolean);
    procedure ParseLine(s:string);

    procedure Load;
    procedure Save;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear; override;

    procedure UpdatePosition(fmEditor:TObject);
    function  GetPositionRec(FileName:string; var Index:integer):TFilePosRec;
  published
    property Enabled :boolean read FEnabled write SetEnabled;
  end;

//------------------------------------------------------------------------------------------

implementation

uses
  fEditor;

const
  EDIT_POSITIONS_FNAME  = 'ConTEXT Positions.ini';
  MAX_POS_HISTORY_FILES = 500;





////////////////////////////////////////////////////////////////////////////////////////////
//                                        TFilePosRec
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFilePosRec.Create;
begin
  FBookmarks:=TList.Create;
end;
//------------------------------------------------------------------------------------------
destructor TFilePosRec.Destroy;
begin
  Clear;
  FBookmarks.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------
procedure TFilePosRec.AddBookmark(Index, X, Y: integer);
var
  bm :TBookmark;
begin
  bm:=TBookmark.Create;
  bm.Index:=Index;
  bm.X:=X;
  bm.Y:=Y;
  FBookmarks.Add(bm);
end;
//------------------------------------------------------------------------------------------
procedure TFilePosRec.Clear;
var
  i :integer;
begin
  TopLine:=0;
  X:=0;
  Y:=0;
  HighlighterName:='';

  for i:=0 to BookmarkCount-1 do
    Bookmarks[i].Free;

  fBookmarks.Clear;
end;
//------------------------------------------------------------------------------------------
function TFilePosRec.GetBookmark(Index: integer): TBookmark;
begin
  if (Index>=0) and (Index<BookmarkCount) then
    result:=FBookmarks[Index]
  else
    result:=nil;
end;
//------------------------------------------------------------------------------------------
function TFilePosRec.GetBookmarkCount: integer;
begin
  result:=FBookmarks.Count;
end;
//------------------------------------------------------------------------------------------
function TFilePosRec.GetFormattedString: string;

  function GetBookmarkString:string;
  var
    i :integer;
  begin
    result:='';
    for i:=0 to BookmarkCount-1 do
      result:=result+Bookmarks[i].GetFormattedString;
  end;

begin
  result:=Format('%d,%d,%d|%s|%s|%d',[TopLine, X, Y, GetBookmarkString, HighlighterName, integer(fWordwrap)]);
end;
//------------------------------------------------------------------------------------------



////////////////////////////////////////////////////////////////////////////////////////////
//                                  Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFilePosHistory.Create;
begin
  FLoaded:=FALSE;
  FChanged:=FALSE;
end;
//------------------------------------------------------------------------------------------
destructor TFilePosHistory.Destroy;
begin
  Save;
  Clear;

  inherited;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TFilePosHistory.SetEnabled(Value:boolean);
begin
  if (FEnabled<>Value) then begin
    FEnabled:=Value;
    Load;
  end;
end;
//------------------------------------------------------------------------------------------
function TFilePosHistory.GetPositionRec(FileName:string; var Index:integer):TFilePosRec;
var
  len :integer;
  i   :integer;
begin
  result:=nil;
  if not FEnabled then EXIT;

  FileName:=AnsiUpperCase(FileName);
  len:=Length(FileName);

  i:=0;
  Index:=-1;
  while (i<Count) do begin
    if (len=Length(Strings[i])) and (AnsiUpperCase(Strings[i])=FileName) then begin
      result:=TFilePosRec(Objects[i]);
      Index:=i;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TFilePosHistory.UpdatePosition(fmEditor:TObject);
var
  n     :integer;
  fname :string;
  rec   :TFilePosRec;
  memo  :TSynEdit;
  HL    :pTHighlighter;

  procedure PropertiesToRec(rec:TFilePosRec);
  var
    i :integer;
  begin
    rec.Clear;
    rec.TopLine:=memo.TopLine;
    rec.X:=memo.CaretX;
    rec.Y:=memo.CaretY;
    rec.Wordwrap:=memo.WordWrap;

    for i:=0 to memo.Marks.Count-1 do
      rec.AddBookmark(memo.Marks[i].BookmarkNumber, memo.Marks[i].Char, memo.Marks[i].Line);

    HL:=GetHighlighterRec(memo.Highlighter);
    if Assigned(HL) and (FindHighlighterForFile(fname)<>HL) then
      rec.HighlighterName:=HL^.name;
  end;

begin
  if FEnabled then begin
    fname:=TfmEditor(fmEditor).FileName;
    memo:=TfmEditor(fmEditor).memo;

    rec:=GetPositionRec(fname,n);

    // ako fajl ne postoji...
    if not Assigned(rec) then begin
      rec:=TFilePosRec.Create;
      InsertObject(0,fname,rec);
      n:=0;
    end else begin
      Delete(n);
      InsertObject(0,fname,rec);
    end;

    PropertiesToRec(rec);

    FChanged:=TRUE;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                      Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TFilePosHistory.Clear;
var
  i :integer;
begin
  for i:=0 to Count-1 do
    if Assigned(Objects[i]) then
      TFilePosRec(Objects[i]).Free;

  inherited;
end;
//------------------------------------------------------------------------------------------
procedure TFilePosHistory.ParseLine(s:string);
var
  rec    :TFilePosRec;
  p      :pChar;
  fname  :string;
  Index, X, Y :integer;

  function GetNextInt(var p:pChar):integer;
  var
    s :string;
  begin
    while (p^ in [',',' ','(',')',';',':']) do begin
      inc(p);
    end;

    s:='0';
    while (p^ in ['0'..'9']) do begin
      s:=s+p^;
      inc(p);
    end;

    result:=StrToIntDef(s,0);
  end;

  function GetNextStr(var p:pChar):string;
  var
    s :string;
  begin
    s:='';
    while (not (p^ in ['|',#13,#10,#0])) do begin
      s:=s+p^;
      inc(p);
    end;

    result:=s;
  end;

begin
  if (Length(s)>=3) and (s[1]='"') then begin
    // filename
    p:=@s[2];
    fname:=RemoveQuote(Copy(s,2,Pos('"',p)-1));

    if (Length(fname)>0) then begin
      // pozicioniraj se na koordinate
      p:=@s[1];
      inc(p,Length(fname)+3);

      rec:=TFilePosRec.Create;
      rec.TopLine:=GetNextInt(p);
      rec.X:=GetNextInt(p);
      rec.Y:=GetNextInt(p);
      inc(p);

      // bookmarks
      while TRUE do begin
        Index:=GetNextInt(p);
        X:=GetNextInt(p);
        Y:=GetNextInt(p);

        if (X>0) then
          rec.AddBookmark(Index, X, Y)
        else
          BREAK;
      end;
      inc(p);

      rec.HighlighterName:=GetNextStr(p);
      inc(p);
      rec.Wordwrap:=(GetNextInt(p)=1);

      AddObject(fname,rec);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TFilePosHistory.Load;
var
  str :TStringList;
  i   :integer;
begin
  if FLoaded then EXIT;

  if FileExists(ApplicationDir+EDIT_POSITIONS_FNAME) then begin
    str:=TStringList.Create;

    try
      str.LoadFromFile(ApplicationDir+EDIT_POSITIONS_FNAME);
    except
    end;

    str.BeginUpdate;

    // limitiraj velièinu
    while (str.Count>MAX_POS_HISTORY_FILES) do
      str.Delete(str.Count-1);

    for i:=0 to str.Count-1 do
      ParseLine(str[i]);

    str.EndUpdate;
    str.Free;

    FLoaded:=TRUE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TFilePosHistory.Save;
var
  str :TStringList;
  i   :integer;
  rec :TFilePosRec;
begin
//  if not (FEnabled and FChanged) then EXIT;

  if FEnabled then begin
    str:=TStringList.Create;

    for i:=0 to Count-1 do begin
      rec:=TFilePosRec(Objects[i]);

      if Assigned(rec) then
        str.Add(Format('"%s"|%s',[Strings[i], rec.GetFormattedString]));
    end;

    try
      str.SaveToFile(ApplicationDir+EDIT_POSITIONS_FNAME);
    except
    end;

    str.Free;
  end;
end;
//------------------------------------------------------------------------------------------

end.
