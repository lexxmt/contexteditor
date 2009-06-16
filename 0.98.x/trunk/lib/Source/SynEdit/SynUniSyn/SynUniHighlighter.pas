{
@abstract(TSynUniSyn main source)
@authors(Fantasist [walking_in_the_sky@yahoo.com], Vit [nevzorov@yahoo.com],
         Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2003)
@lastmod(2006-07-19)
}

{$IFNDEF QSynUniHighlighter}
unit SynUniHighlighter;
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
  QSynUniRules,
{$ELSE}
  Windows,
  Graphics,
  Registry,
  {$IFDEF DEBUG}
  Dialogs,
  {$ENDIF}
  SynEditTypes,
  SynEditHighlighter,
  {$IFDEF CODEFOLDING}
  SynEditCodeFolding,
  {$ENDIF}
  SynUniClasses,
  SynUniRules,
{$ENDIF}
  Classes,
  SysUtils;

type
  TSynUniSyn = class(TSynCustomHighlighter)
  private
    fActiveScheme: TSynScheme;
    fFileName: string;
    fImportFormats: TList;
    fMainRules: TSynRange;

    function AttributeExists(AName: string): Boolean;
    function GetAttributeName(AName: string): string;
    procedure AddAllAttributes(ARange: TSynRange); //: for working with fAttributes
    procedure SetScheme(Value: TSynScheme);
    procedure ReadSyntax(Reader: TReader);
    procedure WriteSyntax(Writer: TWriter);
  protected
//    procedure LoadAdditionalAttributes(ANode: IXMLNode); virtual; //!!EK
//    procedure SaveAdditionalAttributes(ANode: IXMLNode); virtual; //!!EK
  public
    {$IFNDEF SYN_CPPB_1} class {$ENDIF}
    function GetLanguageName: string; override;
  protected
    CurrRange: TSynRange;
    CurrToken: TSynToken;
    fEol: Boolean;
    fLine: PChar;
    fLineNumber: Integer;
    fPrEol: Boolean;
    fPrepared: Boolean;
    fTokenPos: Integer;
    Run: LongInt;

    procedure DefineProperties(Filer: TFiler); override;
    function GetIdentChars(): TSynIdentChars; override;
    function GetSampleSource(): string; override;
    procedure SetSampleSource(Value: string); override;
  public
    EditorProperties: TEditorProperties;
    Info: TSynInfo;
    Schemes: TSynUniSchemes;
    FormatVersion: string;

    //SchemeFileName: string; //ver1.8
    //SchemeName: string;     //ver1.8
    //fSchemes: TStringList;  //ver1.8
    //fSchemeIndex: Integer;  //ver1.8
    //fImportFormats: TList;  //ver1.8

    constructor Create(AOwner: TComponent); overload; override;
    destructor Destroy(); override;

    function GetAsStream(): TMemoryStream;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function GetEol(): Boolean; override;
    function GetRange(): Pointer; override; { Returns current Range }
    function GetToken(): string; override; // Current token (string from fTokenPos to Run)
    function GetTokenAttribute(): TSynHighlighterAttributes; override; {Abstract}
    function GetTokenKind(): Integer; override;
    function GetTokenPos(): Integer; override;

    procedure Next(); override;
    procedure ResetRange(); override; { Reset current range to MainRules }
    procedure SetLine(NewValue: string; LineNumber: Integer); override; { Set current line in SynEdit for highlighting }
    procedure SetRange(Value: Pointer); override;

    procedure Reset();
    procedure Clear();
    procedure Prepare();

    procedure LoadFromStream(AStream: TStream);
    procedure LoadFromFile(AFileName: string);
    procedure SaveToStream(AStream: TStream);
    procedure SaveToFile(AFileName: string);

    //procedure CreateStandardRules(); вернуть!

    property ActiveScheme: TSynScheme read fActiveScheme write SetScheme;
    property FileName: string read fFileName write fFileName;
    property MainRules: TSynRange read fMainRules;
  end;

implementation

uses
  SynUniFormatNativeXml20,
  SynUniFormatNativeXmlAuto;

