{
@abstract(TSynUniSyn classes source)
@authors(Fantasist [walking_in_the_sky@yahoo.com], Vit [nevzorov@yahoo.com],
         Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2004)
@lastmod(2006-07-19)
}

{$IFNDEF QSYNUNICLASSES}
unit SynUniClasses;
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
  QSynEditStrConst,
{$ELSE}
  Windows,
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynEditStrConst,
{$ENDIF}
  Classes,
  SysUtils;

type
  TCharSet = set of Char;

  TSynInfo = class;

  TSynToken = class;

  TTokenNode = class;

  TTokenNodeList = class;

  TAuthorInfo = record
    Name: string;
    Email: string;
    Web: string;
    Copyright: string;
    Company: string;
    Remark: string;
  end;

  TGeneralInfo = record
    Name: string;
    Extensions: string;
    FileType: string;
    Version: Integer;
    Revision: Integer;
    History: string;
    Sample: string;
  end;
  
  TSynInfo = class
  public
    Author: TAuthorInfo;
    General: TGeneralInfo;    
    procedure Clear;
    procedure LoadFromFile(AFileName: string);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToFile(AFileName: string);
    procedure SaveToStream(AStream: TStream);
  end;
  
  TStartType = (stUnspecified, stAny, stTerm);
  TBreakType = (btUnspecified, btAny, btTerm);
  TStartLine = (slNotFirst, slFirst, slFirstNonSpace);
  
  TSynAttributes = class(TSynHighlighterAttributes)
  public
    ParentForeground: Boolean;
    ParentBackground: Boolean;
    constructor Create(AName: string);
    destructor Destroy(); override;
    procedure AssignColorAndStyle(AStyle: TSynAttributes); overload;
    //property Name: string read fName write fName;
  end;

  TEditorProperties = class
  public
    ActiveLineColor: TColor;
    SelectedForeground: TColor;
    SelectedBackground: TColor;
    constructor Create();
    destructor Destroy();
    procedure Clear();
  end;

  TAbstractRule = class;

  TAbstractSynToken = class
  public
    Attributes: TSynHighlighterAttributes;
    BreakType: TBreakType;
    FinishOnEol: Boolean;
    fIsRegexp: Boolean; //new
    fOpenRule: TAbstractRule;
    StartLine: TStartLine;
    StartType: TStartType;
    constructor Create(); reintroduce; overload;
    constructor Create(Attribs: TSynHighlighterAttributes); reintroduce; overload;
    constructor Create(ASynToken: TAbstractSynToken); reintroduce; overload;
    destructor Destroy(); override;
    procedure Clear;
  end;

  TSynMultiToken = class(TAbstractSynToken)
  private
    fSymbols: TStringList;
    function GetSymbol(Index: Integer): string;
    procedure SetSymbol(Index: Integer; ASymbol: string);
  public
    constructor Create(); reintroduce; overload;
    constructor Create(Attribs: TSynHighlighterAttributes); reintroduce; overload;
    constructor Create(ASynMultiToken: TSynMultiToken); reintroduce; overload;
    destructor Destroy(); override;
    function AddSymbol(ASymbol: string): Integer;
    function SymbolCount(): Integer;
    procedure Clear();
    procedure DeleteSymbol(Index: Integer);
    //property SymbolList: TStringList read fSymbols write fSymbols;
    property Symbols[Index: Integer]: string read GetSymbol write SetSymbol; //нужно index добавить и туда #0
  end;
  
  TSynToken = class(TAbstractSynToken)
  private
    fSymbol: string;
    function GetSymbol: string;
  public                       
    ClosingToken: TSynToken;
    Temporary: Boolean;
    constructor Create(); overload;
    constructor Create(Attribs: TSynHighlighterAttributes); overload;
    constructor Create(ASynToken: TSynToken); overload;
    constructor Create(ASynMultiToken: TSynMultiToken; Index: Integer); overload;
    destructor Destroy(); override;
    procedure Clear();
    property Symbol: string read GetSymbol write fSymbol;
  end;

  //TODO: возможно стоит его сделать наследником TAbstractSynSymbol
  TTokenNode = class //was: TSymbolNode
  private
    fChar: Char;
  public
    BreakType: TBreakType;
    StartType: TStartType;
    NextNodes: TTokenNodeList;
    SynToken: TSynToken;
    constructor Create(AChar: Char; ASynToken: TSynToken; ABreakType: TBreakType); overload; //virtual;
    constructor Create(AChar: Char); overload;
    destructor Destroy(); override;
    property Char: Char read fChar write fChar;
  end;

  TTokenNodeList = class //was: TSymbolList
    NodeList: TList;
    constructor Create(); //virtual;
    destructor Destroy(); override;
    function FindNode(AChar: Char): TTokenNode;
    function GetCount: Integer;
    function GetNode(Index: Integer): TTokenNode;
    procedure AddNode(Node: TTokenNode);
    procedure SetNode(Index: Integer; Value: TTokenNode);
    property Count: Integer read GetCount;
    property Nodes[index: Integer]: TTokenNode read GetNode write SetNode;
  end;

  { Color scheme }
  TSynScheme = class
  private
    fName: string;
    fStyleList: TList;

    function GetCount: Integer;
    function GetStyle(Index: Integer): TSynAttributes;
    procedure SetStyle(Index: Integer; Value: TSynAttributes);
  public
    EditorProperties: TEditorProperties;

    constructor Create(const AName: string); virtual;
    destructor Destroy(); override;

    function AddStyle(AName: string; Foreground, Background: TColor;
      FontStyle: TFontStyles): TSynAttributes; overload;
    function GetStyleDefault(const AName: string;
      const Default: TSynAttributes): TSynAttributes;
    function GetStyleName(const AName: string): TSynAttributes;
    function IndexOf(const AName: string): Integer;

    procedure AddStyle(AStyle: TSynAttributes); overload;
    procedure Clear();
    procedure Delete(const Index: Integer);

    property Count: Integer read GetCount;
    property Name: string read fName write fName;
    property Styles[index: Integer]: TSynAttributes read GetStyle write SetStyle;
  end;

  TSynUniSchemes = class
  protected
    fSchemesList: TList;    
    
    function GetCount(): Integer;
    function GetScheme(Index: Integer): TSynScheme;
    procedure SetScheme(Index: Integer; Value: TSynScheme);
  public
    constructor Create(); virtual;
    destructor Destroy(); override;

    function AddScheme(const AName: string): TSynScheme; overload;
    function GetSchemeName(const AName: string): TSynScheme;
    function IndexOf(AScheme: TSynScheme): Integer;

    procedure AddScheme(const AScheme: TSynScheme); overload;
    procedure Clear();
    procedure Delete(AScheme: TSynScheme); overload;
    procedure Delete(const Index: Integer); overload;
    procedure ListStyleNames(AList: TStrings);
    procedure LoadFromFile(AFileName: string);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToFile(AFileName: string);
    procedure SaveToStream(AStream: TStream);

    property Count: Integer read GetCount;
    property Schemes[index: Integer]: TSynScheme read GetScheme write SetScheme;
  end;

  TAbstractRule = class
  private   
    fEnabled: Boolean;   
    procedure SetEnabled(Value: Boolean);
  public
    constructor Create();
    destructor Destroy(); override;
    property Enabled: Boolean read fEnabled write SetEnabled
      default True;
  end;
  
  function FontStyleToStr(AFontStyle: TFontStyles): string;
  function StrToFontStyle(AString: string): TFontStyles;
  function SetToStr(ACharSet: TCharSet): string;
  function StrToSet(AString: string): TCharSet;
  function StartLineToStr(AStartLine: TStartLine): string;
  function StrToStartLine(AString: string): TStartLine;
  function StartTypeToStr(AStartType: TStartType): string;
  function StrToStartType(AString: string): TStartType;
  function BreakTypeToStr(ABreakType: TBreakType): string;
  function StrToBreakType(AString: string): TBreakType;

  procedure ClearList(var List: TList);
  procedure FreeList(var List: TList);

