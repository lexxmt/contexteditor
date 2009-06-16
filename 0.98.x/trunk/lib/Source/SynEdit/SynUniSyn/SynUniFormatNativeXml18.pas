{
@abstract(Provides Old Format 1.8 highlighters import)
@authors(Vitalik [just_vitalik@yahoo.com])
@created(2005)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatNativeXml18}
unit SynUniFormatNativeXml18;
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
  {XMLIntf; } // DW
  SimpleXML;
  
type
  TSynUniFormatNativeXml18 = class(TSynUniFormatNativeXml)
    class function ImportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; override;
    class function ExportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; override;
    class function ImportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; override;
    class function ExportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; override;
    class function ImportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; overload; override;
    class function ExportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; overload; override;
    class function ImportAttributes(Attributes: TSynAttributes; AString: string): Boolean; overload;
    class function ExportAttributes(Attributes: TSynAttributes; var AString: string): Boolean; overload;
    class function ImportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; override;
    class function ExportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; override;
    class function ImportToken(AToken: TSynMultiToken; ANode: IXMLNode; Kind: string = ''): Boolean;
    class function ExportToken(AToken: TSynMultiToken; ANode: IXMLNode; Kind: string = ''): Boolean;
    class function ImportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean; override;
    class function ExportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean; override;
    class function ImportSet(ASet: TSynSet; ANode: IXMLNode): Boolean; override;
    class function ExportSet(ASet: TSynSet; ANode: IXMLNode): Boolean; override;
    class function ImportRange(ARange: TSynRange; ANode: IXMLNode): Boolean; override;
    class function ExportRange(ARange: TSynRange; ANode: IXMLNode): Boolean; override;
    class function ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; override;
    class function ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; override;
    class function ImportFromStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ExportToStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ImportFromFile(AObject: TObject; AFileName: string): Boolean; override;
    class function ExportToFile(AObject: TObject; AFileName: string): Boolean; override;
  end;

implementation

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean;
var
  i: Integer;
begin
  with ANode, AInfo do
  begin
    with EnsureChild('General'), General do
    begin
      Name       := GetVarAttr('Name','');
      Extensions := GetVarAttr('Extensions','');
    end;
    with EnsureChild('Author'), Author do
    begin
      Name      := GetVarAttr('Name','');
      Email     := GetVarAttr('Email','');
      Web       := GetVarAttr('Web','');
      Copyright := GetVarAttr('Copyright','');
      Company   := GetVarAttr('Company','');
      Remark    := GetVarAttr('Remark','');
    end;
    with EnsureChild('Version'), General do
    begin
      Version  := StrToInt(GetVarAttr('Version',''));
      Revision := StrToInt(GetVarAttr('Revision',''));
                  GetVarAttr('Date','');
    end;
    with EnsureChild('Sample'), General do
      for i := 0 to ChildNodes.Count-1 do
        Sample := Sample + ChildNodes[i].Text + #13#10;
    with EnsureChild('History'), General do
      for i := 0 to ChildNodes.Count-1 do
        History := History + ChildNodes[i].Text + #13#10;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean;
var
  i: Integer;
  Buffer: TStringList;
  Node: IXMLNode;
begin
  with AInfo, ANode do
  begin
    with General, AppendElement('General') do
    begin
      SetVarAttr('Name', Name);
      SetVarAttr('Extensions', Extensions);
    end;
    with Author, AppendElement('Author') do
    begin
      SetVarAttr('Name', Name);
      SetVarAttr('Email', Email);
      SetVarAttr('Web', Web);
      SetVarAttr('Copyright', Copyright);
      SetVarAttr('Company', Company);
      SetVarAttr('Remark', Remark);
    end;
    with General, AppendElement('Version') do
    begin
      SetVarAttr('Version', Version);
      SetVarAttr('Revision', Revision);
    end;
    Buffer := TStringList.Create();
    with General, AppendElement('History') do
    begin
      Text := ' ';
      Buffer.Text := History;
      for i := 0 to Buffer.Count-1 do
      begin
        Node := AppendElement('H');
        Node.Text := Buffer[i];
      end;
    end;
    with General, AppendElement('Sample') do
    begin
      Text := ' ';
      Buffer.Text := Sample;
      for i := 0 to Buffer.Count-1 do
      begin
        Node := AppendElement('S');
        Node.Text := Buffer[i];
      end;
    end;
    FreeAndNil(Buffer);
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportEditorProperties(AEditorProperties:
  TEditorProperties; ANode: IXMLNode): Boolean;
