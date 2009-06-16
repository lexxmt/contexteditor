unit SynHighlighterMyGeneral;

{$I SynEdit.inc}

interface

uses
  SysUtils, Windows, Messages, Classes, Controls, Graphics,
  SynEditTypes, SynEditHighlighter, JclStrings;

type
  TtkTokenKind = (tkComment, tkIdentifier, tkKey1, tkKey2, tkKey3, tkKey4, tkKey5, tkNull, tkNumber,
    tkPreprocessor, tkSpace, tkString, tkSymbol, tkUnknown);                    // DJLP 2000-06-18

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
    FLineCommentList    :TStringList;
    FCommentBegList     :TStringList;
    FCommentEndList     :TStringList;

    FStrBegChars        :string;
    FStrEndChars        :string;
    FMultilineStrings   :boolean;
    FNextStringEndChar  :char;

    Identifiers: array[#0..#255] of ByteBool;
    fKeyWords5: TStrings;
    fKeyWords4: TStrings;
    fKeyAttri5: TSynHighlighterAttributes;
    fKeyAttri4: TSynHighlighterAttributes;
    fCodeBrowserSettings: TCodeBrowserSettings;

    procedure AsciiCharProc;
    procedure CRProc;
    procedure IdentProc;
    function  MatchComment(CommentList: TStringList; var CommentStr: string):boolean;
    procedure LineCommentProc;
    procedure CommentBegProc;
    procedure CommentEndProc;
    procedure StringBegProc;
    procedure StringEndProc;
    procedure LFProc;
    procedure NullProc;
    procedure NumberProc;
    procedure SpaceProc;
    procedure UnknownProc;
    function IsInKeyWordList(aToken: String; Keywords: TStrings): Boolean;
    function IsKeyWord1(aToken: String): Boolean;
    function IsKeyWord2(aToken: String): Boolean;
    function IsKeyWord3(aToken: String): Boolean;
    function IsKeyWord4(aToken: String): Boolean;
    function IsKeyWord5(aToken: String): Boolean;
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
    procedure SetKeyWords4(const Value: TStrings);
    procedure SetKeyWords5(const Value: TStrings);
    procedure PrepareKeywordList(const Value: TStrings);
  protected
    function GetIdentChars: TSynIdentChars; override;
  public

    {$IFNDEF SYN_CPPB_1} class {$ENDIF}                                         //mh 2000-07-14
    function GetLanguageName: string; override;
  public
    CurrLineHighlighted :boolean;
    OverrideTxtFgColor  :boolean;
    RightEdgeColorFg    :TColor;
    RightEdgeColorBg    :TColor;
    HelpFile            :string;
    CaseSensitive       :boolean;
    IdentifierBegChars  :string;
    SourceFileName      :string;
    EscapeChar          :char;
    BlockAutoindent     :boolean;
    BlockBegStr         :string;
    BlockEndStr         :string;
    Description         :string;

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
    procedure SetCommentStrings(LineComment, CommentBeg, CommentEnd: string);
    procedure GetCommentStrings(var LineComment, CommentBeg, CommentEnd: string);
    procedure SetStringParams(StrBegChars, StrEndChars:string; MultilineStrings:boolean);
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
    property KeyAttri4: TSynHighlighterAttributes read fKeyAttri4 write fKeyAttri4;
    property KeyAttri5: TSynHighlighterAttributes read fKeyAttri5 write fKeyAttri5;
    property KeyWords1: TStrings read fKeyWords1 write SetKeyWords1;
    property KeyWords2: TStrings read fKeyWords2 write SetKeyWords2;
    property KeyWords3: TStrings read fKeyWords3 write SetKeyWords3;
    property KeyWords4: TStrings read fKeyWords4 write SetKeyWords4;
    property KeyWords5: TStrings read fKeyWords5 write SetKeyWords5;
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
    property CodeBrowserSettings: TCodeBrowserSettings read fCodeBrowserSettings write fCodeBrowserSettings;
  end;

procedure Register;

implementation

uses
  SynEditStrConst;

const
  COMMENT_LIST_SEPARATOR = ' ';

procedure Register;
begin
  RegisterComponents(SYNS_HighlightersPage, [TSynMyGeneralSyn]);
end;


procedure TCodeBrowserSettings.Assign(Source: TCodeBrowserSettings);
begin
  fRegExp:=Source.RegExp;
  fGroupBy:=Source.GroupBy;
  fGroupCaption:=Source.GroupCaption;
  fItemCaption:=Source.ItemCaption;
  fModified:=Source.Modified;
end;

procedure TCodeBrowserSettings.LoadDefaults;
begin
  // virtual holder
end;

procedure TSynMyGeneralSyn.AssignPropertiesTo(HL:TSynMyGeneralSyn);
begin
  HL.CurrLineHighlighted:=CurrLineHighlighted;
  HL.OverrideTxtFgColor:=OverrideTxtFgColor;
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
  HL.SetStringParams(FStrBegChars, FStrEndChars, FMultilineStrings);
  HL.EscapeChar:=EscapeChar;
  HL.BlockAutoindent:=BlockAutoindent;
  HL.BlockBegStr:=BlockBegStr;
  HL.BlockEndStr:=BlockEndStr;


  if CaseSensitive then begin
    HL.Keywords1.Text:=Keywords1.Text;
    HL.Keywords2.Text:=Keywords2.Text;
    HL.Keywords3.Text:=Keywords3.Text;
    HL.Keywords4.Text:=Keywords4.Text;
    HL.Keywords5.Text:=Keywords5.Text;
  end else begin
    HL.Keywords1.Text:=UpperCase(Keywords1.Text);
    HL.Keywords2.Text:=UpperCase(Keywords2.Text);
    HL.Keywords3.Text:=UpperCase(Keywords3.Text);
    HL.Keywords4.Text:=UpperCase(Keywords4.Text);
    HL.Keywords5.Text:=UpperCase(Keywords5.Text);
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

function TSynMyGeneralSyn.IsInKeyWordList(aToken: String; Keywords: TStrings): Boolean;
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
  while (i<Keywords.Count) do begin
    if (Keywords[i]=Token) then begin
      result:=TRUE;
      BREAK;
    end;
    inc(i);
  end;
end;

function TSynMyGeneralSyn.IsKeyWord1(aToken: String): Boolean;
begin
  Result:=IsInKeyWordList(aToken, fKeywords1);
end;

function TSynMyGeneralSyn.IsKeyWord2(aToken: String): Boolean;
begin
  Result:=IsInKeyWordList(aToken, fKeywords2);
end;

function TSynMyGeneralSyn.IsKeyWord3(aToken: String): Boolean;
begin
  Result:=IsInKeyWordList(aToken, fKeywords3);
end;

function TSynMyGeneralSyn.IsKeyWord4(aToken: String): Boolean;
begin
  Result:=IsInKeyWordList(aToken, fKeywords4);
end;

function TSynMyGeneralSyn.IsKeyWord5(aToken: String): Boolean;
begin
  Result:=IsInKeyWordList(aToken, fKeywords5);
end;

procedure TSynMyGeneralSyn.MakeMethodTables;
var
  I: Char;
  n: integer;

  procedure CommentToProcTable(CommentList: TStringList; proc:TProcTableProc);
  var
    i: integer;
    s: string;
  begin
    for i:=0 to CommentList.Count-1 do begin
      s:=UpperCase(CommentList[i]);
      if (Length(s)>0) then begin
        if (s[1] in fIdentChars) then begin
          fProcTable[s[1]]:=proc;
          fProcTable[LowerCase(s[1])[1]]:=proc;
          CommentList[i]:=s;
        end else
          fProcTable[s[1]]:=proc;
      end;
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
          #10: fProcTable[I] := LFProc;
          #0: fProcTable[I] := NullProc;
  //        '0'..'9': fProcTable[I] := NumberProc;
          #1..#9, #11, #12, #14..#32: fProcTable[I] := SpaceProc;
          else fProcTable[I] := UnknownProc;
        end;
      end;
    end;
  end;

  for n:=1 to Length(FStrBegChars) do
    fProcTable[FStrBegChars[n]]:=StringBegProc;

  CommentToProcTable(FLineCommentList, LineCommentProc);
  CommentToProcTable(FCommentBegList, CommentBegProc);

  FCommentEnd:=UpperCase(FCommentEnd);
end;

constructor TSynMyGeneralSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FLineCommentList:=TStringList.Create;
  FCommentBegList:=TStringList.Create;
  FCommentEndList:=TStringList.Create;

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

  fCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment);
  fCommentAttri.Style := [fsItalic];

  AddAttribute(fCommentAttri);
  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fKeyAttri1 := TSynHighlighterAttributes.Create('Keywords 1');
  fKeyAttri1.Style := [];
  AddAttribute(fKeyAttri1);

  fKeyAttri2 := TSynHighlighterAttributes.Create('Keywords 2');
  fKeyAttri2.Style := [];
  AddAttribute(fKeyAttri2);

  fKeyAttri3 := TSynHighlighterAttributes.Create('Keywords 3');
  fKeyAttri3.Style := [];
  AddAttribute(fKeyAttri3);

  fKeyAttri4 := TSynHighlighterAttributes.Create('Keywords 4');
  fKeyAttri4.Style := [];
  AddAttribute(fKeyAttri4);

  fKeyAttri5 := TSynHighlighterAttributes.Create('Keywords 5');
  fKeyAttri5.Style := [];
  AddAttribute(fKeyAttri5);

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
  fKeyWords4.Free;
  fKeyWords5.Free;

  FLineCommentList.Free;
  FCommentBegList.Free;
  FCommentEndList.Free;

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
        if IsKeyWord4(GetToken) then
          fTokenId := tkKey4
        else
          if IsKeyWord5(GetToken) then
            fTokenId := tkKey5
          else
            fTokenId := tkIdentifier;