//----------------------------------------------------------------------------
{* * * * * * * * * * * * * * * * TSynUniSyn * * * * * * * * * * * * * * * * * *}
//----------------------------------------------------------------------------
constructor TSynUniSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  {$IFDEF PROTECTED_ATTRIBUTES}
  fAttributes.Duplicates := dupIgnore;//dupError;  //: for working with fAttributes
  fAttributes.Sorted := FALSE;//TRUE;              //: for working with fAttributes 
  {$ENDIF}  
  fPrepared := False;

  Info := TSynInfo.Create();
  Schemes := TSynUniSchemes.Create();
  fMainRules := TSynRange.Create();
  fMainRules.Parent := fMainRules;

  fEol := False;
  fPrEol := False;
  CurrRange := MainRules;
  fImportFormats := TList.Create();

  EditorProperties := TEditorProperties.Create();
  FormatVersion := '';
end;

//----------------------------------------------------------------------------
destructor TSynUniSyn.Destroy();
begin
  {$IFDEF PROTECTED_ATTRIBUTES}
  fAttributes.Clear(); //: for working with fAttributes
  {$ENDIF}
  FreeAndNil(fMainRules);
  FreeAndNil(Info);
  FreeAndNil(Schemes);
  FreeList(fImportFormats);
  FreeAndNil(EditorProperties);
  inherited;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.AttributeExists(AName: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to AttrCount - 1 do
  begin
    if Attribute[i].Name = AName then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetAttributeName(AName: string): string;
var
  i: Integer;
  NewName: string;
begin
  Result := AName;
  if AttributeExists(AName) then
  begin
    i := 1;
    while True and (i <= 100) { а что? :-) } do
    begin
      Inc(i);
      NewName := AName + ' (' + IntToStr(i) + ')';
      if not AttributeExists(NewName) then
      begin
        Result := NewName;
        break;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.AddAllAttributes(ARange: TSynRange);
//: for working with fAttributes
var
  i: Integer;
begin
  {$IFDEF WRITABLE_ATTRIBUTE_NAME}
  ARange.Attributes.Name := GetAttributeName(ARange.Name);
  {$ENDIF}
  //###try AddAttribute(Range.Attributes); except end;
  try AddAttribute(ARange.ValidAttribs); except end;
  for i := 0 to ARange.KeyListCount - 1 do
  begin
    {$IFDEF WRITABLE_ATTRIBUTE_NAME}
    ARange.KeyLists[i].Attributes.Name := GetAttributeName(ARange.KeyLists[i].Name);
    {$ENDIF}
    //###AddAttribute(Range.KeyLists[i].Attributes);
    AddAttribute(ARange.KeyLists[i].ValidAttribs);
  end;
  for i := 0 to ARange.SetCount - 1 do
  begin
    {$IFDEF WRITABLE_ATTRIBUTE_NAME}
    ARange.Sets[i].Attributes.Name := GetAttributeName(ARange.Sets[i].Name);
    {$ENDIF}
    AddAttribute(ARange.Sets[i].Attributes);
  end;
  for i := 0 to ARange.RangeCount - 1 do
    AddAllAttributes(ARange.Ranges[i]);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.SetScheme(Value: TSynScheme);

  procedure AssignScheme(ARange: TSynRange);
  var
    i: Integer;
    Item: TSynAttributes;
  begin
    if ARange <> MainRules then
    begin
      Item := Value.GetStyleName(ARange.Style);
      if Item <> nil then
        ARange.Attributes.AssignColorAndStyle(Item);
    end;
    for i := 0 to aRange.RangeCount - 1 do
    begin
      Item := Value.GetStyleName(ARange.Ranges[i].Style);
      if Item <> nil then
        ARange.Ranges[i].Attributes.AssignColorAndStyle(Item);
      if (ARange.Ranges[i].RangeCount > 0) or (ARange.Ranges[i].KeyListCount > 0)
        or (ARange.Ranges[i].SetCount > 0) then
          AssignScheme(ARange.Ranges[i]);
    end;
    for i := 0 to aRange.KeyListCount - 1 do
    begin
      Item := Value.GetStyleName(ARange.KeyLists[i].Style);
      if Item <> nil then
        ARange.KeyLists[i].Attributes.AssignColorAndStyle(Item);
    end;
    for i := 0 to ARange.SetCount - 1 do
    begin
      Item := Value.GetStyleName(ARange.Sets[i].Style);
      if Item <> nil then
        ARange.Sets[i].Attributes.AssignColorAndStyle(Item);
    end;
  end;

begin
  fActiveScheme := Value;
  AssignScheme(fMainRules);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.SetLine(NewValue: string; LineNumber: Integer);
