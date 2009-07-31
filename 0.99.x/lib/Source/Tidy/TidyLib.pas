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

$Id: TidyLib.pas,v 1.2 2004/07/03 11:15:30 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynEditExport.pas, released 2000-04-16.

The Original Code is partly based on the mwExport.pas file from the
mwEdit component suite by Martin Waldenburg and other developers, the Initial
Author of this file is Michael Hieke.
Portions created by Michael Hieke are Copyright 2000 Michael Hieke.
Portions created by James D. Jacobson are Copyright 1999 Martin Waldenburg.
All Rights Reserved.

Contributors to the SynEdit project are listed in the Contributors.txt file.

-----------------------------------------------------------------------------}

unit TidyLib;

interface

uses
  SysUtils, Classes, Windows,
  TidyGlobal, TidyEnums, TidyOpaqueTypes, TidyBasicOperations,
  TidyDocumentTree, TidyIO, TidyDocumentParse, TidyConfigurationOptions,
  TidyDiagnosticsAndRepair, TidyDocumentSave;

type
  TTidyReportEvent = procedure(Sender: TObject; TidyDocument: TidyDoc;
                               ReportLevel: TidyReportLevel;
                               Line, Col: LongWord;
                               Message: string;
                               var KillMessage: boolean) of object;
                               
  TTidyConfiguration = class(TPersistent)
  private
    FLiteralAttribs: Boolean;
    FMakeBare: Boolean;
    FWrapAsp: Boolean;
    FCSSPrefix: string;
    FFixBackslash: Boolean;
    FShowMarkup: Boolean;
    FJoinClasses: Boolean;
    FFixUri: Boolean;
    FXmlSpace: Boolean;
    FWrapScriptlets: Boolean;
    FWrapSection: Boolean;
    FEncloseBodyText: Boolean;
    FXmlPIs: Boolean;
    FAsciiChars: Boolean;
    FReplaceColor: Boolean;
    FForceOutput: Boolean;
    FWrapJste: Boolean;
    FHideComments: Boolean;
    FWrapAttVals: Boolean;
    FDropFontTags: Boolean;
    FXmlOut: Boolean;
    FBreakBeforeBR: Boolean;
    FEmacs: Boolean;
    FNumEntities: Boolean;
    FFixComments: Boolean;
    FEncloseBlockText: Boolean;
    FDropEmptyParas: Boolean;
    FLogicalEmphasis: Boolean;
    FUpperCaseTags: Boolean;
    FJoinStyles: Boolean;
    FLowerLiterals: Boolean;
    FXhtmlOut: Boolean;
    FWriteBack: Boolean;
    FXmlDecl: Boolean;
    FEscapeCdata: Boolean;
    FMark: Boolean;
    FXmlTags: Boolean;
    FQuoteAmpersand: Boolean;
    FIndentAttributes: Boolean;
    FIndentCdata: Boolean;
    FQuiet: Boolean;
    FWord2000: Boolean;
    FMakeClean: Boolean;
    FQuoteMarks: Boolean;
    FDropPropAttrs: Boolean;
    FNCR: boolean;
    FWrapPhp: Boolean;
    FKeepFileTimes: Boolean;
    FUpperCaseAttrs: Boolean;
    FHtmlOut: Boolean;
    FBurstSlides: Boolean;
    FHideEndTags: Boolean;
    FShowWarnings: Boolean;
    FBodyOnly: Boolean;
    FQuoteNbsp: Boolean;
    FAccessibilityCheckLevel: LongWord;
    FDoctypeMode: LongWord;
    FWrapLen: LongWord;
    FShowErrors: LongWord;
    FIndentSpaces: LongWord;
    FTabSize: LongWord;
    FBlockTags: string;
    FInlineTags: string;
    FEmacsFile: string;
    FErrFile: string;
    FPreTags: string;
    FEmptyTags: string;
    FSlideStyle: string;
    FAltText: string;
    FDoctype: string;
    FDuplicateAttrs: TidyDupAttrModes;
    FInCharEncoding: TidyEncodingID;
    FCharEncoding: TidyEncodingID;
    FOutCharEncoding: TidyEncodingID;
    FOutputBOM: TTidyTriState;
    FIndentContent: TTidyTriState;
  public
    constructor Create;
  published
    property IndentSpaces: LongWord read FIndentSpaces write FIndentSpaces;
    property WrapLen: LongWord read FWrapLen write FWrapLen;
    property TabSize: LongWord read FTabSize write FTabSize;
    property CharEncoding: TidyEncodingID read FCharEncoding write FCharEncoding;
    property InCharEncoding: TidyEncodingID read FInCharEncoding write FInCharEncoding;
    property OutCharEncoding: TidyEncodingID read FOutCharEncoding write FOutCharEncoding;
    property DoctypeMode: LongWord read FDoctypeMode write FDoctypeMode;
    property Doctype: string read FDoctype write FDoctype;
    property DuplicateAttrs: TidyDupAttrModes read FDuplicateAttrs write FDuplicateAttrs;
    property AltText: string read FAltText write FAltText;
    property SlideStyle: string read FSlideStyle write FSlideStyle;
    property ErrFile: string read FErrFile write FErrFile;
    property WriteBack: Boolean read FWriteBack write FWriteBack;
    property ShowMarkup: Boolean read FShowMarkup write FShowMarkup;
    property ShowWarnings: Boolean read FShowWarnings write FShowWarnings;
    property Quiet: Boolean read FQuiet write FQuiet;
    property IndentContent: TTidyTriState read FIndentContent write FIndentContent;
    property HideEndTags: Boolean read FHideEndTags write FHideEndTags;
    property XmlTags: Boolean read FXmlTags write FXmlTags;
    property XmlOut: Boolean read FXmlOut write FXmlOut;
    property XhtmlOut: Boolean read FXhtmlOut write FXhtmlOut;
    property HtmlOut: Boolean read FHtmlOut write FHtmlOut;
    property XmlDecl: Boolean read FXmlDecl write FXmlDecl;
    property UpperCaseTags: Boolean read FUpperCaseTags write FUpperCaseTags;
    property UpperCaseAttrs: Boolean read FUpperCaseAttrs write FUpperCaseAttrs;
    property MakeBare: Boolean read FMakeBare write FMakeBare;
    property MakeClean: Boolean read FMakeClean write FMakeClean;
    property LogicalEmphasis: Boolean read FLogicalEmphasis write FLogicalEmphasis;
    property DropPropAttrs: Boolean read FDropPropAttrs write FDropPropAttrs;
    property DropFontTags: Boolean read FDropFontTags write FDropFontTags;
    property DropEmptyParas: Boolean read FDropEmptyParas write FDropEmptyParas;
    property FixComments: Boolean read FFixComments write FFixComments;
    property BreakBeforeBR: Boolean read FBreakBeforeBR write FBreakBeforeBR;
    property BurstSlides: Boolean read FBurstSlides write FBurstSlides;
    property NumEntities: Boolean read FNumEntities write FNumEntities;
    property QuoteMarks: Boolean read FQuoteMarks write FQuoteMarks;
    property QuoteNbsp: Boolean read FQuoteNbsp write FQuoteNbsp;
    property QuoteAmpersand: Boolean read FQuoteAmpersand write FQuoteAmpersand;
    property WrapAttVals: Boolean read FWrapAttVals write FWrapAttVals;
    property WrapScriptlets: Boolean read FWrapScriptlets write FWrapScriptlets;
    property WrapSection: Boolean read FWrapSection write FWrapSection;
    property WrapAsp: Boolean read FWrapAsp write FWrapAsp;
    property WrapJste: Boolean read FWrapJste write FWrapJste;
    property WrapPhp: Boolean read FWrapPhp write FWrapPhp;
    property FixBackslash: Boolean read FFixBackslash write FFixBackslash;
    property IndentAttributes: Boolean read FIndentAttributes write FIndentAttributes;
    property XmlPIs: Boolean read FXmlPIs write FXmlPIs;
    property XmlSpace: Boolean read FXmlSpace write FXmlSpace;
    property EncloseBodyText: Boolean read FEncloseBodyText write FEncloseBodyText;
    property EncloseBlockText: Boolean read FEncloseBlockText write FEncloseBlockText;
    property KeepFileTimes: Boolean read FKeepFileTimes write FKeepFileTimes;
    property Word2000: Boolean read FWord2000 write FWord2000;
    property Mark: Boolean read FMark write FMark;
    property Emacs: Boolean read FEmacs write FEmacs;
    property EmacsFile: string read FEmacsFile write FEmacsFile;
    property LiteralAttribs: Boolean read FLiteralAttribs write FLiteralAttribs;
    property BodyOnly: Boolean read FBodyOnly write FBodyOnly;
    property FixUri: Boolean read FFixUri write FFixUri;
    property LowerLiterals: Boolean read FLowerLiterals write FLowerLiterals;
    property HideComments: Boolean read FHideComments write FHideComments;
    property IndentCdata: Boolean read FIndentCdata write FIndentCdata;
    property ForceOutput: Boolean read FForceOutput write FForceOutput;
    property ShowErrors: LongWord read FShowErrors write FShowErrors;
    property AsciiChars: Boolean read FAsciiChars write FAsciiChars;
    property JoinClasses: Boolean read FJoinClasses write FJoinClasses;
    property JoinStyles: Boolean read FJoinStyles write FJoinStyles;
    property EscapeCdata: Boolean read FEscapeCdata write FEscapeCdata;
    property ReplaceColor: Boolean read FReplaceColor write FReplaceColor;
    property CSSPrefix: string read FCSSPrefix write FCSSPrefix;
    property InlineTags: string read FInlineTags write FInlineTags;
    property BlockTags: string read FBlockTags write FBlockTags;
    property EmptyTags: string read FEmptyTags write FEmptyTags;
    property PreTags: string read FPreTags write FPreTags;
    property AccessibilityCheckLevel: LongWord read FAccessibilityCheckLevel write FAccessibilityCheckLevel;
    property OutputBOM: TTidyTriState read FOutputBOM write FOutputBOM;
    property NCR: boolean read FNCR write FNCR;
  end;

  TLibTidy = class(TComponent)
  private
    FConfiguration: TTidyConfiguration;
    FTidyDocument: TidyDoc;
    fReportFilter: TidyReportFilter;
    fOnReport: TTidyReportEvent;
    procedure SetTidyConfiguration(const Value: TTidyConfiguration);
    function GetTidyLibReleaseDate: string;
    function GetTidyNode: TidyNode;
    function GetAccessWarningCount: LongWord;
    function GetConfigErrorCount: LongWord;
    function GetErrorCount: LongWord;
    function GetStatus: LongInt;
    function GetWarningCount: LongWord;
    procedure SetOnReport(const Value: TTidyReportEvent);
    procedure SetReportFilter(const Value: TidyReportFilter);
    function GetDoctypeMode: LongWord;
  protected
    procedure FreeEverything;
    function GetOutput: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Reset;

    procedure ResetConfig;
    function LoadConfigFile(const AFilename: string): boolean;
    function SaveConfigFile(const AFilename: string): boolean;

    function ParseFile(const AFilename: string): boolean;
    function ParseString(const AInputString: string): boolean;
    function ParseStdin: boolean;

    // moved to public
    procedure LoadConfigFromTidy;
    procedure AssignConfigToTidy;

    function CleanAndRepairOnly: string;
    function RunDiagnosticsAndRepair: string;

    property TidyDocument: TidyDoc read FTidyDocument;
    property TidyDocRootNode: TidyNode read GetTidyNode;
    property DoctypeMode: LongWord read GetDoctypeMode;
    property ErrorCount: LongWord read GetErrorCount;
    property WarningCount: LongWord read GetWarningCount;
    property AccessWarningCount: LongWord read GetAccessWarningCount;
    property ConfigErrorCount: LongWord read GetConfigErrorCount;
    property Status: LongInt read GetStatus;
    property ReportCallback: TidyReportFilter read fReportFilter write SetReportFilter;
  published
    property Configuration: TTidyConfiguration read FConfiguration write SetTidyConfiguration;
    property OnReport: TTidyReportEvent read fOnReport write SetOnReport;
    property TidyLibReleaseDate: string read GetTidyLibReleaseDate;
  end;

