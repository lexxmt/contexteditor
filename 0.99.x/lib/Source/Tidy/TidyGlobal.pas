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

$Id: TidyGlobal.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyGlobal;

interface

uses Windows;

type
  TTidyTriState = (tsNo, tsYes, tsAuto);

const
  TIDY_LIB = 'libtidy.dll';
  TIDY_NULL_FILE = 'NUL';
  Yes = True;
  No = False;

var _GlobalTidyLibHandle: THandle = 0;

function LoadTidyLibrary(ATidyLibPath: string = ''): boolean;

implementation

uses TidyIO, TidyNodeInterrogation, TidyBufferOperations,
     TidyAttributeInterrogation, TidyAttributeRetrieval, TidyBasicOperations,
     TidyConfigurationOptions, TidyDiagnosticsAndRepair, TidyDocumentParse,
     TidyDocumentSave, TidyDocumentTree;

function LoadTidyLibrary;
var
  LibHandle: THandle;
begin
  Result := False;
  if (ATidyLibPath = '') then
    LibHandle := LoadLibrary(TIDY_LIB)
  else
    LibHandle := LoadLibrary(PChar(ATidyLibPath));
  if LibHandle <> 0 then
  Begin
    try
      try
        TidyIO.InitTidyLibrary(LibHandle);
        TidyNodeInterrogation.InitTidyLibrary(LibHandle);
        TidyAttributeInterrogation.InitTidyLibrary(LibHandle);
        TidyAttributeRetrieval.InitTidyLibrary(LibHandle);
        TidyBufferOperations.InitTidyLibrary(LibHandle);        
        TidyBasicOperations.InitTidyLibrary(LibHandle);
        TidyConfigurationOptions.InitTidyLibrary(LibHandle);
        TidyDiagnosticsAndRepair.InitTidyLibrary(LibHandle);
        TidyDocumentParse.InitTidyLibrary(LibHandle);
        TidyDocumentSave.InitTidyLibrary(LibHandle);
        TidyDocumentTree.InitTidyLibrary(LibHandle);

        Result := True;
      except
        Result := False;
      end;
    finally
      _GlobalTidyLibHandle := LibHandle;
    end;
  end;
end;

initialization

finalization
  if _GlobalTidyLibHandle <> 0 then FreeLibrary(_GlobalTidyLibHandle);

end.
