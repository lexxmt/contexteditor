{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynHighlighterGeneral.pas, released 2000-04-07.
The Original Code is based on the mwGeneralSyn.pas file from the
mwEdit component suite by Martin Waldenburg and other developers, the Initial
Author of this file is Martin Waldenburg.
Portions written by Martin Waldenburg are copyright 1999 Martin Waldenburg.
All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterGeneral.pas,v 1.2 2000/07/14 17:37:16 mghie Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}
{
@abstract(Provides a customizable highlighter for SynEdit)
@author(Martin Waldenburg, converted to SynEdit by Michael Hieke)
@created(1999)
@lastmod(2000-06-23)
The SynHighlighterGeneral unit provides a customizable highlighter for SynEdit.
}
unit SynHighlighterMyGeneral;

{$I SynEdit.inc}

interface

uses
  SysUtils, Windows, Messages, Classes, Controls, Graphics,
  SynEditTypes, SynEditHighlighter;

type
  TtkTokenKind = (tkComment, tkIdentifier, tkKey1, tkKey2, tkKey3, tkNull, tkNumber,
    tkPreprocessor, tkSpace, tkString, tkSymbol, tkUnknown);                    // DJLP 2000-06-18

  TRangeState = (rsANil, rsBlockComment, rsMultilineString, rsUnKnown);

  TProcTableProc = procedure of object;

