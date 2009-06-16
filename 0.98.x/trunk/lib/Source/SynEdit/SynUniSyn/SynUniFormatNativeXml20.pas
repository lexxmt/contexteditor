{
@abstract(Provides Format 2.0 highlighters import and export)
@authors(Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2005)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatNativeXml20}
unit SynUniFormatNativeXml20;
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
{$IFDEF CODEFOLDING}
  SynEditCodeFolding,
{$ENDIF}
{$ENDIF}
  SysUtils,
  { XMLIntf; } // DW
  SimpleXML;

type
  TSynUniFormatNativeXml20 = class(TSynUniFormatNativeXml)
    class function ImportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; override;
    class function ExportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean; override;
    class function ImportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; override;
    class function ExportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean; override;
    class function ImportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; override;
    class function ExportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean; override;
    class function ImportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; override;
    class function ExportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean; override;
    class function ImportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean; override;
    class function ExportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean; override;
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

{$IFDEF CODEFOLDING}
procedure ImportCodeFolding(AFoldRegions: TFoldRegions; ANodeList: IXMLNodeList{; ParentRegion: TFoldRegionItem = nil});
var
  i: integer;
  NewRegion: TFoldRegionItem;
//  FoldRegionList: TFoldRegions;
begin
{  if ParentRegion = nil then
    FoldRegionList := FoldRegions
  else
    FoldRegionList := ParentRegion.SubFoldRegions;}
  for i := 0 to ANodeList.Count - 1 do
  begin
    with ANodeList.Item[i] do begin
      NewRegion := AFoldRegions.Add(
        TFoldRegionType(GetIntAttr('Type')),
        EnsureChild('Properties').GetBoolAttr('AddEnding'),
        EnsureChild('Properties').GetBoolAttr('AllowNoSubs'),
        EnsureChild('Properties').GetBoolAttr('WholeWords'),
        PChar(EnsureChild('OpenToken').GetAttr('Symbol')),   //PChar
        PChar(EnsureChild('CloseToken').GetAttr('Symbol'))); //PChar
      with NewRegion do begin
        Name           := GetAttr('Name');
        RegExpOpen     := PChar(EnsureChild('OpenToken').GetAttr('RegExpr'));  //PChar
        RegExpClose    := PChar(EnsureChild('CloseToken').GetAttr('RegExpr')); //PChar
        RegExpUseOpen  := EnsureChild('OpenToken').GetBoolAttr('UseRegExpr');
        RegExpUseClose := EnsureChild('CloseToken').GetBoolAttr('UseRegExpr');
      end;
      ImportCodeFolding(NewRegion.SubFoldRegions, EnsureChild('SubRegions').ChildNodes);
    end
  end
end;

procedure ExportCodeFolding(AFoldRegions: TFoldRegions; ParentNode: IXMLNode{; ARegion: TFoldRegionItem});
var
  i: integer;
  NewNode: IXMLNode;
//  FoldRegionList: TFoldRegions;
begin
{  if ARegion = nil then
    FoldRegionList := FoldRegions
  else
    FoldRegionList := ARegion.SubFoldRegions;}
  for i := 0 to AFoldRegions.Count - 1 do
  begin
    NewNode := ParentNode.AppendElement('FoldRegion');
    with NewNode, AFoldRegions.Items[i] do
    begin
      SetVarAttr('Name',Name);
      SetVarAttr('Type',Ord(FoldRegionType));
      with AppendElement('OpenToken') do
      begin
        if StrLen(Open) > 0 then
          SetVarAttr('Symbol', string(Open));
        if StrLen(RegExpOpen) > 0 then
          SetVarAttr('RegExpr', string(RegExpOpen));
        if RegExpUseOpen then
          SetVarAttr('UseRegExpr', BoolToStr(RegExpUseOpen, True));
      end;
      with AppendElement('CloseToken') do
      begin
        if StrLen(Close) > 0 then
          SetVarAttr('Symbol', string(Close));
        if StrLen(RegExpClose) > 0 then
          SetVarAttr('RegExpr', string(RegExpClose));
        if RegExpUseClose then
          SetVarAttr('UseRegExpr', BoolToStr(RegExpUseClose, True));
      end;
      with AppendElement('Properties') do
      begin
        if AddEnding then
          SetVarAttr('AddEnding', BoolToStr(AddEnding, True));
        if NoSubFoldRegions then
          SetVarAttr('AllowNoSubs', BoolToStr(NoSubFoldRegions, True));
        if WholeWords then
          SetVarAttr('WholeWords', BoolToStr(WholeWords, True));
      end;
      ExportCodeFolding(AFoldRegions.Items[i].SubFoldRegions, AppendElement('SubRegions'));
    end;
  end;
