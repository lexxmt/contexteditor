{
@abstract(TSynUniSyn rules source)
@authors(Fantasist [walking_in_the_sky@yahoo.com], Vit [nevzorov@yahoo.com],
         Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2004)
@lastmod(2006-07-19)
}

{$IFNDEF QSynUniRules}
unit SynUniRules;
{$ENDIF}

{$I SynUniHighlighter.inc}

interface

uses
{$IFDEF SYN_CLX}
  Qt,
  Types,
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
  QSynUniClasses,
{$ELSE}
  Windows,
  Graphics,
  {$IFDEF DEBUG}
  Dialogs,
  {$ENDIF}
  SynEditTypes,
  SynEditHighlighter,
  SynUniClasses,
{$ENDIF}
  Classes,
  SysUtils;

type
  TSynRange = class;

  TSynSet = class;

  TAbstractParser = class
    function GetToken(CurRule: TSynRange; fLine: PChar; var Run: Integer; var ASynToken: TSynToken): Boolean; virtual; abstract;
  end;

  TParser = class(TAbstractParser)
    HeadNode: TTokenNode;
    SynSets: TList;
    constructor Create(AChar: Char; ASynToken: TSynToken; ABreakType: TBreakType); reintroduce; overload; virtual;
    constructor Create(SynSet: TSynSet); reintroduce; overload; virtual;
    destructor Destroy(); override;
    function FindTokenNode(AString: string): TTokenNode;
    function GetToken(CurrRange: TSynRange; fLine: PChar; var Run: Integer; var ASynToken: TSynToken): Boolean; override;
    procedure AddSet(SynSet: TSynSet);
    procedure AddTokenNode(AString: string; ASynToken: TSynToken; ABreakType: TBreakType);
  end;

  TDefaultParser = class(TAbstractParser)
    SynToken: TSynToken;
    constructor Create(ASynToken: TSynToken); reintroduce; virtual;
    destructor Destroy(); override;
    function GetToken(CurrRange: TSynRange; fLine: PChar; var Run: Integer; var ASynToken: TSynToken): Boolean; override;
  end;

  TDelimitersParser = class(TAbstractParser)
    SynToken: TSynToken;
    constructor Create(ASynToken: TSynToken); virtual;
    destructor Destroy(); override;
    function GetToken(CurrRange: TSynRange; fLine: PChar; var Run: Integer; var ASynToken: TSynToken): Boolean; override;
  end;

  TSynRule = class(TAbstractRule)
  private
    fName: string;
  protected
    fParent: TSynRange;
    fValidAttribs: TSynHighlighterAttributes;
    function GetValidAttribs(): TSynHighlighterAttributes;
  public  
    Style: string;
    Attributes: TSynAttributes;
    constructor Create();
    destructor Destroy(); override;
    procedure LoadFromFile(AFileName: string); virtual; abstract;
    procedure LoadFromStream(AStream: TStream); virtual; abstract;
    procedure SaveToFile(AFileName: string); virtual; abstract;
    procedure SaveToStream(AStream: TStream); virtual; abstract;
    property Name: string read fName write fName;
    property ValidAttribs: TSynHighlighterAttributes read GetValidAttribs;
    property Parent: TSynRange read fParent write fParent; //TODO: Fill Parent not in prepare!
  end;

  TSynKeyList = class(TSynRule)
  public
    KeyList: TStringList; //TODO: Need to rename not as a ClassName
    constructor Create(st: string = '');
    destructor Destroy(); override;
    procedure LoadFromFile(AFileName: string); override;
    procedure LoadFromStream(AStream: TStream); override;
    procedure SaveToFile(AFileName: string); override;
    procedure SaveToStream(AStream: TStream); override;
  end;

  TSynSet = class(TSynRule)
  public
    BreakType: TBreakType;
    StartType: TStartType;
    CharSet: TCharSet;
    Quantity: Integer;
    constructor Create(ACharSet: TCharSet = []);
    destructor Destroy(); override;
    procedure LoadFromFile(AFileName: string); override;
    procedure LoadFromStream(AStream: TStream); override;
    procedure SaveToFile(AFileName: string); override;
    procedure SaveToStream(AStream: TStream); override;
  end;

  TSynRange = class(TSynRule)
  protected
    fPrepared: Boolean;

    fOpenToken: TSynMultiToken;
    fCloseToken: TSynMultiToken;

    fCaseSensitive: Boolean;    
    fAllowPreviousClose: Boolean;
    fCloseOnEol: Boolean;
    fCloseOnTerm: Boolean;
    fDelimiters: TCharSet;
    
    fSynRanges: TList;
    fSynKeyLists: TList;
    fSynSets: TList;
    fSynTokens: TList;

    StringCaseFunct: function (const st: string): string; // Ћибо тоже в public, либо все сюда
  public
    ClosingToken: TSynToken;

    fDefaultSynToken: TSynToken;
    fDefaultSymbols: TDefaultParser;
    fDefaultTermSymbol: TDelimitersParser;

    CaseFunct: function (AChar: Char): Char;
    HasNodeAnyStart: array[Char] of Boolean;
    SymbolList: array[Char] of TAbstractParser; //TODO: сделать возможность считыани€ SymbolList[CaseFunct(ch)]
  private
    function GetSynRange(Index: Integer): TSynRange;
    function GetSynKeyList(Index: Integer): TSynKeyList;
    function GetSynSet(Index: Integer): TSynSet;
    function GetSynToken(Index: Integer): TSynToken;

    function GetSynRangeCount(): Integer;
    function GetSynKeyListCount(): Integer;
    function GetSynSetCount(): Integer;
    function GetSynTokenCount(): Integer;

    function GetCaseSensitive(): Boolean;
    procedure SetCaseSensitive(const Value: Boolean);

    procedure SetAllowPreviousClose(Value: Boolean);
    procedure SetCloseOnEol(Value: Boolean);
    procedure SetCloseOnTerm(Value: Boolean);
  public
    constructor Create(AOpenToken: string = ''; ACloseToken: string = ''); virtual;
    destructor Destroy(); override;

    function FindRange(const AName: string): TSynRange;
    function FindToken(AString: string): TSynToken;

    function AddRange(AOpen, AClose, AName: string; AColor: TColor): TSynRange; overload;
    function AddKeyList(AName: string; aColor: TColor): TSynKeyList; overload;
    function AddSet(AName: string; ACharSet: TCharSet; AColor: TColor): TSynSet; overload;

    procedure AddRule(NewRule: TSynRule);
    procedure AddRange(NewRange: TSynRange); overload;
    procedure AddKeyList(NewKeyList: TSynKeyList); overload;
    procedure AddSet(NewSet: TSynSet); overload;
    procedure AddSynToken(NewToken: TSynToken); //TODO: Rename all SynSymbol into SynToken

    procedure DeleteRule(ARule: TSynRule);
    procedure DeleteRange(Index: Integer); overload;
    procedure DeleteRange(Range: TSynRange); overload;
    procedure DeleteKeyList(Index: Integer); overload;
    procedure DeleteKeyList(KeyList: TSynKeyList); overload;
    procedure DeleteSet(Index: Integer); overload;
    procedure DeleteSet(SynSet: TSynSet); overload;

    function AddCoupleTokens(AOpenToken, ACloseToken: string): Integer;
    procedure DeleteCoupleTokens(Index: Integer);

    procedure InsertRule(ARule: TSynRule; Index: Integer);
    procedure InsertRange(ARange: TSynRange; Index: Integer);
    procedure InsertKeyList(AKeyList: TSynKeyList; Index: Integer);
    procedure InsertSet(ASet: TSynSet; Index: Integer);

    procedure MoveRule(ARule: TSynRule; NewIndex: Integer);
    procedure MoveRange(ARange: TSynRange; NewIndex: Integer);
    procedure MoveKeyList(AKeyList: TSynKeyList; NewIndex: Integer);
    procedure MoveSet(ASet: TSynSet; NewIndex: Integer);

    procedure RemoveRule(ARule: TSynRule);

    procedure SetColorForChilds;
    procedure SetDelimiters(ADelimiters: TCharSet);

    procedure Clear();
    procedure Prepare(AParent: TSynRange);
    procedure Reset();

    procedure LoadFromFile(AFileName: string); override;
    procedure LoadFromStream(AStream: TStream); override;
    //procedure LoadFromXml(ANode: IXMLNode); override;
    procedure SaveToFile(AFileName: string); override;
    procedure SaveToStream(AStream: TStream); override;
    //procedure SaveToXml(ANode: IXMLNode); override;

    property OpenToken: TSynMultiToken read fOpenToken write fOpenToken;
    property CloseToken: TSynMultiToken read fCloseToken write fCloseToken;

    property Delimiters: TCharSet read fDelimiters write fDelimiters;

    property AllowPreviousClose: Boolean read fAllowPreviousClose write SetAllowPreviousClose;
    property CloseOnEol: Boolean read fCloseOnEol write SetCloseOnEol;
    property CloseOnTerm: Boolean read fCloseOnTerm write SetCloseOnTerm;

    property CaseSensitive: Boolean read GetCaseSensitive write SetCaseSensitive;
    property KeyListCount: Integer read GetSynKeyListCount;
    property KeyLists[index: Integer]: TSynKeyList read GetSynKeyList;
    property Prepared: Boolean read fPrepared;
    property RangeCount: Integer read GetSynRangeCount;
    property Ranges[index: Integer]: TSynRange read GetSynRange;
    property SetCount: Integer read GetSynSetCount;
    property Sets[index: Integer]: TSynSet read GetSynSet;
    property TokenCount: Integer read GetSynTokenCount;
    property Tokens[index: Integer]: TSynToken read GetSynToken;
  end;