type
  TSynMyGeneralSyn = class(TSynCustomHighlighter)
  private
    FLanguageName :string;
    fRange: TRangeState;
    fLine: PChar;
    fProcTable: array[#0..#255] of TProcTableProc;
    Run: LongInt;
    fTokenPos: Integer;
    fTokenID: TtkTokenKind;
    fLineNumber : Integer;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fKeyAttri1: TSynHighlighterAttributes;
    fKeyAttri2: TSynHighlighterAttributes;
    fKeyAttri3: TSynHighlighterAttributes;
    fNumberAttri: TSynHighlighterAttributes;
    fPreprocessorAttri: TSynHighlighterAttributes;                              // DJLP 2000-06-18
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    fKeyWords1: TStrings;
    fKeyWords2: TStrings;
    fKeyWords3: TStrings;
    fIdentChars: TSynIdentChars;
    fNumConstChars: TSynIdentChars;
    fNumBegChars: TSynIdentChars;
    fDetectPreprocessor: boolean;                                               // DJLP 2000-06-18

    FLineComment        :string;
    FCommentBeg         :string;
    FCommentEnd         :string;
    FStrBegChar         :char;
    FStrEndChar         :char;
    FMultilineStrings   :boolean;

    Identifiers: array[#0..#255] of ByteBool;

    procedure AsciiCharProc;
    procedure CRProc;
    procedure IdentProc;
    function  MatchComment(CommentStr:string):boolean;
    procedure LineCommentProc;
    procedure CommentBegProc;
    procedure CommentEndProc;
    procedure StringBegProc;
    procedure StringEndProc;
    procedure IntegerProc;
    procedure LFProc;
    procedure NullProc;
    procedure NumberProc;
    procedure SpaceProc;
    procedure UnknownProc;
    function IsKeyWord1(aToken: String): Boolean;
    function IsKeyWord2(aToken: String): Boolean;
    function IsKeyWord3(aToken: String): Boolean;
    procedure SetKeyWords1(const Value: TStrings);
    procedure SetKeyWords2(const Value: TStrings);
    procedure SetKeyWords3(const Value: TStrings);
    function GetIdentifierChars: string;
    function GetNumConstChars: string;
    function GetNumBegChars: string;
    procedure SetIdentifierChars(const Value: string);
    procedure SetNumConstChars(const Value: string);
    procedure SetNumBegChars(const Value: string);
    procedure SetDetectPreprocessor(Value: boolean);                            // DJLP 2000-06-18
    procedure SetLanguageName(Value:string);
    procedure MakeIdentTable;
  protected
    function GetIdentChars: TSynIdentChars; override;
  public

    {$IFNDEF SYN_CPPB_1} class {$ENDIF}                                         //mh 2000-07-14
    function GetLanguageName: string; override;
  public
    CurrLineHighlighted :boolean;
    RightEdgeColorFg    :TColor;
    RightEdgeColorBg    :TColor;
    HelpFile            :string;
    CaseSensitive       :boolean;
    IdentifierBegChars  :string;
    SourceFileName      :string;
    EscapeChar          :char;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
      override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetTokenID: TtkTokenKind;
    procedure SetLine(NewValue: String; LineNumber:Integer); override;
    function GetToken: String; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    procedure Next; override;
    procedure SetRange(Value: Pointer); override;
    procedure ResetRange; override;
    function SaveToRegistry(RootKey: HKEY; Key: string): boolean; override;
    function LoadFromRegistry(RootKey: HKEY; Key: string): boolean; override;
    procedure SetCommentStrings(LineComment, CommentBeg, CommentEnd:string);
    procedure GetCommentStrings(var LineComment, CommentBeg, CommentEnd:string);
    procedure SetStringParams(StrBegChar, StrEndChar:char; MultilineStrings:boolean);
    procedure MakeMethodTables;
    procedure AssignPropertiesTo(HL:TSynMyGeneralSyn);
  published
    property LanguageName: string read FLanguageName write SetLanguageName;
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri
      write fCommentAttri;
    property DetectPreprocessor: boolean read fDetectPreprocessor               // DJLP 2000-06-18
      write SetDetectPreprocessor;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri
      write fIdentifierAttri;
    property IdentifierChars: string read GetIdentifierChars
      write SetIdentifierChars;
    property NumConstChars: string read GetNumConstChars write SetNumConstChars;
    property NumBegChars: string read GetNumBegChars write SetNumBegChars;
    property KeyAttri1: TSynHighlighterAttributes read fKeyAttri1 write fKeyAttri1;
    property KeyAttri2: TSynHighlighterAttributes read fKeyAttri2 write fKeyAttri2;
    property KeyAttri3: TSynHighlighterAttributes read fKeyAttri3 write fKeyAttri3;
    property KeyWords1: TStrings read fKeyWords1 write SetKeyWords1;
    property KeyWords2: TStrings read fKeyWords2 write SetKeyWords2;
    property KeyWords3: TStrings read fKeyWords3 write SetKeyWords3;
    property NumberAttri: TSynHighlighterAttributes read fNumberAttri
      write fNumberAttri;
    property PreprocessorAttri: TSynHighlighterAttributes                       // DJLP 2000-06-18
      read fPreprocessorAttri write fPreprocessorAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri
      write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri
      write fStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri
      write fSymbolAttri;
  end;

procedure Register;

implementation

uses
  SynEditStrConst;

procedure Register;
begin
  RegisterComponents(SYNS_HighlightersPage, [TSynMyGeneralSyn]);
end;

procedure TSynMyGeneralSyn.AssignPropertiesTo(HL:TSynMyGeneralSyn);
begin
  HL.CurrLineHighlighted:=CurrLineHighlighted;
  HL.RightEdgeColorFg:=RightEdgeColorFg;
  HL.RightEdgeColorBg:=RightEdgeColorBg;
  HL.HelpFile:=HelpFile;
  HL.CaseSensitive:=CaseSensitive;
  HL.IdentifierBegChars:=IdentifierBegChars;
  HL.IdentifierChars:=IdentifierChars;
  HL.NumConstChars:=NumConstChars;
  HL.NumBegChars:=NumBegChars;
  HL.DetectPreprocessor:=DetectPreprocessor;
  HL.SetCommentStrings(FLineComment, FCommentBeg, FCommentEnd);
  HL.SetStringParams(FStrBegChar, FStrEndChar, FMultilineStrings);

  if CaseSensitive then begin
    HL.Keywords1.Text:=Keywords1.Text;
    HL.Keywords2.Text:=Keywords2.Text;
    HL.Keywords3.Text:=Keywords3.Text;
  end else begin
    HL.Keywords1.Text:=UpperCase(Keywords1.Text);
    HL.Keywords2.Text:=UpperCase(Keywords2.Text);
    HL.Keywords3.Text:=UpperCase(Keywords3.Text);
  end;

  HL.MakeMethodTables;
end;

procedure TSynMyGeneralSyn.MakeIdentTable;
var
  I: Char;
begin
  for I := #0 to #255 do
    Identifiers[I]:=(i in fIdentChars);
end;

function TSynMyGeneralSyn.IsKeyWord1(aToken: String): Boolean;
var
  i     :integer;
  Token :string;
begin
  Result := FALSE;

  if not CaseSensitive then
    Token := UpperCase(aToken)
  else
    Token := aToken;

  i:=0;
  while (i<fKeywords1.Count) do begin
    if (fKeywords1[i]=Token) then begin
      result:=TRUE;
      BREAK;
    end;
    inc(i);
  end;
end; { IsKeyWord1 }

function TSynMyGeneralSyn.IsKeyWord2(aToken: String): Boolean;
var
  i     :integer;
  Token :string;
begin
  Result := FALSE;

  if not CaseSensitive then
    Token := UpperCase(aToken)
  else
    Token := aToken;

  i:=0;
  while (i<fKeywords2.Count) do begin
    if (fKeywords2[i]=Token) then begin
      result:=TRUE;
      BREAK;
    end;
    inc(i);
  end;
end; { IsKeyWord2 }

function TSynMyGeneralSyn.IsKeyWord3(aToken: String): Boolean;
var
  i     :integer;
  Token :string;
begin
  Result := FALSE;

  if not CaseSensitive then
    Token := UpperCase(aToken)
  else
    Token := aToken;

  i:=0;
  while (i<fKeywords3.Count) do begin
    if (fKeywords3[i]=Token) then begin
      result:=TRUE;
      BREAK;
    end;
    inc(i);
  end;
end; { IsKeyWord3 }

procedure TSynMyGeneralSyn.MakeMethodTables;
var
  I: Char;

  procedure CommentToProcTable(var CommentStr:string; proc:TProcTableProc);
  begin
    if (Length(CommentStr)>0) then begin
      if (UpCase(CommentStr[1]) in fIdentChars) then begin
        fProcTable[UpCase(CommentStr[1])]:=proc;
        fProcTable[LowerCase(CommentStr[1])[1]]:=proc;
        CommentStr:=UpperCase(CommentStr);
      end else
        fProcTable[CommentStr[1]]:=proc;
    end;
  end;

begin
  for I := #0 to #255 do begin
    if (Pos(I,IdentifierBegChars)>0) then begin
      fProcTable[I] := IdentProc;
    end else begin
      if (I in fNumBegChars) then begin
        fProcTable[I] := NumberProc;
      end else begin
        case I of
          '#': fProcTable[I] := AsciiCharProc;
          #13: fProcTable[I] := CRProc;
  //        '$': fProcTable[I] := IntegerProc;
          #10: fProcTable[I] := LFProc;
          #0: fProcTable[I] := NullProc;
  //        '0'..'9': fProcTable[I] := NumberProc;
          #1..#9, #11, #12, #14..#32: fProcTable[I] := SpaceProc;
          else fProcTable[I] := UnknownProc;
        end;
      end;
    end;
  end;

  if (FStrBegChar<>#00) then fProcTable[FStrBegChar]:=StringBegProc;
  
  CommentToProcTable(FLineComment, LineCommentProc);
  CommentToProcTable(FCommentBeg, CommentBegProc);
  FCommentEnd:=UpperCase(FCommentEnd);
end;

constructor TSynMyGeneralSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fKeyWords1 := TStringList.Create;
  TStringList(fKeyWords1).Sorted := True;
  TStringList(fKeyWords1).Duplicates := dupIgnore;
  fKeyWords2 := TStringList.Create;
  TStringList(fKeyWords2).Sorted := True;
  TStringList(fKeyWords2).Duplicates := dupIgnore;
  fKeyWords3 := TStringList.Create;
  TStringList(fKeyWords3).Sorted := True;
  TStringList(fKeyWords3).Duplicates := dupIgnore;
  fCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment);
  fCommentAttri.Style := [fsItalic];
  AddAttribute(fCommentAttri);
  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier);
  AddAttribute(fIdentifierAttri);
  fKeyAttri1 := TSynHighlighterAttributes.Create('Keywords 1');
  fKeyAttri1.Style := [fsBold];
  AddAttribute(fKeyAttri1);
  fKeyAttri2 := TSynHighlighterAttributes.Create('Keywords 2');
  fKeyAttri2.Style := [fsBold];
  AddAttribute(fKeyAttri2);
  fKeyAttri3 := TSynHighlighterAttributes.Create('Keywords 3');
  fKeyAttri3.Style := [fsBold];
  AddAttribute(fKeyAttri3);
  fNumberAttri := TSynHighlighterAttributes.Create(SYNS_AttrNumber);
  AddAttribute(fNumberAttri);
  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace);
  AddAttribute(fSpaceAttri);
  fStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString);
  AddAttribute(fStringAttri);
  fSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol);
  AddAttribute(fSymbolAttri);
{begin}                                                                         // DJLP 2000-06-18
  fPreprocessorAttri := TSynHighlighterAttributes.Create(SYNS_AttrPreprocessor);
  AddAttribute(fPreprocessorAttri);
{end}                                                                           // DJLP 2000-06-18
  SetAttributesOnChange(DefHighlightChange);

  fIdentChars := inherited GetIdentChars;
  NumConstChars:='0123456789';
  NumBegChars:='0123456789';
  MakeIdentTable;
  fRange := rsUnknown;