function DoReport(Doc: TidyDoc;  lvl: TidyReportLevel;  line, col: LongWord;
                  mssg: PChar): Bool; cdecl;

procedure Register;

implementation

{ Functions }

procedure Register;
Begin
  RegisterComponents('ConTEXT Components', [TLibTidy]);
end;

function DoReport(Doc: TidyDoc;  lvl: TidyReportLevel;  line, col: LongWord;
                  mssg: PChar): Bool; cdecl;
var KillMessage: boolean;
    TidyObj: TLibTidy;
begin
  Result := True;
  KillMessage := False;
  TidyObj := TLibTidy(tidyGetAppData(Doc));
  
  if (TidyObj <> nil) then
    with TidyObj do begin
      if Assigned(OnReport) then begin
        OnReport(TidyObj, Doc, lvl, line, col, AnsiString(mssg), KillMessage);
        Result := KillMessage;
    end;
  end;
end;

{ TLibTidy }

constructor TLibTidy.Create(AOwner: TComponent);
begin
  inherited;

  if (_GlobalTidyLibHandle = 0) then
    // Try to initialize TidyLib
    if not TidyGlobal.LoadTidyLibrary then Begin
      if csDesigning in ComponentState then Begin
        MessageBox(0, 'LibTidy not initialized. Make sure a libtidy.dll is available or ' +
                               'create THTMLTidy instances at runtime, after you have called ' +
                               'TidyGlobal.InitTidyLibrary.', 'LibTidy is not available', MB_ICONERROR);
        SysUtils.Abort;
      end else Begin
        raise Exception.Create('LibTidy not initialized.');
      end;
    end;

  Reset;
