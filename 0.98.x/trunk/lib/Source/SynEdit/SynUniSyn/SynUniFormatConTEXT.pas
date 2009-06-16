
unit SynUniFormatConTEXT;

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
  SimpleXML,
  SynUniFormatNativeXml20;

type
  TSynUniConTEXTAdditionalSettings = class
  private
    fCommentEndString: string;
    fCommentBegString: string;
    fBlockIndentEndStrings: string;
    fBlockIndentBegStrings: string;
    fBracketHighlightEndChars: string;
    fBracketHighlightBegChars: string;
  public
    property BracketHighlightBegChars: string read fBracketHighlightBegChars write fBracketHighlightBegChars;
    property BracketHighlightEndChars: string read fBracketHighlightEndChars write fBracketHighlightEndChars;
    property BlockIndentBegStrings: string read fBlockIndentBegStrings write fBlockIndentBegStrings;
    property BlockIndentEndStrings: string read fBlockIndentEndStrings write fBlockIndentEndStrings;
    property CommentBegString: string read fCommentBegString write fCommentBegString;
    property CommentEndString: string read fCommentEndString write fCommentEndString;
  end;

type
  TSynUniFormatConTEXT = class(TSynUniFormatNativeXml20)
    class function ImportAdditional(AdditionalSettings: TSynUniConTEXTAdditionalSettings; ANode: IXMLNode): Boolean; 
    class function ExportAdditional(AdditionalSettings: TSynUniConTEXTAdditionalSettings; ANode: IXMLNode): Boolean; 
    class function ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; override;
    class function ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean; override;
  end;

implementation

//------------------------------------------------------------------------------
class function TSynUniFormatConTEXT.ImportAdditional(
  AdditionalSettings: TSynUniConTEXTAdditionalSettings;
  ANode: IXMLNode): Boolean;
begin
  with AdditionalSettings do begin
    with ANode.EnsureChild('BracketHighlight') do begin
      BracketHighlightBegChars := VarToStr(GetVarAttr('BegChars', ''));
      BracketHighlightEndChars := VarToStr(GetVarAttr('EndChars', ''));
    end;
    with ANode.EnsureChild('BlockAutoIndent') do begin
      BlockIndentBegStrings := VarToStr(GetVarAttr('BegStr', ''));
      BlockIndentEndStrings := VarToStr(GetVarAttr('EndStr', ''));
    end;
    with ANode.EnsureChild('Comments') do begin
      CommentBegString := VarToStr(GetVarAttr('BegStr', ''));
      CommentEndString := VarToStr(GetVarAttr('EndStr', ''));
    end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatConTEXT.ExportAdditional(
  AdditionalSettings: TSynUniConTEXTAdditionalSettings;
  ANode: IXMLNode): Boolean;
begin
  with AdditionalSettings do begin
    with ANode.EnsureChild('BracketHighlight') do begin
      if (Length(BracketHighlightBegChars) <> 0) then
        SetVarAttr('BegChars', BracketHighlightBegChars);
      if (Length(BracketHighlightEndChars) <> 0) then
        SetVarAttr('EndChars', BracketHighlightEndChars);
    end;
    with ANode.EnsureChild('BlockAutoIndent') do begin
      if (Length(BlockIndentBegStrings) <> 0) then
        SetVarAttr('BegStr', BlockIndentBegStrings);
      if (Length(BlockIndentEndStrings) <> 0) then
        SetVarAttr('EndStr', BlockIndentEndStrings);
    end;
    with ANode.EnsureChild('Comments') do begin
      if (Length(CommentBegString) <> 0) then
        SetVarAttr('BegStr', CommentBegString);
      if (Length(CommentEndString) <> 0) then
        SetVarAttr('EndStr', CommentEndString);
    end;
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatConTEXT.ImportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin
  inherited ImportHighlighter(SynUniSyn, ANode);
{
  //TODO: Insert try..except
  with ANode, SynUniSyn do
  begin
    Clear();
    with EnsureChild('SyntaxColoring') do begin
      ImportInfo(Info, EnsureChild('Info'));
      ImportSchemes(Schemes, EnsureChild('Schemes'));

      //# если убират?эт?строку, то перестанет работать. «амени еЄ на чт?нить правильное ;-)
      SynUniSyn.ActiveScheme := Schemes.GetSchemeName('Default');

      ImportEditorProperties(EditorProperties, EnsureChild('Editor'));
      ImportRange(MainRules, EnsureChild('MainRules'));
    end;
    ImportCodeFolding(FoldRegions, EnsureChild('CodeFolding').ChildNodes); //###
    FormatVersion := '2.0';
  end;
  Result := True;
}
end;

//------------------------------------------------------------------------------
class function TSynUniFormatConTEXT.ExportHighlighter(SynUniSyn: TSynUniSyn; ANode: IXMLNode): Boolean;
begin
{
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
    ExportCodeFolding(FoldRegions, ANode.AppendElement('CodeFolding'));
  end;
  Result := True;
}
end;

//------------------------------------------------------------------------------

end.