end;

function TSynMyGeneralSyn.MatchComment(CommentList: TStringList; var CommentStr: string):boolean;
var
  i   :integer;
  len :integer;
  ok  :boolean;
  j: integer;
begin
  j:=0;
  ok:=FALSE;
  while (j<CommentList.Count) do begin
    CommentStr:=UpperCase(CommentList[j]);

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

    if ok then
      BREAK;

    inc(j);
  end;

  result:=ok;
end;

procedure TSynMyGeneralSyn.LineCommentProc;
var
  CommentStr: string;
begin
  if MatchComment(FLineCommentList, CommentStr) then begin
    inc(Run, Length(CommentStr));
    fTokenID:=tkComment;
    while (FLine[Run]<>#0) do begin
      case FLine[Run] of
        #10, #13: BREAK;
      end;
      inc(Run);
    end;
  end else begin
    //!!!!!!!!!!!!!!!!!!!!!
    if (Length(CommentStr)>0) and (CommentStr[1] in fIdentChars) then
      IdentProc
    else begin
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
  else begin
    if MatchComment(FCommentBegList, CommentStr) then begin
      fTokenID:=tkComment;
      fRange:=rsBlockComment;
      inc(Run,Length(CommentStr));

      while (FLine[Run]<>#0) do begin
        if MatchComment(FCommentEndList, CommentStr) then begin
          fRange:=rsUnKnown;
          inc(Run,Length(CommentStr));
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
      //!!!!!!!!!!!!!!!!!!!!!
      if (Length(CommentStr)>0) and (CommentStr[1] in fIdentChars) then
        IdentProc
      else begin
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
    if MatchComment(FCommentEndList, CommentStr) then begin
      fRange:=rsUnKnown;
      inc(Run, Length(CommentStr));
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
var
  i   :integer;
begin
  fTokenID:=tkString;

  i:=Pos(FLine[Run],FStrBegChars);
  if (i>0) and (i<=Length(FStrEndChars)) then
    FNextStringEndChar:=FStrEndChars[i]
  else
    FNextStringEndChar:=#00;

  repeat
    if (EscapeChar<>#0) and (FLine[Run]=EscapeChar) and (FLine[Run+1]<>#0) then begin
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
  until (FLine[Run]=FNextStringEndChar);
  if FLine[Run] <> #0 then inc(Run);
end;

procedure TSynMyGeneralSyn.StringEndProc;
begin
  fTokenID:=tkString;

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
    if (EscapeChar<>#0) and (FLine[Run]=EscapeChar) and (FLine[Run+1]<>#0) then begin
      inc(Run);
    end else begin
      case FLine[Run] of
        #0, #10, #13: BREAK;
      end;
    end;
    inc(Run);
  until (FLine[Run]=FNextStringEndChar);

  if (FLine[Run]=FNextStringEndChar) and (FNextStringEndChar<>#00) then
    fRange:=rsUnKnown;

  if FLine[Run] <> #0 then inc(Run);
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
    tkKey4: Result := fKeyAttri4;
    tkKey5: Result := fKeyAttri5;
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

procedure TSynMyGeneralSyn.PrepareKeywordList(const Value: TStrings);
var
  i: Integer;
begin
  if Value <> nil then begin
    Value.BeginUpdate;
    for i := 0 to Value.Count - 1 do begin
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

procedure TSynMyGeneralSyn.SetCommentStrings(LineComment, CommentBeg, CommentEnd: string);
begin
  FLineComment:=LineComment;
  FCommentBeg:=CommentBeg;
  FCommentEnd:=CommentEnd;

  StrToStrings(LineComment, COMMENT_LIST_SEPARATOR, FLineCommentList);
  StrToStrings(CommentBeg, COMMENT_LIST_SEPARATOR, FCommentBegList);
  StrToStrings(CommentEnd, COMMENT_LIST_SEPARATOR, FCommentEndList);
end;

procedure TSynMyGeneralSyn.GetCommentStrings(var LineComment, CommentBeg, CommentEnd:string);
begin
  LineComment:=StringsToStr(FLineCommentList, COMMENT_LIST_SEPARATOR);
  CommentBeg:=StringsToStr(FCommentBegList, COMMENT_LIST_SEPARATOR);
  CommentEnd:=StringsToStr(FCommentEndList, COMMENT_LIST_SEPARATOR);
end;

procedure TSynMyGeneralSyn.SetStringParams(StrBegChars, StrEndChars:string; MultilineStrings:boolean);
var
  i :integer;
begin
  FStrBegChars:=StrBegChars;
  FStrEndChars:=StrEndChars;
  FMultilineStrings:=MultilineStrings;

  for i:=1 to Length(FStrBegChars) do
    fProcTable[FStrBegChars[i]]:=StringBegProc;
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

