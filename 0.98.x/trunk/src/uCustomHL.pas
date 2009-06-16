// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uCustomHL;

interface

{$I ConTEXT.inc}

uses
  Windows, SysUtils, Classes, Graphics, Forms, uCommon, SynEditHighlighter,
  SynHighlighterMyGeneral, JclFileUtils;

type
  TCustHLDef   = record
                   Language            :string;
                   Filter              :string;
                   HelpFile            :string;
                   LineComment         :string;
                   CommentBeg          :string;
                   CommentEnd          :string;
                   BlockAutoindent     :boolean;
                   BlockBegStr         :string;
                   BlockEndStr         :string;
                   IdentifierChars     :string;
                   IdentifierBegChars  :string;
                   NumConstChars       :string;
                   NumConstBeg         :string;
                   Keywords1           :string;
                   Keywords2           :string;
                   Keywords3           :string;
                   Keywords4           :string;
                   Keywords5           :string;
                   StringBegChars      :string;
                   StringEndChars      :string;
                   Description         :string;
                   EscapeChar          :char;
                   MultilineStrings    :boolean;
                   CaseSensitive       :boolean;
                   UsePreprocessor     :boolean;
                   CurrLineHighlighted :boolean;
                   OverrideTxtFgColor  :boolean;
                   SpaceCol            :TFgBg;
                   Keyword1Col         :TFgBg;
                   Keyword1Attr        :TFontStyles;
                   Keyword2Col         :TFgBg;
                   Keyword2Attr        :TFontStyles;
                   Keyword3Col         :TFgBg;
                   Keyword3Attr        :TFontStyles;
                   Keyword4Col         :TFgBg;
                   Keyword4Attr        :TFontStyles;
                   Keyword5Col         :TFgBg;
                   Keyword5Attr        :TFontStyles;
                   IdentifierCol       :TFgBg;
                   IdentifierAttr      :TFontStyles;
                   CommentCol          :TFgBg;
                   CommentAttr         :TFontStyles;
                   NumberCol           :TFgBg;
                   NumberAttr          :TFontStyles;
                   StringCol           :TFgBg;
                   StringAttr          :TFontStyles;
                   SymbolCol           :TFgBg;
                   SymbolAttr          :TFontStyles;
                   PreprocessorCol     :TFgBg;
                   PreprocessorAttr    :TFontStyles;
                   SelectionCol        :TFgBg;
                   CurrentLineCol      :TFgBg;
                   MatchedBracesCol    :TFgBg;
                   dummyAttr           :TFontStyles;
                 end;
  pTCustHLDef  = ^TCustHLDef;

procedure LoadCustomHLFiles;
function  EnumCustomHL(var HL:TSynCustomHighlighter; var n:integer):boolean;
procedure SaveCustomHLFile(pHL:pTHighLighter);
procedure FreeCustomHighlighters;

implementation

type
  TToken = (
              tkNONE, tkEOF, tkIDENT,
              tkKW_LANG, tkKW_FILTER, tkKW_COMMENTCOL, tkKW_ESCAPECHAR,
              tkKW_IDENTCHARS, tkKW_IDENTBEGCHARS, tkKW_IDENTCOL, tkKW_NUMCHARS, tkKW_NUMBEGCHARS,
              tkKW_KEYWORDS1, tkKW_KEYWORDS2, tkKW_KEYWORDS3, tkKW_KEYWORDS4, tkKW_KEYWORDS5,
              tkKW_KEYWORD1COL, tkKW_KEYWORD2COL, tkKW_KEYWORD3COL, tkKW_KEYWORD4COL, tkKW_KEYWORD5COL, tkKW_STRDELIMITERS,
              tkKW_SPACECOL, tkKW_STRINGCOL, tkKW_CURRENTLINEHL, tkKW_MATCHEDBRACESCOL,
              tkKW_SYMBOLCOL, tkKW_SELECTIONCOL, tkKW_CURRENTLINECOL,
              tkKW_USERPREPROC, tkKW_NUMBERCOL, tkKW_PREDPROCCOL, tkKW_HELPFILE, tkKW_CASESENSITIVE,
              tkKW_LINECOMMENT, tkKW_COMMENTBEG, tkKW_COMMENTEND,
              tkKW_STRINGBEGCHAR, tkKW_STRINGENDCHAR, tkKW_MULTILINESTRINGS, tkKW_OVERRIDETXTFGCOLOR,
              tkKW_BLOCKBEGSTR, tkKW_BLOCKENDSTR, tkKW_BLOCKAUTOINDENT, tkKW_DESCRIPTION
           );