const
  { Symbols that are always delimiters }
  AbsoluteDelimiters: TCharSet = [#0, #9, #10, #13, #32];
  { End of line identifier }
  EOL = #13#10;

implementation

uses
  SynUniFormatNativeXml20,
{$IFDEF SYN_CLX}
  QSynUniRules;
{$ELSE}
  SynUniRules;
{$ENDIF}

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * INTERFACE * * * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
function FontStyleToStr(AFontStyle: TFontStyles): string;
begin
  Result := '';
  if fsBold in AFontStyle then Result := Result + 'B';
  if fsItalic in AFontStyle then Result := Result + 'I';
  if fsUnderline in AFontStyle then Result := Result + 'U';
  if fsStrikeOut in AFontStyle then Result := Result + 'S';
end;

//----------------------------------------------------------------------------
function SetToStr(ACharSet: TCharSet): string;
var
  b: byte;
begin
  Result := '';
  for b := 1 to 255 do
    if (chr(b) in ACharSet) and (not (chr(b) in AbsoluteDelimiters)) then
      Result := Result + chr(b);
end;

//----------------------------------------------------------------------------
function StrToFontStyle(AString: string): TFontStyles;
begin
  Result := [];
  if Pos('B', AString) > 0 then
    Include(Result, fsBold);
  if Pos('I', AString) > 0 then
    Include(Result, fsItalic);
  if Pos('U', AString) > 0 then
    Include(Result, fsUnderline);
  if Pos('S', AString) > 0 then
    Include(Result, fsStrikeOut);
end;

//----------------------------------------------------------------------------
function StrToSet(AString: string): TCharSet;
var
   i: Integer;
begin
  Result := [];
  for i := 1 to Length(AString) do
    Result := Result + [AString[i]];
end;

//----------------------------------------------------------------------------
function StartLineToStr(AStartLine: TStartLine): string;
begin
  if AStartLine = slFirst then
    Result := 'True'
  else if AStartLine = slFirstNonSpace then
    Result := 'NonSpace'
  else
    Result := '';
end;

//----------------------------------------------------------------------------
function StrToStartLine(AString: string): TStartLine;
begin
  Result := slNotFirst;
  if (AString = 'True') or (AString = 'First') then
    Result := slFirst
  else if AString = 'NonSpace' then
    Result := slFirstNonSpace
  else if (AString = 'False') or (AString = '') then
    Result := slNotFirst
  else
    //raise Exception.Create('Unknown StartLine identifier');
end;

//----------------------------------------------------------------------------
function StartTypeToStr(AStartType: TStartType): string;
begin

end;

//----------------------------------------------------------------------------
function StrToStartType(AString: string): TStartType;
begin
  if (AString = 'True') or (AString = 'Left') or (AString = '') then
    Result := stAny
  else if (AString = 'Right') or (AString = 'False') then
    Result := stTerm
  else
    Result := stUnspecified//raise Exception.Create('Unknown start types identifier');
end;

//----------------------------------------------------------------------------
function BreakTypeToStr(ABreakType: TBreakType): string;
begin

end;

//----------------------------------------------------------------------------
function StrToBreakType(AString: string): TBreakType;
begin
  if (AString = 'True') or (AString = 'Right') or (AString = '') then
    Result := btAny
  else if (AString = 'Left') or (AString = 'False') then
    Result := btTerm
  else
    Result := btUnspecified;//raise Exception.Create('Unknown break types identifier');
end;

//----------------------------------------------------------------------------
procedure ClearList(var List: TList);
var
  i: Integer;
begin
  if not Assigned(List) then
    Exit;
  for i := 0 to List.Count-1 do
    TObject(List[i]).Free();
  List.Clear();
end;

//----------------------------------------------------------------------------
procedure FreeList(var List: TList);
var
  i: Integer;
begin
  if not Assigned(List) then
    Exit;
  for i := 0 to List.Count - 1 do
    TObject(List[i]).Free();
  FreeAndNil(List);
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * TSynInfo * * * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
procedure TSynInfo.Clear;
begin
  General.Name := '';
  General.Extensions := '';
  General.Version := 0;
  General.Revision := 0;
  General.Sample := '';
  Author.Name := '';
  Author.Email := '';
  Author.Web := '';
  Author.Copyright := '';
  Author.Company := '';
end;

//----------------------------------------------------------------------------
procedure TSynInfo.LoadFromStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ImportFromStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynInfo.LoadFromFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ImportFromFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
procedure TSynInfo.SaveToStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ExportToStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynInfo.SaveToFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ExportToFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * TEditorProperties * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TEditorProperties.Create();
begin
  inherited;
  Clear;
end;

//----------------------------------------------------------------------------
destructor TEditorProperties.Destroy();
begin
  inherited;
end;

//----------------------------------------------------------------------------
procedure TEditorProperties.Clear;
begin
  ActiveLineColor := clNone;
  SelectedForeground := clHighlightText;
  SelectedBackground := clHighlight;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * TSynAttributes * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TSynAttributes.Create(AName: String);
begin
  // inherited Create(Name);  //!!EK
  inherited Create(AName);  //!!EK
  //#fName := AName;
end;

//----------------------------------------------------------------------------
destructor TSynAttributes.Destroy();
begin
  //#fName := '';
  inherited;
end;

//----------------------------------------------------------------------------
procedure TSynAttributes.AssignColorAndStyle(AStyle: TSynAttributes);
begin
  inherited AssignColorAndStyle(AStyle);
  ParentForeground := AStyle.ParentForeground;
  ParentBackground := AStyle.ParentBackground;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * TAbstractSynSymbol * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TAbstractSynToken.Create();
begin
  inherited;
  Attributes := nil;
  fIsRegexp  := False; 
  fOpenRule  := nil;
  StartLine  := slNotFirst;
  StartType  := stUnspecified;
  BreakType  := btUnspecified;
end;

//----------------------------------------------------------------------------
constructor TAbstractSynToken.Create(Attribs: TSynHighlighterAttributes);
begin
  Create();
  Attributes := Attribs;
end;

//----------------------------------------------------------------------------
constructor TAbstractSynToken.Create(ASynToken: TAbstractSynToken);
begin
  inherited Create();
  Attributes := ASynToken.Attributes;
  //# fOpenRule  := ASynSymbol.fOpenRule; //TODO: Ќад этим надо подумать... (см. SafeInsertToken)
  StartLine  := ASynToken.StartLine;
  StartType  := ASynToken.StartType;
  BreakType  := ASynToken.BreakType;
end;

//----------------------------------------------------------------------------
destructor TAbstractSynToken.Destroy();
begin
  {if Assigned(Attributes) then
    FreeAndNil(Attributes);}
  inherited;
end;

{//----------------------------------------------------------------------------
procedure TAbstractSynSymbol.SetFinishOnEol(Value: Boolean);
begin
  fFinishOnEol := Value;
end;}

//----------------------------------------------------------------------------
procedure TAbstractSynToken.Clear;
begin
  StartType := stAny;
  BreakType := btAny;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TSynToken * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TSynToken.Create();
begin
  inherited;
  Symbol := '';
  Temporary := False;
end;

//----------------------------------------------------------------------------
constructor TSynToken.Create(Attribs: TSynHighlighterAttributes);
begin
  inherited;
  Symbol := '';
end;

//----------------------------------------------------------------------------
constructor TSynToken.Create(ASynToken: TSynToken);
begin
  inherited Create(ASynToken as TAbstractSynToken);
  Symbol := ASynToken.Symbol;
end;

constructor TSynToken.Create(ASynMultiToken: TSynMultiToken; Index: Integer);
begin
  inherited Create(ASynMultiToken as TAbstractSynToken);
  Symbol := ASynMultiToken.Symbols[Index];
end;

//----------------------------------------------------------------------------
destructor TSynToken.Destroy();
begin
  {if Assigned(ClosingToken) then
    FreeAndNil(ClosingToken);}
  inherited;
end;

//----------------------------------------------------------------------------
function TSynToken.GetSymbol: string;
begin
  if FinishOnEol then
    Result := fSymbol + #0
  else
    Result := fSymbol;
end;

//----------------------------------------------------------------------------
procedure TSynToken.Clear();
begin
  Symbol := '';
end;

(*
//----------------------------------------------------------------------------
procedure TSynToken.SetFinishOnEol(Value: Boolean);
begin
  inherited;
{  if fSymbol[Length(fSymbol)] = #0 then
  begin
    if not fFinishOnEol then
      Delete(fSymbol, Length(fSymbol), 1);
  end
  else begin
    if fFinishOnEol then
      fSymbol := fSymbol + #0;
  end}
end;
*)

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * TSynMultiToken * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TSynMultiToken.Create();
begin
  inherited;
  fSymbols := TStringList.Create();
  //fSymbols.Add('');
  StartType := stAny;
  BreakType := btAny;
end;

//----------------------------------------------------------------------------
constructor TSynMultiToken.Create(Attribs: TSynHighlighterAttributes);
begin
  inherited;
  Create();
end;

//----------------------------------------------------------------------------
constructor TSynMultiToken.Create(ASynMultiToken: TSynMultiToken);
begin
  inherited Create(ASynMultiToken as TAbstractSynToken);
  Create();
  //Symbol := ASynToken.Symbol;
end;

//----------------------------------------------------------------------------
destructor TSynMultiToken.Destroy();
begin
  FreeAndNil(fSymbols);
  inherited;
end;

//----------------------------------------------------------------------------
function TSynMultiToken.AddSymbol(ASymbol: string): Integer;
begin
  //if (fSymbols.Count = 1) and
  Result := fSymbols.Add(ASymbol);
end;

//----------------------------------------------------------------------------
procedure TSynMultiToken.Clear();
begin
  fSymbols.Clear();
  //fSymbols.Add('');
end;

//----------------------------------------------------------------------------
procedure TSynMultiToken.DeleteSymbol(Index: Integer);
begin
  if (Index > -1) and (Index < fSymbols.Count) then
    fSymbols.Delete(Index)
  else
    raise Exception.Create(ClassName + '.DelteSymbol: Index out of bounds');
end;

{
//----------------------------------------------------------------------------
procedure TSynMultiToken.SetFinishOnEol(Value: Boolean);
var
  i: Integer;
  Current: string;
begin
  inherited;
  for i := 0 to fSymbols.Count-1 do begin
    Current := fSymbols[i];
    if Current[Length(Current)] = #0 then
    begin
      if not FinishOnEol then
        Delete(Current, Length(Current), 1);
    end
    else begin
      if fFinishOnEol then
        Current := Current + #0;
    end;
    fSymbols[i] := Current;
  end;
end;
}

//----------------------------------------------------------------------------
function TSynMultiToken.GetSymbol(Index: Integer): string;
begin
  if (Index > -1) and (Index < fSymbols.Count) then
    Result := fSymbols[Index]
  else
    raise Exception.Create(ClassName + '.GetSymbol: Index out of bounds');
end;

//----------------------------------------------------------------------------
procedure TSynMultiToken.SetSymbol(Index: Integer; ASymbol: string);
begin
  if (Index > -1) and (Index < fSymbols.Count) then
    fSymbols[Index] := ASymbol
  else
    raise Exception.Create(ClassName + '.SetSymbol: Index out of bounds');
end;

//----------------------------------------------------------------------------
function TSynMultiToken.SymbolCount: Integer;
begin
  Result := fSymbols.Count;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TTokenNode * * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TTokenNode.Create(AChar: Char);
begin
  inherited Create();
  fChar := AChar;
  NextNodes := TTokenNodeList.Create();
  SynToken := nil;
end;

//----------------------------------------------------------------------------
constructor TTokenNode.Create(AChar: Char; ASynToken: TSynToken;
  ABreakType: TBreakType);
begin
  Create(AChar);
  BreakType := ABreakType;
  StartType := ASynToken.StartType;
  SynToken := ASynToken;
end;

//----------------------------------------------------------------------------
destructor TTokenNode.Destroy();
begin
  FreeAndNil(NextNodes);
  inherited;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * TTokenNodeList * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TTokenNodeList.Create();
begin
  inherited;
  NodeList := TList.Create();
end;

//----------------------------------------------------------------------------
destructor TTokenNodeList.Destroy();
begin
  FreeList(NodeList);
  inherited;
end;

//----------------------------------------------------------------------------
procedure TTokenNodeList.AddNode(Node: TTokenNode);
begin
  NodeList.Add(Node);
end;

//----------------------------------------------------------------------------
function TTokenNodeList.FindNode(AChar: Char): TTokenNode;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to NodeList.Count-1 do
    if TTokenNode(NodeList[i]).fChar = AChar then
    begin
      Result := TTokenNode(NodeList[i]);
      Break;
    end;
end;

//----------------------------------------------------------------------------
// Return Node count in SymbolList
//----------------------------------------------------------------------------
function TTokenNodeList.GetCount: Integer;
begin
  Result := NodeList.Count;
end;

//----------------------------------------------------------------------------
// Return Node in SymbolList by index
//----------------------------------------------------------------------------
function TTokenNodeList.GetNode(Index: Integer): TTokenNode;
begin
  Result := TTokenNode(NodeList[index]);
end;

//----------------------------------------------------------------------------
procedure TTokenNodeList.SetNode(Index: Integer; Value: TTokenNode);
begin
  if Index < NodeList.Count then
    TTokenNode(NodeList[index]).Free;
  NodeList[index] := Value;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TAbstractRule * * * * * * * * * * * * * * * * }