begin
  // формат не поддерживает
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportEditorProperties(AEditorProperties:
  TEditorProperties; ANode: IXMLNode): Boolean;
begin
  // формат не поддерживает
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportAttributes(Attributes: TSynAttributes;
  AString: string): Boolean;
begin
  with Attributes do
  begin
    ParentForeground := False; // Нужно ли?..
    ParentBackground := False;
    Foreground := StrToIntDef(Copy(AString, 1, pos(',',AString)-1), 0);
    Background := StrToIntDef(Copy(AString, pos(',',AString)+1, pos(';',AString)-pos(',',AString)-1), $FFFFFF);
    ParentForeground := LowerCase(Copy(AString, pos(';',AString)+1, pos(':',AString)-pos(';',AString)-1)) = 'true';
    ParentBackground := LowerCase(Copy(AString, pos(':',AString)+1, pos('.',AString)-pos(':',AString)-1)) = 'true';
    Style := StrToFontStyle(Copy(AString, pos('.',AString)+1, Length(AString)-pos('.',AString)));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportAttributes(Attributes: TSynAttributes; var AString: string): Boolean;
begin
  with Attributes do
  begin
    AString := IntToStr(Foreground)+','+IntToStr(Background)+';'+
               BoolToStr(ParentForeground,True)+':'+
               BoolToStr(ParentBackground,True)+'.'+
               FontStyleToStr(Style);
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportAttributes(Attributes: TSynAttributes;
  ANode: IXMLNode): Boolean;
begin
  Result := ImportAttributes(Attributes, ANode.GetVarAttr('Attributes',''));
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportAttributes(Attributes: TSynAttributes;
  ANode: IXMLNode): Boolean;
var
  AString: string;
begin
  Result := ExportAttributes(Attributes, AString);
  ANode.SetVarAttr('Attributes', AString);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean;
begin
  //TODO: Add implementation here
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean;
begin
  // формат не поддерживает
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean;
var
  i: Integer;
begin
  with AKeyList, ANode do
  begin
    Name    := VarToStr(GetVarAttr('Name',''));
    Enabled := VarToBool(GetVarAttr('Enabled',''), True);
    ImportAttributes(AKeyList.Attributes, VarToStr(GetVarAttr('Attributes','')));
    Style   := VarToStr(GetVarAttr('Style',''));
    for i := 0 to ChildNodes.Count-1 do
      //if ChildNodes[i].NodeName = 'W' then
        KeyList.Add(VarToStr(ChildNodes[i].GetVarAttr('value','')));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean;
var
  i: Integer;
  Buffer: TStringList;
  Node: IXMLNode;
begin
  with AKeyList, ANode do
  begin
    SetVarAttr('Name',Name);
    if not Enabled then
      SetVarAttr('Enabled', BoolToStr(Enabled, True));
    ExportAttributes(AKeyList.Attributes, ANode);
    SetVarAttr('Style',Style);
    Buffer := TStringList.Create();
    Buffer.Text := KeyList.Text;
    for i := 0 to Buffer.Count-1 do
    begin
      Node := AppendElement('word');
      Node.SetVarAttr('value', Buffer[i]);
    end;
    FreeAndNil(Buffer);
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportSet(ASet: TSynSet; ANode: IXMLNode): Boolean;
begin
  with ASet, ANode do
  begin
    Name    := VarToStr(GetVarAttr('Name',''));
    Enabled := VarToBool(GetVarAttr('Enabled',''), True);
    ImportAttributes(ASet.Attributes, VarToStr(GetVarAttr('Attributes','')));
    Style   := VarToStr(GetVarAttr('Style',''));
    CharSet := VarToSet(GetVarAttr('Symbols',''));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportSet(ASet: TSynSet; ANode: IXMLNode): Boolean;