begin
  if not CurrRange.Prepared then // If current Range isn't ready,
    Prepare(); // then prepare it and its sub-ranges

  fLine := PChar(NewValue);     // Current string of SynEdit
  Run := 0;                     // Set Position of "parser" at the first char of string
  fTokenPos := 0;               // Set Position of current token at the first char of string
  fLineNumber := LineNumber;    // Number of current line in SynEdit
  fEol := False;                // End of Line
  fPrEol := False;              // Previous End of Line
  CurrToken := nil;
  Next();                       // Find first token in the line
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.Next();
var
  atr: TSynHighlighterAttributes;
begin
  if Assigned(CurrToken) and CurrToken.Temporary then
    FreeAndNil(CurrToken);
  if fPrEol then begin // if it was end of line then
    // if current range close on end of line then
    if (CurrRange.CloseOnEol) or (CurrRange.CloseOnTerm) then begin
      if CurrRange.AllowPreviousClose then begin
        CurrRange := CurrRange.Parent;
        while (CurrRange.CloseOnEol) or (CurrRange.CloseOnTerm) do
          CurrRange := CurrRange.Parent;
      end else
        CurrRange := CurrRange.Parent;
    end;
    {atr := TSynHighlighterAttributes.Create('123');
    atr.Foreground := clRed;
    atr.Background := clYellow;
    CurrToken := TSynToken.Create(atr);
    CurrToken.Temporary := True;}
    fEol := True; // We are at the end of line
    Exit;
  end;

  fTokenPos := Run; // Start of cf current token is end of previsious
  // if current range closes on delimeter and current symbol is delimeter then
  if (CurrRange.CloseOnTerm) and (fLine[Run] in CurrRange.Delimiters) then begin
    if CurrRange.AllowPreviousClose then begin
      CurrRange := CurrRange.Parent;
      while (CurrRange.CloseOnTerm) do
        CurrRange := CurrRange.Parent;
    end
    else
      CurrRange := CurrRange.Parent;
  end;

  if not CurrRange.SymbolList[CurrRange.CaseFunct(fLine[Run])].GetToken(CurrRange, fLine, Run, CurrToken) then
  begin // If we can't find token from current position
    //TODO: возможно стоит запихнуть это в TDefaultParser (для наглядности) 
    CurrToken := CurrRange.fDefaultSynToken; // Current token is just default symbol
    while not ((fLine[Run] in CurrRange.Delimiters) or CurrRange.HasNodeAnyStart[CurrRange.CaseFunct(fLine[Run])]) do
    begin
      {$IFDEF SYN_MBCSSUPPORT} // DW
      if StrByteType(fLine, Run) = mbLeadByte then
        Inc(Run);
      {$ENDIF}
      Inc(Run);   // Goes to the first non-delimeter symbol
    end;
  end
  else // We have found token!
    if (CurrRange.ClosingToken = CurrToken) then
    begin // If current token closes current range
    // if (CurrRange.fClosingSymbol <> nil) and (CurrRange.fClosingSymbol.Symbol = CurrToken.Symbol) then
      if CurrRange.AllowPreviousClose then begin
        CurrRange := CurrRange.Parent;
        while (CurrRange.ClosingToken <> nil) and (CurrRange.ClosingToken.Symbol = CurrToken.Symbol) do
          CurrRange := CurrRange.Parent;
      end
      else
        CurrRange := CurrRange.Parent
    end
    else // !!! можно вставить свойство, типа если один range закрывается и сразу открывается другой... Тогда этого else не будет...
    if (CurrToken <> nil) and (CurrToken.fOpenRule <> nil) then begin // else if current token open range then
      if CurrToken.fOpenRule is TSynRange then begin
        CurrRange := TSynRange(CurrToken.fOpenRule);  // open range
        CurrRange.ClosingToken := CurrToken.ClosingToken;
      end;
    end;

  if fLine[Run] = #0 then // If end of line
    fPrEol := True; // It's now a previous end of line}
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT:    Result := CurrRange.Attributes;
    SYN_ATTR_IDENTIFIER: Result := CurrRange.Attributes;
    SYN_ATTR_KEYWORD:    Result := CurrRange.Attributes;
    SYN_ATTR_STRING:     Result := CurrRange.Attributes;
    SYN_ATTR_WHITESPACE: Result := CurrRange.Attributes;
  else
    Result := nil;
  end;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetEol(): Boolean;
begin
  Result := fEol;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetRange(): Pointer;
