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

$Id: TidyAttributeInterrogation.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyAttributeInterrogation;

interface

uses Windows,
     TidyOpaqueTypes, TidyEnums;

type
  TtidyGetAttrIdFunc = function(tattr: TidyAttr): TidyAttrId; { TODO : naming conflict? }
  TtidyAttrIsEventFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsPropFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsHREFFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsSRCFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsIDFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsNAMEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsSUMMARYFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsALTFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsLONGDESCFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsUSEMAPFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsISMAPFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsLANGUAGEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsTYPEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsVALUEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsCONTENTFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsTITLEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsXMLNSFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsDATAFLDFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsWIDTHFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsHEIGHTFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsFORFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsSELECTEDFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsCHECKEDFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsLANGFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsTARGETFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsHTTP_EQUIVFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsRELFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnMOUSEMOVEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnMOUSEDOWNFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnMOUSEUPFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnCLICKFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnMOUSEOVERFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnMOUSEOUTFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnKEYDOWNFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnKEYUPFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnKEYPRESSFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnFOCUSFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsOnBLURFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsBGCOLORFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsLINKFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsALINKFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsVLINKFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsTEXTFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsSTYLEFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsABBRFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsCOLSPANFunc = function(tattr: TidyAttr): Bool;
  TtidyAttrIsROWSPANFunc = function(tattr: TidyAttr): Bool;

var
  tidyGetAttrId: TtidyGetAttrIdFunc;
  tidyAttrIsEvent: TtidyAttrIsEventFunc;
  tidyAttrIsProp: TtidyAttrIsPropFunc;
  tidyAttrIsHREF: TtidyAttrIsHREFFunc;
  tidyAttrIsSRC: TtidyAttrIsSRCFunc;
  tidyAttrIsID: TtidyAttrIsIDFunc;
  tidyAttrIsNAME: TtidyAttrIsNAMEFunc;
  tidyAttrIsSUMMARY: TtidyAttrIsSUMMARYFunc;
  tidyAttrIsALT: TtidyAttrIsALTFunc;
  tidyAttrIsLONGDESC: TtidyAttrIsLONGDESCFunc;
  tidyAttrIsUSEMAP: TtidyAttrIsUSEMAPFunc;
  tidyAttrIsISMAP: TtidyAttrIsISMAPFunc;
  tidyAttrIsLANGUAGE: TtidyAttrIsLANGUAGEFunc;
  tidyAttrIsTYPE: TtidyAttrIsTYPEFunc;
  tidyAttrIsVALUE: TtidyAttrIsVALUEFunc;
  tidyAttrIsCONTENT: TtidyAttrIsCONTENTFunc;
  tidyAttrIsTITLE: TtidyAttrIsTITLEFunc;
  tidyAttrIsXMLNS: TtidyAttrIsXMLNSFunc;
  tidyAttrIsDATAFLD: TtidyAttrIsDATAFLDFunc;
  tidyAttrIsWIDTH: TtidyAttrIsWIDTHFunc;
  tidyAttrIsHEIGHT: TtidyAttrIsHEIGHTFunc;
  tidyAttrIsFOR: TtidyAttrIsFORFunc;
  tidyAttrIsSELECTED: TtidyAttrIsSELECTEDFunc;
  tidyAttrIsCHECKED: TtidyAttrIsCHECKEDFunc;
  tidyAttrIsLANG: TtidyAttrIsLANGFunc;
  tidyAttrIsTARGET: TtidyAttrIsTARGETFunc;
  tidyAttrIsHTTP_EQUIV: TtidyAttrIsHTTP_EQUIVFunc;
  tidyAttrIsREL: TtidyAttrIsRELFunc;
  tidyAttrIsOnMOUSEMOVE: TtidyAttrIsOnMOUSEMOVEFunc;
  tidyAttrIsOnMOUSEDOWN: TtidyAttrIsOnMOUSEDOWNFunc;
  tidyAttrIsOnMOUSEUP: TtidyAttrIsOnMOUSEUPFunc;
  tidyAttrIsOnCLICK: TtidyAttrIsOnCLICKFunc;
  tidyAttrIsOnMOUSEOVER: TtidyAttrIsOnMOUSEOVERFunc;
  tidyAttrIsOnMOUSEOUT: TtidyAttrIsOnMOUSEOUTFunc;
  tidyAttrIsOnKEYDOWN: TtidyAttrIsOnKEYDOWNFunc;
  tidyAttrIsOnKEYUP: TtidyAttrIsOnKEYUPFunc;
  tidyAttrIsOnKEYPRESS: TtidyAttrIsOnKEYPRESSFunc;
  tidyAttrIsOnFOCUS: TtidyAttrIsOnFOCUSFunc;
  tidyAttrIsOnBLUR: TtidyAttrIsOnBLURFunc;
  tidyAttrIsBGCOLOR: TtidyAttrIsBGCOLORFunc;
  tidyAttrIsLINK: TtidyAttrIsLINKFunc;
  tidyAttrIsALINK: TtidyAttrIsALINKFunc;
  tidyAttrIsVLINK: TtidyAttrIsVLINKFunc;
  tidyAttrIsTEXT: TtidyAttrIsTEXTFunc;
  tidyAttrIsSTYLE: TtidyAttrIsSTYLEFunc;
  tidyAttrIsABBR: TtidyAttrIsABBRFunc;
  tidyAttrIsCOLSPAN: TtidyAttrIsCOLSPANFunc;
  tidyAttrIsROWSPAN: TtidyAttrIsROWSPANFunc;

procedure InitTidyLibrary(LibHandle: THandle);

implementation