end;

destructor TLibTidy.Destroy;
begin
  FreeEverything;
  inherited;
end;

procedure TLibTidy.FreeEverything;
begin
  if FTidyDocument <> nil then tidyRelease(FTidyDocument);
  if FConfiguration <> nil then FConfiguration.Free;
end;

function TLibTidy.GetAccessWarningCount: LongWord;
begin
  Result := tidyAccessWarningCount(fTidyDocument);
end;

function TLibTidy.GetConfigErrorCount: LongWord;
begin
  Result := tidyConfigErrorCount(fTidyDocument);
end;

function TLibTidy.GetErrorCount: LongWord;
begin
  Result := tidyErrorCount(fTidyDocument);
end;

function TLibTidy.GetStatus: LongInt;
begin
  Result := tidyStatus(FTidyDocument)
end;

function TLibTidy.GetTidyLibReleaseDate: string;
begin
  Result := tidyReleaseDate;
end;

function TLibTidy.GetTidyNode: TidyNode;
begin
  Result := tidyGetRoot(FTidyDocument);
end;

function TLibTidy.GetWarningCount: LongWord;
begin
  Result := tidyWarningCount(fTidyDocument);
end;

procedure TLibTidy.LoadConfigFromTidy;
begin
  with FConfiguration do
  begin
    FIndentSpaces := tidyOptGetInt(FTidyDocument, TidyIndentSpaces);
    FWrapLen := tidyOptGetInt(FTidyDocument, TidyWrapLen);
    FTabSize := tidyOptGetInt(FTidyDocument, TidyTabSize);
    FCharEncoding := TidyEncodingID(tidyOptGetInt(FTidyDocument, TidyCharEncoding));
    FInCharEncoding := TidyEncodingID(tidyOptGetInt(FTidyDocument, TidyInCharEncoding));
    FOutCharEncoding := TidyEncodingID(tidyOptGetInt(FTidyDocument, TidyOutCharEncoding));
    FDoctypeMode := tidyOptGetInt(FTidyDocument, TidyDoctypeMode);
    FDoctype := tidyOptGetValue(FTidyDocument, TidyDoctype);
    FDuplicateAttrs := TidyDupAttrModes(tidyOptGetInt(FTidyDocument, TidyDuplicateAttrs));
    FAltText := tidyOptGetValue(FTidyDocument, TidyAltText);
    FSlideStyle := tidyOptGetValue(FTidyDocument, TidySlideStyle);
    FErrFile := tidyOptGetValue(FTidyDocument, TidyErrFile);
    FWriteBack := tidyOptGetBool(FTidyDocument, TidyWriteBack);
    FShowMarkup := tidyOptGetBool(FTidyDocument, TidyShowMarkup);
    FShowWarnings := tidyOptGetBool(FTidyDocument, TidyShowWarnings);
    FQuiet := tidyOptGetBool(FTidyDocument, TidyQuiet);
    FIndentContent := TTidyTriState(tidyOptGetInt(FTidyDocument, TidyIndentContent));
    FHideEndTags := tidyOptGetBool(FTidyDocument, TidyHideEndTags);
    FXmlTags := tidyOptGetBool(FTidyDocument, TidyXmlTags);
    FXmlOut := tidyOptGetBool(FTidyDocument, TidyXmlOut);
    FXhtmlOut := tidyOptGetBool(FTidyDocument, TidyXhtmlOut);
    FHtmlOut := tidyOptGetBool(FTidyDocument, TidyHtmlOut);
    FXmlDecl := tidyOptGetBool(FTidyDocument, TidyXmlDecl);
    FUpperCaseTags := tidyOptGetBool(FTidyDocument, TidyUpperCaseTags);
    FUpperCaseAttrs := tidyOptGetBool(FTidyDocument, TidyUpperCaseAttrs);
    FMakeBare := tidyOptGetBool(FTidyDocument, TidyMakeBare);
    FMakeClean := tidyOptGetBool(FTidyDocument, TidyMakeClean);
    FLogicalEmphasis := tidyOptGetBool(FTidyDocument, TidyLogicalEmphasis);
    FDropPropAttrs := tidyOptGetBool(FTidyDocument, TidyDropPropAttrs);
    FDropFontTags := tidyOptGetBool(FTidyDocument, TidyDropFontTags);
    FDropEmptyParas := tidyOptGetBool(FTidyDocument, TidyDropEmptyParas);
    FFixComments := tidyOptGetBool(FTidyDocument, TidyFixComments);
    FBreakBeforeBR := tidyOptGetBool(FTidyDocument, TidyBreakBeforeBR);
    FBurstSlides := tidyOptGetBool(FTidyDocument, TidyBurstSlides);
    FNumEntities := tidyOptGetBool(FTidyDocument, TidyNumEntities);
    FQuoteMarks := tidyOptGetBool(FTidyDocument, TidyQuoteMarks);
    FQuoteNbsp := tidyOptGetBool(FTidyDocument, TidyQuoteNbsp);
    FQuoteAmpersand := tidyOptGetBool(FTidyDocument, TidyQuoteAmpersand);
    FWrapAttVals := tidyOptGetBool(FTidyDocument, TidyWrapAttVals);
    FWrapScriptlets := tidyOptGetBool(FTidyDocument, TidyWrapScriptlets);
    FWrapSection := tidyOptGetBool(FTidyDocument, TidyWrapSection);
    FWrapAsp := tidyOptGetBool(FTidyDocument, TidyWrapAsp);
    FWrapJste := tidyOptGetBool(FTidyDocument, TidyWrapJste);
    FWrapPhp := tidyOptGetBool(FTidyDocument, TidyWrapPhp);
    FFixBackslash := tidyOptGetBool(FTidyDocument, TidyFixBackslash);
    FIndentAttributes := tidyOptGetBool(FTidyDocument, TidyIndentAttributes);
    FXmlPIs := tidyOptGetBool(FTidyDocument, TidyXmlPIs);
    FXmlSpace := tidyOptGetBool(FTidyDocument, TidyXmlSpace);
    FEncloseBodyText := tidyOptGetBool(FTidyDocument, TidyEncloseBodyText);
    FEncloseBlockText := tidyOptGetBool(FTidyDocument, TidyEncloseBlockText);
    FKeepFileTimes := tidyOptGetBool(FTidyDocument, TidyKeepFileTimes);
    FWord2000 := tidyOptGetBool(FTidyDocument, TidyWord2000);
    FMark := tidyOptGetBool(FTidyDocument, TidyMark);
    FEmacs := tidyOptGetBool(FTidyDocument, TidyEmacs);
    FEmacsFile := tidyOptGetValue(FTidyDocument, TidyEmacsFile);
    FLiteralAttribs := tidyOptGetBool(FTidyDocument, TidyLiteralAttribs);
    FBodyOnly := tidyOptGetBool(FTidyDocument, TidyBodyOnly);
    FFixUri := tidyOptGetBool(FTidyDocument, TidyFixUri);
    FLowerLiterals := tidyOptGetBool(FTidyDocument, TidyLowerLiterals);
    FHideComments := tidyOptGetBool(FTidyDocument, TidyHideComments);
    FIndentCdata := tidyOptGetBool(FTidyDocument, TidyIndentCdata);
    FForceOutput := tidyOptGetBool(FTidyDocument, TidyForceOutput);
    FShowErrors := tidyOptGetInt(FTidyDocument, TidyShowErrors);
    FAsciiChars := tidyOptGetBool(FTidyDocument, TidyAsciiChars);
    FJoinClasses := tidyOptGetBool(FTidyDocument, TidyJoinClasses);
    FJoinStyles := tidyOptGetBool(FTidyDocument, TidyJoinStyles);
    FEscapeCdata := tidyOptGetBool(FTidyDocument, TidyEscapeCdata);
    FReplaceColor := tidyOptGetBool(FTidyDocument, TidyReplaceColor);
    FCSSPrefix := tidyOptGetValue(FTidyDocument, TidyCSSPrefix);
    FInlineTags := tidyOptGetValue(FTidyDocument, TidyInlineTags);
    FBlockTags := tidyOptGetValue(FTidyDocument, TidyBlockTags);
    FEmptyTags := tidyOptGetValue(FTidyDocument, TidyEmptyTags);
    FPreTags := tidyOptGetValue(FTidyDocument, TidyPreTags);
    FAccessibilityCheckLevel := tidyOptGetInt(FTidyDocument, TidyAccessibilityCheckLevel);
    FOutputBOM := TTidyTriState(tidyOptGetInt(FTidyDocument, TidyOutputBOM));
    FNCR := tidyOptGetBool(FTidyDocument, TidyNCR);
    // This seems to be TidyLib Issue: An emtpy string as DocType is invalid,
    // but it's the standard value. We have to set it manually
    if FDocType = '' then FDocType := 'auto';
  end;