end;

{$ENDIF}

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean;
begin
  with ANode do
  begin
    with AInfo.General, EnsureChild('General') do begin
      Name       := VarToStr(GetVarAttr('Name',''));
      Extensions := VarToStr(GetVarAttr('Extensions',''));
      Version    := VarToInt(GetVarAttr('Version',''));
      Revision   := VarToInt(GetVarAttr('Revision',''));
      Sample     := VarToStr(GetVarAttr('Sample',''));
      History    := VarToStr(GetVarAttr('History',''));
    end;
    with AInfo.Author, EnsureChild('Author') do begin
      Name      := VarToStr(GetVarAttr('Name',''));
      Email     := VarToStr(GetVarAttr('Mail','')); //TODO: Переименовать обратно в 'Email', блин...
      Web       := VarToStr(GetVarAttr('Web',''));
      Copyright := VarToStr(GetVarAttr('Copyright',''));
      Company   := VarToStr(GetVarAttr('Company',''));
      Remark    := VarToStr(GetVarAttr('Remark',''));
    end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportInfo(AInfo: TSynInfo; ANode: IXMLNode): Boolean;
begin
  with AInfo, ANode do
  begin
    with General, AppendElement('General') do
    begin
      SetVarAttr('Name',Name);
      SetVarAttr('Extensions',Extensions);
      SetVarAttr('Version',Version);
      SetVarAttr('Revision',Revision);
      SetVarAttr('Sample',Sample);
      SetVarAttr('History',History);
    end;
    with Author, AppendElement('Author') do
    begin
      SetVarAttr('Name',Name);
      SetVarAttr('Mail',Email); //TODO: Переименовать обратно в 'Email', блин...
      SetVarAttr('Web',Web);
      SetVarAttr('Copyright',Copyright);
      SetVarAttr('Company',Company);
      SetVarAttr('Remark',Remark);
    end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean;
begin
  with AEditorProperties, ANode do
  begin
    ActiveLineColor := VarToColor(GetVarAttr('ActiveLineColor',''), clNone);
    SelectedForeground := VarToColor(GetVarAttr('SelectedForeground',''), clHighlightText);
    SelectedBackground := VarToColor(GetVarAttr('SelectedBackground',''), clHighlight);
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportEditorProperties(AEditorProperties: TEditorProperties; ANode: IXMLNode): Boolean;
begin
  with AEditorProperties, ANode do
  begin
    if ActiveLineColor <> clNone then
      SetVarAttr('ActiveLineColor',ColorToString(ActiveLineColor));
    if SelectedForeground <> clHighlightText then
      SetVarAttr('SelectedForeground',ColorToString(SelectedForeground));
    if SelectedBackground <> clHighlight then
      SetVarAttr('SelectedBackground',ColorToString(SelectedBackground));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean;
begin
  with Attributes, ANode do
  begin
    ParentForeground := False; // Нужно ли?..
    ParentBackground := False;
    Foreground := VarToColor(GetVarAttr('Foreground',''), clWindowText);
    Background := VarToColor(GetVarAttr('Background',''), clWindow);
    ParentForeground := VarToBool(GetVarAttr('ParentForeground',''));
    ParentBackground := VarToBool(GetVarAttr('ParentBackground',''));
    Style := StrToFontStyle(VarToStr(GetVarAttr('Style','')));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportAttributes(Attributes: TSynAttributes; ANode: IXMLNode): Boolean;
