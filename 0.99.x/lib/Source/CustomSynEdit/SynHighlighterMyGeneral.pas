unit SynHighlighterMyGeneral;

{$I SynEdit.inc}

interface

uses
  SysUtils,
  Windows,
  Messages,
  Classes,
  Controls,
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynHighLighterGeneral,
  JclStrings;

type
  TtkTokenKind = (tkComment, tkIdentifier, tkKey, tkNull, tkNumber, tkPreprocessor, tkSpace, tkString, tkSymbol, tkUnknown, tkKey2, tkKey3, tkKey4, tkKey5); // DJLP 2000-06-18
  TRangeState = (rsANil, rsBlockComment, rsMultilineString, rsUnKnown);

  TProcTableProc = procedure of object;

type
  TSynMyGeneralSyn = class(TSynCustomHighlighter)
  private
    FLanguageName: string;
    fRange: TRangeState;
    fProcTable: array[#0..#255] of TProcTableProc;
    fTokenID: TtkTokenKind;
    fKeyAttri1: TSynHighlighterAttributes;
    fKeyAttri2: TSynHighlighterAttributes;
    fKeyAttri3: TSynHighlighterAttributes;
    fKeyAttri4: TSynHighlighterAttributes;
    fKeyAttri5: TSynHighlighterAttributes;

    fComments: TCommentStyles;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fIdentChars: UnicodeString;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;

    fKeyWords1: TStrings;
    fKeyWords2: TStrings;
    fKeyWords3: TStrings;
    fKeyWords4: TStrings;
    fKeyWords5: TStrings;

    fNumConstChars: string;
    fNumBegChars: string;
    FLineComment: string;
    FCommentBeg: string;
    FCommentEnd: string;
    FLineCommentList: TStringList;
    FCommentBegList: TStringList;
    FCommentEndList: TStringList;
    FStrBegChars: string;
    FStrEndChars: string;
    FMultilineStrings: boolean;
    FNextStringEndChar: char;
    fPreprocessorAttri: TSynHighlighterAttributes;
    fNumberAttri: TSynHighlighterAttributes;
    fDetectPreprocessor: boolean;
    fStringDelimCh: WideChar;
    FSourceFileName: string;
    FDescription: string;
    FCaseSensitive: boolean;
    FCurrLineHighlighted: boolean;
    FOverrideTxtFgColor: boolean;
    FRightEdgeColorFg: TColor;
    FRightEdgeColorBg: TColor;
    FHelpFile: string;
    FIdentifierBegChars: string;
    FEscapeChar: char;
    FBlockAutoindent: boolean;
    FBlockBegStr: string;
    FBlockEndStr: string;

    procedure AsciiCharProc;
    function MatchComment(CommentList: TStringList; var CommentStr: string): boolean;
    procedure LineCommentProc;
    procedure CommentBegProc;
    procedure CommentEndProc;
    procedure StringBegProc;
    procedure StringEndProc;
    procedure SpaceProc;
    procedure UnknownProc;
    procedure SetKeyWords1(const Value: TStrings);
    procedure SetKeyWords2(const Value: TStrings);
    procedure SetKeyWords3(const Value: TStrings);
    procedure SetKeyWords4(const Value: TStrings);
    procedure SetKeyWords5(const Value: TStrings);
    function GetNumConstChars: string;
    function GetNumBegChars: string;
    procedure SetNumConstChars(const Value: string);
    procedure SetNumBegChars(const Value: string);
    procedure SetLanguageName(Value: string);
    procedure PrepareKeywordList(const Value: TStrings);
    procedure MyNumberProc;
    procedure MyIntegerProc;
    procedure MyCRProc;
    procedure MyLFProc;
    procedure MyNullProc;
    function GetIdentifierChars: UnicodeString;
    function GetStringDelim: TStringDelim;
    procedure SetDetectPreprocessor(const Value: boolean);
    procedure SetIdentifierChars(const Value: UnicodeString);
    procedure SetStringDelim(const Value: TStringDelim);
    procedure MyIdentProc;
    procedure SetComments(Value: TCommentStyles);
    function GetTokenID: TtkTokenKind;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetEol: Boolean; override;
    function IsKeyword(const AKeyword: String; const AKeywordList: TStrings): Boolean; reintroduce;
    function GetTokenPos: Integer; override;
    procedure Next; override;
    procedure SetRange(Value: Pointer); override;
    procedure ResetRange; override;
    procedure SetCommentStrings(LineComment, CommentBeg, CommentEnd: string);
    procedure GetCommentStrings(var LineComment, CommentBeg, CommentEnd: string);
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    procedure SetStringParams(StrBegChars, StrEndChars: string; MultilineStrings: boolean);
    procedure MakeMethodTables;
    procedure AssignPropertiesTo(HL: TSynMyGeneralSyn);
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;override;
    function GetTokenKind: integer; override;
    class function GetLanguageName: string; override;
  published
    property LanguageName: string read FLanguageName write SetLanguageName;
    property NumConstChars: string read GetNumConstChars write SetNumConstChars;
    property NumBegChars: string read GetNumBegChars write SetNumBegChars;

    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property Comments: TCommentStyles read fComments write SetComments;
    property DetectPreprocessor: boolean read fDetectPreprocessor write SetDetectPreprocessor;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property IdentifierChars: UnicodeString read GetIdentifierChars write SetIdentifierChars;

    property NumberAttri: TSynHighlighterAttributes read fNumberAttri write fNumberAttri;
    property PreprocessorAttri: TSynHighlighterAttributes read fPreprocessorAttri write fPreprocessorAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri write fSymbolAttri;
    property StringDelim: TStringDelim read GetStringDelim write SetStringDelim default sdSingleQuote;

    property KeyAttri1: TSynHighlighterAttributes read fKeyAttri1 write fKeyAttri1;
    property KeyAttri2: TSynHighlighterAttributes read fKeyAttri2 write fKeyAttri2;
    property KeyAttri3: TSynHighlighterAttributes read fKeyAttri3 write fKeyAttri3;
    property KeyAttri4: TSynHighlighterAttributes read fKeyAttri4 write fKeyAttri4;
    property KeyAttri5: TSynHighlighterAttributes read fKeyAttri5 write fKeyAttri5;
    property KeyWords1: TStrings read fKeyWords1 write SetKeyWords1;
    property KeyWords2: TStrings read fKeyWords2 write SetKeyWords2;
    property KeyWords3: TStrings read fKeyWords3 write SetKeyWords3;
    property KeyWords4: TStrings read fKeyWords4 write SetKeyWords4;
    property KeyWords5: TStrings read fKeyWords5 write SetKeyWords5;

    property SourceFileName: string read FSourceFileName write FSourceFileName;
    property Description: string read FDescription write FDescription;
    property CaseSensitive: boolean read FCaseSensitive write FCaseSensitive;
    property CurrLineHighlighted: boolean read FCurrLineHighlighted write FCurrLineHighlighted;
    property OverrideTxtFgColor: boolean read FOverrideTxtFgColor write FOverrideTxtFgColor;
    property RightEdgeColorFg: TColor read FRightEdgeColorFg write FRightEdgeColorFg;
    property RightEdgeColorBg: TColor read FRightEdgeColorBg write FRightEdgeColorBg;
    property HelpFile: string read FHelpFile write FHelpFile;
    property IdentifierBegChars: string read FIdentifierBegChars write FIdentifierBegChars;
    property EscapeChar: char read FEscapeChar write FEscapeChar;
    property BlockAutoindent: boolean read FBlockAutoindent write FBlockAutoindent;
    property BlockBegStr: string read FBlockBegStr write FBlockBegStr;
    property BlockEndStr: string read FBlockEndStr write FBlockEndStr;
  end;

procedure Register;

implementation

uses
  StrUtils,
  SynEditStrConst;

const
  COMMENT_LIST_SEPARATOR = ' ';

procedure Register;
begin
  RegisterComponents(SYNS_HighlightersPage, [TSynMyGeneralSyn]);
end;

procedure TSynMyGeneralSyn.AssignPropertiesTo(HL: TSynMyGeneralSyn);
begin
  HL.CurrLineHighlighted := CurrLineHighlighted;
  HL.OverrideTxtFgColor := OverrideTxtFgColor;
  HL.RightEdgeColorFg := RightEdgeColorFg;
  HL.RightEdgeColorBg := RightEdgeColorBg;
  HL.HelpFile := HelpFile;
  HL.CaseSensitive := CaseSensitive;
  HL.IdentifierBegChars := IdentifierBegChars;
  HL.IdentifierChars := IdentifierChars;
  HL.NumConstChars := NumConstChars;
  HL.NumBegChars := NumBegChars;
  HL.DetectPreprocessor := DetectPreprocessor;
  HL.SetCommentStrings(FLineComment, FCommentBeg, FCommentEnd);
  HL.SetStringParams(FStrBegChars, FStrEndChars, FMultilineStrings);
  HL.EscapeChar := EscapeChar;
  HL.BlockAutoindent := BlockAutoindent;
  HL.BlockBegStr := BlockBegStr;
  HL.BlockEndStr := BlockEndStr;

  if CaseSensitive then
  begin
    HL.Keywords1.Text := Keywords1.Text;
    HL.Keywords2.Text := Keywords2.Text;
    HL.Keywords3.Text := Keywords3.Text;
    HL.Keywords4.Text := Keywords4.Text;
    HL.Keywords5.Text := Keywords5.Text;
  end
  else
  begin
    HL.Keywords1.Text := UpperCase(Keywords1.Text);
    HL.Keywords2.Text := UpperCase(Keywords2.Text);
    HL.Keywords3.Text := UpperCase(Keywords3.Text);
    HL.Keywords4.Text := UpperCase(Keywords4.Text);
    HL.Keywords5.Text := UpperCase(Keywords5.Text);
  end;

  HL.MakeMethodTables;
end;

procedure TSynMyGeneralSyn.MakeMethodTables;
var
  I: Char;
  n: integer;

  procedure CommentToProcTable(CommentList: TStringList; proc: TProcTableProc);
  var
    i: integer;
    s: string;
  begin
    for i := 0 to CommentList.Count - 1 do
    begin
      s := UpperCase(CommentList[i]);
      if (Length(s) > 0) then
      begin
        if Pos(s[1], IdentifierChars) > 0 then
        begin
          fProcTable[s[1]] := proc;
          fProcTable[LowerCase(s[1])[1]] := proc;
          CommentList[i] := s;
        end
        else
          fProcTable[s[1]] := proc;
      end;
    end;
  end;

begin
  for I := #0 to #255 do
  begin
    fProcTable[I] := MyIdentProc;
    if (Pos(I, IdentifierBegChars) > 0) then
    begin
      fProcTable[I] := MyIdentProc;
    end
    else
    begin
      if Pos(I, fNumBegChars) > 0 then
        fProcTable[I] := MyNumberProc
      else
      begin
        case I of
          '#': fProcTable[I] := AsciiCharProc;
          #13: fProcTable[I] := MyCRProc;
          #10: fProcTable[I] := MyLFProc;
          #0: fProcTable[I] := MyNullProc;
          //        '0'..'9': fProcTable[I] := NumberProc;
          #1..#9, #11, #12, #14..#32: fProcTable[I] := SpaceProc;
        else
          fProcTable[I] := UnknownProc;
        end;
      end;
    end;
  end;

  for n := 1 to Length(FStrBegChars) do
    fProcTable[FStrBegChars[n]] := StringBegProc;

  CommentToProcTable(FLineCommentList, LineCommentProc);
  CommentToProcTable(FCommentBegList, CommentBegProc);

  FCommentEnd := UpperCase(FCommentEnd);
end;

constructor TSynMyGeneralSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLineCommentList := TStringList.Create;
  FCommentBegList := TStringList.Create;
  FCommentEndList := TStringList.Create;

  fKeyWords1 := TStringList.Create;
  TStringList(fKeyWords1).Sorted := True;
  TStringList(fKeyWords1).Duplicates := dupIgnore;

  fKeyWords2 := TStringList.Create;
  TStringList(fKeyWords2).Sorted := True;
  TStringList(fKeyWords2).Duplicates := dupIgnore;

  fKeyWords3 := TStringList.Create;
  TStringList(fKeyWords3).Sorted := True;
  TStringList(fKeyWords3).Duplicates := dupIgnore;

  fKeyWords4 := TStringList.Create;
  TStringList(fKeyWords4).Sorted := True;
  TStringList(fKeyWords4).Duplicates := dupIgnore;

  fKeyWords5 := TStringList.Create;
  TStringList(fKeyWords5).Sorted := True;
  TStringList(fKeyWords5).Duplicates := dupIgnore;

  fCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment, SYNS_FriendlyAttrComment);
  fCommentAttri.Style := [fsItalic];
  AddAttribute(fCommentAttri);

  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fNumberAttri := TSynHighlighterAttributes.Create(SYNS_AttrNumber, SYNS_FriendlyAttrNumber);
  AddAttribute(fNumberAttri);

  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  AddAttribute(fStringAttri);

  fSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol, SYNS_FriendlyAttrSymbol);
  AddAttribute(fSymbolAttri);

  fPreprocessorAttri := TSynHighlighterAttributes.Create(SYNS_AttrPreprocessor, SYNS_FriendlyAttrPreprocessor);
  AddAttribute(fPreprocessorAttri);

  fKeyAttri1 := TSynHighlighterAttributes.Create('Keywords 1', 'Keywords 1');
  fKeyAttri1.Style := [];
  AddAttribute(fKeyAttri1);

  fKeyAttri2 := TSynHighlighterAttributes.Create('Keywords 2', 'Keywords 2');
  fKeyAttri2.Style := [];
  AddAttribute(fKeyAttri2);

  fKeyAttri3 := TSynHighlighterAttributes.Create('Keywords 3', 'Keywords 3');
  fKeyAttri3.Style := [];
  AddAttribute(fKeyAttri3);

  fKeyAttri4 := TSynHighlighterAttributes.Create('Keywords 4', 'Keywords 4');
  fKeyAttri4.Style := [];
  AddAttribute(fKeyAttri4);

  fKeyAttri5 := TSynHighlighterAttributes.Create('Keywords 5', 'Keywords 5');
  fKeyAttri5.Style := [];
  AddAttribute(fKeyAttri5);

  NumConstChars := '0123456789';
  NumBegChars := '0123456789';
  fRange := rsUnknown;
