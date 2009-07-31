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

$Id: TidyBasicOperations.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyBasicOperations;

interface

uses Windows,
     TidyOpaqueTypes, TidyIO;

type
  TtidyCreateFunc = function: TidyDoc; cdecl;
  TtidyReleaseFunc = procedure(doc: TidyDoc); cdecl;
  TtidySetAppDataFunc = procedure(doc: TidyDoc; appdata: Pointer); cdecl;
  TtidyGetAppDataFunc = function(doc: TidyDoc): Pointer; cdecl;
  TtidyReleaseDateFunc = function: PChar; cdecl;
  TtidyDetectedHtmlVersionFunc = function(doc: TidyDoc): LongInt; cdecl;
  TtidyDetectedXhtmlFunc = function(doc: TidyDoc): boolean; cdecl;
  TtidyDetectedGenericXmlFunc = function(doc: TidyDoc): boolean; cdecl;
  TtidyStatusFunc = function(doc: TidyDoc): LongInt; cdecl;
  TtidyErrorCountFunc = function(doc: TidyDoc): UInt; cdecl;
  TtidyWarningCountFunc = function(doc: TidyDoc): UInt; cdecl;
  TtidyAccessWarningCountFunc = function(doc: TidyDoc): UInt; cdecl;
  TtidyConfigErrorCountFunc = function(doc: TidyDoc): UInt; cdecl;
  TtidyLoadConfigFunc = function(doc: TidyDoc; configFile: PChar): LongInt; cdecl;
  TtidyLoadConfigEncFunc = function(doc: TidyDoc; configFile: PChar; charenc: PChar): LongInt; cdecl;
  TtidySetCharEncodingFunc = function(doc: TidyDoc; encnam: PChar): LongInt; cdecl;
  TtidyOptSaveFileFunc = function(doc: TidyDoc; cfgfil: PChar): LongInt; cdecl;
  TtidyOptSaveSinkFunc = function (doc: TidyDoc; sink: TidyOutputSink): LongInt; cdecl;
  TtidyErrorSummaryFunc = procedure(doc: TidyDoc); cdecl;
  TtidyGeneralInfoFunc = procedure(doc: TidyDoc); cdecl;

var
  tidyCreate: TtidyCreateFunc;
  tidyRelease: TtidyReleaseFunc;
  tidySetAppData: TtidySetAppDataFunc;
  tidyGetAppData: TtidyGetAppDataFunc;
  tidyReleaseDate: TtidyReleaseDateFunc;
  tidyDetectedHTMLVersion: TtidyDetectedHTMLVersionFunc;
  tidyDetectedXhtml: TtidyDetectedXhtmlFunc;
  tidyDetectedGenericXML: TtidyDetectedGenericXMLFunc;
  tidyStatus: TtidyStatusFunc;
  tidyErrorCount: TtidyErrorCountFunc;
  tidyWarningCount: TtidyWarningCountFunc;
  tidyAccessWarningCount: TtidyAccessWarningCountFunc;
  tidyConfigErrorCount: TtidyConfigErrorCountFunc;
  tidyLoadConfig: TtidyLoadConfigFunc;
  tidyLoadConfigEnc: TtidyLoadConfigEncFunc;
  tidySetCharEncoding: TtidySetCharEncodingFunc;
  tidyOptSaveFile: TtidyOptSaveFileFunc;
  tidyOptSaveSink: TtidyOptSaveSinkFunc;
  tidyErrorSummary: TtidyErrorSummaryFunc;
  tidyGeneralInfo: TtidyGeneralInfoFunc;
  
procedure InitTidyLibrary(LibHandle: THandle);

implementation

procedure InitTidyLibrary;
Begin
  tidyCreate := GetProcAddress(LibHandle, 'tidyCreate');
  tidyRelease := GetProcAddress(LibHandle, 'tidyRelease');
  tidySetAppData := GetProcAddress(LibHandle, 'tidySetAppData');
  tidyGetAppData := GetProcAddress(LibHandle, 'tidyGetAppData');
  tidyReleaseDate := GetProcAddress(LibHandle, 'tidyReleaseDate');
  tidyDetectedHTMLVersion := GetProcAddress(LibHandle, 'tidyDetectedHTMLVersion');
  tidyDetectedXhtml := GetProcAddress(LibHandle, 'tidyDetectedXhtml');
  tidyDetectedGenericXML := GetProcAddress(LibHandle, 'tidyDetectedGenericXML');
  tidyStatus := GetProcAddress(LibHandle, 'tidyStatus');
  tidyErrorCount := GetProcAddress(LibHandle, 'tidyErrorCount');
  tidyWarningCount := GetProcAddress(LibHandle, 'tidyWarningCount');
  tidyAccessWarningCount := GetProcAddress(LibHandle, 'tidyAccessWarningCount');
  tidyConfigErrorCount := GetProcAddress(LibHandle, 'tidyConfigErrorCount');
  tidyLoadConfig := GetProcAddress(LibHandle, 'tidyLoadConfig');
  tidyLoadConfigEnc := GetProcAddress(LibHandle, 'tidyLoadConfigEnc');
  tidySetCharEncoding := GetProcAddress(LibHandle, 'tidySetCharEncoding');
  tidyOptSaveFile := GetProcAddress(LibHandle, 'tidyOptSaveFile');
  tidyOptSaveSink := GetProcAddress(LibHandle, 'tidyOptSaveSink');
  tidyErrorSummary := GetProcAddress(LibHandle, 'tidyErrorSummary');
  tidyGeneralInfo := GetProcAddress(LibHandle, 'tidyGeneralInfo');
end;

end.
