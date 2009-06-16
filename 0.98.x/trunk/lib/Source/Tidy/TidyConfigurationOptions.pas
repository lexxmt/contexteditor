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

$Id: TidyConfigurationOptions.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyConfigurationOptions;

interface

uses
  Windows,
  TidyEnums, TidyOpaqueTypes;

type
  TidyOptionType = (TidyString, TidyInteger, TidyBoolean);
  TidyConfigCategory = (TidyMarkup, TidyDiagnostics, TidyPrettyPrint,
                        TidyEncoding, TidyMiscellaneous);  

  TtidyOptGetIdForName = function(optnam: PChar): TidyOptionId; cdecl;
  TtidyGetOptionList = function(tdoc: TidyDoc): TidyIterator; cdecl;
  TtidyGetNextOption = function(tdoc: TidyDoc; pos: TidyIterator): TidyOption; cdecl;
  TtidyGetOption = function(tdoc: TidyDoc; optId: TidyOptionId): TidyOption; cdecl;
  TtidyGetOptionByName = function(tdoc: TidyDoc; optnam: PChar): TidyOption; cdecl;
  TtidyOptGetId = function(opt: TidyOption): TidyOptionId; cdecl;
  TtidyOptGetName = function(opt: TidyOption): PChar; cdecl;
  TtidyOptGetType = function(opt: TidyOption): TidyOptionType; cdecl;
  TtidyOptIsReadOnly = function(opt: TidyOption): boolean; cdecl;
  TtidyOptGetCategory = function(opt: TidyOption): TidyConfigCategory; cdecl;
  TtidyOptGetDefault = function(opt: TidyOption): PChar; cdecl;
  TtidyOptGetDefaultInt = function(opt: TidyOption): uint; cdecl;
  TtidyOptGetDefaultBool = function(opt: TidyOption): boolean; cdecl;
  TtidyOptGetPickList = function(opt: TidyOption): TidyIterator; cdecl;
  TtidyOptGetNextPick = function(opt: TidyOption; pos: TidyIterator): PChar; cdecl;
  TtidyOptGetValue = function(tdoc: TidyDoc; optId: TidyOptionId): PChar; cdecl;
  TtidyOptSetValue = function(tdoc: TidyDoc; optId: TidyOptionId; val: PChar): boolean; cdecl;
  TtidyOptParseValue = function(tdoc: TidyDoc; optnam: PChar; val: PChar): boolean; cdecl;
  TtidyOptGetInt = function(tdoc: TidyDoc; optId: TidyOptionId): uint; cdecl;
  TtidyOptSetInt = function(tdoc: TidyDoc; optId: TidyOptionId; val: uint): boolean; cdecl;
  TtidyOptGetBool = function(tdoc: TidyDoc; optId: TidyOptionId): boolean; cdecl;
  TtidyOptSetBool = function(tdoc: TidyDoc; optId: TidyOptionId; val: boolean): boolean; cdecl;
  TtidyOptResetToDefault = function(tdoc: TidyDoc; opt: TidyOptionId): boolean; cdecl;
  TtidyOptResetAllToDefault = function(tdoc: TidyDoc): boolean; cdecl;
  TtidyOptSnapshot = function(tdoc: TidyDoc): boolean; cdecl;
  TtidyOptResetToSnapshot = function(tdoc: TidyDoc): boolean; cdecl;
  TtidyOptDiffThanDefault = function(tdoc: TidyDoc): boolean; cdecl;
  TtidyOptDiffThanSnapshot = function(tdoc: TidyDoc): boolean; cdecl;
  TtidyOptCopyConfig = function(copy_to: TidyDoc; from: TidyDoc): boolean; cdecl;
  TtidyOptGetEncName = function(tdoc: TidyDoc; optId: TidyOptionId): PChar; cdecl;
  TtidyOptGetCurrPick = function(tdoc: TidyDoc; optId: TidyOptionId): PChar; cdecl;
  TtidyOptGetDeclTagList = function(tdoc: TidyDoc): TidyIterator; cdecl;
  TtidyOptGetNextDeclTag = function(tdoc: TidyDoc; optId: TidyOptionId; iter: TidyIterator): PChar; cdecl;