const
  DefaultDelimiters: TCharSet = ['*','/','+','-','=','\','|','&','(',')',
    '[',']','{','}','`','~','!','@',',','$','%','^','?',':',';','''','"','.',
    '>','<','#'];

implementation

uses
  SynUniFormatNativeXml20,
  SynUniFormatNativeXmlAuto;

//------------------------------------------------------------------------------
function HaveNodeAnyStart(Node: TTokenNode): Boolean;
var
  i: Integer;
begin
  Result := False;
  {if Node = nil then
  begin
    ShowMessage('Error');
    Exit;
  end;}
  if Node.StartType = stAny then begin
    Result := True;
    Exit;
  end;
  for i := 0 to Node.NextNodes.Count-1 do
    if (Node.NextNodes.Nodes[i].StartType = stAny) or HaveNodeAnyStart(Node.NextNodes.Nodes[i]) then begin
      Result := True;
      Exit;
    end
end;

//----------------------------------------------------------------------------
// Need for CaseSensitive
//----------------------------------------------------------------------------
function AnsiUpCase(ch: Char): Char;
begin
  Result := AnsiUpperCase(ch)[1];
end;

//----------------------------------------------------------------------------
// Need for CaseSensitive
//----------------------------------------------------------------------------
function CaseNone(ch: Char): Char;
begin
  Result := ch;
end;

//----------------------------------------------------------------------------
// Need for CaseSensitive
//----------------------------------------------------------------------------
function StringCaseNone(const st: string): string;
begin
  Result := st;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TSymbols * * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
// Add SynSymbol to the tree Symbols
//----------------------------------------------------------------------------
procedure TParser.AddTokenNode(AString: string; ASynToken: TSynToken; ABreakType: TBreakType);
var
  i: Integer;
  l: Integer;
  Node: TTokenNode;
  SList: TTokenNodeList; //TODO: Rename
begin
  SList := HeadNode.NextNodes;   // All branches of current node (first - root node)
  Node := nil;                   // Current Node
  l := Length(AString);          // Length of adding string
  for i := 1 to l do             // Check all symbols of adding string
  begin
    Node := SList.FindNode(AString[i]);      // Try to find current symbol of adding string among branches
    if Node = nil then                       // If we can't find current symbol
    begin
      Node := TTokenNode.Create(AString[i]); // then create node with current symbol
      SList.AddNode(Node);                   // and add it to current branches
    end;
    SList := Node.NextNodes;                 // Go to finded or added node
  end;
  Node.StartType := ASynToken.StartType;
  Node.BreakType := ABreakType;  // Set Break Type and ...
  Node.SynToken := ASynToken;    // ... SynSymbol of last Node
end;

//----------------------------------------------------------------------------
constructor TParser.Create(AChar: Char; ASynToken: TSynToken;
  ABreakType: TBreakType);
begin
  inherited Create();
  HeadNode := TTokenNode.Create(AChar, ASynToken, ABreakType);
  SynSets := TList.Create();
end;

//----------------------------------------------------------------------------
constructor TParser.Create(SynSet: TSynSet);
begin
  SynSets := TList.Create();
  AddSet(SynSet);
end;

//----------------------------------------------------------------------------
destructor TParser.Destroy();
begin
  if Assigned(HeadNode) then
    FreeAndNil(HeadNode);
  //FreeList(SynSets);
  SynSets.Clear();
  FreeAndNil(SynSets);
  inherited;
end;

//----------------------------------------------------------------------------
// Find string st in the tree Symbols
//----------------------------------------------------------------------------
function TParser.FindTokenNode(AString: string): TTokenNode; //never used
var
  i: Integer;
  l: Integer;
  Node, prvNode: TTokenNode;
begin
  Node := HeadNode;   //: Root of the tree
  l := Length(AString);     //: Length of string
  for i := 1 to l do
  begin
    prvNode := Node.NextNodes.FindNode(AString[i]);
    if prvNode = nil then     //: If don't find
      break;                  //: Exit from cycle
    Node := prvNode;          //: Else go to the brench or nil, if don't find
  end;
  Result := Node;     //: Return node, if found, and nil, if not found
end;

//----------------------------------------------------------------------------
procedure TParser.AddSet(SynSet: TSynSet);
begin
  SynSets.Add(SynSet);
end;

//----------------------------------------------------------------------------
// Try to find any token
//----------------------------------------------------------------------------
function TParser.GetToken(CurrRange: TSynRange; fLine: PChar; var Run: Integer; var ASynToken: TSynToken): Boolean;
var
  CurrNode, nxtStart, prevFind: TTokenNode;
  i, posStart, posNext, posPrev, Quantity: Integer;
  AllowedDelimiters: TCharSet;

  function CanBeToken(): Boolean;
  var
    i: Integer;
  begin
    CanBeToken := True;
    if CurrNode.SynToken = nil then
      CanBeToken := False
    else if (CurrNode.BreakType = btTerm) and not (fLine[Succ(Run)] in CurrRange.fDelimiters) then
      CanBeToken := False
    else
      case CurrNode.SynToken.StartLine of
        slFirstNonSpace:
          for i := 0 to posStart-1 do
            if not (fLine[i] in [' ', #32, #9]) then begin
              CanBeToken := False;
              Break;
            end;
        slFirst:
          if posStart <> 0 then
            CanBeToken := False;
      end;
  end;

begin
  Result := False;
  posStart := Run; // «апоминаем текущую позицию, чтобы восстановить перед поиском SynSet'ов
  if Assigned(HeadNode) then begin // ≈сли есть дерево токенов на этот символ
    CurrNode := HeadNode;
    posNext := posStart;
    NxtStart := nil;
    repeat
      if nxtStart <> nil then begin
        CurrNode := NxtStart;
        Run := posNext;
        NxtStart := nil;
      end;
      if CanBeToken() then
        PrevFind := CurrNode
      else
        PrevFind := nil;
      posPrev := Run;
      while (CurrNode.NextNodes.Count > 0) and (fLine[Run] <> #0) do begin
        Inc(Run);
        CurrNode := CurrNode.NextNodes.FindNode(CurrRange.CaseFunct(fLine[Run]));
        if CurrNode = nil then begin
          Dec(Run);
          break;
        end;

        if CanBeToken() then begin
          PrevFind := CurrNode;
          PosPrev := Run;
        end;

        if nxtStart = nil then
         if CurrRange.HasNodeAnyStart[CurrRange.CaseFunct(CurrNode.Char)] or
            (CurrNode.Char in CurrRange.fDelimiters) or
            (CurrRange.CaseFunct(fLine[Run]) in CurrRange.fDelimiters) then begin
           nxtStart := CurrNode;
           posNext := Run;
         end;
      end;

      Run := posPrev;

      if prevFind = nil then
        Continue;
      if prevFind.SynToken = nil then
        Continue; // Never happened???

      if fLine[Run] <> #0 then  // Go to next symbol in line if it isn't end of line
        Inc(Run);

      if prevFind.BreakType = btAny then begin  // If token can end by any symbol
        Result := True;            // We've found it!
        ASynToken := prevFind.SynToken;
        Exit;
      end;

      if fLine[Run] in CurrRange.fDelimiters then begin  // If token can end by delimeter and current symbol is delimeter
        Result := True;            // We've found it!
        ASynToken := prevFind.SynToken;
        Exit;
      end;
    until nxtStart = nil;
  end;
//l1:
{begin}
  Run := posStart;
  //Result := False;
  AllowedDelimiters := CurrRange.fDelimiters;
  for i := 0 to SynSets.Count-1 do begin
    AllowedDelimiters := AllowedDelimiters - TSynSet(SynSets[i]).CharSet;
  end;

  for i := 0 to SynSets.Count-1 do begin
    Run := posStart;
    repeat
      Inc(Run);
    until not (fLine[Run] in TSynSet(SynSets[i]).CharSet) or (fLine[Run] = #0);
    
    Quantity := TSynSet(SynSets[i]).Quantity;
    if (Quantity <> 0) and (Quantity <> Run - posStart) then
      Continue;
    // If number ends on some Term-symbol, then
    if TSynSet(SynSets[i]).BreakType = btAny then begin
      Result := True;                   // We've found it!
      ASynToken := TSynToken.Create(TSynSet(SynSets[i]).Attributes);
      ASynToken.Temporary := True;
      Exit;
    end;
    if (fLine[Run] in AllowedDelimiters) then begin
      Result := True;                   // We've found it!
      ASynToken := TSynToken.Create(TSynSet(SynSets[i]).Attributes);
      ASynToken.Temporary := True;
      Exit;
    end;
  end;
  Run := Succ(posStart);
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * TDefaultSymbols * * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TDefaultParser.Create(ASynToken: TSynToken);
begin
  SynToken := ASynToken;
end;

//----------------------------------------------------------------------------
destructor TDefaultParser.Destroy();
begin
  FreeAndNil(SynToken);
  inherited;
end;

//----------------------------------------------------------------------------
// Read just symbol, nothing to return
//----------------------------------------------------------------------------
function TDefaultParser.GetToken(CurrRange: TSynRange; fLine: PChar;
  var Run: Integer; var ASynToken: TSynToken): Boolean;
begin
  {$IFDEF SYN_MBCSSUPPORT} // DW
  if StrByteType(fLine, Run) = mbLeadByte then
    Inc(Run);
  {$ENDIF}
  Inc(Run);
  Result := False;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * TDefaultTermSymbols * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TDelimitersParser.Create(ASynToken: TSynToken);
begin
  inherited Create();
  SynToken := ASynToken;
end;

//----------------------------------------------------------------------------
destructor TDelimitersParser.Destroy();
begin
  FreeAndNil(SynToken);
  inherited;
end;

//----------------------------------------------------------------------------
function TDelimitersParser.GetToken(CurrRange: TSynRange; fLine: PChar;
  var Run: Integer; var ASynToken: TSynToken): Boolean;
begin
  if fLine[Run] <> #0 then  // If is not end of line then
    Inc(Run);                       // go to next symbol in fLine
  ASynToken := Self.SynToken;        // And return DefaultTermSymbol
  Result := True;                         // We've found token
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TSynRule * * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TSynRule.Create();
begin
  inherited;
  Attributes := TSynAttributes.Create('');
  fValidAttribs := TSynHighlighterAttributes.Create('');
end;

//----------------------------------------------------------------------------
destructor TSynRule.Destroy();
begin
  FreeAndNil(Attributes);
  FreeAndNil(fValidAttribs);
  inherited;
end;

//----------------------------------------------------------------------------
function TSynRule.GetValidAttribs(): TSynHighlighterAttributes;
begin
  {//TODO: First verify reaction on Attribs = nil...
  if Attribs = nil then begin
    Result := nil;
    Exit;
  end;}
  fValidAttribs.Assign(Attributes);
  if Attributes.ParentForeground then
    fValidAttribs.Foreground := Parent.Attributes.Foreground;
  if Attributes.ParentBackground then
    fValidAttribs.Background := Parent.Attributes.Background;
  Result := fValidAttribs;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * TSynRange * * * * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TSynRange.Create(AOpenToken: string; ACloseToken: string);
begin
  inherited Create();

  fName := '';

  fOpenToken := TSynMultiToken.Create();
  fCloseToken := TSynMultiToken.Create();
  AddCoupleTokens(AOpenToken, ACloseToken);

  FillChar(SymbolList, SizeOf(SymbolList), 0);

  SetCaseSensitive(False);

  fPrepared := False;

  fSynRanges := TList.Create();
  fSynKeyLists := TList.Create();
  fSynSets := TList.Create();
  fSynTokens := TList.Create();

  fDelimiters := DefaultDelimiters;

  Attributes.Foreground := clWindowText;
  Attributes.Background := clWindow;
end;

//----------------------------------------------------------------------------
// Destructor of TSynRange
//----------------------------------------------------------------------------
destructor TSynRange.Destroy();
begin
  Reset();
  Clear();
  {if Assigned(ClosingToken) then
    FreeAndNil(ClosingToken);}
  FreeAndNil(fOpenToken);
  FreeAndNil(fCloseToken);
  FreeAndNil(Attributes);
  FreeList(fSynKeyLists);
  FreeList(fSynSets);
  FreeList(fSynTokens);
  FreeList(fSynRanges);
  inherited;
end;

//----------------------------------------------------------------------------
// Add SynSymbol to the list fSynSymbols. If SynSymbol already exist in list
// Then remove it and add to the end of the list
//----------------------------------------------------------------------------
procedure TSynRange.AddSynToken(NewToken: TSynToken);
var
  SynToken: TSynToken;
begin
  SynToken := FindToken(NewToken.Symbol);
  if SynToken = nil then
    fSynTokens.Add(NewToken);
end;

//----------------------------------------------------------------------------
// Find SynSymbol (Symbol = st) in the list fSynSymbols
//----------------------------------------------------------------------------
function TSynRange.FindToken(AString: string): TSynToken;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to fSynTokens.Count-1 do
   if TSynToken(fSynTokens.Items[i]).Symbol = AString then
   begin
     Result := TSynToken(fSynTokens.Items[i]);
     Break;
   end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.AddRule(NewRule: TSynRule);
begin
  if NewRule is TSynRange then
    AddRange(NewRule as TSynRange) else
  if NewRule is TSynKeyList then
    AddKeyList(NewRule as TSynKeyList) else
  if NewRule is TSynSet then
    AddSet(NewRule as TSynSet);
end;

//----------------------------------------------------------------------------
procedure TSynRange.AddRange(NewRange: TSynRange);
begin
  fSynRanges.Add(NewRange);
  NewRange.Parent := Self;
end;

//----------------------------------------------------------------------------
function TSynRange.AddRange(AOpen, AClose, AName: string; AColor: TColor): TSynRange;
begin
  Result := TSynRange.Create(AOpen, AClose);
  with Result do begin
    fName := aName;
    Attributes.Foreground := AColor;
    Attributes.ParentForeground := False;
  end;
  AddRange(Result);
end;

//----------------------------------------------------------------------------
procedure TSynRange.AddKeyList(NewKeyList: TSynKeyList);
begin
  fSynKeyLists.Add(NewKeyList);
  NewKeyList.Parent := Self;
end;

//----------------------------------------------------------------------------
function TSynRange.AddKeyList(AName: string; AColor: TColor): TSynKeyList;
begin
  Result := TSynKeyList.Create('');
  with Result do begin
    fName := AName;
    Attributes.Foreground := AColor;
    Attributes.ParentForeground := False;
  end;
  AddKeyList(Result);
end;

//----------------------------------------------------------------------------
procedure TSynRange.AddSet(NewSet: TSynSet);
begin
  fSynSets.Add(NewSet);
  NewSet.Parent := Self;
end;

//----------------------------------------------------------------------------
function TSynRange.AddSet(AName: string; ACharSet: TCharSet; AColor: TColor): TSynSet;
begin
  Result := TSynSet.Create(ACharSet);
  with Result do begin
    fName := AName;
    Attributes.Foreground := AColor;
    Attributes.ParentForeground := False;
  end;
  AddSet(Result);
end;

//----------------------------------------------------------------------------
procedure TSynRange.InsertRule(ARule: TSynRule; Index: Integer);
begin
  if ARule is TSynRange then
    InsertRange(TSynRange(ARule), Index)
  else if ARule is TSynKeyList then
    InsertKeyList(TSynKeyList(ARule), Index)
  else if ARule is TSynSet then
    InsertSet(TSynSet(ARule), Index);
end;

//----------------------------------------------------------------------------
procedure TSynRange.InsertRange(ARange: TSynRange; Index: Integer);
begin
  fSynRanges.Insert(Index, ARange);
end;

//----------------------------------------------------------------------------
procedure TSynRange.InsertKeyList(AKeyList: TSynKeyList; Index: Integer);
begin
  fSynKeyLists.Insert(Index, AKeyList);
end;

//----------------------------------------------------------------------------
procedure TSynRange.InsertSet(ASet: TSynSet; Index: Integer);
begin
  fSynSets.Insert(Index, ASet);
end;

//----------------------------------------------------------------------------
procedure TSynRange.MoveRule(ARule: TSynRule; NewIndex: Integer);
begin
  if ARule is TSynRange then
    MoveRange(TSynRange(ARule), NewIndex);
  if ARule is TSynKeyList then
    MoveKeyList(TSynKeyList(ARule), NewIndex);
  if ARule is TSynSet then
    MoveSet(TSynSet(ARule), NewIndex);
end;

//----------------------------------------------------------------------------
procedure TSynRange.MoveRange(ARange: TSynRange; NewIndex: Integer);
begin
  fSynRanges.Exchange(fSynRanges.IndexOf(ARange), NewIndex);
end;

//----------------------------------------------------------------------------
procedure TSynRange.MoveKeyList(AKeyList: TSynKeyList; NewIndex: Integer);
begin
  fSynKeyLists.Exchange(fSynRanges.IndexOf(AKeyList), NewIndex);
end;

//----------------------------------------------------------------------------
procedure TSynRange.MoveSet(ASet: TSynSet; NewIndex: Integer);
begin
  fSynSets.Exchange(fSynRanges.IndexOf(ASet), NewIndex);
end;

//----------------------------------------------------------------------------
procedure TSynRange.RemoveRule(ARule: TSynRule);
begin
  if ARule is TSynRange then
    fSynRanges.Remove(ARule)
  else if ARule is TSynKeyList then
    fSynKeyLists.Remove(ARule)
  else if ARule is TSynSet then
    fSynSets.Remove(ARule);
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteRule(ARule: TSynRule);
begin
  if ARule is TSynRange then
    DeleteRange(TSynRange(ARule))
  else if ARule is TSynKeyList then
    DeleteKeyList(TSynKeyList(ARule))
  else if ARule is TSynSet then
    DeleteSet(TSynSet(ARule));
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteRange(Range: TSynRange);
begin
  if Range <> nil then
  begin
  fSynRanges.Remove(Range);
  FreeAndNil(Range);
  end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteRange(index: Integer);
begin
  TSynRange(fSynRanges[index]).Free;
  fSynRanges.Delete(index);
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteKeyList(KeyList: TSynKeyList);
begin
  if KeyList <> nil then
  begin
  fSynKeyLists.Remove(KeyList);
  FreeAndNil(KeyList);
  end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteKeyList(index: Integer);
begin
  TSynKeyList(fSynKeyLists[index]).Free;
  fSynKeyLists.Delete(index);
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteSet(SynSet: TSynSet);
begin
  if SynSet <> nil then
  begin
  fSynSets.Remove(SynSet);
  FreeAndNil(SynSet);
  end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteSet(index: Integer);
begin
  TSynSet(fSynSets[index]).Free;
  fSynSets.Delete(index);
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynTokenCount: Integer;
begin
  Result := fSynTokens.Count;
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynRangeCount: Integer;
begin
  Result := fSynRanges.Count;
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynKeyListCount: Integer;
begin
  Result := fSynKeyLists.Count;
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynSetCount: Integer;
begin
  Result := fSynSets.Count;
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynToken(Index: Integer): TSynToken;
begin
  Result := TSynToken(fSynTokens[Index]);
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynRange(Index: Integer): TSynRange;
begin
  Result := TSynRange(fSynRanges[Index]);
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynKeyList(Index: Integer): TSynKeyList;
begin
  Result := TSynKeyList(fSynKeyLists[Index]);
end;

//----------------------------------------------------------------------------
function TSynRange.GetSynSet(Index: Integer): TSynSet;
begin
  Result := TSynSet(fSynSets[Index]);
end;

//----------------------------------------------------------------------------
function TSynRange.AddCoupleTokens(AOpenToken, ACloseToken: string): Integer;
var
  Result1: Integer;
begin
  Result1 := fOpenToken.AddSymbol(AOpenToken);
  Result := fCloseToken.AddSymbol(ACloseToken);
  if Result1 <> Result then
    raise Exception.Create(ClassName + '.AddCoupleTags: different multitags count');
end;

//----------------------------------------------------------------------------
procedure TSynRange.DeleteCoupleTokens(Index: Integer);
begin
  fOpenToken.DeleteSymbol(Index);
  fCloseToken.DeleteSymbol(Index);
end;

//----------------------------------------------------------------------------
procedure TSynRange.SetDelimiters(ADelimiters: TCharSet);
var
  i: Integer;
begin
  Delimiters := ADelimiters;
  for i := 0 to RangeCount-1 do
    Ranges[i].SetDelimiters(ADelimiters);
end;

//----------------------------------------------------------------------------
// Return CaseSensitive
//----------------------------------------------------------------------------
function TSynRange.GetCaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

//----------------------------------------------------------------------------
// Set CaseSensitive
//----------------------------------------------------------------------------
procedure TSynRange.SetCaseSensitive(const Value: Boolean);
begin
  fCaseSensitive := Value;
  if not Value then begin
    CaseFunct := AnsiUpCase;
    StringCaseFunct := AnsiUpperCase;
  end
  else begin
    CaseFunct := CaseNone;
    StringCaseFunct := StringCaseNone;
  end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.SetCloseOnTerm(Value: Boolean);
begin
  fCloseOnTerm := Value;
end;

//----------------------------------------------------------------------------
procedure TSynRange.SetCloseOnEol(Value: Boolean);
begin
  fCloseOnEol := Value;
end;

//----------------------------------------------------------------------------
procedure TSynRange.SetAllowPreviousClose(Value: Boolean);
begin
  fAllowPreviousClose := Value;
end;

//----------------------------------------------------------------------------
// Sort symbols by quick sort
//----------------------------------------------------------------------------
procedure QuickSortTokenList(const List: TList; const lowerPos, upperPos: Integer); //bouville
//TODO: чтобы избежать сортировки нужно в правилах какое-нить свойство, что мол список уже отсортирован
var
  i, middlePos: Integer;
  pivotValue: string;
Begin
  if lowerPos < upperPos then
  begin

    pivotValue := TSynToken(List[lowerPos]).Symbol;
    middlePos := lowerPos; 

    for i := lowerPos + 1 to upperPos do
    begin
      if TSynToken(List[i]).Symbol < pivotValue then
      begin
        Inc(middlePos);
        List.Exchange(i,middlePos);
      end;
    end;
    List.Exchange(lowerPos,middlePos);

    QuickSortTokenList(List, lowerPos, middlePos-1);
    QuickSortTokenList(List, middlePos+1, upperPos);
  end;
end;

//----------------------------------------------------------------------------
// This procedure prepare Range for parsing
// Is called only from SetLine
//----------------------------------------------------------------------------
procedure TSynRange.Prepare(AParent: TSynRange); 
var
  i, j, Len: Integer;
  SynToken: TSynToken;
  s: string;
  FirstChar: Char;
  BreakType: TBreakType;

  //----------------------------------------------------------------------------
  // This function add Symb to SynRange, if and only if there is no it there
  // Return added or found element
  //----------------------------------------------------------------------------
  function SafeInsertToken(SynToken: TSynToken; Rules: TSynRange;
    Attribs: TSynHighlighterAttributes): TSynToken;
  begin
    Result := Rules.FindToken(SynToken.Symbol); // Find Symb in Rules
    if Result = nil then begin // If Symb not found, then add Symb to Rules
      Result := TSynToken.Create(SynToken);
      Rules.AddSynToken(Result);
    end;
    if Result.Attributes = nil then begin // If attributes of SynToken not setted
      Result.Attributes := Attribs; // then set them to Attribs
    end;
  end;

  //----------------------------------------------------------------------------
  // Add Token or just replace Attributes
  //----------------------------------------------------------------------------
  function InsertToken(SynToken: TSynToken; Rules: TSynRange): TSynToken;
  begin
    Result := Rules.FindToken(SynToken.Symbol);
    if Result = nil then begin
      Result := TSynToken.Create(SynToken);
      {Result.Symbol := Symb.Symbol;
      Result.BreakType := Symb.BreakType;} //TODO: We need to verify that... according to parsing
      Rules.AddSynToken(Result);
    end
    else
      Result.Attributes := SynToken.Attributes;
  end;

var
  Range: TSynRange;
  KeyList: TSynKeyList;
  //RuleLink: TSynRuleLink;
  OpenSynToken: TSynToken;

begin
  Reset(); // If already prepared then reset it!
  fDefaultSynToken  := TSynToken.Create(ValidAttribs);
  if Assigned(fDefaultTermSymbol) then
    FreeAndNil(fDefaultTermSymbol);
  fDefaultTermSymbol := TDelimitersParser.Create(TSynToken.Create(ValidAttribs));
  fDefaultSymbols    := TDefaultParser.Create(TSynToken.Create(ValidAttribs));

  fDelimiters := fDelimiters + AbsoluteDelimiters;

  if (AParent = nil) then //# ћы обновл€ем только текущий диапазон...
    if (Parent <> nil) then
    begin
      for j := 0 to OpenToken.SymbolCount-1 do
      begin
        if OpenToken.Symbols[j] = '' then continue;
        OpenSynToken := Parent.FindToken(OpenToken.Symbols[j]);
        if OpenSynToken = nil then
          raise Exception.Create(ClassName+'.Prepare: error preparing custom range');
        SynToken := TSynToken.Create(CloseToken, j);
        OpenSynToken.ClosingToken := SafeInsertToken(SynToken, Self, ValidAttribs);
        FreeAndNil(SynToken);
      end;
    end
  else begin
    fParent := AParent;
  end;

 if Enabled then
 begin
  // Assign range opening and closing symbols and Prepare range rules.
  for i := 0 to fSynRanges.Count-1 do begin
    Range := TSynRange(fSynRanges[i]);
    if Range.Enabled then begin
      for j := 0 to Range.fOpenToken.SymbolCount-1 do begin
        // Assign range opening symbol
        SynToken := TSynToken.Create(Range.OpenToken, j); //Atribs = nil
        OpenSynToken := SafeInsertToken(SynToken, Self, Range.ValidAttribs);
        OpenSynToken.fOpenRule := Range;
        FreeAndNil(SynToken);

        // Assing range closing symbols
        SynToken := TSynToken.Create(Range.CloseToken, j);
        OpenSynToken.ClosingToken := SafeInsertToken(SynToken, Range, Range.ValidAttribs);
        FreeAndNil(SynToken);
      end;
      Range.Prepare(Self);
    end;
  end;

  // Add all keywords to list fSynTokens:
  for i := 0 to fSynKeyLists.Count-1 do // All KeyLists
  begin
    KeyList := TSynKeyList(fSynKeyLists[i]);
    if KeyList.Enabled then
      for j := 0 to KeyList.KeyList.Count-1 do // All keywords in KeyLists
      begin // Add current keyword to list fSynTokens:
        SynToken := TSynToken.Create(KeyList.ValidAttribs);
        //###SynToken := TSynToken.Create(KeyList.Attributes);
        SynToken.Symbol := KeyList.KeyList[j];
        InsertToken(SynToken, Self); {AddSymbol}
        SynToken.Free();
      end;
  end;

  // Build tokens table
  QuickSortTokenList(fSynTokens, 0, fSynTokens.Count-1); // Sort fSynTokens
  for i := 0 to fSynTokens.Count-1 do begin       // run all  SynTokens
    SynToken := TSynToken(fSynTokens[i]);       // SynToken - next SymToken
    Len := Length(SynToken.Symbol);
    if Len < 1 then                                // If length equal zero
      continue;                                    //   then next SynToken
    s := SynToken.Symbol;                         // String of SynSymbol
    FirstChar := s[1];                             // First symbol of string of SynSymbol

    if SynToken.BreakType <> btUnspecified then   // If BreakType defined then
      BreakType := SynToken.BreakType             //   Write this BreakType to local variable
    else                                           // Else (if BreakType not defined)
      if s[Len] in fDelimiters then               //   If last symbol is TermSymbol
        BreakType := btAny                         //     Write to BreakType: btAny
      else                                         //   Else
        BreakType := btTerm;                       //     Write to BreakType: btTerm

    if SymbolList[CaseFunct(FirstChar)] = nil then // If in SymbolList on FirstChar there is no nothing
    begin
      if Len = 1 then                              //   If length of string of SynSymbol equal 1
                                                   //     then write SynSymbol in this element of SimbolList
        SymbolList[CaseFunct(FirstChar)] := {%fDefaultSymbols//}TParser.Create(FirstChar, SynToken, BreakType)
      else begin                                   //   Else (length of SynSymbol greate then 1)
                                                   //     Write fDefaultSynSymbol (???) to this element | FirstChar
        SymbolList[CaseFunct(FirstChar)] := {%fDefaultSymbols//}TParser.Create(FirstChar, fDefaultSynToken, BreakType);
                                                   //     and add SynSymbol to this element | All but without FirstChar
        {%//}TParser(SymbolList[CaseFunct(FirstChar)]).AddTokenNode(StringCaseFunct(copy(s, 2, Len-1)), SynToken, BreakType);
      end;
    end
    else begin                                     // Else (if in SynSymbol exist something)
      if Len = 1 then
      else                                         // If length of string SynSymbol greate then 1
                                                   //   Add SynSymbol to this element | All but without FirstChar
        {%//}TParser(SymbolList[CaseFunct(FirstChar)]).AddTokenNode(StringCaseFunct(copy(s, 2, Len-1)), SynToken, BreakType);
    end;
  end;

  if fSynSets.Count > 0 then
    for i := 0 to 255 do
      for j := 0 to fSynSets.Count-1 do begin
        if TSynSet(fSynSets[j]).Enabled and (Char(i) in TSynSet(fSynSets[j]).CharSet) then
          if SymbolList[CaseFunct(Char(i))] = nil then
            SymbolList[CaseFunct(Char(i))] := {%fDefaultSymbols//}TParser.Create(TSynSet(fSynSets[j]))
          else
            {%//}TParser(SymbolList[CaseFunct(Char(i))]).AddSet(TSynSet(fSynSets[j]));
      end;
//          SymbolList[Char(i)] := fSetSymbols;
//          TSetSymbols(SymbolList[Char(i)]).AddSetfSetSymbols;

  for i := 0 to 255 do
   if (SymbolList[Char(i)] <> nil) then
    if (SymbolList[Char(i)] <> fDefaultTermSymbol) then
     if (SymbolList[Char(i)] <> fDefaultSymbols) then
      {%}if (TParser(SymbolList[Char(i)]).HeadNode <> nil) then
        HasNodeAnyStart[Char(i)] :=
          HaveNodeAnyStart(TParser(SymbolList[CaseFunct(Char(i))]).HeadNode);

 end; //if enabled
 
  // Fill remaining table
  for i := 0 to 255 do
  if SymbolList[Char(i)] = nil then
  begin
    if Char(i) in fDelimiters then
      SymbolList[Char(i)] := fDefaultTermSymbol
    else
      SymbolList[Char(i)] := fDefaultSymbols;
   end;

  fPrepared := true;
end;

//----------------------------------------------------------------------------
// Clear some properties of SynRange,
// Calls in Clear method, and also on TSynRange prepare (Prepare method)
// Can be done only if range has been prepared
//----------------------------------------------------------------------------
procedure TSynRange.Reset();
var
  i: Integer;
begin
  if not fPrepared then
    Exit;
  for i := 0 to 255 do
  begin
    //SymbolList[Char(i)] := nil; //maybe need to free
    if Assigned(SymbolList[Char(i)]) and
      (SymbolList[Char(i)] <> fDefaultTermSymbol) and
      (SymbolList[Char(i)] <> fDefaultSymbols) then
         FreeAndNil(SymbolList[Char(i)])
    else
      SymbolList[Char(i)] := nil;
  end;
  FreeAndNil(fDefaultSynToken);
  FreeAndNil(fDefaultTermSymbol);
  FreeAndNil(fDefaultSymbols);
  for i := 0 to fSynRanges.Count-1 do
    TSynRange( fSynRanges[i] ).Reset();
  ClearList(fSynTokens);
  fPrepared := False;
end;

//----------------------------------------------------------------------------
// Clear primary properties of SynRange, calls on new rules creating
//----------------------------------------------------------------------------
procedure TSynRange.Clear();
var
  i: Integer;
begin
  OpenToken.Clear();
  CloseToken.Clear();
  AddCoupleTokens('', '');
  AllowPreviousClose := False;
  CloseOnTerm := False;
  CloseOnEol := False;
  Reset;  // Reset range (clear some properties)
  for i := 0 to fSynRanges.Count-1 do   // Clear all sub-ranges
    TSynRange(fSynRanges[i]).Clear();
  //ClearList(fRules);
  ClearList(fSynRanges);
  ClearList(fSynTokens);
  ClearList(fSynKeyLists);
  ClearList(fSynSets);
end;

//----------------------------------------------------------------------------
function TSynRange.FindRange(const AName: string): TSynRange;
var
  i: Integer;
begin
  Result := nil;
  if fParent = nil then
    Exit;
  for i := 0 to fParent.RangeCount-1 do
    if SameText(AName, fParent.Ranges[I].fName) then
    begin
      Result := fParent.Ranges[i];
      Exit;
    end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.SetColorForChilds;
var
  i: Integer;
begin
  //TODO: ¬ставить сюда наконец-то with...do
  for i := 0 to RangeCount-1 do
  begin
    if Ranges[i].Attributes.ParentForeground then
      Ranges[i].Attributes.Foreground := Attributes.Foreground;
    if Ranges[i].Attributes.ParentBackground then
      Ranges[i].Attributes.Background := Attributes.Background;
    Ranges[i].SetColorForChilds;
  end;
  for i := 0 to KeyListCount-1 do
  begin
    if KeyLists[i].Attributes.ParentForeground then
      KeyLists[i].Attributes.Foreground := Attributes.Foreground;
    if KeyLists[i].Attributes.ParentBackground then
      KeyLists[i].Attributes.Background := Attributes.Background;
  end;
  for i := 0 to SetCount-1 do
  begin
    if Sets[i].Attributes.ParentForeground then
      Sets[i].Attributes.Foreground := Attributes.Foreground;
    if Sets[i].Attributes.ParentBackground then
      Sets[i].Attributes.Background := Attributes.Background;
  end;
end;

//----------------------------------------------------------------------------
procedure TSynRange.LoadFromStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ImportFromStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynRange.LoadFromFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ImportFromFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
procedure TSynRange.SaveToStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ExportToStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynRange.SaveToFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ExportToFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * TSynKeyList * * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TSynKeyList.Create(st: string);
begin
  inherited Create();
  fName := '';
  KeyList := TStringList.Create();
  KeyList.Text := st;
  Attributes.Foreground := clWindowText;
  Attributes.Background := clWindow;
end;

//----------------------------------------------------------------------------
destructor TSynKeyList.Destroy();
begin
  FreeAndNil(KeyList);
  inherited;
end;

//----------------------------------------------------------------------------
procedure TSynKeyList.LoadFromStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ImportFromStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynKeyList.LoadFromFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ImportFromFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
procedure TSynKeyList.SaveToStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ExportToStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynKeyList.SaveToFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ExportToFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TSynSet * * * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TSynSet.Create(ACharSet: TCharSet = []);
begin
  inherited Create();
  fName := '';
  CharSet := ACharSet;
  Quantity := 0;
  Attributes.Foreground := clWindowText; //TODO: Ёто должно быть в TSynRule или в TSynAttributes
  Attributes.Background := clWindow;
end;

//----------------------------------------------------------------------------
destructor TSynSet.Destroy();
begin
  inherited;
end;

//----------------------------------------------------------------------------
procedure TSynSet.LoadFromStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ImportFromStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynSet.LoadFromFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ImportFromFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
procedure TSynSet.SaveToStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ExportToStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynSet.SaveToFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ExportToFile(Self, AFileName);
end;

end.