end; { Create }

destructor TSynMyGeneralSyn.Destroy;
begin
  fKeyWords1.Free;
  fKeyWords2.Free;
  fKeyWords3.Free;
  inherited Destroy;
end; { Destroy }

procedure TSynMyGeneralSyn.SetLine(NewValue: String; LineNumber:Integer);
begin
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end; { SetLine }

procedure TSynMyGeneralSyn.CRProc;
begin
  fTokenID := tkSpace;
  Inc(Run);
  if fLine[Run] = #10 then Inc(Run);
end;

procedure TSynMyGeneralSyn.AsciiCharProc;
begin
  if fDetectPreprocessor then begin
    fTokenID := tkPreprocessor;
    repeat
      inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end else begin
    fTokenID := tkSymbol;
    inc(Run);
  end;
end;

procedure TSynMyGeneralSyn.IdentProc;
begin
  inc(Run);
  while Identifiers[fLine[Run]] do inc(Run);
  if IsKeyWord1(GetToken) then
    fTokenId := tkKey1
    else
      if IsKeyWord2(GetToken) then
        fTokenId := tkKey2
      else
        if IsKeyWord3(GetToken) then
          fTokenId := tkKey3
        else
          fTokenId := tkIdentifier;
end;

function TSynMyGeneralSyn.MatchComment(CommentStr:string):boolean;
var
  i   :integer;
  len :integer;
  ok  :boolean;