var
  tidyOptGetIdForName: TtidyOptGetIdForName;
  tidyGetOptionList: TtidyGetOptionList;
  tidyGetNextOption: TtidyGetNextOption;
  tidyGetOption: TtidyGetOption;
  tidyGetOptionByName: TtidyGetOptionByName;
  tidyOptGetId: TtidyOptGetId;
  tidyOptGetName: TtidyOptGetName;
  tidyOptGetType: TtidyOptGetType;
  tidyOptIsReadOnly: TtidyOptIsReadOnly;
  tidyOptGetCategory: TtidyOptGetCategory;
  tidyOptGetDefault: TtidyOptGetDefault;
  tidyOptGetDefaultInt: TtidyOptGetDefaultInt;
  tidyOptGetDefaultBool: TtidyOptGetDefaultBool;
  tidyOptGetPickList: TtidyOptGetPickList;
  tidyOptGetNextPick: TtidyOptGetNextPick;
  tidyOptGetValue: TtidyOptGetValue;
  tidyOptSetValue: TtidyOptSetValue;
  tidyOptParseValue: TtidyOptParseValue;
  tidyOptGetInt: TtidyOptGetInt;
  tidyOptSetInt: TtidyOptSetInt;
  tidyOptGetBool: TtidyOptGetBool;
  tidyOptSetBool: TtidyOptSetBool;
  tidyOptResetToDefault: TtidyOptResetToDefault;
  tidyOptResetAllToDefault: TtidyOptResetAllToDefault;
  tidyOptSnapshot: TtidyOptSnapshot;
  tidyOptResetToSnapshot: TtidyOptResetToSnapshot;
  tidyOptDiffThanDefault: TtidyOptDiffThanDefault;
  tidyOptDiffThanSnapshot: TtidyOptDiffThanSnapshot;
  tidyOptCopyConfig: TtidyOptCopyConfig;
  tidyOptGetEncName: TtidyOptGetEncName;
  tidyOptGetCurrPick: TtidyOptGetCurrPick;
  tidyOptGetDeclTagList: TtidyOptGetDeclTagList;
  tidyOptGetNextDeclTag: TtidyOptGetNextDeclTag;

procedure InitTidyLibrary(LibHandle: THandle);

implementation

procedure InitTidyLibrary;
Begin
  tidyOptGetIdForName := GetProcAddress(LibHandle, 'tidyOptGetIdForName');
  tidyGetOptionList := GetProcAddress(LibHandle, 'tidyGetOptionList');
  tidyGetNextOption := GetProcAddress(LibHandle, 'tidyGetNextOption');
  tidyGetOption := GetProcAddress(LibHandle, 'tidyGetOption');
  tidyGetOptionByName := GetProcAddress(LibHandle, 'tidyGetOptionByName');
  tidyOptGetId := GetProcAddress(LibHandle, 'tidyOptGetId');
  tidyOptGetName := GetProcAddress(LibHandle, 'tidyOptGetName');
  tidyOptGetType := GetProcAddress(LibHandle, 'tidyOptGetType');
  tidyOptIsReadOnly := GetProcAddress(LibHandle, 'tidyOptIsReadOnly');
  tidyOptGetCategory := GetProcAddress(LibHandle, 'tidyOptGetCategory');
  tidyOptGetDefault := GetProcAddress(LibHandle, 'tidyOptGetDefault');
  tidyOptGetDefaultInt := GetProcAddress(LibHandle, 'tidyOptGetDefaultInt');
  tidyOptGetDefaultBool := GetProcAddress(LibHandle, 'tidyOptGetDefaultBool');
  tidyOptGetPickList := GetProcAddress(LibHandle, 'tidyOptGetPickList');
  tidyOptGetNextPick := GetProcAddress(LibHandle, 'tidyOptGetNextPick');
  tidyOptGetValue := GetProcAddress(LibHandle, 'tidyOptGetValue');
  tidyOptSetValue := GetProcAddress(LibHandle, 'tidyOptSetValue');
  tidyOptParseValue := GetProcAddress(LibHandle, 'tidyOptParseValue');
  tidyOptGetInt := GetProcAddress(LibHandle, 'tidyOptGetInt');
  tidyOptSetInt := GetProcAddress(LibHandle, 'tidyOptSetInt');
  tidyOptGetBool := GetProcAddress(LibHandle, 'tidyOptGetBool');
  tidyOptSetBool := GetProcAddress(LibHandle, 'tidyOptSetBool');
  tidyOptResetToDefault := GetProcAddress(LibHandle, 'tidyOptResetToDefault');
  tidyOptResetAllToDefault := GetProcAddress(LibHandle, 'tidyOptResetAllToDefault');
  tidyOptSnapshot := GetProcAddress(LibHandle, 'tidyOptSnapshot');
  tidyOptResetToSnapshot := GetProcAddress(LibHandle, 'tidyOptResetToSnapshot');
  tidyOptDiffThanDefault := GetProcAddress(LibHandle, 'tidyOptDiffThanDefault');
  tidyOptDiffThanSnapshot := GetProcAddress(LibHandle, 'tidyOptDiffThanSnapshot');
  tidyOptCopyConfig := GetProcAddress(LibHandle, 'tidyOptCopyConfig');
  tidyOptGetEncName := GetProcAddress(LibHandle, 'tidyOptGetEncName');
  tidyOptGetCurrPick := GetProcAddress(LibHandle, 'tidyOptGetCurrPick');
  tidyOptGetDeclTagList := GetProcAddress(LibHandle, 'tidyOptGetDeclTagList');
  tidyOptGetNextDeclTag := GetProcAddress(LibHandle, 'tidyOptGetNextDeclTag');
end;

end.