//----------------------------------------------------------------------------
constructor TAbstractRule.Create();
begin
  inherited;
  Enabled := True;
end;

//----------------------------------------------------------------------------
destructor TAbstractRule.Destroy();
begin
  inherited;
end;

//----------------------------------------------------------------------------
procedure TAbstractRule.SetEnabled(Value: Boolean);
begin
  fEnabled := Value;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * TSynScheme * * * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TSynScheme.Create(const AName: string);
begin
  inherited Create();
  fName := AName;
  fStyleList := TList.Create();
  EditorProperties := TEditorProperties.Create();
end;

//----------------------------------------------------------------------------
destructor TSynScheme.Destroy();
begin
  Clear;
  FreeList(fStyleList);
  FreeAndNil(EditorProperties);
  inherited;
end;

//----------------------------------------------------------------------------
function TSynScheme.AddStyle(AName: string; Foreground, Background: TColor;
  FontStyle: TFontStyles): TSynAttributes;
begin
  {$IFDEF WRITABLE_ATTRIBUTE_NAME}
  Result := TSynAttributes.Create(Name);
  Result.Name := AName;
  {$ELSE}
  Result := TSynAttributes.Create(AName);
  {$ENDIF}
  Result.ParentForeground := False;
  Result.ParentBackground := False;
  Result.Foreground := Foreground;
  Result.Background := Background;
  Result.Style := FontStyle;
  fStyleList.Add(Result);