begin
  with ASet, ANode do
  begin
    SetVarAttr('Name', Name);
    if not Enabled then
      SetVarAttr('Enabled', BoolToStr(Enabled, True));
    ExportAttributes(ASet.Attributes, ANode);
    SetVarAttr('Style', Style);
    SetVarAttr('Symbols', SetToStr(CharSet));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportToken(AToken: TSynMultiToken; ANode: IXMLNode; Kind: string = ''): Boolean;
begin
  with AToken, ANode do
  begin
    FinishOnEol := VarToBool(GetVarAttr(Kind+'FinishOnEol', ''));
    StartLine   := StrToStartLine(VarToStr(GetVarAttr(Kind+'StartLine', '')));
    StartType   := StrToStartType(VarToStr(GetVarAttr(Kind+'PartOfTerm', '')));
    BreakType   := StrToBreakType(VarToStr(GetVarAttr(Kind+'PartOfTerm', '')));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportToken(AToken: TSynMultiToken; ANode: IXMLNode; Kind: string = ''): Boolean;
begin
  with AToken, ANode do
  begin
    if FinishOnEol then
      SetVarAttr(Kind+'FinishOnEol', BoolToStr(FinishOnEol, True));

    if StartLine <> slNotFirst then
      SetVarAttr(Kind+'StartLine', StartLineToStr(StartLine));

    if (StartType = stTerm) and (BreakType = btTerm) then
      SetVarAttr(Kind+'PartOfTerm', 'False')
    else if (StartType = stAny) and (BreakType = btTerm) then
      SetVarAttr(Kind+'PartOfTerm', 'Left')
    else if (StartType = stTerm) and (BreakType = btAny) then
      SetVarAttr(Kind+'PartOfTerm', 'Right');
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportRange(ARange: TSynRange; ANode: IXMLNode): Boolean;
var
  i: Integer;
  NewRange: TSynRange;
  NewKeyList: TSynKeyList;
  NewSet: TSynSet;

begin
  with ARange, ANode do
  begin
    Name          := VarToStr(GetVarAttr('Name', ''));
    Enabled       := VarToBool(GetVarAttr('Enabled', ''), True);
    CaseSensitive := VarToBool(GetVarAttr('CaseSensitive', ''));
    Style         := VarToStr(GetVarAttr('Style', ''));
    ImportAttributes(ARange.Attributes, VarToStr(GetVarAttr('Attributes', '')));

    Delimiters := VarToSet(GetVarAttr('Delimiters', ''));

    with EnsureChild('Rule') do
    begin
      CloseOnTerm        := VarToBool(GetVarAttr('CloseOnTerm', ''));
      CloseOnEol         := VarToBool(GetVarAttr('CloseOnEol', ''));
      AllowPreviousClose := VarToBool(GetVarAttr('AllowPredClose', ''));
      OpenToken.Clear();
      CloseToken.Clear();
      AddCoupleTokens(VarToStr(GetVarAttr('OpenSymbol', '')), VarToStr(GetVarAttr('CloseSymbol', '')));
    end;
    ImportToken(OpenToken,  EnsureChild('Rule'), 'OpenSymbol');
    ImportToken(CloseToken, EnsureChild('Rule'), 'CloseSymbol');

    for i := 0 to ChildNodes.Count-1 do
      if ChildNodes[i].NodeName = 'Keywords' then
      begin
        NewKeyList := TSynKeyList.Create();
        ImportKeyList(NewKeyList, ChildNodes[i]);
        AddKeyList(NewKeyList);
      end
      else if ChildNodes[i].NodeName = 'Set' then
      begin
        NewSet := TSynSet.Create();
        ImportSet(NewSet, ChildNodes[i]);
        AddSet(NewSet);
      end
      else if ChildNodes[i].NodeName = 'Range' then
      begin
        NewRange := TSynRange.Create;
        ImportRange(NewRange, ChildNodes[i]);
        AddRange(NewRange);
      end
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportRange(ARange: TSynRange; ANode: IXMLNode): Boolean;
var
  i: Integer;
  NodeRule: IXMLNode;