var
  strCustomHL    :TStringList;
  listCustomHL   :TList;

  token          :TToken;
  svalue         :string;
  ptr            :PChar;
  ptr_beg        :PChar;

const
  CUSTOM_HL_FILE_EXT = 'chl';

////////////////////////////////////////////////////////////////////////////////////////////
//                                  HL functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function EnumCustomHL(var HL:TSynCustomHighlighter; var n:integer):boolean;
var
  ok :boolean;
begin
  ok:=(n<listCustomHL.Count);

  if ok then begin
    HL:=TSynCustomHighlighter(listCustomHL[n]);
    inc(n);
  end;

  result:=ok;
end;
//------------------------------------------------------------------------------------------
procedure FreeCustomHighlighters;
var
  i :integer;
begin
  if Assigned(listCustomHL) then begin
    for i:=0 to listCustomHL.Count-1 do
      if Assigned(listCustomHL[i]) then
        TSynCustomHighlighter(listCustomHL[i]).Free;

    listCustomHL.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure AddHL(SrcFileName:string; CHL:pTCustHLDef);
var
  HL   :TSynMyGeneralSyn;
  Attr :TSynHighlighterAttributes;

  function ExpandIdentCh(s:string):string;
  var
    ss           :string;
    i, ii, n     :integer;
    str          :TStringList;
  begin
    str:=TStringList.Create;

    try
      str.Text:=PChar(s);

      for i:=0 to str.Count-1 do begin
        s:=str[i];
        n:=Pos('..',s);

        if (n=2) and (Length(s)=4) then begin
          for ii:=ord(s[1]) to ord(s[4]) do
            ss:=ss+chr(ii);
        end else
          ss:=ss+s;
      end;
    finally
      str.Free;
    end;

    result:=ss;
  end;

  procedure SetAttrColor(HL:TSynMyGeneralSyn; AttrName:string; Fg, Bg:TColor);
  begin
    Attr:=HL.Attribute[FindAttrIndex(AttrName, HL)];
    if Assigned(Attr) then begin
      if (Fg<>clNone) then Attr.Foreground:=Fg;
      if (Bg<>clNone) then Attr.Background:=Bg;
    end;
  end;