end;

function TLibTidy.LoadConfigFile(const AFilename: string): boolean;
begin
  Result := tidyLoadConfig(FTidyDocument, PChar(AFilename)) >= 0;
  LoadConfigFromTidy;
end;

function TLibTidy.ParseFile(const AFilename: string): boolean;
begin
  AssignConfigToTidy;
  Result := tidyParseFile(FTidyDocument, PChar(AFileName)) >= 0;
end;

function TLibTidy.ParseStdin: boolean;
begin
  AssignConfigToTidy;
  Result := tidyParseStdin(FTidyDocument) >= 0;
end;

function TLibTidy.ParseString(const AInputString: string): boolean;
begin
  AssignConfigToTidy;
  Result := tidyParseString(FTidyDocument, PChar(AInputString)) >= 0;
end;

procedure TLibTidy.Reset;
begin
  FreeEverything;

  FConfiguration := TTidyConfiguration.Create;

  FTidyDocument := tidyCreate;
  tidySetAppData(FTidyDocument, Self);

  ResetConfig;  

  if (Assigned(fOnReport)) then SetOnReport(fOnReport)
  else if (fReportFilter <> nil) then SetReportFilter(fReportFilter);
end;

procedure TLibTidy.ResetConfig;
begin
  tidyOptResetAllToDefault(FTidyDocument);
  LoadConfigFromTidy;