begin
  with Attributes, ANode do begin
    SetVarAttr('Foreground',ColorToString(Foreground));
    SetVarAttr('Background',ColorToString(Background));
    if ParentForeground then
      SetVarAttr('ParentForeground', BoolToStr(ParentForeground, True));
    if ParentBackground then
      SetVarAttr('ParentBackground', BoolToStr(ParentBackground, True));
    if Style <> [] then
      SetVarAttr('Style',FontStyleToStr(Style));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean;
var
  i, j: integer;
  NewScheme: TSynScheme;
  NewStyle: TSynAttributes;
begin
  with ASchemes, ANode.ChildNodes do
  begin
    Clear();
    for i := 0 to Count - 1 do
    begin
      NewScheme := AddScheme(VarToStr(Item[i].GetVarAttr('Name','')));
      ImportEditorProperties(NewScheme.EditorProperties, Item[i].EnsureChild('Editor'));
      with Item[i].EnsureChild('Styles').ChildNodes do
        for j := 0 to Count - 1 do
        begin
          NewStyle := NewScheme.AddStyle(VarToStr(Item[j].GetVarAttr('Name','')),
            clWindowText, clWindow, StrToFontStyle(''));
          ImportAttributes(NewStyle, Item[j]);
        end;
    end;
    //SetScheme(GetSchemeName('Default'));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportSchemes(ASchemes: TSynUniSchemes; ANode: IXMLNode): Boolean;
var
  i, j: integer;
  NewNode: IXMLNode;
begin
  with ASchemes do begin
    for i := 0 to Count - 1 do
      with ANode.AppendElement('Scheme') do
      begin
        SetVarAttr('Name',Schemes[i].Name);
        ExportEditorProperties(Schemes[i].EditorProperties, AppendElement('Editor'));
        with AppendElement('Styles') do
          for j := 0 to Schemes[i].Count - 1 do
          begin
            NewNode := AppendElement('Style');
            NewNode.SetVarAttr('Name',Schemes[i].Styles[j].Name);
            ExportAttributes(Schemes[i].Styles[j], NewNode);
          end;
      end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean;
begin
  with AKeyList, ANode do
  begin
    Name         := VarToStr(GetVarAttr('Name',''));
    Enabled      := VarToBool(GetVarAttr('Enabled',''), True);
    Style        := VarToStr(GetVarAttr('Style',''));
    KeyList.Text := VarToStr(GetVarAttr('Words',''));
    ImportAttributes(AKeyList.Attributes, EnsureChild('Attributes'));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportKeyList(AKeyList: TSynKeyList; ANode: IXMLNode): Boolean;
begin
  with AKeyList, ANode do
  begin
    ANode.SetVarAttr('Name',Name);
    ANode.SetVarAttr('Enabled', BoolToStr(Enabled, True));
    ANode.SetVarAttr('Style',Style);
    ANode.SetVarAttr('Words',KeyList.Text);
    ExportAttributes(AKeyList.Attributes, AppendElement('Attributes'));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportSet(ASet: TSynSet; ANode: IXMLNode): Boolean;
begin
  with ASet, ANode do
  begin
    Name     := VarToStr(GetVarAttr('Name',''));
    Enabled  := VarToBool(GetVarAttr('Enabled',''), True);
    Style    := VarToStr(GetVarAttr('Style',''));
    CharSet  := VarToSet(GetVarAttr('Symbols',''));
    Quantity := VarToInt(GetVarAttr('Quantity',''));
    ImportAttributes(ASet.Attributes, EnsureChild('Attributes'));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportSet(ASet: TSynSet; ANode: IXMLNode): Boolean;