begin
  HL:=TSynMyGeneralSyn.Create(nil);

  with HL do begin
    // general
    AddAdditionalToHighlighter(HL);
    LanguageName:=CHL^.Language;
    DefaultFilter:=CHL^.Filter;
    Description:=CHL^.Description;

    // colors
    CommentAttri.Foreground:=CHL^.CommentCol.Fg;
    CommentAttri.Background:=CHL^.CommentCol.Bg;
    IdentifierAttri.Foreground:=CHL^.IdentifierCol.Fg;
    IdentifierAttri.Background:=CHL^.IdentifierCol.Bg;
    KeyAttri1.Foreground:=CHL^.Keyword1Col.Fg;
    KeyAttri1.Background:=CHL^.Keyword1Col.Bg;
    KeyAttri2.Foreground:=CHL^.Keyword2Col.Fg;
    KeyAttri2.Background:=CHL^.Keyword2Col.Bg;
    KeyAttri3.Foreground:=CHL^.Keyword3Col.Fg;
    KeyAttri3.Background:=CHL^.Keyword3Col.Bg;
    KeyAttri4.Foreground:=CHL^.Keyword4Col.Fg;
    KeyAttri4.Background:=CHL^.Keyword4Col.Bg;
    KeyAttri5.Foreground:=CHL^.Keyword5Col.Fg;
    KeyAttri5.Background:=CHL^.Keyword5Col.Bg;
    NumberAttri.Foreground:=CHL^.NumberCol.Fg;
    NumberAttri.Background:=CHL^.NumberCol.Bg;
    PreprocessorAttri.Foreground:=CHL^.PreprocessorCol.Fg;
    PreprocessorAttri.Background:=CHL^.PreprocessorCol.Bg;
    SpaceAttri.Foreground:=CHL^.SpaceCol.Fg;
    SpaceAttri.Background:=CHL^.SpaceCol.Bg;
    StringAttri.Foreground:=CHL^.StringCol.Fg;
    StringAttri.Background:=CHL^.StringCol.Bg;
    SymbolAttri.Foreground:=CHL^.SymbolCol.Fg;
    SymbolAttri.Background:=CHL^.SymbolCol.Bg;

    // attributes
    CommentAttri.Style:=CHL^.CommentAttr;
    IdentifierAttri.Style:=CHL^.IdentifierAttr;
    KeyAttri1.Style:=CHL^.Keyword1Attr;
    KeyAttri2.Style:=CHL^.Keyword2Attr;
    KeyAttri3.Style:=CHL^.Keyword3Attr;
    KeyAttri4.Style:=CHL^.Keyword4Attr;
    KeyAttri5.Style:=CHL^.Keyword5Attr;
    NumberAttri.Style:=CHL^.NumberAttr;
    PreprocessorAttri.Style:=CHL^.PreprocessorAttr;
    StringAttri.Style:=CHL^.StringAttr;
    SymbolAttri.Style:=CHL^.SymbolAttr;

    // additional colors
    SetAttrColor(HL, ATTR_SELECTION_STR, CHL^.SelectionCol.Fg, CHL^.SelectionCol.Bg);
    SetAttrColor(HL, ATTR_CURRENT_LINE_STR, CHL^.CurrentLineCol.Fg, CHL^.CurrentLineCol.Bg);
    SetAttrColor(HL, ATTR_MATCHED_BRACES, CHL^.MatchedBracesCol.Fg, CHL^.MatchedBracesCol.Bg);

//!!    ed.memo.RightEdgeColor:=HL.Attribute[FindAttrIndex(ATTR_RIGHTEDGE_STR,HL)].Foreground;

    while (Pos(' ',CHL^.StringBegChars)>0) do
      Delete(CHL^.StringBegChars, Pos(' ',CHL^.StringBegChars),1);
    while (Pos(' ',CHL^.StringEndChars)>0) do
      Delete(CHL^.StringEndChars, Pos(' ',CHL^.StringEndChars),1);

    // other
    IdentifierChars:=ExpandIdentCh(CHL^.IdentifierChars);
    IdentifierBegChars:=ExpandIdentCh(CHL^.IdentifierBegChars);
    NumConstChars:=ExpandIdentCh(CHL^.NumConstChars);
    NumBegChars:=ExpandIdentCh(CHL^.NumConstBeg);
    DetectPreprocessor:=CHL^.UsePreprocessor;
    CaseSensitive:=CHL^.CaseSensitive;
    CurrLineHighlighted:=CHL^.CurrLineHighlighted;
    OverrideTxtFgColor:=CHL^.OverrideTxtFgColor;
    HelpFile:=CHL^.HelpFile;
    SetCommentStrings(CHL^.LineComment, CHL^.CommentBeg, CHL^.CommentEnd);
    SetStringParams(CHL^.StringBegChars, CHL^.StringEndChars, CHL^.MultilineStrings);
    EscapeChar:=CHL^.EscapeChar;
    BlockAutoindent:=CHL^.BlockAutoindent;
    BlockBegStr:=CHL^.BlockBegStr;
    BlockEndStr:=CHL^.BlockEndStr;

    // keywords
    if CaseSensitive then begin
      HL.Keywords1.Text:=CHL^.Keywords1;
      HL.Keywords2.Text:=CHL^.Keywords2;
      HL.Keywords3.Text:=CHL^.Keywords3;
      HL.Keywords4.Text:=CHL^.Keywords4;
      HL.Keywords5.Text:=CHL^.Keywords5;
    end else begin
      HL.Keywords1.Text:=UpperCase(CHL^.Keywords1);
      HL.Keywords2.Text:=UpperCase(CHL^.Keywords2);
      HL.Keywords3.Text:=UpperCase(CHL^.Keywords3);
      HL.Keywords4.Text:=UpperCase(CHL^.Keywords4);
      HL.Keywords5.Text:=UpperCase(CHL^.Keywords5);
    end;
  end;

  HL.SourceFileName:=SrcFileName;
  HL.MakeMethodTables;

  listCustomHL.Add(HL);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Parse functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function CheckIsKeyword(var svalue:string; var token:TToken):boolean;