end;

//----------------------------------------------------------------------------
procedure TSynScheme.AddStyle(AStyle: TSynAttributes);
begin
  fStyleList.Add(AStyle);
end;

//----------------------------------------------------------------------------
procedure TSynScheme.Clear;
begin
  ClearList(fStyleList);
end;

//----------------------------------------------------------------------------
procedure TSynScheme.Delete(const Index: Integer);
begin
  TSynAttributes(fStyleList.Items[Index]).Free;
  fStyleList.Remove(fStyleList.Items[Index]);
end;

//----------------------------------------------------------------------------
function TSynScheme.GetCount: Integer;
begin
  Result := fStyleList.Count;
end;

//----------------------------------------------------------------------------
function TSynScheme.GetStyle(Index: Integer): TSynAttributes;
begin
  Result := TSynAttributes(fStyleList.Items[Index]);
end;

//----------------------------------------------------------------------------
function TSynScheme.GetStyleDefault(const AName: string;
  const Default: TSynAttributes): TSynAttributes;
var
  i: Integer;
begin
  Result := Default;
  try //??? ¬ Designer 2.0 выскакивает AV
    if fStyleList = nil then Exit;
  except
    Exit;
  end;
  for i := 0 to {fStyleList.}Count - 1 do
    if TSynAttributes(fStyleList[i]).{f}Name = AName then
    begin
      Result := TSynAttributes(fStyleList[i]);
      Break;
    end;