begin
  with ASet, ANode do
  begin
    SetVarAttr('Name', Name);
    SetVarAttr('Enabled', BoolToStr(Enabled, True));
    SetVarAttr('Style', Style);
    SetVarAttr('Symbols', SetToStr(CharSet));
    SetVarAttr('Quantity', IntToStr(Quantity));
    ExportAttributes(ASet.Attributes, AppendElement('Attributes'));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean;
begin
  with AToken, ANode do
  begin
    Clear();
    FinishOnEol := VarToBool(GetVarAttr('FinishOnEol',''));
    StartLine := StrToStartLine(VarToStr(GetVarAttr('StartLine','')));
    StartType := StrToStartType(VarToStr(GetVarAttr('PartOfTerm','')));
    BreakType := StrToBreakType(VarToStr(GetVarAttr('PartOfTerm','')));
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportToken(AToken: TSynMultiToken; ANode: IXMLNode): Boolean;
begin
  with AToken, ANode do
  begin
    if FinishOnEol then SetVarAttr('FinishOnEol', BoolToStr(FinishOnEol, True));
    SetVarAttr('StartLine', StartLineToStr(StartLine));

    if (StartType = stTerm) and (BreakType = btTerm) then
      SetVarAttr('PartOfTerm','False')
    else if (StartType = stAny) and (BreakType = btTerm) then
      SetVarAttr('PartOfTerm','Left')
    else if (StartType = stTerm) and (BreakType = btAny) then
      SetVarAttr('PartOfTerm','Right');
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportRange(ARange: TSynRange; ANode: IXMLNode): Boolean;
var
  i: integer;
  NewRange: TSynRange;
  NewKeyList: TSynKeyList;
  NewSet: TSynSet;
begin
  with ARange, ANode do begin
    Clear;
    Name          := VarToStr(GetVarAttr('Name',''));
    Enabled       := VarToBool(GetVarAttr('Enabled',''), True);
    CaseSensitive := VarToBool(GetVarAttr('CaseSensitive',''));
    Style         := VarToStr(GetVarAttr('Style',''));

    Delimiters := VarToSet(EnsureChild('Delimiters').GetVarAttr('Value',''));
    ImportAttributes(ARange.Attributes, EnsureChild('Attributes'));

    //TODO: if mainrules then exit, хо? уж?врод??та?работает :)

    with EnsureChild('Properties') do
    begin
      CloseOnEol         := VarToBool(GetVarAttr('CloseOnEol',''));
      CloseOnTerm        := VarToBool(GetVarAttr('CloseOnTerm',''));
      AllowPreviousClose := VarToBool(GetVarAttr('AllowPredClose',''));
    end;

    ImportToken(OpenToken, EnsureChild('OpenToken'));
    ImportToken(CloseToken, EnsureChild('CloseToken'));

    with EnsureChild('MultiTokens') do
      for i := 0 to ChildNodes.Count-1 do
        with ChildNodes[i] do
          AddCoupleTokens(VarToStr(GetVarAttr('Open','')), VarToStr(GetVarAttr('Close','')));

    {Sub rules}
    with EnsureChild('SubRules').ChildNodes do
    begin
      for i := 0 to Count-1 do
      begin
        if Item[i].NodeName = 'Range' then
        begin
          NewRange := TSynRange.Create;
          ImportRange(NewRange, Item[i]);
          AddRange(NewRange);
        end
        else if Item[i].NodeName = 'KeyList' then
        begin
          NewKeyList := TSynKeyList.Create();
          ImportKeyList(NewKeyList, Item[i]);
          AddKeyList(NewKeyList);
        end
        else if Item[i].NodeName = 'Set' then
        begin
          NewSet := TSynSet.Create();
          ImportSet(NewSet, Item[i]);
          AddSet(NewSet);
        end;
      end;
    end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportRange(ARange: TSynRange; ANode: IXMLNode): Boolean;
var
  i: integer;
