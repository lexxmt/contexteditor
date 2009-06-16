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

$Id: TidyIO.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyIO;

interface

uses Windows,
     TidyOpaqueTypes;

type
  TidyPutByteFunc = procedure(sinkData: UInt; bt: Byte); cdecl;
  TidyGetByteFunc = function(sourceData: UInt):LongInt; cdecl;
  TidyInputType = (TidyContenatInput, TidyConfigInput);
  TidyOutputType = (TidyContentOutput, TidyDiagnosticOutput);
  TidyUngetByteFunc = procedure(sourceData: uint; bt: byte); cdecl;
  TidyEOFFunc = function(sourceData: uint): boolean; cdecl;

  TidyOutputSink = ^TTidyOutputSink;
  TidyInputSource = ^TTidyInputSource;

  TTidyOutputSink = record
    sinkData: UInt;
    putByte:  TidyPutByteFunc;
  end;

  TTidyInputSource = record
    sourceData: UInt;
    getByte: TidyGetByteFunc;
    ungetByte: TidyUngetByteFunc;
    eof: TidyEOFFunc;
  end;

  TtidyInitSource = function(source: TidyInputSource; srcData: pointer;
                             gbFunc: TidyGetByteFunc;
                             ugbFunc: TidyUngetByteFunc;
                             endFunc: TidyEOFFunc): boolean; cdecl;
  TtidyInitInputBuffer = procedure(inp: TidyInputSource; buf: TidyBuffer); cdecl;
  TtidyGetByte  = function(source: TidyInputSource): uint; cdecl;
  TtidyUngetByte = procedure(source: TidyInputSource; byteValue: uint); cdecl;
  TtidyIsEOF  = function(source: TidyInputSource ): boolean; cdecl;
  TtidyInitSink  = function(sink: TidyOutputSink; snkData: Pointer; pbFunc: TidyPutByteFunc): boolean; cdecl;
  TtidyPutByte = procedure(sink: TidyOutputSink; byteValue: UInt); cdecl;
  TtidySetReportFilter = function(doc: TidyDoc; filtCallback: TidyReportFilter): boolean; cdecl;
  TtidySetErrorBuffer = function (doc: TidyDoc; errbuf: TidyBuffer): LongInt; cdecl;
  TtidySetErrorSink  = function(doc: TidyDoc; sink: TidyOutputSink ): LongInt; cdecl;
  TtidySetErrorFile = function(doc: TidyDoc; errfilnam: PChar): LongInt; cdecl;

const
  EndOfStream = not (0);

var
  tidyInitSource: TtidyInitSource;
  tidyInitInputBuffer: TtidyInitInputBuffer;
  tidyUngetByte: TtidyUngetByte;
  tidyIsEOF: TtidyIsEOF;
  tidyInitSink: TtidyInitSink;
  tidyPutByte: TtidyPutByte;
  tidySetReportFilter: TtidySetReportFilter;
  tidySetErrorBuffer: TtidySetErrorBuffer;
  tidySetErrorSink : TtidySetErrorSink;
  tidySetErrorFile: TtidySetErrorFile;

procedure InitTidyLibrary(LibHandle: THandle);

implementation

procedure InitTidyLibrary;
Begin
  tidyInitSource := GetProcAddress(LibHandle, 'tidyInitSource');
  tidyInitInputBuffer := GetProcAddress(LibHandle, 'initIntidyInitInputBufferputBuffer');
  tidyUngetByte := GetProcAddress(LibHandle, 'tidyUngetByte');
  tidyIsEOF := GetProcAddress(LibHandle, 'tidyIsEOF');
  tidyInitSink := GetProcAddress(LibHandle, 'tidyInitSink');
  tidyPutByte := GetProcAddress(LibHandle, 'tidyPutByte');
  tidySetReportFilter := GetProcAddress(LibHandle, 'tidySetReportFilter');
  tidySetErrorBuffer := GetProcAddress(LibHandle, 'tidySetErrorBuffer');
  tidySetErrorSink  := GetProcAddress(LibHandle, 'tidySetErrorSink ');
  tidySetErrorFile := GetProcAddress(LibHandle, 'tidySetErrorFile');
end;

end.
