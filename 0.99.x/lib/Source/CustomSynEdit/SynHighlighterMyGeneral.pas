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
  TtkTokenKind = (tkComment, tkIdentifier, tkKey1, tkKey2, tkKey3, tkKey4, tkKey5, tkNull, tkNumber, tkPreprocessor, tkSpace, tkString, tkSymbol, tkUnknown); // DJLP 2000-06-18

  TRangeState = (rsANil, rsBlockComment, rsMultilineString, rsUnKnown);

  TProcTableProc = procedure of object;

type
  TCodeBrowserSettings = class
  private
    fGroupBy: integer;
    fGroupCaption: string;
    fItemCaption: string;
    fRegExp: string;
    fModified: boolean;
  public
    procedure LoadDefaults; virtual;
    procedure Assign(Source: TCodeBrowserSettings); virtual;
    property RegExp: string read fRegExp write fRegExp;
    property GroupBy: integer read fGroupBy write fGroupBy;
    property GroupCaption: string read fGroupCaption write fGroupCaption;
    property ItemCaption: string read fItemCaption write fItemCaption;
    property Modified: boolean read fModified write fModified;
  end;

  TSynMyGeneralSyn = class(TSynGeneralSyn)
  private
    FLanguageName: string;
    fRange: TRangeState;
    fLine: PChar;
    fProcTable: array[#0..#255] of TProcTableProc;
    Run: LongInt;
    fTokenPos: Integer;
    fTokenID: TtkTokenKind;
    fLineNumber: Integer;
    fKeyAttri1: TSynHighlighterAttributes;
    fKeyAttri2: TSynHighlighterAttributes;
    fKeyAttri3: TSynHighlighterAttributes;
    fKeyAttri4: TSynHighlighterAttributes;
    fKeyAttri5: TSynHighlighterAttributes;

    fNumberAttri: TSynHighlighterAttributes;
    fPreprocessorAttri: TSynHighlighterAttributes; // DJLP 2000-06-18
    fKeyWords1: TStrings;
    fKeyWords2: TStrings;
    fKeyWords3: TStrings;
    fKeyWords5: TStrings;
    fKeyWords4: TStrings;

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

    //Identifiers: array[#0..#255] of ByteBool;
    fCodeBrowserSettings: TCodeBrowserSettings;

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
  public
    CurrLineHighlighted: boolean;
    OverrideTxtFgColor: boolean;
    RightEdgeColorFg: TColor;
    RightEdgeColorBg: TColor;
    HelpFile: string;
    CaseSensitive: boolean;
    IdentifierBegChars: string;
    SourceFileName: string;
    EscapeChar: char;
    BlockAutoindent: boolean;
    BlockBegStr: string;
    BlockEndStr: string;
    Description: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetLine(const NewValue: string; LineNumber: Integer); override;
    function GetToken: string; override;
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
    class function GetLanguageName: string; override;
  published
    property LanguageName: string read FLanguageName write SetLanguageName;
    property NumConstChars: string read GetNumConstChars write SetNumConstChars;
    property NumBegChars: string read GetNumBegChars write SetNumBegChars;
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
    property CodeBrowserSettings: TCodeBrowserSettings read fCodeBrowserSettings write fCodeBrowserSettings;
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

procedure TCodeBrowserSettings.Assign(Source: TCodeBrowserSettings);
begin
  fRegExp := Source.RegExp;
  fGroupBy := Source.GroupBy;
  fGroupCaption := Source.GroupCaption;
  fItemCaption := Source.ItemCaption;
  fModified := Source.Modified;
end;

procedure TCodeBrowserSettings.LoadDefaults;
begin
  // virtual holder
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
        if Pos(s[1], fIdentChars) > 0 then
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
    if (Pos(I, IdentifierBegChars) > 0) then
    begin
      fProcTable[I] := IdentProc;
    end
    else
    begin
      if Pos(I, fNumBegChars) > 0 then
        fProcTable[I] := NumberProc
      else
      begin
        case I of
          '#': fProcTable[I] := AsciiCharProc;
          #13: fProcTable[I] := CRProc;
          #10: fProcTable[I] := LFProc;
          #0: fProcTable[I] := NullProc;
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
  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrAreaAIdentifier);
  AddAttribute(fIdentifierAttri);

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

  fNumberAttri := TSynHighlighterAttributes.Create(SYNS_AttrNumber, SYNS_FriendlyAttrNumber);
  AddAttribute(fNumberAttri);
  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);
  fStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  AddAttribute(fStringAttri);
  fSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol, SYNS_FriendlyAttrSymbol);
  AddAttribute(fSymbolAttri);
  {begin}// DJLP 2000-06-18
  fPreprocessorAttri := TSynHighlighterAttributes.Create(SYNS_AttrPreprocessor, SYNS_FriendlyAttrPreprocessor);
  AddAttribute(fPreprocessorAttri);
  {end}// DJLP 2000-06-18
  SetAttributesOnChange(DefHighlightChange);

  fIdentChars := inherited IdentifierChars;
  NumConstChars := '0123456789';
  NumBegChars := '0123456789';
  fRange := rsUnknown;
end; { Create }

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

procedure TSynMyGeneralSyn.SetLine(const NewValue: string; LineNumber: Integer);
begin
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end; { SetLine }

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

    if ok and ContainsStr(CommentStr[1], fIdentChars) then
      ok := not ContainsStr(FLine[Run + Length(CommentStr)], fIdentChars);

    if ok then
      BREAK;

    inc(j);
  end;

  result := ok;
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
    //!!!!!!!!!!!!!!!!!!!!!
    if (Length(CommentStr) > 0) and ContainsStr(CommentStr[1], fIdentChars) then
      IdentProc
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
      //!!!!!!!!!!!!!!!!!!!!!
      if (Length(CommentStr) > 0) and ContainsStr(CommentStr[1], fIdentChars) then
        IdentProc
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
        NullProc;
        EXIT;
      end;
    #10:
      begin
        LFProc;
        EXIT;
      end;
    #13:
      begin
        CRProc;
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
end;

function TSynMyGeneralSyn.GetToken: string;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;


function TSynMyGeneralSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment: Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey1: Result := fKeyAttri1;
    tkKey2: Result := fKeyAttri2;
    tkKey3: Result := fKeyAttri3;
    tkKey4: Result := fKeyAttri4;
    tkKey5: Result := fKeyAttri5;
    tkNumber: Result := fNumberAttri;
    tkPreprocessor: Result := fPreprocessorAttri; // DJLP 2000-06-18
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkSymbol: Result := fSymbolAttri;
    tkUnknown: Result := fSymbolAttri;
  else
    Result := nil;
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

procedure TSynMyGeneralSyn.SetCommentStrings(LineComment, CommentBeg, CommentEnd: string);
begin
  FLineComment := LineComment;
  FCommentBeg := CommentBeg;
  FCommentEnd := CommentEnd;

  StrToStrings(LineComment, COMMENT_LIST_SEPARATOR, FLineCommentList);
  StrToStrings(CommentBeg, COMMENT_LIST_SEPARATOR, FCommentBegList);
  StrToStrings(CommentEnd, COMMENT_LIST_SEPARATOR, FCommentEndList);
end;

procedure TSynMyGeneralSyn.GetCommentStrings(var LineComment, CommentBeg, CommentEnd: string);
begin
  LineComment := StringsToStr(FLineCommentList, COMMENT_LIST_SEPARATOR);
  CommentBeg := StringsToStr(FCommentBegList, COMMENT_LIST_SEPARATOR);
  CommentEnd := StringsToStr(FCommentEndList, COMMENT_LIST_SEPARATOR);
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