begin
  with ARange, ANode do
  begin
    SetVarAttr('Name',Name);
    if not Enabled then
      SetVarAttr('Enabled', BoolToStr(Enabled, True));
    if CaseSensitive then
      SetVarAttr('CaseSensitive', BoolToStr(CaseSensitive, True));
    SetVarAttr('Style',Style);
    ExportAttributes(ARange.Attributes, AppendElement('Attributes'));
    with AppendElement('Delimiters') do
      SetVarAttr('Value',SetToStr(Delimiters));

    if ANode.NodeName <> 'MainRules' then
    begin
      ExportToken(OpenToken, AppendElement('OpenToken'));
      ExportToken(CloseToken, AppendElement('CloseToken'));
      with AppendElement('Properties') do
      begin
        if CloseOnTerm then
          SetVarAttr('CloseOnTerm', BoolToStr(CloseOnTerm, True));
        if CloseOnEol then
          SetVarAttr('CloseOnEol', BoolToStr(CloseOnEol, True));
        if AllowPreviousClose then
          SetVarAttr('AllowPredClose', BoolToStr(AllowPreviousClose, True));
      end;
      with AppendElement('MultiTokens') do
        for i := 0 to OpenToken.SymbolCount-1 do
          with AppendElement('Tokens') do
          begin
            if OpenToken.Symbols[i] <> '' then
              SetVarAttr('Open',OpenToken.Symbols[i]);
            if CloseToken.Symbols[i] <> '' then
              SetVarAttr('Close',CloseToken.Symbols[i]);
          end;
    end;
    
    with AppendElement('SubRules') do begin
      for i := 0 to RangeCount -1 do
        ExportRange(Ranges[i], AppendElement('Range'));
      for i := 0 to KeyListCount -1 do
        ExportKeyList(KeyLists[i], AppendElement('KeyList'));
      for i := 0 to SetCount -1 do
        ExportSet(Sets[i], AppendElement('Set'));
    end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin
  //TODO: Insert try..except
  with ANode, SynUniSyn do
  begin
    Clear();
    with EnsureChild('SyntaxColoring') do begin
      ImportInfo(Info, EnsureChild('Info'));
      ImportSchemes(Schemes, EnsureChild('Schemes'));

      //# если убират?эт?строку, то перестанет работать. Замени её на чт?нить правильное ;-)
      SynUniSyn.ActiveScheme := Schemes.GetSchemeName('Default');

      ImportEditorProperties(EditorProperties, EnsureChild('Editor'));
      ImportRange(MainRules, EnsureChild('MainRules'));
    end;
    {$IFDEF CODEFOLDING}
    ImportCodeFolding(FoldRegions, EnsureChild('CodeFolding').ChildNodes); //###
    {$ENDIF}
    FormatVersion := '2.0'; 
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin
  ANode.SetVarAttr('Version', '2.0');
  with SynUniSyn do
  begin
    with ANode.AppendElement('SyntaxColoring') do
    begin
      ExportInfo(Info, AppendElement('Info'));
      ExportSchemes(Schemes, AppendElement('Schemes'));
      ExportEditorProperties(EditorProperties, AppendElement('Editor'));
      ExportRange(MainRules, AppendElement('MainRules'));
    end;
    {$IFDEF CODEFOLDING}
    ExportCodeFolding(FoldRegions, ANode.AppendElement('CodeFolding'));
    {$ENDIF}
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportFromStream(AObject: TObject; AStream: TStream): Boolean;
begin
  Result := inherited ImportFromStream(AObject, AStream);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportToStream(AObject: TObject; AStream: TStream): Boolean;
begin
  Result := inherited ExportToStream(AObject, AStream);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ImportFromFile(AObject: TObject; AFileName: string): Boolean;
begin
  Result := inherited ImportFromFile(AObject, AFileName);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXml20.ExportToFile(AObject: TObject; AFileName: string): Boolean;
begin
  Result := inherited ExportToFile(AObject, AFileName);
end;

end.