var
  old_tok :TToken;
begin
  old_tok:=token;

  if (Length(svalue)>0) and (svalue[Length(svalue)]=':') then begin
    SetLength(svalue,Length(svalue)-1);
    if (Length(svalue)>0) then begin
      case (svalue[1]) of
        'B': if (svalue='BlockCommentBeg') then token:=tkKW_COMMENTBEG else
               if (svalue='BlockBegStr') then token:=tkKW_BLOCKBEGSTR else
                 if (svalue='BlockEndStr') then token:=tkKW_BLOCKENDSTR else
                   if (svalue='BlockCommentEnd') then token:=tkKW_COMMENTEND else
                     if (svalue='BlockAutoindent') then token:=tkKW_BLOCKAUTOINDENT;
        'L':
          if (svalue='Language') then token:=tkKW_LANG else
            if (svalue='LineComment') then token:=tkKW_LINECOMMENT;
        'E':
          if (svalue='EscapeChar') then token:=tkKW_ESCAPECHAR;
        'F':
          if (svalue='Filter') then token:=tkKW_FILTER;
        'C':
          if (svalue='CommentCol') then token:=tkKW_COMMENTCOL else
            if (svalue='CurrentLineCol') then token:=tkKW_CURRENTLINECOL else
              if (svalue='CurrLineHighlighted') then token:=tkKW_CURRENTLINEHL else
                if (svalue='CaseSensitive') then token:=tkKW_CASESENSITIVE;
        'D':
          if (svalue='Description') then token:=tkKW_DESCRIPTION;
        'H':
          if (svalue='HelpFile') then token:=tkKW_HELPFILE;
        'I':
          if (svalue='IdentifierChars') then token:=tkKW_IDENTCHARS else
            if (svalue='IdentifierBegChars') then token:=tkKW_IDENTBEGCHARS else
              if (svalue='IdentifierCol') then token:=tkKW_IDENTCOL;
        'K':
          if (svalue='KeyWords1') then token:=tkKW_KEYWORDS1 else
            if (svalue='Keyword1Col') then token:=tkKW_KEYWORD1COL else
              if (svalue='KeyWords2') then token:=tkKW_KEYWORDS2 else
                if (svalue='Keyword2Col') then token:=tkKW_KEYWORD2COL else
                  if (svalue='KeyWords3') then token:=tkKW_KEYWORDS3 else
                    if (svalue='Keyword3Col') then token:=tkKW_KEYWORD3COL else
                      if (svalue='KeyWords4') then token:=tkKW_KEYWORDS4 else
                        if (svalue='Keyword4Col') then token:=tkKW_KEYWORD4COL else
                          if (svalue='KeyWords5') then token:=tkKW_KEYWORDS5 else
                            if (svalue='Keyword5Col') then token:=tkKW_KEYWORD5COL;
        'M':
          if (svalue='MultilineStrings') then token:=tkKW_MULTILINESTRINGS else
            if (svalue='MatchedBracesCol') then token:=tkKW_MATCHEDBRACESCOL;
        'O':
          if (svalue='OverrideTxtFgColor') then token:=tkKW_OVERRIDETXTFGCOLOR;
        'S':
          if (svalue='StringBegChar') then token:=tkKW_STRINGBEGCHAR else
            if (svalue='StringEndChar') then token:=tkKW_STRINGENDCHAR else
              if (svalue='SpaceCol') then token:=tkKW_SPACECOL else
                  if (svalue='StringCol') then token:=tkKW_STRINGCOL else
                      if (svalue='SymbolCol') then token:=tkKW_SYMBOLCOL else
                          if (svalue='SelectionCol') then token:=tkKW_SELECTIONCOL;
        'U':
          if (svalue='UsePreprocessor') then token:=tkKW_USERPREPROC;
        'N':
          if (svalue='NumberCol') then token:=tkKW_NUMBERCOL else
            if (svalue='NumConstChars') then token:=tkKW_NUMCHARS else
              if (svalue='NumConstBegChars') then token:=tkKW_NUMBEGCHARS;
        'P':
          if (svalue='PreprocessorCol') then token:=tkKW_PREDPROCCOL;
      end;
    end;
  end;

  result:=(token<>old_tok);