procedure InitTidyLibrary;
Begin
  tidyGetAttrId := GetProcAddress(LibHandle, 'tidyGetAttrId');
  tidyAttrIsEvent := GetProcAddress(LibHandle, 'tidyAttrIsEvent');
  tidyAttrIsProp := GetProcAddress(LibHandle, 'tidyAttrIsProp');
  tidyAttrIsHREF := GetProcAddress(LibHandle, 'tidyAttrIsHREF');
  tidyAttrIsSRC := GetProcAddress(LibHandle, 'tidyAttrIsSRC');
  tidyAttrIsID := GetProcAddress(LibHandle, 'tidyAttrIsID');
  tidyAttrIsNAME := GetProcAddress(LibHandle, 'tidyAttrIsNAME');
  tidyAttrIsSUMMARY := GetProcAddress(LibHandle, 'tidyAttrIsSUMMARY');
  tidyAttrIsALT := GetProcAddress(LibHandle, 'tidyAttrIsALT');
  tidyAttrIsLONGDESC := GetProcAddress(LibHandle, 'tidyAttrIsLONGDESC');
  tidyAttrIsUSEMAP := GetProcAddress(LibHandle, 'tidyAttrIsUSEMAP');
  tidyAttrIsISMAP := GetProcAddress(LibHandle, 'tidyAttrIsISMAP');
  tidyAttrIsLANGUAGE := GetProcAddress(LibHandle, 'tidyAttrIsLANGUAGE');
  tidyAttrIsTYPE := GetProcAddress(LibHandle, 'tidyAttrIsTYPE');
  tidyAttrIsVALUE := GetProcAddress(LibHandle, 'tidyAttrIsVALUE');
  tidyAttrIsCONTENT := GetProcAddress(LibHandle, 'tidyAttrIsCONTENT');
  tidyAttrIsTITLE := GetProcAddress(LibHandle, 'tidyAttrIsTITLE');
  tidyAttrIsXMLNS := GetProcAddress(LibHandle, 'tidyAttrIsXMLNS');
  tidyAttrIsDATAFLD := GetProcAddress(LibHandle, 'tidyAttrIsDATAFLD');
  tidyAttrIsWIDTH := GetProcAddress(LibHandle, 'tidyAttrIsWIDTH');
  tidyAttrIsHEIGHT := GetProcAddress(LibHandle, 'tidyAttrIsHEIGHT');
  tidyAttrIsFOR := GetProcAddress(LibHandle, 'tidyAttrIsFOR');
  tidyAttrIsSELECTED := GetProcAddress(LibHandle, 'tidyAttrIsSELECTED');
  tidyAttrIsCHECKED := GetProcAddress(LibHandle, 'tidyAttrIsCHECKED');
  tidyAttrIsLANG := GetProcAddress(LibHandle, 'tidyAttrIsLANG');
  tidyAttrIsTARGET := GetProcAddress(LibHandle, 'tidyAttrIsTARGET');
  tidyAttrIsHTTP_EQUIV := GetProcAddress(LibHandle, 'tidyAttrIsHTTP_EQUIV');
  tidyAttrIsREL := GetProcAddress(LibHandle, 'tidyAttrIsREL');
  tidyAttrIsOnMOUSEMOVE := GetProcAddress(LibHandle, 'tidyAttrIsOnMOUSEMOVE');
  tidyAttrIsOnMOUSEDOWN := GetProcAddress(LibHandle, 'tidyAttrIsOnMOUSEDOWN');
  tidyAttrIsOnMOUSEUP := GetProcAddress(LibHandle, 'tidyAttrIsOnMOUSEUP');
  tidyAttrIsOnCLICK := GetProcAddress(LibHandle, 'tidyAttrIsOnCLICK');
  tidyAttrIsOnMOUSEOVER := GetProcAddress(LibHandle, 'tidyAttrIsOnMOUSEOVER');
  tidyAttrIsOnMOUSEOUT := GetProcAddress(LibHandle, 'tidyAttrIsOnMOUSEOUT');
  tidyAttrIsOnKEYDOWN := GetProcAddress(LibHandle, 'tidyAttrIsOnKEYDOWN');
  tidyAttrIsOnKEYUP := GetProcAddress(LibHandle, 'tidyAttrIsOnKEYUP');
  tidyAttrIsOnKEYPRESS := GetProcAddress(LibHandle, 'tidyAttrIsOnKEYPRESS');
  tidyAttrIsOnFOCUS := GetProcAddress(LibHandle, 'tidyAttrIsOnFOCUS');
  tidyAttrIsOnBLUR := GetProcAddress(LibHandle, 'tidyAttrIsOnBLUR');
  tidyAttrIsBGCOLOR := GetProcAddress(LibHandle, 'tidyAttrIsBGCOLOR');
  tidyAttrIsLINK := GetProcAddress(LibHandle, 'tidyAttrIsLINK');
  tidyAttrIsALINK := GetProcAddress(LibHandle, 'tidyAttrIsALINK');
  tidyAttrIsVLINK := GetProcAddress(LibHandle, 'tidyAttrIsVLINK');
  tidyAttrIsTEXT := GetProcAddress(LibHandle, 'tidyAttrIsTEXT');
  tidyAttrIsSTYLE := GetProcAddress(LibHandle, 'tidyAttrIsSTYLE');
  tidyAttrIsABBR := GetProcAddress(LibHandle, 'tidyAttrIsABBR');
  tidyAttrIsCOLSPAN := GetProcAddress(LibHandle, 'tidyAttrIsCOLSPAN');
  tidyAttrIsROWSPAN := GetProcAddress(LibHandle, 'tidyAttrIsROWSPAN');
end;

end.