end;

function TLibTidy.SaveConfigFile(const AFilename: string): boolean;
begin
  AssignConfigToTidy;
  Result := tidyOptSaveFile(FTidyDocument, PChar(AFilename)) >= 0;
end;

procedure TLibTidy.SetOnReport(const Value: TTidyReportEvent);
begin
  fReportFilter := nil;
  fOnReport := Value;
  if (not Assigned(Value)) then tidySetReportFilter(FTidyDocument, nil)
  else tidySetReportFilter(FTidyDocument, @DoReport);
end;

procedure TLibTidy.SetReportFilter(const Value: TidyReportFilter);
begin
  fOnReport := nil;
  fReportFilter := Value;
  tidySetReportFilter(FTidyDocument, fReportFilter);
end;

procedure TLibTidy.SetTidyConfiguration(const Value: TTidyConfiguration);
begin
  FConfiguration := Value;
end;

function TLibTidy.GetDoctypeMode: LongWord;
begin
  Result := tidyOptGetInt(FTidyDocument, TidyDoctypeMode);
end;

function TLibTidy.CleanAndRepairOnly: string;
begin
  AssignConfigToTidy;
  tidyCleanAndRepair(FTidyDocument);
  Result := GetOutput;
end;

function TLibTidy.RunDiagnosticsAndRepair: string;
begin
  CleanAndRepairOnly;
  tidyRunDiagnostics(FTidyDocument);
  Result := GetOutput;
