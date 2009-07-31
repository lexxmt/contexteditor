{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at 
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Initial Developer of the Original Code is Michael Elsdörfer.
All Rights Reserved.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: TidyEnums.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyEnums;

interface

type
  TidyNodeType = (
      TidyNode_Root,    TidyNode_DocType,  TidyNode_Comment,
      TidyNode_ProcIns, TidyNode_Text,     TidyNode_Start,
      TidyNode_End,     TidyNode_StartEnd, TidyNode_CDATA,
      TidyNode_Section, TidyNode_Asp,      TidyNode_Jste,
      TidyNode_Php,     TidyNode_XmlDecl
    );

  TidyReportLevel = (TidyInfo, TidyWarning, TidyConfig, TidyAccess, TidyError,
                     TidyBadDocument, TidyFatal);

  TidyTagId = (
      TidyTag_UNKNOWN,    TidyTag_A,        TidyTag_ABBR,
      TidyTag_ACRONYM,    TidyTag_ADDRESS,  TidyTag_ALIGN,  
      TidyTag_APPLET,     TidyTag_AREA,     TidyTag_B,  
      TidyTag_BASE,       TidyTag_BASEFONT, TidyTag_BDO,  
      TidyTag_BGSOUND,    TidyTag_BIG,      TidyTag_BLINK,  
      TidyTag_BLOCKQUOTE, TidyTag_BODY,     TidyTag_BR,  
      TidyTag_BUTTON,     TidyTag_CAPTION,  TidyTag_CENTER,  
      TidyTag_CITE,       TidyTag_CODE,     TidyTag_COL,  
      TidyTag_COLGROUP,   TidyTag_COMMENT,  TidyTag_DD,  
      TidyTag_DEL,        TidyTag_DFN,      TidyTag_DIR,  
      TidyTag_DIV,        TidyTag_DL,       TidyTag_DT,  
      TidyTag_EM,         TidyTag_EMBED,    TidyTag_FIELDSET,  
      TidyTag_FONT,       TidyTag_FORM,     TidyTag_FRAME,  
      TidyTag_FRAMESET,   TidyTag_H1,       TidyTag_H2,  
      TidyTag_H3,         TidyTag_H4,       TidyTag_H5,  
      TidyTag_H6,         TidyTag_HEAD,     TidyTag_HR,  
      TidyTag_HTML,       TidyTag_I,        TidyTag_IFRAME,
      TidyTag_ILAYER,     TidyTag_IMG,      TidyTag_INPUT,  
      TidyTag_INS,        TidyTag_ISINDEX,  TidyTag_KBD,  
      TidyTag_KEYGEN,     TidyTag_LABEL,    TidyTag_LAYER,  
      TidyTag_LEGEND,     TidyTag_LI,       TidyTag_LINK,  
      TidyTag_LISTING,    TidyTag_MAP,      TidyTag_MARQUEE,  
      TidyTag_MENU,       TidyTag_META,     TidyTag_MULTICOL,  
      TidyTag_NOBR,       TidyTag_NOEMBED,  TidyTag_NOFRAMES,  
      TidyTag_NOLAYER,    TidyTag_NOSAVE,   TidyTag_NOSCRIPT,  
      TidyTag_OBJECT,     TidyTag_OL,       TidyTag_OPTGROUP,  
      TidyTag_OPTION,     TidyTag_P,        TidyTag_PARAM,  
      TidyTag_PLAINTEXT,  TidyTag_PRE,      TidyTag_Q,  
      TidyTag_RB,         TidyTag_RBC,      TidyTag_RP,  
      TidyTag_RT,         TidyTag_RTC,      TidyTag_RUBY,  
      TidyTag_S,          TidyTag_SAMP,     TidyTag_SCRIPT,  
      TidyTag_SELECT,     TidyTag_SERVER,   TidyTag_SERVLET,  
      TidyTag_SMALL,      TidyTag_SPACER,   TidyTag_SPAN,  
      TidyTag_STRIKE,     TidyTag_STRONG,   TidyTag_STYLE,  
      TidyTag_SUB,        TidyTag_SUP,      TidyTag_TABLE,  
      TidyTag_TBODY,      TidyTag_TD,       TidyTag_TEXTAREA,  
      TidyTag_TFOOT,      TidyTag_TH,       TidyTag_THEAD,  
      TidyTag_TITLE,      TidyTag_TR,       TidyTag_TT,  
      TidyTag_U,          TidyTag_UL,       TidyTag_VAR,  
      TidyTag_WBR,        TidyTag_XMP,      N_TIDY_TAGS
    );

  TidyAttrId = (
      TidyAttr_UNKNOWN,           TidyAttr_ABBR,            TidyAttr_ACCEPT,
      TidyAttr_ACCEPT_CHARSET,    TidyAttr_ACCESSKEY,       TidyAttr_ACTION,  
      TidyAttr_ADD_DATE,          TidyAttr_ALIGN,           TidyAttr_ALINK,  
      TidyAttr_ALT,               TidyAttr_ARCHIVE,         TidyAttr_AXIS,  
      TidyAttr_BACKGROUND,        TidyAttr_BGCOLOR,         TidyAttr_BGPROPERTIES,  
      TidyAttr_BORDER,            TidyAttr_BORDERCOLOR,     TidyAttr_BOTTOMMARGIN,  
      TidyAttr_CELLPADDING,       TidyAttr_CELLSPACING,     TidyAttr_CHAR,  
      TidyAttr_CHAROFF,           TidyAttr_CHARSET,         TidyAttr_CHECKED,  
      TidyAttr_CITE,              TidyAttr_CLASS,           TidyAttr_CLASSID,  
      TidyAttr_CLEAR,             TidyAttr_CODE,            TidyAttr_CODEBASE,  
      TidyAttr_CODETYPE,          TidyAttr_COLOR,           TidyAttr_COLS,  
      TidyAttr_COLSPAN,           TidyAttr_COMPACT,         TidyAttr_CONTENT,  
      TidyAttr_COORDS,            TidyAttr_DATA,            TidyAttr_DATAFLD,  
      TidyAttr_DATAFORMATAS,      TidyAttr_DATAPAGESIZE,    TidyAttr_DATASRC,  
      TidyAttr_DATETIME,          TidyAttr_DECLARE,         TidyAttr_DEFER,  
      TidyAttr_DIR,               TidyAttr_DISABLED,        TidyAttr_ENCODING,  
      TidyAttr_ENCTYPE,           TidyAttr_FACE,            TidyAttr_FOR,  
      TidyAttr_FRAME,             TidyAttr_FRAMEBORDER,     TidyAttr_FRAMESPACING,  
      TidyAttr_GRIDX,             TidyAttr_GRIDY,           TidyAttr_HEADERS,  
      TidyAttr_HEIGHT,            TidyAttr_HREF,            TidyAttr_HREFLANG,  
      TidyAttr_HSPACE,            TidyAttr_HTTP_EQUIV,      TidyAttr_ID,  
      TidyAttr_ISMAP,             TidyAttr_LABEL,           TidyAttr_LANG,  
      TidyAttr_LANGUAGE,          TidyAttr_LAST_MODIFIED,   TidyAttr_LAST_VISIT,  
      TidyAttr_LEFTMARGIN,        TidyAttr_LINK,            TidyAttr_LONGDESC,  
      TidyAttr_LOWSRC,            TidyAttr_MARGINHEIGHT,    TidyAttr_MARGINWIDTH,  
      TidyAttr_MAXLENGTH,         TidyAttr_MEDIA,           TidyAttr_METHOD,  
      TidyAttr_MULTIPLE,          TidyAttr_NAME,            TidyAttr_NOHREF,  
      TidyAttr_NORESIZE,          TidyAttr_NOSHADE,         TidyAttr_NOWRAP,  
      TidyAttr_OBJECT,            TidyAttr_OnAFTERUPDATE,   TidyAttr_OnBEFOREUNLOAD,  
      TidyAttr_OnBEFOREUPDATE,    TidyAttr_OnBLUR,          TidyAttr_OnCHANGE,  
      TidyAttr_OnCLICK,           TidyAttr_OnDATAAVAILABLE, TidyAttr_OnDATASETCHANGED,  
      TidyAttr_OnDATASETCOMPLETE, TidyAttr_OnDBLCLICK,      TidyAttr_OnERRORUPDATE,  
      TidyAttr_OnFOCUS,           TidyAttr_OnKEYDOWN,       TidyAttr_OnKEYPRESS,  
      TidyAttr_OnKEYUP,           TidyAttr_OnLOAD,          TidyAttr_OnMOUSEDOWN,  
      TidyAttr_OnMOUSEMOVE,       TidyAttr_OnMOUSEOUT,      TidyAttr_OnMOUSEOVER,  
      TidyAttr_OnMOUSEUP,         TidyAttr_OnRESET,         TidyAttr_OnROWENTER,  
      TidyAttr_OnROWEXIT,         TidyAttr_OnSELECT,        TidyAttr_OnSUBMIT,  
      TidyAttr_OnUNLOAD,          TidyAttr_PROFILE,         TidyAttr_PROMPT,  
      TidyAttr_RBSPAN,            TidyAttr_READONLY,        TidyAttr_REL,  
      TidyAttr_REV,               TidyAttr_RIGHTMARGIN,     TidyAttr_ROWS,  
      TidyAttr_ROWSPAN,           TidyAttr_RULES,           TidyAttr_SCHEME,  
      TidyAttr_SCOPE,             TidyAttr_SCROLLING,       TidyAttr_SELECTED,  
      TidyAttr_SHAPE,             TidyAttr_SHOWGRID,        TidyAttr_SHOWGRIDX,  
      TidyAttr_SHOWGRIDY,         TidyAttr_SIZE,            TidyAttr_SPAN,  
      TidyAttr_SRC,               TidyAttr_STANDBY,         TidyAttr_START,  
      TidyAttr_STYLE,             TidyAttr_SUMMARY,         TidyAttr_TABINDEX,  
      TidyAttr_TARGET,            TidyAttr_TEXT,            TidyAttr_TITLE,  
      TidyAttr_TOPMARGIN,         TidyAttr_TYPE,            TidyAttr_USEMAP,  
      TidyAttr_VALIGN,            TidyAttr_VALUE,           TidyAttr_VALUETYPE,  
      TidyAttr_VERSION,           TidyAttr_VLINK,           TidyAttr_VSPACE,  
      TidyAttr_WIDTH,             TidyAttr_WRAP,            TidyAttr_XML_LANG,  
      TidyAttr_XML_SPACE,         TidyAttr_XMLNS,           N_TIDY_ATTRIBS
    );

  TidyOptionId = (
   TidyUnknownOption,   TidyIndentSpaces,    TidyWrapLen,          TidyTabSize, 
   TidyCharEncoding,    TidyInCharEncoding,  TidyOutCharEncoding,  TidyNewline,
                                                                   TidyDoctypeMode, 
   TidyDoctype,         TidyDuplicateAttrs,  TidyAltText,          TidySlideStyle, 
   TidyErrFile,
   TidyOutFile,         TidyWriteBack,       TidyShowMarkup,       TidyShowWarnings,
   TidyQuiet,           TidyIndentContent,   TidyHideEndTags,      TidyXmlTags, 
   TidyXmlOut,          TidyXhtmlOut,        TidyHtmlOut,          TidyXmlDecl, 
   TidyUpperCaseTags,   TidyUpperCaseAttrs,  TidyMakeBare,         TidyMakeClean,
   TidyLogicalEmphasis, TidyDropPropAttrs,   TidyDropFontTags,     TidyDropEmptyParas, 
   TidyFixComments,     TidyBreakBeforeBR,   TidyBurstSlides,      TidyNumEntities, 
   TidyQuoteMarks,      TidyQuoteNbsp,       TidyQuoteAmpersand,   TidyWrapAttVals,
   TidyWrapScriptlets,  TidyWrapSection,     TidyWrapAsp,          TidyWrapJste, 
   TidyWrapPhp,         TidyFixBackslash,    TidyIndentAttributes, TidyXmlPIs, 
   TidyXmlSpace,        TidyEncloseBodyText, TidyEncloseBlockText, TidyKeepFileTimes, 
   TidyWord2000,        TidyMark,            TidyEmacs,            TidyEmacsFile,
   TidyLiteralAttribs,  TidyBodyOnly,        TidyFixUri,           TidyLowerLiterals,
   TidyHideComments,    TidyIndentCdata,     TidyForceOutput,      TidyShowErrors,
   TidyAsciiChars,      TidyJoinClasses,     TidyJoinStyles,       TidyEscapeCdata,
   TidyLanguage,        TidyNCR,
   TidyOutputBOM,
   TidyReplaceColor,    TidyCSSPrefix,       TidyInlineTags,       TidyBlockTags, 
   TidyEmptyTags,       TidyPreTags,         TidyAccessibilityCheckLevel, 
   N_TIDY_OPTIONS);

   TidyEncodingID = (
     TidyRaw, TidyASCII, TidyLatin1, TidyUTF8, TidyISO2022, TidyMacRoman,
     TidyWin1252,  TidyUTF16le,  TidyUTF16be,  TidyUTF16, TidyBig5,
     TidyShiftJIS);

   TidyDoctypeModes = (TidyDoctypeOmit, TidyDoctypeAuto, TidyDoctypeStrict,
                       TidyDoctypeLoose, TidyDoctypeUser);
   TidyDupAttrModes = (TidyKeepFirst, TidyKeepLast);

implementation

end.
