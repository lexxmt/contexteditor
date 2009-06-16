{
@abstract(Provides Old Format 1.5 highlighters import)
@authors(Vitalik [just_vitalik@yahoo.com])
@created(2005)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatNativeXml15}
unit SynUniFormatNativeXml15;
{$ENDIF}

{$I SynUniHighlighter.inc}

interface

uses
{$IFDEF SYN_CLX}
  QClasses,
  QGraphics,
  QSynUniFormat,
  QSynUniClasses,
  QSynUniRules,
  QSynUniHighlighter
{$ELSE}
  Classes,
  Graphics,
{$IFDEF SYN_COMPILER_6_UP}
  Variants,
{$ENDIF}
  SynUniFormat,
  SynUniFormatNativeXml,
  SynUniClasses,
  SynUniRules,
  SynUniHighlighter,
{$ENDIF}
  SysUtils,
  Dialogs,
  {XMLIntf; } // DW
  SimpleXML;
  
type
  TSynUniFormatNativeXml15 = class(TSynUniFormatNativeXml)
    class function ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; override;
    class function ImportFromStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ImportFromFile(AObject: TObject; AFileName: string): Boolean; override;
  end;

implementation

{$IFNDEF SYN_COMPILER_7_UP}
function StrToBoolDef(const S: string; const Default: Boolean): Boolean;
begin
  if (S = 'True') or (S = '1') or (S = '-1') then
    Result := True
  else if (S = 'False') or (S = '0') then
    Result := False
  else
    Result := Default;
end;
{$ENDIF}

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml15.ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
var
  Schemes: TStringList;
  SchemeIndex: integer;
  
  //----------------------------------
  procedure LoadInfo(ANode: IXMLNode);
  var
    i: integer;
  begin
    with ANode, SynUniSyn.Info do
    begin
      with EnsureChild('General'), General do
      begin
        Name       := EnsureChild('Name').Text;
        Extensions := EnsureChild('FileTypeName').Text;
                      EnsureChild('Layout').Text;
      end;
      with EnsureChild('Author'), Author do
      begin
        Name      := EnsureChild('Name').Text;
        Email     := EnsureChild('Email').Text;
        Web       := EnsureChild('Web').Text;
        Copyright := EnsureChild('Copyright').Text;
        Company   := EnsureChild('Company').Text;
        Remark    := EnsureChild('Remark').Text;
      end;
      with EnsureChild('Version'), General do
      begin
        Version  := StrToInt(EnsureChild('Version').Text);
        Revision := StrToInt(EnsureChild('Revision').Text);
                    EnsureChild('Date').Text;
                    EnsureChild('Type').Text;
      end;
      with EnsureChild('Sample'), General do
        for i := 0 to ChildNodes.Count-1 do
          Sample := Sample + ChildNodes[i].Text + #13#10;
      with EnsureChild('History'), General do
        for i := 0 to ChildNodes.Count-1 do
          History := History + ChildNodes[i].Text + #13#10;
    end;
  end;

  //--------------------------------------------------------------
  procedure LoadSchemes({Schemes: TSynUniSchemes; }ANode: IXMLNode);
  begin
    //TODO: Add implementation here
  end;

  //---------------------------------------------------------------
  procedure LoadAttri(Attributes: TSynAttributes; ANode: IXMLNode);
  begin
    with Attributes, ANode do begin
      if EnsureChild('Fore').Text <> '' then
        Foreground := StringToColor(EnsureChild('Fore').Text);
      if EnsureChild('Back').Text <> '' then
        Background := StringToColor(EnsureChild('Back').Text);
      Style := StrToFontStyle(EnsureChild('Style').Text);
      ParentForeground := StrToBoolDef(EnsureChild('ParentForeground').Text, False);
      ParentBackground := StrToBoolDef(EnsureChild('ParentBackground').Text, False);
    end;
  end;

  //------------------------------------------------------------
  procedure LoadKeyList(AKeyList: TSynKeyList; ANode: IXMLNode);
  var
    i: integer;
  begin
    with AKeyList, ANode do begin
      Name := VarToStr(GetVarAttr('Name',''));
      LoadAttri(AKeyList.Attributes, ChildNodes[SchemeIndex]);
      for i := 0 to ChildNodes.Count-1 do
        if ChildNodes[i].NodeName = 'W' then
          KeyList.Add(ChildNodes[i].Text);
    end;
  end;

  //------------------------------------------------
  procedure LoadSet(ASet: TSynSet; ANode: IXMLNode);
  begin
    with ASet, ANode do begin
      Name := VarToStr(GetVarAttr('Name',''));
      LoadAttri(ASet.Attributes, ChildNodes[SchemeIndex]);
      CharSet := StrToSet(EnsureChild('S').Text);
    end;
  end;

  //------------------------------------------------------
  procedure LoadRange(ARange: TSynRange; ANode: IXMLNode);
  var
    i: integer;
    NewRange: TSynRange;
    NewKeyList: TSynKeyList;
    NewSet: TSynSet;

    procedure LoadToken(AToken: TSynMultiToken; ANode: IXMLNode; Kind: string);
    begin
      with AToken, ANode do begin
        FinishOnEol := StrToBoolDef(EnsureChild(Kind+'FinishOnEol').Text, False);
        StartLine   := StrToStartLine(EnsureChild(Kind+'StartLine').Text);
        StartType   := StrToStartType(EnsureChild(Kind+'PartOfTerm').Text);
        BreakType   := StrToBreakType(EnsureChild(Kind+'PartOfTerm').Text);
      end;
    end;

  var b: Boolean;
  begin
    with ARange, ANode do begin
      Name := VarToStr(GetVarAttr('Name',''));
      //TODO: Сделать считывание Num как создание SynSet (если Num <> Def)
      LoadAttri(ARange.Attributes, EnSureChild('Def'));
      LoadAttri(ARange.Attributes, ChildNodes[SchemeIndex]);
      OpenToken.Clear();
      CloseToken.Clear();
      AddCoupleTokens(EnsureChild('OpenSymbol').Text, EnsureChild('CloseSymbol').Text);
      Delimiters := StrToSet(EnsureChild('DelimiterChars').Text);

      CaseSensitive      := StrToBoolDef(EnsureChild('CaseSensitive').Text, False);
      CloseOnTerm        := StrToBoolDef(EnsureChild('CloseOnTerm').Text, False);
