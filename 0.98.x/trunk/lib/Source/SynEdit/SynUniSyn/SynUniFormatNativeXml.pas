{
@abstract(Provides Native Format highlighters import and export)
@authors(Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2005)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatNativeXml}
unit SynUniFormatNativeXml;
{$ENDIF}

{$I SynUniHighlighter.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynUniClasses,
{$ELSE}
  SysUtils,
  Graphics,
  Classes,
{$IFDEF SYN_COMPILER_6_UP}
  Variants,
{$ENDIF}
  SynUniFormat,
  SynUniClasses,
  SynUniRules,
  SynUniHighlighter,
{$ENDIF}
(*
{$IFDEF MSWINDOWS}
  MSXML,
{$ELSE}
  oxmldom,
{$ENDIF}
*)
  { XMLDoc,
  XMLIntf;  } // DW
  SimpleXML; // DW

type
  TSynUniFormatNativeXml = class(TSynUniFormat)
    class function ImportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; virtual;
    class function ExportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; virtual;
    class function ImportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; virtual;
    class function ExportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; virtual;
    class function ImportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; virtual;
    class function ExportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; virtual;
    class function ImportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; virtual;
    class function ExportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; virtual;
    class function ImportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean; virtual;
    class function ExportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean; virtual;
    class function ImportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean; virtual;
    class function ExportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean; virtual;
    class function ImportSet(ASet: TSynSet; ANode: IXMLNode): Boolean; virtual;
    class function ExportSet(ASet: TSynSet; ANode: IXMLNode): Boolean; virtual;
    class function ImportRange(ARange: TSynRange; ANode: IXMLNode): Boolean; virtual;
    class function ExportRange(ARange: TSynRange; ANode: IXMLNode): Boolean; virtual;
    class function ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; virtual;
    class function ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; virtual;
    class function ImportFromStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ExportToStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ImportFromFile(AObject: TObject; AFileName: string): Boolean; override;
    class function ExportToFile(AObject: TObject; AFileName: string): Boolean; override;
    class procedure LoadAdditionalAttributes(ANode: IXMLNode); virtual; //!!EK
    class procedure SaveAdditionalAttributes(ANode: IXMLNode); virtual; //!!EK
  end;

  function CreateXmlDocument(RootNode: string): IXmlDocument;

  {$IFNDEF SYN_COMPILER_6_UP}
  function VarToStr(const V: Variant; const ADefault: string = ''): string;
  {$ENDIF}
  function VarToBool(const V: Variant; Default: Boolean = False): Boolean;
  function VarToColor(const V: Variant; Default: TColor): TColor;
  function VarToInt(const V: Variant; Default: Integer = 0): Integer;
  function VarToSet(const V: Variant): TCharSet;

  {$IFNDEF SYN_COMPILER_7_UP}
  function StrToBoolDef(const S: string; const Default: Boolean): Boolean;
  function BoolToStr(B: Boolean; UseBoolStrs: Boolean = False): string;
  {$ENDIF}

implementation

{$IFNDEF SYN_COMPILER_7_UP}
//------------------------------------------------------------------------------
function StrToBoolDef(const S: string; const Default: Boolean): Boolean;
begin
  if (S = 'True') or (S = '1') or (S = '-1') then
    Result := True
  else if (S = 'False') or (S = '0') then
    Result := False
  else
    Result := Default;
end;

//------------------------------------------------------------------------------
function BoolToStr(B: Boolean; UseBoolStrs: Boolean = False): string;
const
  cSimpleBoolStrs: array [Boolean] of String = ('0', '-1');
begin
  if UseBoolStrs then
  begin
    if B then
      Result := 'True'
    else
      Result := 'False';
  end
  else
    Result := cSimpleBoolStrs[B];
end;
{$ENDIF}

//------------------------------------------------------------------------------
function CreateXmlDocument(RootNode: string): IXmlDocument;
begin
  Result := SimpleXML.CreateXmlDocument(RootNode);
  // Result.Active := True;
  // Result.Options := [doNodeAutoIndent, doAttrNull, doNodeAutoCreate];
  // Result.Version := '1.0';
  // Result.Encoding := 'windows-1251';
  //if RootNode <> '' then
  //  Result.Node.AddChild(RootNode);
end;

{$IFNDEF SYN_COMPILER_6_UP}
//------------------------------------------------------------------------------
function FindVarData(const V: Variant): PVarData;
begin
  Result := @TVarData(V);
  while Result.VType = varByRef or varVariant do
    Result := PVarData(Result.VPointer);
end;

//------------------------------------------------------------------------------
function VarIsNull(const V: Variant): Boolean;
begin
  Result := FindVarData(V)^.VType = varNull;
end;

//------------------------------------------------------------------------------
function VarToStr(const V: Variant; const ADefault: string): string;
begin
  if not VarIsNull(V) then
    Result := V
  else
    Result := ADefault;
end;
{$ENDIF}

//------------------------------------------------------------------------------
function VarToBool(const V: Variant; Default: Boolean): Boolean;
begin
  Result := StrToBoolDef(VarToStr(V), Default);
end;

//------------------------------------------------------------------------------
function VarToColor(const V: Variant; Default: TColor): TColor;
begin
  if VarToStr(V) <> '' then
    Result := StringToColor(VarToStr(V))
  else
    Result := Default;
end;

//------------------------------------------------------------------------------
function VarToInt(const V: Variant; Default: Integer): Integer;
begin
  Result := StrToIntDef(VarToStr(V), Default);
end;

//------------------------------------------------------------------------------
function VarToSet(const V: Variant): TCharSet;
begin
  Result := StrToSet(VarToStr(V));
end;

//------------------------------------------------------------------------------
function VarToPChar(const V: Variant): PChar;
begin
  Result := PChar(VarToStr(V));
end;

//------------------------------------------------------------------------------
//----------------------- TSynUniFormatNativeXml -------------------------------
//------------------------------------------------------------------------------

class function TSynUniFormatNativeXml.ImportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean; 
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportSet(ASet: TSynSet; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportSet(ASet: TSynSet; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportRange(ARange: TSynRange; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportRange(ARange: TSynRange; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin Result := False; end;

class function TSynUniFormatNativeXml.ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin Result := False; end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml.ImportFromStream(AObject: TObject; AStream: TStream): Boolean;
var
  XMLDocument: IXMLDocument;
begin
  VerifyStream(AStream);
  AStream.Position := 0; // DW

  XMLDocument := CreateXmlDocument('');
  XMLDocument.Load(AStream);
  if AObject is TSynUniSyn then
  begin
    Result := ImportHighlighter(TSynUniSyn(AObject), XMLDocument.DocumentElement);
    //TSynUniSyn(AObject).Prepare(); //TODO: Нужно ли это?.. Может убрать?..
    TSynUniSyn(AObject).FileName := '';
  end
  else if AObject is TSynRange then
    Result := ImportRange(TSynRange(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynKeyList then
    Result := ImportKeyList(TSynKeyList(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynSet then
    Result := ImportSet(TSynSet(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynInfo then
    Result := ImportInfo(TSynInfo(AObject), XMLDocument.DocumentElement)
  else if AObject is TEditorProperties then
    Result := ImportEditorProperties(TEditorProperties(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynAttributes then
    Result := ImportAttributes(TSynAttributes(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynSet then
    Result := ImportSet(TSynSet(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynUniSchemes then
    Result := ImportSchemes(TSynUniSchemes(AObject), XMLDocument.DocumentElement)
  else if AObject is TSynMultiToken then
    Result := ImportToken(TSynMultiToken(AObject), XMLDocument.DocumentElement)
  else begin
    raise Exception.Create(ClassName + '.ImportFromStream: Cannot import into '+AObject.ClassName+' object');
    Result := False;
  end;
  //XMLDocument.Active := False;
  //SynUniSyn.DefHighlightChange(SynUniSyn);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml.ExportToStream(AObject: TObject; AStream: TStream): Boolean;
var
  XmlDocument: IXmlDocument;
begin
  VerifyStream(AStream);

  if (AObject is TSynUniSyn) then begin
    XmlDocument := CreateXmlDocument('SynUniHighlighter');
    Result := ExportHighlighter(TSynUniSyn(AObject), XmlDocument.DocumentElement);
  end
  else if AObject is TSynRange then begin
    XmlDocument := CreateXmlDocument('Range');
    Result := ExportRange(TSynRange(AObject), XMLDocument.DocumentElement);
  end
  else if AObject is TSynKeyList then begin
    XmlDocument := CreateXmlDocument('KeyList');
    Result := ExportKeyList(TSynKeyList(AObject), XMLDocument.DocumentElement);
  end
  else if AObject is TSynSet then begin
    XmlDocument := CreateXmlDocument('Set');
    Result := ExportSet(TSynSet(AObject), XMLDocument.DocumentElement);
  end
  else if AObject is TSynInfo then begin
    XmlDocument := CreateXmlDocument('Info');
    Result := ExportInfo(TSynInfo(AObject), XMLDocument.DocumentElement);
  end
  else if AObject is TSynAttributes then begin
    XmlDocument := CreateXmlDocument('Attributes');
    Result := ExportAttributes(TSynAttributes(AObject), XMLDocument.DocumentElement);
  end
  else if AObject is TSynUniSchemes then begin
    XmlDocument := CreateXmlDocument('Schemes');
    Result := ExportSchemes(TSynUniSchemes(AObject), XMLDocument.DocumentElement);
  end
  else begin
    raise Exception.Create(ClassName + '.ExportToStream: Cannot export from '+AObject.ClassName+' object');
    Result := False;
  end;

  XmlDocument.Save(AStream);
  XmlDocument.RemoveAllAttrs();
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml.ImportFromFile(AObject: TObject; AFileName: string): Boolean;
var
  FileStream: TFileStream;
begin
  VerifyFileName(AFileName);
  FileStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    ImportFromStream(AObject, FileStream);
  finally
    FreeAndNil(FileStream);
  end;
  if AObject is TSynUniSyn then
    TSynUniSyn(AObject).FileName := AFileName;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml.ExportToFile(AObject: TObject; AFileName: string): Boolean;
var
  FileStream: TFileStream;
begin
  VerifyEmptyFileName(AFileName);
  FileStream := TFileStream.Create(AFileName, fmCreate or fmShareDenyWrite);
  try
    ExportToStream(AObject, FileStream);
  finally
    FreeAndNil(FileStream);
  end;
  if AObject is TSynUniSyn then
    TSynUniSyn(AObject).FileName := AFileName;
  Result := True;
end;

//------------------------------------------------------------------------------
class procedure TSynUniFormatNativeXml.LoadAdditionalAttributes(ANode: IXMLNode);  //!!EK
begin
// virtual holder
end;

//------------------------------------------------------------------------------
class procedure TSynUniFormatNativeXml.SaveAdditionalAttributes(ANode: IXMLNode);  //!!EK
begin
// virtual holder
end;
//----------------------------------------------------------------------------

end.