end;

//----------------------------------------------------------------------------
function TSynScheme.GetStyleName(const AName: string): TSynAttributes;
begin
  Result := GetStyleDefault(AName, nil);
end;

//----------------------------------------------------------------------------
function TSynScheme.IndexOf(const AName: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to fStyleList.Count - 1 do
    if TSynAttributes(fStyleList[i]).{f}Name = AName then
    begin
      Result := i;
      Break;
    end;
end;

//----------------------------------------------------------------------------
procedure TSynScheme.SetStyle(Index: Integer; Value: TSynAttributes);
begin
  fStyleList.Items[Index] := Value;
end;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * TSynUniSchemes * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TSynUniSchemes.Create();
var
  NewScheme: TSynScheme;
begin
  inherited;
  fSchemesList := TList.Create();
  NewScheme := TSynScheme.Create('Default');
  fSchemesList.Add(NewScheme);
end;

//----------------------------------------------------------------------------
destructor TSynUniSchemes.Destroy();
begin
  Clear;
  FreeList(fSchemesList);
  inherited;
end;

//----------------------------------------------------------------------------
function TSynUniSchemes.GetCount(): Integer;
begin
  Result := fSchemesList.Count;
end;

//----------------------------------------------------------------------------
function TSynUniSchemes.GetScheme(Index: Integer): TSynScheme;
begin
  Result := TSynScheme(fSchemesList[Index]);
end;

//----------------------------------------------------------------------------
function TSynUniSchemes.IndexOf(AScheme: TSynScheme): Integer;
begin
  Result := fSchemesList.IndexOf(AScheme);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.Delete(const Index: Integer);
begin
  TSynScheme(fSchemesList.Items[Index]).Free;
  fSchemesList.Remove(fSchemesList.Items[Index]);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.Delete(AScheme: TSynScheme);
begin
  fSchemesList.Remove(AScheme);
  FreeAndNil(AScheme);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.LoadFromStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ImportFromStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.LoadFromFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ImportFromFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.SaveToStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ExportToStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.SaveToFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ExportToFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.SetScheme(Index: Integer; Value: TSynScheme);
begin
  fSchemesList[Index] := Value;
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.Clear;
begin
  ClearList(fSchemesList);
end;

//----------------------------------------------------------------------------
function TSynUniSchemes.GetSchemeName(const AName: string): TSynScheme;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to fSchemesList.Count - 1 do
    if TSynScheme(fSchemesList[i]).Name = AName then
    begin
      Result := TSynScheme(fSchemesList[i]);
      Break;
    end;
end;

//----------------------------------------------------------------------------
function TSynUniSchemes.AddScheme(const AName: string): TSynScheme;
begin
  Result := TSynScheme.Create(AName);
  fSchemesList.Add(Result);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.AddScheme(const AScheme: TSynScheme);
begin
  fSchemesList.Add(AScheme);
end;

//----------------------------------------------------------------------------
procedure TSynUniSchemes.ListStyleNames(AList: TStrings);
var
  i: Integer;
begin
  AList.BeginUpdate;
  try
    AList.Clear;
    for i := 0 to fSchemesList.Count - 1 do
      AList.Add(TSynScheme(fSchemesList[i]).Name);
  finally
    AList.EndUpdate;
  end;
end;

end.