end;

function TLibTidy.GetOutput: string;
var L: LongWord;
    R: string;
begin
  L := 1;
  SetLength(R, L);
  if tidySaveString(FTidyDocument, @R[1], @L) = -12 then begin
    SetLength(R, L);
    tidySaveString(FTidyDocument, @R[1], @L);
  end;
  Result := R;
  if (length(Result) < 3) and (Result[1] in [#10, #13]) then Result := '';
end;

// Well, this is really fucking weird. In the meantime, I am totally confused
// and I have no idea what this is about, what's right and what's wrong, and
// why it is as it is. All I can hope is that it is finally working.
// When I released version 1.0 of this package, AssignConfigToTidy() looked
// exactly as it is now, using a tidyOptSetBool() call for setting boolean
// option values.
// Then, while working on OpenWebBuilder, I noticed that there's something
// wrong - all boolean options where not assigned correctly. I was not able
// to find out why, however, it worked when using an additional funktion, e.g.
// AssignBoolToTidy(), which then in return called tidyOptSetBool() - no clue
// why. So I released version 1.1 with using this rewrite technique.
// Then David Esperalta contacted me: the new version of TidyLib was not
// working for him - the boolean options are not assigned correctly. Huh?
// So I played a bit around, and noticed that the rewrite technique NO
// LONGER WORKED FOR ME! (Damn, no *fucking* clue why). So I tried calling
// tidyOptSetBool directly, as it was in version 1.0 - and it WORKS!?
// Well, you would assume that it should work with variations, but .. <sigh>
procedure TLibTidy.AssignConfigToTidy;
begin
  with FConfiguration do
  begin
    tidyOptSetInt(FTidyDocument, TidyIndentSpaces, IndentSpaces);
    tidyOptSetInt(FTidyDocument, TidyWrapLen, WrapLen);
    tidyOptSetInt(FTidyDocument, TidyTabSize, TabSize);
    tidyOptSetInt(FTidyDocument, TidyCharEncoding, Integer(FCharEncoding));
    tidyOptSetInt(FTidyDocument, TidyInCharEncoding, Integer(FInCharEncoding));
    tidyOptSetInt(FTidyDocument, TidyOutCharEncoding, Integer(FOutCharEncoding));
    tidyOptSetValue(FTidyDocument, TidyDoctype, PChar(FDoctype));
    tidyOptSetInt(FTidyDocument, TidyDoctypeMode, DoctypeMode);
    tidyOptSetInt(FTidyDocument, TidyDuplicateAttrs, Integer(DuplicateAttrs));
    tidyOptSetValue(FTidyDocument, TidyAltText, PChar(FAltText));
    //tidyOptSetValue(FTidyDocument, TidySlideStyle, PChar(FSlideStyle));  // not used yet
    tidyOptSetValue(FTidyDocument, TidyErrFile, PChar(FErrFile));
    tidyOptSetBool(FTidyDocument, TidyWriteBack, WriteBack);
    tidyOptSetBool(FTidyDocument, TidyShowMarkup, ShowMarkup);
    tidyOptSetBool(FTidyDocument, TidyShowWarnings, ShowWarnings);
    tidyOptSetBool(FTidyDocument, TidyQuiet, Quiet);
    tidyOptSetInt(FTidyDocument, TidyIndentContent, Integer(IndentContent));
    tidyOptSetBool(FTidyDocument, TidyHideEndTags, HideEndTags);
    tidyOptSetBool(FTidyDocument, TidyXmlTags, XmlTags);
    tidyOptSetBool(FTidyDocument, TidyXmlOut, XmlOut);
    tidyOptSetBool(FTidyDocument, TidyXhtmlOut, XHtmlOut);
    tidyOptSetBool(FTidyDocument, TidyHtmlOut, HTMLOut);
    tidyOptSetBool(FTidyDocument, TidyXmlDecl, XmlDecl);
    tidyOptSetBool(FTidyDocument, TidyUpperCaseTags, UpperCaseTags);
    tidyOptSetBool(FTidyDocument, TidyUpperCaseAttrs, UpperCaseAttrs);
    tidyOptSetBool(FTidyDocument, TidyMakeBare, MakeBare);
    tidyOptSetBool(FTidyDocument, TidyMakeClean, MakeClean);
    tidyOptSetBool(FTidyDocument, TidyLogicalEmphasis, LogicalEmphasis);
    tidyOptSetBool(FTidyDocument, TidyDropPropAttrs, DropPropAttrs);
    tidyOptSetBool(FTidyDocument, TidyDropFontTags, DropFontTags);
    tidyOptSetBool(FTidyDocument, TidyDropEmptyParas, DropEmptyParas);
    tidyOptSetBool(FTidyDocument, TidyFixComments, FixComments);
    tidyOptSetBool(FTidyDocument, TidyBreakBeforeBR, BreakBeforeBR);
    tidyOptSetBool(FTidyDocument, TidyBurstSlides, BurstSlides);
    tidyOptSetBool(FTidyDocument, TidyNumEntities, NumEntities);
    tidyOptSetBool(FTidyDocument, TidyQuoteMarks, QuoteMarks);
    tidyOptSetBool(FTidyDocument, TidyQuoteNbsp, QuoteNbsp);
    tidyOptSetBool(FTidyDocument, TidyQuoteAmpersand, QuoteAmpersand);
    tidyOptSetBool(FTidyDocument, TidyWrapAttVals, WrapAttVals);
    tidyOptSetBool(FTidyDocument, TidyWrapScriptlets, WrapScriptlets);
    tidyOptSetBool(FTidyDocument, TidyWrapSection, WrapSection);
    tidyOptSetBool(FTidyDocument, TidyWrapAsp, WrapAsp);
    tidyOptSetBool(FTidyDocument, TidyWrapJste, WrapJste);
    tidyOptSetBool(FTidyDocument, TidyWrapPhp, WrapPhp);
    tidyOptSetBool(FTidyDocument, TidyFixBackslash, FixBackslash);
    tidyOptSetBool(FTidyDocument, TidyIndentAttributes, IndentAttributes);
    tidyOptSetBool(FTidyDocument, TidyXmlPIs, XmlPIs);
    tidyOptSetBool(FTidyDocument, TidyXmlSpace, XmlSpace);
    tidyOptSetBool(FTidyDocument, TidyEncloseBodyText, EncloseBodyText);
    tidyOptSetBool(FTidyDocument, TidyEncloseBlockText, EncloseBlockText);
    tidyOptSetBool(FTidyDocument, TidyKeepFileTimes, KeepFileTimes);
    tidyOptSetBool(FTidyDocument, TidyWord2000, Word2000);
    tidyOptSetBool(FTidyDocument, TidyMark, Mark);
    tidyOptSetBool(FTidyDocument, TidyEmacs, Emacs);
    tidyOptSetValue(FTidyDocument, TidyEmacsFile, PChar(FEmacsFile));
    tidyOptSetBool(FTidyDocument, TidyLiteralAttribs, LiteralAttribs);
    tidyOptSetBool(FTidyDocument, TidyBodyOnly, BodyOnly);
    tidyOptSetBool(FTidyDocument, TidyFixUri, FixUri);
    tidyOptSetBool(FTidyDocument, TidyLowerLiterals, LowerLiterals);
    tidyOptSetBool(FTidyDocument, TidyHideComments, HideComments);
    tidyOptSetBool(FTidyDocument, TidyIndentCdata, IndentCdata);
    tidyOptSetBool(FTidyDocument, TidyForceOutput, ForceOutput);
    tidyOptSetInt(FTidyDocument, TidyShowErrors, ShowErrors);
    tidyOptSetBool(FTidyDocument, TidyAsciiChars, AsciiChars);
    tidyOptSetBool(FTidyDocument, TidyJoinClasses, JoinClasses);
    tidyOptSetBool(FTidyDocument, TidyJoinStyles, JoinStyles);
    tidyOptSetBool(FTidyDocument, TidyEscapeCdata, EscapeCdata);
    tidyOptSetBool(FTidyDocument, TidyReplaceColor, ReplaceColor);
    if FCSSPrefix <> '' then // if it is '', there is a configuration error in tidy !?
      tidyOptSetValue(FTidyDocument, TidyCSSPrefix, PChar(FCSSPrefix));
    tidyOptSetValue(FTidyDocument, TidyInlineTags, PChar(FInlineTags));
    tidyOptSetValue(FTidyDocument, TidyBlockTags, PChar(FBlockTags));
    tidyOptSetValue(FTidyDocument, TidyEmptyTags, PChar(FEmptyTags));
    tidyOptSetValue(FTidyDocument, TidyPreTags, PChar(FPreTags));
    tidyOptSetInt(FTidyDocument, TidyAccessibilityCheckLevel, AccessibilityCheckLevel);
    tidyOptSetInt(FTidyDocument, TidyOutputBOM, Integer(OutputBOM));
    tidyOptSetBool(FTidyDocument, TidyNCR, NCR);
  end;
end;

{ TTidyConfiguration }

constructor TTidyConfiguration.Create;
begin
  FDoctype := 'auto';
end;

end.