end;

procedure TSynMyGeneralSyn.MyCRProc;
begin
  fTokenID := tkSpace;
  Inc(Run);
  if fLine[Run] = #10 then
    Inc(Run);
end;

{ Create }

destructor TSynMyGeneralSyn.Destroy;
begin
  fKeyWords1.Free;
  fKeyWords2.Free;
  fKeyWords3.Free;
  fKeyWords4.Free;
  fKeyWords5.Free;

  FLineCommentList.Free;
  FCommentBegList.Free;
  FCommentEndList.Free;

  inherited Destroy;
end; { Destroy }

procedure TSynMyGeneralSyn.AsciiCharProc;
begin
  if DetectPreprocessor then
  begin
    fTokenID := tkPreprocessor;
    repeat
      inc(Run);
    until CharInSet(fLine[Run], [#0, #10, #13]);
  end
  else
  begin
    fTokenID := tkSymbol;
    inc(Run);
  end;
end;

function TSynMyGeneralSyn.MatchComment(CommentList: TStringList; var CommentStr: string): boolean;
var
  i: integer;
  len: integer;
  ok: boolean;
  j: integer;
begin
  j := 0;
  ok := FALSE;
  while (j < CommentList.Count) do
  begin
    CommentStr := UpperCase(CommentList[j]);

    len := Length(CommentStr);
    ok := (len > 0);

    if ok then
    begin
      i := 1;
      while ok and (i <= len) do
      begin
        ok := (UpCase(FLine[Run + i - 1]) = CommentStr[i]);
        inc(i);
      end;
      ok := ok and (i - 1 = len);
    end;

    if ok and ContainsStr(CommentStr[1], IdentifierChars) then
      ok := not ContainsStr(FLine[Run + Length(CommentStr)], IdentifierChars);

    if ok then
      BREAK;

    inc(j);
  end;

  result := ok;
end;

procedure TSynMyGeneralSyn.MyLFProc;
begin
  fTokenID := tkSpace;
  Inc(Run);
  if fLine[Run] = #10 then Inc(Run);
end;

procedure TSynMyGeneralSyn.LineCommentProc;
var
  CommentStr: string;
begin
  if MatchComment(FLineCommentList, CommentStr) then
  begin
    inc(Run, Length(CommentStr));
    fTokenID := tkComment;
    while (FLine[Run] <> #0) do
    begin
      case FLine[Run] of
        #10, #13: BREAK;
      end;
      inc(Run);
    end;
  end
  else
  begin
    if (Length(CommentStr) > 0) and ContainsStr(CommentStr[1], IdentifierChars) then
      MyIdentProc
    else
    begin
      inc(Run);
      fTokenID := tkSymbol;
    end;
  end;
end;

procedure TSynMyGeneralSyn.CommentBegProc;
var
  CommentStr: string;
begin
  if MatchComment(FLineCommentList, CommentStr) then
    LineCommentProc
  else
  begin
    if MatchComment(FCommentBegList, CommentStr) then
    begin
      fTokenID := tkComment;
      fRange := rsBlockComment;
      inc(Run, Length(CommentStr));

      while (FLine[Run] <> #0) do
      begin
        if MatchComment(FCommentEndList, CommentStr) then
        begin
          fRange := rsUnKnown;
          inc(Run, Length(CommentStr));
          BREAK;
        end
        else
        begin
          case FLine[Run] of
            #10, #13: BREAK;
          else
            inc(Run);
          end;
        end;
      end;
    end
    else
    begin
      if (Length(CommentStr) > 0) and ContainsStr(CommentStr[1], IdentifierChars) then
        MyIdentProc
      else
      begin
        inc(Run);
        fTokenID := tkSymbol;
      end;
    end;
  end;
end;

procedure TSynMyGeneralSyn.CommentEndProc;
var
  CommentStr: string;
begin
  fTokenID := tkComment;

  case FLine[Run] of
    #0:
      begin
        MyNullProc;
        exit;
      end;
    #10:
      begin
        MyLFProc;
        exit;
      end;
    #13:
      begin
        MyCRProc;
        exit;
      end;
  end;

  while (FLine[Run] <> #0) do
  begin
    if MatchComment(FCommentEndList, CommentStr) then
    begin
      fRange := rsUnKnown;
      inc(Run, Length(CommentStr));
      BREAK;
    end
    else
    begin
      case FLine[Run] of
        #10, #13: BREAK;
      else
        inc(Run);
      end;
    end;
  end;
end;

procedure TSynMyGeneralSyn.StringBegProc;
var
  i: integer;
begin
  fTokenID := tkString;

  i := Pos(FLine[Run], FStrBegChars);
  if (i > 0) and (i <= Length(FStrEndChars)) then
    FNextStringEndChar := FStrEndChars[i]
  else
    FNextStringEndChar := #00;

  repeat
    if (EscapeChar <> #0) and (FLine[Run] = EscapeChar) and (FLine[Run + 1] <> #0) then
    begin
      inc(Run);
    end
    else
    begin
      case FLine[Run] of
        #0, #10, #13:
          begin
            if FMultilineStrings then
              fRange := rsMultilineString;
            BREAK;
          end;
      end;
    end;
    inc(Run);
  until (FLine[Run] = FNextStringEndChar);
  if FLine[Run] <> #0 then
    inc(Run);
end;

procedure TSynMyGeneralSyn.StringEndProc;
begin
  fTokenID := tkString;

  case FLine[Run] of
    #0:
      begin
        MyNullProc;
        EXIT;
      end;
    #10:
      begin
        MyLFProc;
        EXIT;
      end;
    #13:
      begin
        MyCRProc;
        EXIT;
      end;
  end;

  repeat
    if (EscapeChar <> #0) and (FLine[Run] = EscapeChar) and (FLine[Run + 1] <> #0) then
    begin
      inc(Run);
    end
    else
    begin
      case FLine[Run] of
        #0, #10, #13: BREAK;
      end;
    end;
    inc(Run);
  until (FLine[Run] = FNextStringEndChar);

  if (FLine[Run] = FNextStringEndChar) and (FNextStringEndChar <> #00) then
    fRange := rsUnKnown;

  if FLine[Run] <> #0 then
    inc(Run);
end;

procedure TSynMyGeneralSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while CharInSet(FLine[Run], [#1..#9, #11, #12, #14..#32]) do
    inc(Run);
end;

procedure TSynMyGeneralSyn.UnknownProc;
begin
  inc(Run);
  fTokenID := tkUnKnown;
end;

procedure TSynMyGeneralSyn.Next;
begin
  fTokenPos := Run;
  case fRange of
    rsBlockComment: CommentEndProc;
    rsMultilineString: StringEndProc;
  else
    fProcTable[fLine[Run]];
  end;
  inherited;
end;

procedure TSynMyGeneralSyn.MyNullProc;
begin
  fTokenID := tkNull;
  inc(Run);
end;

procedure TSynMyGeneralSyn.MyNumberProc;

  function IsNumberChar: Boolean;
  begin
    case fLine[Run] of
      '0'..'9', '.', 'e', 'E', 'x':
        Result := True;
      else
        Result := False;
    end;
  end;

begin
  inc(Run);
  fTokenID := tkNumber;
  while IsNumberChar do
  begin
    case FLine[Run] of
      'x': begin // handle C style hex numbers
             MyIntegerProc;
             break;
           end;
      '.':
        if FLine[Run + 1] = '.' then break;
    end;
    inc(Run);
  end;
end;

function TSynMyGeneralSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment: Result := CommentAttri;
    tkIdentifier: Result := IdentifierAttri;
    tkKey: Result := fKeyAttri1;
    tkKey2: Result := fKeyAttri2;
    tkKey3: Result := fKeyAttri3;
    tkKey4: Result := fKeyAttri4;
    tkKey5: Result := fKeyAttri5;
    tkNumber: Result := NumberAttri;
    tkPreprocessor: Result := PreprocessorAttri; // DJLP 2000-06-18
    tkSpace: Result := SpaceAttri;
    tkString: Result := StringAttri;
    tkSymbol: Result := SymbolAttri;
    tkUnknown: Result := SymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynMyGeneralSyn.GetTokenID: TtkTokenKind;
begin
  result := fTokenID;
end;

function TSynMyGeneralSyn.GetTokenKind: integer;
begin
  result := Ord(GetTokenID);
end;

procedure TSynMyGeneralSyn.MyIdentProc;
var
  sToken : string;
begin
  fTokenId := tkIdentifier;
  while (not GetEol) and IsIdentChar(fLine[Run]) do
    inc(Run);
  sToken := GetToken;
  if sToken <> '' then
  begin
    if IsKeyWord(sToken, fKeyWords1) then
      fTokenId := tkKey
    else
    if IsKeyWord(sToken, fKeyWords2) then
      fTokenId := tkKey2
    else
    if IsKeyWord(sToken, fKeyWords3) then
      fTokenId := tkKey3
    else
    if IsKeyWord(sToken, fKeyWords4) then
      fTokenId := tkKey4
    else
    if IsKeyWord(sToken, fKeyWords5) then
      fTokenId := tkKey5;
  end;
end;

procedure TSynMyGeneralSyn.MyIntegerProc;
  function IsIntegerChar: Boolean;
  begin
    case fLine[Run] of
      '0'..'9', 'A'..'F', 'a'..'f':
        Result := True;
      else
        Result := False;
    end;
  end;

begin
  inc(Run);
  fTokenID := tkNumber;
  while IsIntegerChar do inc(Run);
end;

function TSynMyGeneralSyn.IsKeyword(const AKeyword: String; const AKeywordList: TStrings): Boolean;
var
  First, Last, I, Compare: Integer;
  Token: String;
begin
  First := 0;
  Last := AKeywordList.Count - 1;
  Result := False;
  Token := UpperCase(AKeyword);
  while First <= Last do
  begin
    I := (First + Last) shr 1;
    Compare := WideCompareText(AKeywordList[i], Token);
    if Compare = 0 then
    begin
      Result := True;
      break;
    end
    else if Compare < 0 then
      First := I + 1
    else
      Last := I - 1;
  end;
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

procedure TSynMyGeneralSyn.PrepareKeywordList(const Value: TStrings);
var
  i: Integer;
begin
  if Value <> nil then
  begin
    Value.BeginUpdate;
    for i := 0 to Value.Count - 1 do
    begin
      if not CaseSensitive then
        Value[i] := UpperCase(Value[i]);
    end;
    Value.EndUpdate;
  end;
end;

procedure TSynMyGeneralSyn.SetKeyWords1(const Value: TStrings);
begin
  PrepareKeywordList(Value);
  fKeyWords1.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynMyGeneralSyn.SetKeyWords2(const Value: TStrings);
begin
  PrepareKeywordList(Value);
  fKeyWords2.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynMyGeneralSyn.SetKeyWords3(const Value: TStrings);
begin
  PrepareKeywordList(Value);
  fKeyWords3.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynMyGeneralSyn.SetKeyWords4(const Value: TStrings);
begin
  PrepareKeywordList(Value);
  fKeyWords4.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynMyGeneralSyn.SetKeyWords5(const Value: TStrings);
begin
  PrepareKeywordList(Value);
  fKeyWords5.Assign(Value);
  DefHighLightChange(nil);
end;

class function TSynMyGeneralSyn.GetLanguageName: string;
begin
  Result := SYNS_LangGeneral;
end;

procedure TSynMyGeneralSyn.SetComments(Value: TCommentStyles);
begin
  if fComments <> Value then
  begin
    fComments := Value;
    DefHighLightChange(Self);
  end;
end;

procedure TSynMyGeneralSyn.SetCommentStrings(LineComment, CommentBeg, CommentEnd: string);
begin
  FLineComment := LineComment;
  FCommentBeg := CommentBeg;
  FCommentEnd := CommentEnd;

  StrToStrings(LineComment, COMMENT_LIST_SEPARATOR, FLineCommentList);
  StrToStrings(CommentBeg, COMMENT_LIST_SEPARATOR, FCommentBegList);
  StrToStrings(CommentEnd, COMMENT_LIST_SEPARATOR, FCommentEndList);
end;

procedure TSynMyGeneralSyn.SetDetectPreprocessor(const Value: boolean);
begin
  fDetectPreprocessor := Value;
end;

procedure TSynMyGeneralSyn.SetIdentifierChars(const Value: UnicodeString);
begin
  fIdentChars := Value;
end;

procedure TSynMyGeneralSyn.GetCommentStrings(var LineComment, CommentBeg, CommentEnd: string);
begin
  LineComment := StringsToStr(FLineCommentList, COMMENT_LIST_SEPARATOR);
  CommentBeg := StringsToStr(FCommentBegList, COMMENT_LIST_SEPARATOR);
  CommentEnd := StringsToStr(FCommentEndList, COMMENT_LIST_SEPARATOR);
end;

function TSynMyGeneralSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := fKeyAttri1;
    SYN_ATTR_STRING: Result := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
    SYN_ATTR_SYMBOL: Result := fSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynMyGeneralSyn.GetEol: Boolean;
begin
  Result := Run > fLineLen;
end;

function TSynMyGeneralSyn.GetIdentifierChars: UnicodeString;
begin
  Result := fIdentChars;
end;

procedure TSynMyGeneralSyn.SetStringDelim(const Value: TStringDelim);
var
  newCh: WideChar;
begin
  case Value of
    sdSingleQuote: newCh := '''';
    else newCh := '"';
  end; //case
  if newCh <> fStringDelimCh then
    fStringDelimCh := newCh;
end;

procedure TSynMyGeneralSyn.SetStringParams(StrBegChars, StrEndChars: string; MultilineStrings: boolean);
var
  i: integer;
begin
  FStrBegChars := StrBegChars;
  FStrEndChars := StrEndChars;
  FMultilineStrings := MultilineStrings;

  for i := 1 to Length(FStrBegChars) do
    fProcTable[FStrBegChars[i]] := StringBegProc;
end;

function TSynMyGeneralSyn.GetNumConstChars: string;
var
  ch: char;
  s: string;
begin
  s := '';
  for ch := #0 to #255 do
    if ContainsStr(ch, fNumConstChars) then
      s := s + ch;
  Result := s;
end;

function TSynMyGeneralSyn.GetStringDelim: TStringDelim;
begin
  if fStringDelimCh = '''' then
    Result := sdSingleQuote
  else
    Result := sdDoubleQuote;
end;

function TSynMyGeneralSyn.GetNumBegChars: string;
var
  ch: char;
  s: string;
begin
  s := '';
  for ch := #0 to #255 do
    if ContainsStr(ch, fNumBegChars) then
      s := s + ch;
  Result := s;
end;

procedure TSynMyGeneralSyn.SetNumConstChars(const Value: string);
var
  i: integer;
begin
  fNumConstChars := '';
  for i := 1 to Length(Value) do
    fNumConstChars := fNumConstChars + Value[i];
end;

procedure TSynMyGeneralSyn.SetNumBegChars(const Value: string);
var
  i: integer;
begin
  fNumBegChars := '';
  for i := 1 to Length(Value) do
    fNumBegChars := fNumBegChars + Value[i];
end;

procedure TSynMyGeneralSyn.SetLanguageName(Value: string);
begin
  FLanguageName := Value;
end;

initialization
{$IFNDEF SYN_CPPB_1} //mh 2000-07-14
  RegisterPlaceableHighlighter(TSynMyGeneralSyn);
{$ENDIF}
end.