begin
  Result := CurrRange;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetToken(): string;
var
  Len: LongInt;
begin
  Len := Run - fTokenPos;
  Setstring(Result, (fLine + fTokenPos), Len);
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetTokenAttribute(): TSynHighlighterAttributes;
begin
  Result := CurrToken.Attributes;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetTokenPos(): Integer;
begin
  Result := fTokenPos;
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.ResetRange();
begin
  CurrRange := MainRules;
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.SetRange(Value: Pointer);
begin
  CurrRange := TSynRange(Value);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.Reset();
begin
  MainRules.Reset();
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetIdentChars(): TSynIdentChars; // Get word break chars
begin
  Result := [#32..#255] - CurrRange.Delimiters;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetTokenKind(): Integer; //TODO: Заюзать для каких-нибудь целей
begin
  Result := 1; //TODO: Брать индекс стиля ;)
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.Clear();
begin
  {$IFDEF PROTECTED_ATTRIBUTES}
  fAttributes.Clear(); //: for working with fAttributes
  {$ENDIF}
  MainRules.Clear();
  Schemes.Clear();
  Info.Clear();
  {$IFDEF CODEFOLDING}
  FoldRegions.Clear();
  {$ENDIF}
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.Prepare();
begin
  {$IFDEF PROTECTED_ATTRIBUTES}
  fAttributes.Clear();         //: for working with fAttributes
  AddAllAttributes(MainRules); //: for working with fAttributes
  {$ENDIF}
  fMainRules.Prepare(fMainRules);
  DefHighlightChange(Self);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.DefineProperties(Filer: TFiler);
//! Never used ????
var
  iHasData: Boolean;
begin
  inherited;
  if Filer.Ancestor <> nil then
    iHasData := True
  else
    iHasData := MainRules.RangeCount > 0;
  Filer.DefineProperty( 'Syntax', ReadSyntax, WriteSyntax, {True}iHasData );
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.ReadSyntax(Reader: TReader);
//: This is some metods for reading ??? ??? ???
var
  iBuffer: TStringStream;
begin
//  iBuffer := nil;
//  try
    iBuffer := TStringStream.Create( Reader.ReadString );
    iBuffer.Position := 0;
    LoadFromStream( iBuffer );
//  finally
    FreeAndNil(iBuffer);
//  end;
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.WriteSyntax(Writer: TWriter);
//: This is some metods for writing ??? ??? ???
var
  iBuffer: TStringStream;
begin
  iBuffer := TStringStream.Create( '' );
  try
    SaveToStream( iBuffer );
    iBuffer.Position := 0;
    Writer.WriteString( iBuffer.DataString );
  finally
    FreeAndNil(iBuffer);
  end;
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetSampleSource(): string;
//: Get sample text
begin
  Result := Info.General.Sample;
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.SetSampleSource(Value: string);
//: Set sample text
begin
  Info.General.Sample := Value;
end;

//----------------------------------------------------------------------------
class function TSynUniSyn.GetLanguageName: string;
begin
  Result := 'UniLanguage'; //TODO: возвращать название подсветки с префиксом 'uni'?
end;

//------------------------------------------------------------------------------
//procedure TSynUniSyn.LoadAdditionalAttributes(ANode: IXMLNode);  //!!EK
// begin
  // virtual holder
// end;
//------------------------------------------------------------------------------
//procedure TSynUniSyn.SaveAdditionalAttributes(ANode: IXMLNode);  //!!EK
// begin
  // virtual holder
//end;
//----------------------------------------------------------------------------
procedure TSynUniSyn.LoadFromStream(AStream: TStream);
begin
  TSynUniFormatNativeXmlAuto.ImportFromStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.LoadFromFile(AFileName: string);
begin
  TSynUniFormatNativeXmlAuto.ImportFromFile(Self, AFileName);
end;

//----------------------------------------------------------------------------
function TSynUniSyn.GetAsStream(): TMemoryStream;
begin
  Result := TMemoryStream.Create();
  SaveToStream(Result);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.SaveToStream(AStream: TStream);
begin
  TSynUniFormatNativeXml20.ExportToStream(Self, AStream);
end;

//----------------------------------------------------------------------------
procedure TSynUniSyn.SaveToFile(AFileName: string);
begin
  TSynUniFormatNativeXml20.ExportToFile(Self, AFileName);
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynUniSyn);
{$ENDIF}

end.