//      ShowMessage(ChildNodes['CloseOnEol'].Text);
//      b := StrToBoolDef(ChildNodes['CloseOnEol'].Text, False);
//      ShowMessage(BoolToStr(b));
//      ShowMessage(BoolToStr(StrToBoolDef(ChildNodes['CloseOnEol'].Text, False)));
      CloseOnEol         := StrToBoolDef(EnsureChild('CloseOnEol').Text, False);
//      ShowMessage(BoolToStr(CloseOnEol));
      AllowPreviousClose := StrToBoolDef(EnsureChild('AllowPredClose').Text, False);

      LoadToken(OpenToken, ANode, 'OpenSymbol');
      LoadToken(CloseToken, ANode, 'CloseSymbol');
      
      for i := 0 to ChildNodes.Count-1 do
        if ChildNodes[i].NodeName = 'Range' then begin
          NewRange := TSynRange.Create;
          LoadRange(NewRange, ChildNodes[i]);
          AddRange(NewRange);
        end
        else if ChildNodes[i].NodeName = 'KW' then begin
          NewKeyList := TSynKeyList.Create();
          LoadKeyList(NewKeyList, ChildNodes[i]);
          AddKeyList(NewKeyList);
        end
        else if ChildNodes[i].NodeName = 'Set' then begin
          NewSet := TSynSet.Create();
          LoadSet(NewSet, ChildNodes[i]);
          AddSet(NewSet);
        end;
    end;
  end;

begin
  with ANode, SynUniSyn do begin
    Clear();
    LoadInfo(EnsureChild('Info'));
    if EnsureChild('SchemeIndex').Text <> '' then begin  // DW
      SchemeIndex := StrToInt(EnsureChild('SchemeIndex').Text);
      LoadSchemes(EnsureChild('Schemes'));
    end;
    LoadRange(MainRules, EnsureChild('Range'));
    FormatVersion := '1.5';
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml15.ImportFromStream(AObject: TObject; AStream: TStream): Boolean;
var
  Buffer: TStringlist;
  Stream: TMemoryStream;
begin
  VerifyStream(AStream);

  Buffer := TStringList.Create();
  Buffer.LoadFromStream(AStream);
  Buffer.Text := Stringreplace(Buffer.Text, '&qt;', '&quot;',[rfreplaceall, rfignorecase]);
  Buffer.Insert(0, '<?xml version="1.0" encoding="windows-1251"?>');
  Stream := TMemoryStream.Create();
  Buffer.SaveToStream(Stream);
  FreeAndNil(Buffer);

  Result := inherited ImportFromStream(AObject, Stream);
  FreeAndNil(Stream);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml15.ImportFromFile(AObject: TObject; AFileName: string): Boolean;
begin
  Result := inherited ImportFromFile(AObject, AFileName);
end;

end.