begin
  len:=Length(CommentStr);
  ok:=(len>0);

  if ok then begin
    i:=1;
    while ok and (i<=len) do begin
      ok:=(UpCase(FLine[Run+i-1])=CommentStr[i]);
      inc(i);
    end;
    ok:=ok and (i-1=len);
  end;

  if ok and (CommentStr[1] in fIdentChars) then
    ok:=not (FLine[Run+Length(CommentStr)] in fIdentChars);

  result:=ok;
end;

procedure TSynMyGeneralSyn.LineCommentProc;
begin
  if MatchComment(FLineComment) then begin
    inc(Run,Length(FLineComment));
    fTokenID:=tkComment;
    while (FLine[Run]<>#0) do begin
      case FLine[Run] of
        #10, #13: BREAK;
      end;
      inc(Run);
    end;
  end else begin
    if (Length(FLineComment)>0) and (FLineComment[1] in fIdentChars) then
      IdentProc
    else begin
      inc(Run);
      fTokenID := tkSymbol;
    end;
  end;
end;

procedure TSynMyGeneralSyn.CommentBegProc;
begin
  if MatchComment(FLineComment) then
    LineCommentProc
  else begin
    if MatchComment(FCommentBeg) then begin
      fTokenID:=tkComment;
      fRange:=rsBlockComment;
      inc(Run,Length(FCommentBeg));

      while (FLine[Run]<>#0) do begin
        if MatchComment(FCommentEnd) then begin
          fRange:=rsUnKnown;
          inc(Run,Length(FCommentEnd));
          BREAK;
        end else begin
          case FLine[Run] of
            #10,#13: BREAK;
            else
              inc(Run);
          end;
        end;
      end;
    end else begin
      if (Length(FCommentBeg)>0) and (FCommentBeg[1] in fIdentChars) then
        IdentProc
      else begin
        inc(Run);
        fTokenID := tkSymbol;
      end;
    end;
  end;
end;

procedure TSynMyGeneralSyn.CommentEndProc;
begin
  fTokenID:=tkComment;

  case FLine[Run] of
    #0:
      begin
        NullProc;
        exit;
      end;
    #10:
      begin
        LFProc;
        exit;
      end;
    #13:
      begin
        CRProc;
        exit;
      end;
  end;

  while (FLine[Run]<>#0) do begin
    if MatchComment(FCommentEnd) then begin
      fRange:=rsUnKnown;
      inc(Run,Length(FCommentEnd));
      BREAK;
    end else begin
      case FLine[Run] of
        #10,#13: BREAK;
        else
          inc(Run);
      end;
    end;
  end;
end;

procedure TSynMyGeneralSyn.StringBegProc;
begin
  fTokenID:=tkString;
  repeat
    if (FLine[Run]=EscapeChar) and (EscapeChar<>#0) then begin
      inc(Run);
    end else begin
      case FLine[Run] of
        #0, #10, #13:
          begin
            if FMultilineStrings then
              fRange:=rsMultilineString;
            BREAK;
          end;
      end;
    end;
    inc(Run);
  until FLine[Run] = FStrEndChar;
  if FLine[Run] <> #0 then inc(Run);
end;

procedure TSynMyGeneralSyn.StringEndProc;
begin
  fTokenID:=tkString;

  case FLine[Run] of
    #0:
      begin
        NullProc;
        exit;
      end;
    #10:
      begin
        LFProc;
        exit;
      end;
    #13:
      begin
        CRProc;
        exit;
      end;
  end;

  repeat
    if (FLine[Run]=EscapeChar) and (EscapeChar<>#0) then begin
      inc(Run);
    end else begin
      case FLine[Run] of
        #0, #10, #13: BREAK;
      end;
    end;
    inc(Run);
  until FLine[Run]=FStrEndChar;

  if (FLine[Run]=FStrEndChar) then
    fRange:=rsUnKnown;
  
  if FLine[Run] <> #0 then inc(Run);
end;

procedure TSynMyGeneralSyn.IntegerProc;
begin
  inc(Run);
  fTokenID := tkNumber;
  while FLine[Run] in ['0'..'9', 'A'..'F', 'a'..'f'] do inc(Run);
end;

procedure TSynMyGeneralSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end;

procedure TSynMyGeneralSyn.NullProc;
begin
  fTokenID := tkNull;
end;

{begin}                                                                         // DJLP 2000-06-18
procedure TSynMyGeneralSyn.NumberProc;
begin
  inc(Run);
  fTokenID := tkNumber;

//  while FLine[Run] in ['0'..'9', '.', 'e', 'E', 'x'] do
  while FLine[Run] in fNumConstChars do
  begin
    case FLine[Run] of
      '.':
        if FLine[Run + 1] = '.' then break;
    end;
    inc(Run);
  end;
end;
{end}                                                                           // DJLP 2000-06-18

procedure TSynMyGeneralSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while FLine[Run] in [#1..#9, #11, #12, #14..#32] do inc(Run);
end;

procedure TSynMyGeneralSyn.UnknownProc;
begin
  inc(Run);
  fTokenID := tkUnKnown;
end;

procedure TSynMyGeneralSyn.Next;
begin
  fTokenPos := Run;
  Case fRange of
    rsBlockComment:    CommentEndProc;
    rsMultilineString: StringEndProc;
    else
      fProcTable[fLine[Run]];
  end;
end;

function TSynMyGeneralSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := fKeyAttri1;
    SYN_ATTR_STRING: Result := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
    else Result := nil;
  end;
end;

function TSynMyGeneralSyn.GetEol: Boolean;
begin
  Result := fTokenId = tkNull;
end;

function TSynMyGeneralSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

function TSynMyGeneralSyn.GetToken: String;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;

function TSynMyGeneralSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynMyGeneralSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment: Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey1: Result := fKeyAttri1;
    tkKey2: Result := fKeyAttri2;
    tkKey3: Result := fKeyAttri3;
    tkNumber: Result := fNumberAttri;
    tkPreprocessor: Result := fPreprocessorAttri;                               // DJLP 2000-06-18
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkSymbol: Result := fSymbolAttri;
    tkUnknown: Result := fSymbolAttri;
    else Result := nil;
  end;
end;

function TSynMyGeneralSyn.GetTokenKind: integer;
begin
  Result := Ord(fTokenId);
end;

function TSynMyGeneralSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

procedure TSynMyGeneralSyn.ReSetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynMyGeneralSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

procedure TSynMyGeneralSyn.SetKeyWords1(const Value: TStrings);
var
  i: Integer;
begin
  if Value <> nil then
    begin
      Value.BeginUpdate;
      for i := 0 to Value.Count - 1 do begin
        if not CaseSensitive then
          Value[i] := UpperCase(Value[i]);
      end;
      Value.EndUpdate;
    end;
  fKeyWords1.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynMyGeneralSyn.SetKeyWords2(const Value: TStrings);
var
  i: Integer;
begin
  if Value <> nil then
    begin
      Value.BeginUpdate;
      for i := 0 to Value.Count - 1 do begin
        if not CaseSensitive then
          Value[i] := UpperCase(Value[i]);
      end;
      Value.EndUpdate;
    end;
  fKeyWords2.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynMyGeneralSyn.SetKeyWords3(const Value: TStrings);
var
  i: Integer;
begin
  if Value <> nil then
    begin
      Value.BeginUpdate;
      for i := 0 to Value.Count - 1 do begin
        if not CaseSensitive then
          Value[i] := UpperCase(Value[i]);
      end;
      Value.EndUpdate;
    end;
  fKeyWords3.Assign(Value);
  DefHighLightChange(nil);
end;

{$IFNDEF SYN_CPPB_1} class {$ENDIF}                                             //mh 2000-07-14
function TSynMyGeneralSyn.GetLanguageName: string;
begin
  result:='';
//  SELF.GetStringDelim;
//  Result := LanguageName;
end;

function TSynMyGeneralSyn.LoadFromRegistry(RootKey: HKEY; Key: string): boolean;
begin
  result:=TRUE;
end;

function TSynMyGeneralSyn.SaveToRegistry(RootKey: HKEY; Key: string): boolean;
begin
  result:=TRUE;
end;

procedure TSynMyGeneralSyn.SetCommentStrings(LineComment, CommentBeg, CommentEnd:string);
begin
  FLineComment:=LineComment;
  FCommentBeg:=CommentBeg;
  FCommentEnd:=CommentEnd;
end;

procedure TSynMyGeneralSyn.GetCommentStrings(var LineComment, CommentBeg, CommentEnd:string);
begin
  LineComment:=FLineComment;
  CommentBeg:=FCommentBeg;
  CommentEnd:=FCommentEnd;
end;

procedure TSynMyGeneralSyn.SetStringParams(StrBegChar, StrEndChar:char; MultilineStrings:boolean);
begin
  FStrBegChar:=StrBegChar;
  FStrEndChar:=StrEndChar;
  FMultilineStrings:=MultilineStrings;

  if (FStrBegChar<>#00) then fProcTable[FStrBegChar]:=StringBegProc;
end;

function TSynMyGeneralSyn.GetIdentifierChars: string;
var
  ch: char;
  s: shortstring;
begin
  s := '';
  for ch := #0 to #255 do
    if ch in fIdentChars then s := s + ch;
  Result := s;
end;

function TSynMyGeneralSyn.GetNumConstChars: string;
var
  ch: char;
  s: shortstring;
begin
  s := '';
  for ch := #0 to #255 do
    if ch in fNumConstChars then s := s + ch;
  Result := s;
end;

function TSynMyGeneralSyn.GetNumBegChars: string;
var
  ch: char;
  s: shortstring;
begin
  s := '';
  for ch := #0 to #255 do
    if ch in fNumBegChars then s := s + ch;
  Result := s;
end;

procedure TSynMyGeneralSyn.SetIdentifierChars(const Value: string);
var
  i: integer;
begin
  fIdentChars := [];
  for i := 1 to Length(Value) do begin
    fIdentChars := fIdentChars + [Value[i]];
  end; //for
  MakeIdentTable;
end;

procedure TSynMyGeneralSyn.SetNumConstChars(const Value: string);
var
  i: integer;
begin
  fNumConstChars := [];
  for i := 1 to Length(Value) do begin
    fNumConstChars := fNumConstChars + [Value[i]];
  end; //for
end;

procedure TSynMyGeneralSyn.SetNumBegChars(const Value: string);
var
  i: integer;
begin
  fNumBegChars := [];
  for i := 1 to Length(Value) do begin
    fNumBegChars := fNumBegChars + [Value[i]];
  end; //for
end;

procedure TSynMyGeneralSyn.SetLanguageName(Value:string);
begin
  FLanguageName:=Value;
end;

function TSynMyGeneralSyn.GetIdentChars: TSynIdentChars;
begin
  Result := fIdentChars;
end;

{begin}                                                                         // DJLP 2000-06-18
procedure TSynMyGeneralSyn.SetDetectPreprocessor(Value: boolean);
begin
  if Value <> fDetectPreprocessor then begin
    fDetectPreprocessor := Value;
    DefHighlightChange(Self);
  end;
end;
{end}                                                                           // DJLP 2000-06-18

initialization
{$IFNDEF SYN_CPPB_1}                                                            //mh 2000-07-14
  RegisterPlaceableHighlighter(TSynMyGeneralSyn);
{$ENDIF}
end.