begin
  with ARange, ANode do
  begin
    SetVarAttr('Name', Name);
    if not Enabled then
      SetVarAttr('Enabled', BoolToStr(Enabled, True));
    if CaseSensitive then
      SetVarAttr('CaseSensitive', BoolToStr(CaseSensitive, True));
    ExportAttributes(Attributes, ANode);
    SetVarAttr('Style', Style);
    SetVarAttr('Delimiters', SetToStr(Delimiters));

    NodeRule := AppendElement('Rule');
    with NodeRule do
    begin
      if OpenToken.Symbols[0] <> '' then
        SetVarAttr('OpenSymbol', OpenToken.Symbols[0]);
      ExportToken(OpenToken, NodeRule, 'OpenSymbol');
      if CloseToken.Symbols[0] <> '' then
        SetVarAttr('CloseSymbol', CloseToken.Symbols[0]);
      ExportToken(CloseToken, NodeRule, 'CloseSymbol');
      if CloseOnTerm then
        SetVarAttr('CloseOnTerm', BoolToStr(CloseOnTerm, True));
      if CloseOnEol then
        SetVarAttr('CloseOnEol', BoolToStr(CloseOnEol, True));
      if AllowPreviousClose then
        SetVarAttr('AllowPredClose', BoolToStr(AllowPreviousClose, True));
    end;

    for i := 0 to KeyListCount -1 do
      ExportKeyList(KeyLists[i], AppendElement('Keywords'));
    for i := 0 to SetCount -1 do
      ExportSet(Sets[i], AppendElement('Set'));
    for i := 0 to RangeCount -1 do
      ExportRange(Ranges[i], AppendElement('Range'));
  end;
  Result := True;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;

var
  Schemes: TStringList;
  SchemeIndex: Integer;
begin
  with ANode, SynUniSyn do
  begin
    Clear();
    ImportInfo(Info, EnsureChild('Info'));
    ImportSchemes(Schemes, EnsureChild('Scheme'));
    ImportRange(MainRules, EnsureChild('Range'));
    FormatVersion := '1.8';
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin
  //:(ANode.NodeName := 'UniHighlighter';
  ANode.SetVarAttr('Version', '1.8.3');
  with SynUniSyn, ANode do
  begin
    ExportInfo(Info, AppendElement('Info'));
    ExportSchemes(Schemes, AppendElement('Scheme'));
    ExportRange(MainRules, AppendElement('Range'));
     // '<CopyRight>Rule file for UniHighlighter Delphi component (Copyright(C) Fantasist(walking_in_the_sky@yahoo.com), Vit(nevzorov@yahoo.com), Vitalik(vetal-x@mail.ru), 2002-2006)</CopyRight>'

  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportFromStream(AObject: TObject; AStream: TStream): Boolean;
var
  Buffer: TStringlist;
  Stream: TMemoryStream;
begin
  VerifyStream(AStream);

  Buffer := TStringList.Create();
  Buffer.LoadFromStream(AStream);
  Buffer.Insert(0, '<?xml version="1.0" encoding="windows-1251"?>');
  Stream := TMemoryStream.Create();
  Buffer.SaveToStream(Stream);
  FreeAndNil(Buffer);

  Result := inherited ImportFromStream(AObject, Stream);
  FreeAndNil(Stream);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportToStream(AObject: TObject; AStream: TStream): Boolean;
var
  Buffer: TStringlist;
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create();
  Result := inherited ExportToStream(AObject, Stream);
  Buffer := TStringList.Create();
  Stream.Position := 0;
  Buffer.LoadFromStream(Stream);
  Buffer.Delete(0);
  Buffer.SaveToStream(AStream);
  FreeAndNil(Stream);
  FreeAndNil(Buffer);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ImportFromFile(AObject: TObject; AFileName: string): Boolean;
begin
  Result := inherited ImportFromFile(AObject, AFileName);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml18.ExportToFile(AObject: TObject; AFileName: string): Boolean;
begin
  Result := inherited ExportToFile(AObject, AFileName);
end;

end.