end;
//------------------------------------------------------------------------------------------
procedure lex;
label
  Error;

  function NextNonBlankChar:char;
  var
    ptr_ :PChar;
  begin
    ptr_:=ptr;
    repeat inc(ptr_) until ((ptr_^>' ') or (ptr_^=#0));
    result:=ptr_^;
  end;

begin
  // skip blanks
  while (ptr^<>#0) do begin
    if (ptr^>' ') then break;
    inc(ptr);
  end;

  // skip EOL
  while ((ptr^) in [#13,#10]) do
    inc(ptr);

  // check EOF
  if (ptr^=#0) then begin
    token:=tkEOF;
    EXIT;
  end;

  // komentar, ali samo ako je na poèetku linije
  if ((ptr^='/') and ((ptr+1)^='/')) and ((ptr=ptr_beg) or ((ptr-1)^=#10)) then begin
     while (not (ptr^ in [#13,#10,#00])) do
       inc(ptr);
     lex;

     EXIT;
  end;

  // match identifiers
  svalue := ptr^;
  inc(ptr);
  while (not (ptr^ in [' ',#09,#13,#10,#00])) do begin
    svalue := svalue + ptr^;
    inc(ptr);
  end;

  token := tkIDENT;

  if (Length(svalue)>0) and (svalue[Length(svalue)]=':') then
    CheckIsKeyword(svalue, token);

  EXIT;
end;
//------------------------------------------------------------------------------------------
procedure InitCHL(CHL:pTCustHLDef);

  procedure ResetColor(var FgBg:TFgBg);
  begin
    FgBg.Fg:=clWindowText;
    FgBg.Bg:=clWindow;
  end;

begin
  FillChar(CHL^, SizeOf(TCustHLDef), 0);

  with CHL^ do begin
    ResetColor(SpaceCol);
    ResetColor(Keyword1Col);
    ResetColor(Keyword2Col);
    ResetColor(Keyword3Col);
    ResetColor(Keyword4Col);
    ResetColor(Keyword5Col);
    ResetColor(IdentifierCol);
    ResetColor(CommentCol);
    ResetColor(NumberCol);
    ResetColor(StringCol);
    ResetColor(SymbolCol);
    ResetColor(PreprocessorCol);
    ResetColor(SelectionCol);
    ResetColor(CurrentLineCol);
    ResetColor(MatchedBracesCol);
  end;
end;
//------------------------------------------------------------------------------------------
procedure Parse(SrcFileName:string);
var
  CHL     :TCustHLDef;
  IsFirst :boolean;

  function GetColor(var Attr:TFontStyles):TFgBg;
  begin
    result.Fg:=clNone;
    result.Bg:=clNone;

    // Foreground
    lex;
    if (token=tkIDENT) then
      try
        result.Fg:=StringToColor(svalue);
      except
      end;
    // Background
    lex;
    if (token=tkIDENT) then
      try
        result.Bg:=StringToColor(svalue);
      except
      end;

    lex;
    if (token=tkIDENT) then begin
      Attr:=[];
      svalue:=UpperCase(svalue);
      if (Pos('B',svalue)>0) then Include(Attr,fsBold);
      if (Pos('I',svalue)>0) then Include(Attr,fsItalic);
      if (Pos('U',svalue)>0) then Include(Attr,fsUnderline);
      if (Pos('S',svalue)>0) then Include(Attr,fsStrikeOut);
    end;
  end;

  function GetKeywords:string;
  begin
    result:='';

    repeat
      lex;

      if (token=tkIDENT) then begin
        result:=result+svalue+#13#10;
      end;
    until (token<>tkIDENT);

    if (Length(result)>0) then
      SetLength(result,Length(result)-2);
  end;

  function GetParams:string;
  begin
    result:='';

    repeat
      lex;

      if (token=tkIDENT) then begin
        result:=result+svalue+' ';
      end;
    until (token<>tkIDENT);

    if (Length(result)>0) then
      SetLength(result,Length(result)-1);
  end;

  function GetParamsToEOL:string;
  begin
    result:='';

    while (ptr^ in [' ',#09]) do inc(ptr);

    while (not (ptr^ in [#13,#10,#0])) do begin
      result:=result+ptr^;
      inc(ptr);
    end;

    result:=Trim(result);
    token:=tkNONE;
  end;

  function GetChar:char;
  var
    s :string;
  begin
    s:=GetParamsToEOL;
    if (Length(s)>0) then
      result:=s[1]
    else
      result:=#255;
  end;

  function GetInt:integer;
  begin
    lex;
    result:=StrToIntDef(svalue, 0);
  end;

  function GetBool: boolean;
  begin
    lex;
    result:=StrToIntDef(svalue, 0)<>0;
  end;

begin
  IsFirst:=TRUE;

  repeat
    if (token in [tkNONE, tkEOF, tkIDENT]) then
      lex;

    case token of
      tkKW_LANG:
        begin
          if not IsFirst and (Length(CHL.Language)>0) then
            AddHL(SrcFileName,@CHL);

          InitCHL(@CHL);
          CHL.Language:=GetParams;
          IsFirst:=FALSE;
        end;
      tkKW_FILTER:
        CHL.Filter:=GetParams;
      tkKW_DESCRIPTION:
        CHL.Description:=GetParamsToEOL;
      tkKW_HELPFILE:
        CHL.HelpFile:=GetParams;
      tkKW_CASESENSITIVE:
        CHL.CaseSensitive:=GetBool;
      tkKW_LINECOMMENT:
        CHL.LineComment:=GetParamsToEOL;
      tkKW_COMMENTBEG:
        CHL.CommentBeg:=GetParamsToEOL;
      tkKW_COMMENTEND:
        CHL.CommentEnd:=GetParamsToEOL;
      tkKW_BLOCKAUTOINDENT:
        CHL.BlockAutoindent:=GetBool;
      tkKW_BLOCKBEGSTR:
        CHL.BlockBegStr:=GetParamsToEOL;
      tkKW_BLOCKENDSTR:
        CHL.BlockEndStr:=GetParamsToEOL;
      tkKW_STRINGBEGCHAR:
        CHL.StringBegChars:=GetParamsToEOL;
      tkKW_STRINGENDCHAR:
        CHL.StringEndChars:=GetParamsToEOL;
      tkKW_MULTILINESTRINGS:
        CHL.MultilineStrings:=GetBool;
      tkKW_IDENTCHARS:
        CHL.IdentifierChars:=GetKeywords;
      tkKW_IDENTBEGCHARS:
        CHL.IdentifierBegChars:=GetKeywords;
      tkKW_NUMCHARS:
        CHL.NumConstChars:=GetKeywords;
      tkKW_NUMBEGCHARS:
        CHL.NumConstBeg:=GetKeywords;
      tkKW_ESCAPECHAR:
        CHL.EscapeChar:=GetChar;
      tkKW_KEYWORDS1:
        CHL.Keywords1:=GetKeywords;
      tkKW_KEYWORDS2:
        CHL.Keywords2:=GetKeywords;
      tkKW_KEYWORDS3:
        CHL.Keywords3:=GetKeywords;
      tkKW_KEYWORDS4:
        CHL.Keywords4:=GetKeywords;
      tkKW_KEYWORDS5:
        CHL.Keywords5:=GetKeywords;
      tkKW_USERPREPROC:
        CHL.UsePreprocessor:=GetBool;
      tkKW_COMMENTCOL:
        CHL.CommentCol:=GetColor(CHL.CommentAttr);
      tkKW_IDENTCOL:
        CHL.IdentifierCol:=GetColor(CHL.IdentifierAttr);
      tkKW_KEYWORD1COL:
        CHL.Keyword1Col:=GetColor(CHL.Keyword1Attr);
      tkKW_KEYWORD2COL:
        CHL.Keyword2Col:=GetColor(CHL.Keyword2Attr);
      tkKW_KEYWORD3COL:
        CHL.Keyword3Col:=GetColor(CHL.Keyword3Attr);
      tkKW_KEYWORD4COL:
        CHL.Keyword4Col:=GetColor(CHL.Keyword4Attr);
      tkKW_KEYWORD5COL:
        CHL.Keyword5Col:=GetColor(CHL.Keyword5Attr);
      tkKW_SPACECOL:
        CHL.SpaceCol:=GetColor(CHL.dummyAttr);
      tkKW_STRINGCOL:
        CHL.StringCol:=GetColor(CHL.StringAttr);
      tkKW_SYMBOLCOL:
        CHL.SymbolCol:=GetColor(CHL.SymbolAttr);
      tkKW_SELECTIONCOL:
        CHL.SelectionCol:=GetColor(CHL.dummyAttr);
      tkKW_NUMBERCOL:
        CHL.NumberCol:=GetColor(CHL.NumberAttr);
      tkKW_PREDPROCCOL:
        CHL.PreprocessorCol:=GetColor(CHL.PreprocessorAttr);
      tkKW_CURRENTLINECOL:
        CHL.CurrentLineCol:=GetColor(CHL.dummyAttr);
      tkKW_MATCHEDBRACESCOL:
        CHL.MatchedBracesCol:=GetColor(CHL.dummyAttr);
      tkKW_CURRENTLINEHL:
        CHL.CurrLineHighlighted:=GetBool;
      tkKW_OVERRIDETXTFGCOLOR:
        CHL.OverrideTxtFgColor:=GetBool;
    end;
  until (token in [tkEOF]);

  if (Length(CHL.Language)>0) then
    AddHL(SrcFileName,@CHL);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Load functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function EnumAllCustomHLFiles(path:string):TStringList;
var
  F     :TSearchRec;
  ok    :boolean;
  ss    :TStringList;
begin
  ss:=TStringList.Create;

  path:=PathAddSeparator(path);

  ok:=FindFirst(path+'*.'+CUSTOM_HL_FILE_EXT,faAnyFile,F)=0;

  if ok then begin
    repeat
      ss.Add(path+F.FindData.cFileName); // uzmi long filename
      ok:=FindNext(F)=0;
    until not ok;
  end;

  SysUtils.FindClose(F);

  result:=ss;
end;
//------------------------------------------------------------------------------------------
procedure LoadCustomHLFiles;
var
  ss          :TStringList;
  strCustomHL :TStringList;
  i           :integer;
  fname       :string;
begin
  ss:=EnumAllCustomHLFiles(ApplicationDir+'Highlighters');
  listCustomHL:=TList.Create;

  strCustomHL:=TStringList.Create;

  try
    for i:=0 to ss.Count-1 do begin
      try
        strCustomHL.LoadFromFile(ss[i]);
        fname:=ss[i];
        ptr:=PChar(strCustomHL.Text);
        ptr_beg:=ptr;

        Parse(fname);
      except
        DlgErrorOpenFile(ss[i]);
      end;
    end;
  finally
    strCustomHL.Free;
    ss.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure SaveCustomHLFile(pHL:pTHighLighter);
var
  HL    :TSynMyGeneralSyn;
  ss    :TStringList;
const
  VALUE_TAB = 25;

  function LoadFile:boolean;
  begin
    try
      ss.LoadFromFile(HL.SourceFileName);
      result:=TRUE;
    except
      DlgErrorOpenFile(HL.SourceFileName);
      result:=FALSE;
    end;
  end;

  function SaveFile:boolean;
  begin
    try
      ss.SaveToFile(HL.SourceFileName);
      result:=TRUE;
    except
      DlgErrorSaveFile(HL.SourceFileName);
      result:=FALSE;
    end;
  end;

  function FindParameterLine(KeyName:string):integer;
  var
    i     :integer;
    kword :string;
    p     :PChar;
  begin
    result:=-1;

    i:=0;
    while (i<ss.Count) do begin
      p:=PChar(ss[i]);
      if not (p^ in [#0,'/']) then begin
        kword:='';
        while not (p^ in [':',#0,#13,#10]) do begin
          kword:=kword+p^;
          inc(p);
        end;

        if (kword=KeyName) then begin
          result:=i;
          BREAK;
        end;
      end;
      inc(i);
    end;
  end;

  procedure SetKeyValue(KeyName:string; Value:string);
  var
    n :integer;
    s :string;
  begin
    n:=FindParameterLine(KeyName);

    s:=KeyName+':';
    while (Length(s)<VALUE_TAB-1) do
      s:=s+' ';

    s:=TrimRight(s+Value);

    if (n>-1) then
      ss[n]:=s
    else
      ss.Add(s);
  end;

  procedure SetColorAttr(KeyName:string; Attr:TSynHighlighterAttributes);

    function GetFontAttr(fs:TFontStyles):string;
    begin
      result:='';
      if (fsBold in fs) then result:=result+'B';
      if (fsItalic in fs) then result:=result+'I';
      if (fsUnderline in fs) then result:=result+'U';
      if (fsStrikeOut in fs) then result:=result+'S';
    end;

  begin
    if Assigned(Attr) then
      SetKeyValue(KeyName, ColorToString(Attr.Foreground)+' '+ColorToString(Attr.Background)+' '+GetFontAttr(Attr.Style));
  end;

begin
  if not (Assigned(pHL) and Assigned(pHL^.HL) and (pHL^.HL is TSynMyGeneralSyn)) then EXIT;

  HL:=(pHL^.HL as TSynMyGeneralSyn);
  ss:=TStringList.Create;

  if LoadFile then begin
    SetKeyValue('Filter', pHL^.HL.DefaultFilter);
    SetKeyValue('HelpFile',pHL^.HelpFile);
    SetKeyValue('CurrLineHighlighted',IntToStr(integer(pHL^.ColorCurrentLine)));
    SetKeyValue('OverrideTxtFgColor',IntToStr(integer(pHL^.OverrideTxtFgColor)));
    SetKeyValue('BlockAutoindent',IntToStr(integer(pHL^.BlockAutoindent)));
    SetKeyValue('BlockBegStr',pHL^.BlockBegStr);
    SetKeyValue('BlockEndStr',pHL^.BlockEndStr);
    SetColorAttr('SpaceCol', HL.SpaceAttri);
    SetColorAttr('Keyword1Col', HL.KeyAttri1);
    SetColorAttr('Keyword2Col', HL.KeyAttri2);
    SetColorAttr('Keyword3Col', HL.KeyAttri3);
    SetColorAttr('Keyword4Col', HL.KeyAttri4);
    SetColorAttr('Keyword5Col', HL.KeyAttri5);
    SetColorAttr('IdentifierCol', HL.IdentifierAttri);
    SetColorAttr('CommentCol', HL.CommentAttri);
    SetColorAttr('NumberCol', HL.NumberAttri);
    SetColorAttr('StringCol', HL.StringAttri);
    SetColorAttr('SymbolCol', HL.SymbolAttri);
    SetColorAttr('PreprocessorCol', HL.PreprocessorAttri);
    SetColorAttr('SelectionCol', HL.Attribute[FindAttrIndex(ATTR_SELECTION_STR, HL)]);
    SetColorAttr('CurrentLineCol', HL.Attribute[FindAttrIndex(ATTR_CURRENT_LINE_STR, HL)]);
    SetColorAttr('MatchedBracesCol', HL.Attribute[FindAttrIndex(ATTR_MATCHED_BRACES, HL)]);

    SaveFile;
  end;

  ss.Free;
end;
//------------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------
initialization

finalization
  if Assigned(strCustomHL) then
    strCustomHL.Free;

end.

