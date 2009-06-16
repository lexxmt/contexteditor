unit SynHighlighterVCP;

{$I SynEdit.inc}

interface

uses
  SysUtils, Classes,
  {$IFDEF SYN_KYLIX}
  Qt, QControls, QGraphics,
  {$ELSE}
  Windows, Messages, Controls, Graphics, Registry,
  {$ENDIF}
  SynEditTypes, SynEditHighlighter;

type
  TtkTokenKind = (tkNone,
                  tkKeyword,
                  tkInternalVar, tkLocalVar, tkGlobalVar, tkIOVar,
                  tkInternalConst, tkLocalConst, tkConst,
                  tkInternalFunc, tkLocalFunc, tkFunc,
                  tkComment, tkIdentifier, tkNull, tkNumber, tkSpace, tkString, tkSymbol, tkUnknown);

  TCommentStyle = (csAnsiStyle, csPasStyle, csCStyle, csAsmStyle, csBasStyle);
  CommentStyles = set of TCommentStyle;

  TRangeState = (rsANil, rsAnsi, rsPasStyle, rsCStyle, rsUnKnown);

  TStringDelim = (sdSingleQuote, sdDoubleQuote);

  TProcTableProc = procedure of object;

type
  TSynVCPSyn = class(TSynCustomHighlighter)
  private
    fRange: TRangeState;
    fLine: PChar;
    fProcTable: array[#0..#255] of TProcTableProc;
    Run: LongInt;
    fTokenPos: Integer;
    fTokenID: TtkTokenKind;
    fLineNumber : Integer;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fNumberAttri: TSynHighlighterAttributes;

    fKeywordAttri:          TSynHighlighterAttributes;
    fVarsAttri:             TSynHighlighterAttributes;
    fInternalVarsAttri:     TSynHighlighterAttributes;
    fLocalVarsAttri:        TSynHighlighterAttributes;
    fGlobalVarsAttri:       TSynHighlighterAttributes;
    fIOVarsAttri:           TSynHighlighterAttributes;
    fInternalConstAttri:    TSynHighlighterAttributes;
    fLocalConstAttri:       TSynHighlighterAttributes;
    fConstAttri:            TSynHighlighterAttributes;
    fInternalFuncAttri:     TSynHighlighterAttributes;
    fLocalFuncAttri:        TSynHighlighterAttributes;
    fFuncAttri:             TSynHighlighterAttributes;

    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    fHLItems: TStrings;
    fComments: CommentStyles;
    fStringDelimCh: char;
    fIdentChars: TSynIdentChars;
    procedure AsciiCharProc;
    procedure BraceOpenProc;
    procedure PointCommaProc;
    procedure CRProc;
    procedure IdentProc;
    procedure IntegerProc;
    procedure LFProc;
    procedure NullProc;
    procedure NumberProc;
    procedure RoundOpenProc;
    procedure SlashProc;
    procedure SpaceProc;
    procedure StringProc;
    procedure UnknownProc;
    procedure MakeMethodTables;
    procedure AnsiProc;
    procedure PasStyleProc;
    procedure CStyleProc;
    procedure SetHLItems(const Value: TStrings);
    procedure SetComments(Value: CommentStyles);
    function GetStringDelim: TStringDelim;
    procedure SetStringDelim(const Value: TStringDelim);
    function GetIdentifierChars: string;
    procedure SetIdentifierChars(const Value: string);
  protected
    function GetIdentChars: TSynIdentChars; override;
  public
    {$IFNDEF SYN_CPPB_1} class {$ENDIF}                                 
    function GetLanguageName: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
      override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetTokenID: TtkTokenKind;
    function GetToken: String; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    function IsKeyword(const AKeyword: string): boolean; override;              //mh 2000-11-08
    procedure Next; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    procedure SetLine(NewValue: String; LineNumber: Integer); override;
  published
    property Comments:              CommentStyles read fComments write SetComments;
    property IdentifierChars:       string read GetIdentifierChars write SetIdentifierChars;
    property HLItems:               TStrings read fHLItems write SetHLItems;
    property StringDelim:           TStringDelim read GetStringDelim write SetStringDelim default sdSingleQuote;

    property CommentAttri:          TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property IdentifierAttri:       TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property NumberAttri:           TSynHighlighterAttributes read fNumberAttri write fNumberAttri;
    property SpaceAttri:            TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri:           TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property SymbolAttri:           TSynHighlighterAttributes read fSymbolAttri write fSymbolAttri;

    property KeywordAttri:          TSynHighlighterAttributes read fKeywordAttri write fKeywordAttri;
    property VarsAttri:             TSynHighlighterAttributes read fVarsAttri write fVarsAttri;
    property InternalVarsAttri:     TSynHighlighterAttributes read fInternalVarsAttri write fInternalVarsAttri;
    property LocalVarsAttri:        TSynHighlighterAttributes read fLocalVarsAttri write fLocalVarsAttri;
    property GlobalVarsAttri:       TSynHighlighterAttributes read fGlobalVarsAttri write fGlobalVarsAttri;
    property IOVarsAttri:           TSynHighlighterAttributes read fIOVarsAttri write fIOVarsAttri;
    property InternalConstAttri:    TSynHighlighterAttributes read fInternalConstAttri write fInternalConstAttri;
    property LocalConstAttri:       TSynHighlighterAttributes read fLocalConstAttri write fLocalConstAttri;
    property ConstAttri:            TSynHighlighterAttributes read fConstAttri write fConstAttri;
    property InternalFuncAttri:     TSynHighlighterAttributes read fInternalFuncAttri write fInternalFuncAttri;
    property LocalFuncAttri:        TSynHighlighterAttributes read fLocalFuncAttri write fLocalFuncAttri;
    property FuncAttri:             TSynHighlighterAttributes read fFuncAttri write fFuncAttri;
  end;

implementation

uses
  SynEditStrConst;

var
  Identifiers: array[#0..#255] of ByteBool;
  mHashTable: array[#0..#255] of Integer;

procedure MakeIdentTable;
var
  I, J: Char;
begin
  for I := #0 to #255 do
  begin
    Case I of
      '_', '0'..'9', 'a'..'z', 'A'..'Z': Identifiers[I] := True;
    else Identifiers[I] := False;
    end;
    J := UpCase(I);
    Case I in ['_', 'a'..'z', 'A'..'Z'] of
      True: mHashTable[I] := Ord(J) - 64
    else mHashTable[I] := 0;
    end;
  end;
end;

function TSynVCPSyn.IsKeyword(const AKeyword: string): boolean;
var
  First, Last, I, Compare: Integer;
  Token: String;
begin
  First := 0;
  Last := fHLItems.Count - 1;
  Result := False;
  Token := UpperCase(AKeyword);
  while First <= Last do
  begin
    I := (First + Last) shr 1;
    Compare := CompareStr(fHLItems[i], Token);
    if Compare = 0 then
    begin
      Result := True;
      break;
    end else
      if Compare < 0 then First := I + 1 else Last := I - 1;
  end;
end;

procedure TSynVCPSyn.MakeMethodTables;
var
  I: Char;
begin
  for I := #0 to #255 do
    case I of
      '#': fProcTable[I] := AsciiCharProc;
      '{': fProcTable[I] := BraceOpenProc;
      ';': fProcTable[I] := PointCommaProc;
      #13: fProcTable[I] := CRProc;
      'A'..'Z', 'a'..'z', '_': fProcTable[I] := IdentProc;
      '$': fProcTable[I] := IntegerProc;
      #10: fProcTable[I] := LFProc;
      #0: fProcTable[I] := NullProc;
      '0'..'9': fProcTable[I] := NumberProc;
      '(': fProcTable[I] := RoundOpenProc;
      '/': fProcTable[I] := SlashProc;
      #1..#9, #11, #12, #14..#32: fProcTable[I] := SpaceProc;
      else fProcTable[I] := UnknownProc;
    end;
  fProcTable[fStringDelimCh] := StringProc;
end;

constructor TSynVCPSyn.Create(AOwner: TComponent);

  function CreateKWList:TStringList;
  begin
    result:=TStringList.Create;
    result.Sorted:=True;
    result.Duplicates:=dupIgnore;
  end;

  function CreateAttri(Name:string; Fg,Bg:TColor; FontStyle:TFontStyles):TSynHighlighterAttributes;
  begin
    result:=TSynHighlighterAttributes.Create(Name);
    result.Style:=FontStyle;
    result.Foreground:=Fg;
    result.Background:=Bg;
    AddAttribute(result);
  end;

begin
  inherited Create(AOwner);
  fHLItems:=CreateKWList;

  fCommentAttri:=CreateAttri(SYNS_AttrComment,clGray,clWindow,[fsItalic]);
  fIdentifierAttri:=CreateAttri(SYNS_AttrIdentifier,clBlack,clWindow,[]);

  fKeywordAttri:=CreateAttri('Keyword',clBlue,clWindow,[]);
  fVarsAttri:=CreateAttri('Variable',clGreen,clWindow,[]);
  fInternalVarsAttri:=CreateAttri('Internal variable',clOlive,clWindow,[]);
  fLocalVarsAttri:=CreateAttri('Local variable',clPurple,clWindow,[]);
  fGlobalVarsAttri:=CreateAttri('Global variable',clTeal,clWindow,[]);
  fIOVarsAttri:=CreateAttri('I/O variable',clLime,clWindow,[]);
  fInternalConstAttri:=CreateAttri('Internal constant',clFuchsia,clWindow,[]);
  fLocalConstAttri:=CreateAttri('Local constant',clAqua,clWindow,[]);
  fConstAttri:=CreateAttri('Constant',clRed,clWindow,[]);
  fInternalFuncAttri:=CreateAttri('Internal function',clSilver,clWindow,[]);
  fLocalFuncAttri:=CreateAttri('Local function',clGray,clWindow,[]);
  fFuncAttri:=CreateAttri('Function',clYellow,clWindow,[]);

  fNumberAttri:=CreateAttri(SYNS_AttrNumber,clRed,clWindow,[]);
  fSpaceAttri:=CreateAttri(SYNS_AttrSpace,clWindowText,clWindow,[]);
  fStringAttri:=CreateAttri(SYNS_AttrString,clMaroon,clWindow,[]);
  fSymbolAttri:=CreateAttri(SYNS_AttrSymbol,clGray,clWindow,[]);

  SetAttributesOnChange(DefHighlightChange);

  fStringDelimCh := '''';
  fIdentChars := inherited GetIdentChars;
  MakeMethodTables;
  fRange := rsUnknown;
end; { Create }

destructor TSynVCPSyn.Destroy;
begin
  fHLItems.Free;

  inherited Destroy;
end; { Destroy }

procedure TSynVCPSyn.SetLine(NewValue: String; LineNumber:Integer);
begin
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end; { SetLine }

procedure TSynVCPSyn.AnsiProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    fTokenID := tkComment;
    repeat
      if (fLine[Run] = '*') and (fLine[Run + 1] = ')') then begin
        fRange := rsUnKnown;
        Inc(Run, 2);
        break;
      end;
      Inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end;
end;

procedure TSynVCPSyn.PasStyleProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    fTokenID := tkComment;
    repeat
      if fLine[Run] = '}' then begin
        fRange := rsUnKnown;
        Inc(Run);
        break;
      end;
      Inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end;
end;

procedure TSynVCPSyn.CStyleProc;
begin
  case fLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    fTokenID := tkComment;
    repeat
      if (fLine[Run] = '*') and (fLine[Run + 1] = '/') then begin
        fRange := rsUnKnown;
        Inc(Run, 2);
        break;
      end;
      Inc(Run);
    until fLine[Run] in [#0, #10, #13];
  end;
end;

procedure TSynVCPSyn.AsciiCharProc;
begin
  fTokenID := tkString;
  repeat
    inc(Run);
  until not (fLine[Run] in ['0'..'9']);
end;

procedure TSynVCPSyn.BraceOpenProc;
begin
  if csPasStyle in fComments then
  begin
    fTokenID := tkComment;
    fRange := rsPasStyle;
    inc(Run);
    while FLine[Run] <> #0 do
      case FLine[Run] of
        '}':
          begin
            fRange := rsUnKnown;
            inc(Run);
            break;
          end;
        #10: break;

        #13: break;
      else inc(Run);
      end;
  end else
  begin
    inc(Run);
    fTokenID := tkSymbol;
  end;
end;

procedure TSynVCPSyn.PointCommaProc;
begin
  if (csASmStyle in fComments) or (csBasStyle in fComments) then
  begin
    fTokenID := tkComment;
    fRange := rsUnknown;
    inc(Run);
    while FLine[Run] <> #0 do
      begin
        fTokenID := tkComment;
        inc(Run);
      end;
  end else
  begin
    inc(Run);
    fTokenID := tkSymbol;
  end;
end;

procedure TSynVCPSyn.CRProc;
begin
  fTokenID := tkSpace;
  Inc(Run);
  if fLine[Run] = #10 then Inc(Run);
end;

procedure TSynVCPSyn.IdentProc;

  function FindWhatIs(const AKeyword: string):TtkTokenKind;
  var
    First, Last, I, Compare: Integer;
    Token: String;
  begin
    First := 0;
    Last := fHLItems.Count - 1;
    Result := tkIdentifier;
    Token := UpperCase(AKeyword);
    while First <= Last do
    begin
      I := (First + Last) shr 1;
      Compare := CompareStr(fHLItems[i], Token);
      if Compare = 0 then
      begin
        Result:=TtkTokenKind(fHLItems.Objects[i]);
        BREAK;
      end else
        if Compare < 0 then First := I + 1 else Last := I - 1;
    end;
  end;

begin
  while Identifiers[fLine[Run]] do inc(Run);

  fTokenId:=FindWhatIs(GetToken);
end;

procedure TSynVCPSyn.IntegerProc;
begin
  inc(Run);
  fTokenID := tkNumber;
  while FLine[Run] in ['0'..'9', 'A'..'F', 'a'..'f'] do inc(Run);
end;

procedure TSynVCPSyn.LFProc;
begin
  fTokenID := tkSpace;
  inc(Run);
end;

procedure TSynVCPSyn.NullProc;
begin
  fTokenID := tkNull;
end;

procedure TSynVCPSyn.NumberProc;
begin
  inc(Run);
  fTokenID := tkNumber;
  while FLine[Run] in ['0'..'9', '.', 'e', 'E', 'x'] do
  begin
    case FLine[Run] of
      'x': begin // handle C style hex numbers
             IntegerProc;
             break;
           end;
      '.':
        if FLine[Run + 1] = '.' then break;
    end;
    inc(Run);
  end;
end;

procedure TSynVCPSyn.RoundOpenProc;
begin
  inc(Run);
  if csAnsiStyle in fComments then
  begin
    case fLine[Run] of
      '*':
        begin
          fTokenID := tkComment;
          fRange := rsAnsi;
          inc(Run);
          while fLine[Run] <> #0 do
            case fLine[Run] of
              '*':
                if fLine[Run + 1] = ')' then
                begin
                  fRange := rsUnKnown;
                  inc(Run, 2);
                  break;
                end else inc(Run);
              #10: break;
              #13: break;
            else inc(Run);
            end;
        end;
      '.':
        begin
          inc(Run);
          fTokenID := tkSymbol;
        end;
    else
      begin
        FTokenID := tkSymbol;
      end;
    end;
  end else fTokenId := tkSymbol;
end;

procedure TSynVCPSyn.SlashProc;
begin
  case FLine[Run + 1] of
    '/':
      begin
        inc(Run, 2);
        fTokenID := tkComment;
        while FLine[Run] <> #0 do
        begin
          case FLine[Run] of
            #10, #13: break;
          end;
          inc(Run);
        end;
      end;
    '*':
      begin
        if csCStyle in fComments then
        begin
          fTokenID := tkComment;
          fRange := rsCStyle;
          inc(Run);
          while fLine[Run] <> #0 do
            case fLine[Run] of
              '*':
                if fLine[Run + 1] = '/' then
                begin
                  fRange := rsUnKnown;
                  inc(Run, 2);
                  break;
                end else inc(Run);
              #10: break;
              #13: break;
            else inc(Run);
            end;
        end
        else
          begin
            inc(Run);    
            fTokenId := tkSymbol;
          end;
      end;
  else
    begin
      inc(Run);
      fTokenID := tkSymbol;
    end;
  end;
end;

procedure TSynVCPSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while FLine[Run] in [#1..#9, #11, #12, #14..#32] do inc(Run);
end;

procedure TSynVCPSyn.StringProc;
begin
  fTokenID := tkString;
  if (fLine[Run + 1] = fStringDelimCh) and (fLine[Run + 2] = fStringDelimCh) then
    Inc(Run, 2);
  repeat
    case FLine[Run] of
      #0, #10, #13: break;
    end;
    inc(Run);
  until FLine[Run] = fStringDelimCh;
  if FLine[Run] <> #0 then inc(Run);
end;

procedure TSynVCPSyn.UnknownProc;
begin
  inc(Run);
  fTokenID := tkUnKnown;
end;

procedure TSynVCPSyn.Next;
begin
  fTokenPos := Run;
  case fRange of
    rsAnsi: AnsiProc;
    rsPasStyle: PasStyleProc;
    rsCStyle: CStyleProc;
  else
    fProcTable[fLine[Run]];
  end;
end;

function TSynVCPSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD: Result := fKeywordAttri;
    SYN_ATTR_STRING: Result := fStringAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynVCPSyn.GetEol: Boolean;
begin
  Result := fTokenId = tkNull;
end;

function TSynVCPSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

function TSynVCPSyn.GetToken: String;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  SetString(Result, (FLine + fTokenPos), Len);
end;

function TSynVCPSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynVCPSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment: Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;

    tkKeyword: Result := fKeywordAttri;
    tkInternalVar: Result := fInternalVarsAttri;
    tkLocalVar: Result := fLocalVarsAttri;
    tkGlobalVar: Result := fGlobalVarsAttri;
    tkIOVar: Result := fIOVarsAttri;
    tkInternalConst: Result := fInternalConstAttri;
    tkLocalConst: Result := fLocalConstAttri;
    tkConst: Result := fConstAttri;
    tkInternalFunc: Result := fInternalFuncAttri;
    tkLocalFunc: Result := fLocalFuncAttri;
    tkFunc: Result := fFuncAttri;

    tkNumber: Result := fNumberAttri;
    tkSpace: Result := fSpaceAttri;
    tkString: Result := fStringAttri;
    tkSymbol: Result := fSymbolAttri;
    tkUnknown: Result := fSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynVCPSyn.GetTokenKind: integer;
begin
  Result := Ord(fTokenId);
end;

function TSynVCPSyn.GetTokenPos: Integer;
begin
  Result := fTokenPos;
end;

procedure TSynVCPSyn.ReSetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynVCPSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

procedure TSynVCPSyn.SetHLItems(const Value: TStrings);
var
  i: Integer;
begin
(*
  if Value <> nil then
    begin
      Value.BeginUpdate;
      for i := 0 to Value.Count - 1 do
        Value[i] := UpperCase(Value[i]);
      Value.EndUpdate;
    end;
*)
  fHLItems.Assign(Value);
  DefHighLightChange(nil);
end;

procedure TSynVCPSyn.SetComments(Value: CommentStyles);
begin
  fComments := Value;
  DefHighLightChange(nil);
end;

{$IFNDEF SYN_CPPB_1} class {$ENDIF}
function TSynVCPSyn.GetLanguageName: string;
begin
  Result := SYNS_LangGeneral;
end;

function TSynVCPSyn.GetStringDelim: TStringDelim;
begin
  if fStringDelimCh = '''' then
    Result := sdSingleQuote
  else
    Result := sdDoubleQuote;
end;

procedure TSynVCPSyn.SetStringDelim(const Value: TStringDelim);
var
  newCh: char;
begin
  case Value of
    sdSingleQuote: newCh := '''';
    else newCh := '"';
  end; //case
  if newCh <> fStringDelimCh then begin
    fStringDelimCh := newCh;
    MakeMethodTables;
  end;
end;

function TSynVCPSyn.GetIdentifierChars: string;
var
  ch: char;
  s: shortstring;
begin
  s := '';
  for ch := #0 to #255 do
    if ch in fIdentChars then s := s + ch;
  Result := s;
end;

procedure TSynVCPSyn.SetIdentifierChars(const Value: string);
var
  i: integer;
begin
  fIdentChars := [];
  for i := 1 to Length(Value) do begin
    fIdentChars := fIdentChars + [Value[i]];
  end; //for
end;

function TSynVCPSyn.GetIdentChars: TSynIdentChars;
begin
  Result := fIdentChars;
end;

initialization
  MakeIdentTable;
{$IFNDEF SYN_CPPB_1}                                                    
  RegisterPlaceableHighlighter(TSynVCPSyn);
{$ENDIF}
end.

