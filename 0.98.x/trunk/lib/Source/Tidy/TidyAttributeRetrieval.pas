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

$Id: TidyAttributeRetrieval.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyAttributeRetrieval;

interface

uses Windows,
     TidyEnums, TidyOpaqueTypes;

type
  TtidyAttrGetHREFFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetSRCFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetIDFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetNAMEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetSUMMARYFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetALTFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetLONGDESCFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetUSEMAPFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetISMAPFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetLANGUAGEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetTYPEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetVALUEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetCONTENTFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetTITLEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetXMLNSFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetDATAFLDFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetWIDTHFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetHEIGHTFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetFORFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetSELECTEDFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetCHECKEDFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetLANGFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetTARGETFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetHTTP_EQUIVFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetRELFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnMOUSEMOVEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnMOUSEDOWNFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnMOUSEUPFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnCLICKFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnMOUSEOVERFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnMOUSEOUTFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnKEYDOWNFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnKEYUPFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnKEYPRESSFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnFOCUSFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetOnBLURFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetBGCOLORFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetLINKFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetALINKFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetVLINKFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetTEXTFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetSTYLEFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetABBRFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetCOLSPANFunc = function(node: TidyNode): TidyAttr;
  TtidyAttrGetROWSPANFunc = function(node: TidyNode): TidyAttr;

var
  tidyAttrGetHREF: TtidyAttrGetHREFFunc;
  tidyAttrGetSRC: TtidyAttrGetSRCFunc;
  tidyAttrGetID: TtidyAttrGetIDFunc;
  tidyAttrGetNAME: TtidyAttrGetNAMEFunc;
  tidyAttrGetSUMMARY: TtidyAttrGetSUMMARYFunc;
  tidyAttrGetALT: TtidyAttrGetALTFunc;
  tidyAttrGetLONGDESC: TtidyAttrGetLONGDESCFunc;
  tidyAttrGetUSEMAP: TtidyAttrGetUSEMAPFunc;
  tidyAttrGetISMAP: TtidyAttrGetISMAPFunc;
  tidyAttrGetLANGUAGE: TtidyAttrGetLANGUAGEFunc;
  tidyAttrGetTYPE: TtidyAttrGetTYPEFunc;
  tidyAttrGetVALUE: TtidyAttrGetVALUEFunc;
  tidyAttrGetCONTENT: TtidyAttrGetCONTENTFunc;
  tidyAttrGetTITLE: TtidyAttrGetTITLEFunc;
  tidyAttrGetXMLNS: TtidyAttrGetXMLNSFunc;
  tidyAttrGetDATAFLD: TtidyAttrGetDATAFLDFunc;
  tidyAttrGetWIDTH: TtidyAttrGetWIDTHFunc;
  tidyAttrGetHEIGHT: TtidyAttrGetHEIGHTFunc;
  tidyAttrGetFOR: TtidyAttrGetFORFunc;
  tidyAttrGetSELECTED: TtidyAttrGetSELECTEDFunc;
  tidyAttrGetCHECKED: TtidyAttrGetCHECKEDFunc;
  tidyAttrGetLANG: TtidyAttrGetLANGFunc;
  tidyAttrGetTARGET: TtidyAttrGetTARGETFunc;
  tidyAttrGetHTTP_EQUIV: TtidyAttrGetHTTP_EQUIVFunc;
  tidyAttrGetREL: TtidyAttrGetRELFunc;
  tidyAttrGetOnMOUSEMOVE: TtidyAttrGetOnMOUSEMOVEFunc;
  tidyAttrGetOnMOUSEDOWN: TtidyAttrGetOnMOUSEDOWNFunc;
  tidyAttrGetOnMOUSEUP: TtidyAttrGetOnMOUSEUPFunc;
  tidyAttrGetOnCLICK: TtidyAttrGetOnCLICKFunc;
  tidyAttrGetOnMOUSEOVER: TtidyAttrGetOnMOUSEOVERFunc;
  tidyAttrGetOnMOUSEOUT: TtidyAttrGetOnMOUSEOUTFunc;
  tidyAttrGetOnKEYDOWN: TtidyAttrGetOnKEYDOWNFunc;
  tidyAttrGetOnKEYUP: TtidyAttrGetOnKEYUPFunc;
  tidyAttrGetOnKEYPRESS: TtidyAttrGetOnKEYPRESSFunc;
  tidyAttrGetOnFOCUS: TtidyAttrGetOnFOCUSFunc;
  tidyAttrGetOnBLUR: TtidyAttrGetOnBLURFunc;
  tidyAttrGetBGCOLOR: TtidyAttrGetBGCOLORFunc;
  tidyAttrGetLINK: TtidyAttrGetLINKFunc;
  tidyAttrGetALINK: TtidyAttrGetALINKFunc;
  tidyAttrGetVLINK: TtidyAttrGetVLINKFunc;
  tidyAttrGetTEXT: TtidyAttrGetTEXTFunc;
  tidyAttrGetSTYLE: TtidyAttrGetSTYLEFunc;
  tidyAttrGetABBR: TtidyAttrGetABBRFunc;
  tidyAttrGetCOLSPAN: TtidyAttrGetCOLSPANFunc;
  tidyAttrGetROWSPAN: TtidyAttrGetROWSPANFunc;

procedure InitTidyLibrary(LibHandle: THandle);

implementation

procedure InitTidyLibrary;
Begin
  tidyAttrGetHREF := GetProcAddress(LibHandle, 'tidyAttrGetHREF');
  tidyAttrGetSRC := GetProcAddress(LibHandle, 'tidyAttrGetSRC');
  tidyAttrGetID := GetProcAddress(LibHandle, 'tidyAttrGetID');
  tidyAttrGetNAME := GetProcAddress(LibHandle, 'tidyAttrGetNAME');
  tidyAttrGetSUMMARY := GetProcAddress(LibHandle, 'tidyAttrGetSUMMARY');
  tidyAttrGetALT := GetProcAddress(LibHandle, 'tidyAttrGetALT');
  tidyAttrGetLONGDESC := GetProcAddress(LibHandle, 'tidyAttrGetLONGDESC');
  tidyAttrGetUSEMAP := GetProcAddress(LibHandle, 'tidyAttrGetUSEMAP');
  tidyAttrGetISMAP := GetProcAddress(LibHandle, 'tidyAttrGetISMAP');
  tidyAttrGetLANGUAGE := GetProcAddress(LibHandle, 'tidyAttrGetLANGUAGE');
  tidyAttrGetTYPE := GetProcAddress(LibHandle, 'tidyAttrGetTYPE');
  tidyAttrGetVALUE := GetProcAddress(LibHandle, 'tidyAttrGetVALUE');
  tidyAttrGetCONTENT := GetProcAddress(LibHandle, 'tidyAttrGetCONTENT');
  tidyAttrGetTITLE := GetProcAddress(LibHandle, 'tidyAttrGetTITLE');
  tidyAttrGetXMLNS := GetProcAddress(LibHandle, 'tidyAttrGetXMLNS');
  tidyAttrGetDATAFLD := GetProcAddress(LibHandle, 'tidyAttrGetDATAFLD');
  tidyAttrGetWIDTH := GetProcAddress(LibHandle, 'tidyAttrGetWIDTH');
  tidyAttrGetHEIGHT := GetProcAddress(LibHandle, 'tidyAttrGetHEIGHT');
  tidyAttrGetFOR := GetProcAddress(LibHandle, 'tidyAttrGetFOR');
  tidyAttrGetSELECTED := GetProcAddress(LibHandle, 'tidyAttrGetSELECTED');
  tidyAttrGetCHECKED := GetProcAddress(LibHandle, 'tidyAttrGetCHECKED');
  tidyAttrGetLANG := GetProcAddress(LibHandle, 'tidyAttrGetLANG');
  tidyAttrGetTARGET := GetProcAddress(LibHandle, 'tidyAttrGetTARGET');
  tidyAttrGetHTTP_EQUIV := GetProcAddress(LibHandle, 'tidyAttrGetHTTP_EQUIV');
  tidyAttrGetREL := GetProcAddress(LibHandle, 'tidyAttrGetREL');
  tidyAttrGetOnMOUSEMOVE := GetProcAddress(LibHandle, 'tidyAttrGetOnMOUSEMOVE');
  tidyAttrGetOnMOUSEDOWN := GetProcAddress(LibHandle, 'tidyAttrGetOnMOUSEDOWN');
  tidyAttrGetOnMOUSEUP := GetProcAddress(LibHandle, 'tidyAttrGetOnMOUSEUP');
  tidyAttrGetOnCLICK := GetProcAddress(LibHandle, 'tidyAttrGetOnCLICK');
  tidyAttrGetOnMOUSEOVER := GetProcAddress(LibHandle, 'tidyAttrGetOnMOUSEOVER');
  tidyAttrGetOnMOUSEOUT := GetProcAddress(LibHandle, 'tidyAttrGetOnMOUSEOUT');
  tidyAttrGetOnKEYDOWN := GetProcAddress(LibHandle, 'tidyAttrGetOnKEYDOWN');
  tidyAttrGetOnKEYUP := GetProcAddress(LibHandle, 'tidyAttrGetOnKEYUP');
  tidyAttrGetOnKEYPRESS := GetProcAddress(LibHandle, 'tidyAttrGetOnKEYPRESS');
  tidyAttrGetOnFOCUS := GetProcAddress(LibHandle, 'tidyAttrGetOnFOCUS');
  tidyAttrGetOnBLUR := GetProcAddress(LibHandle, 'tidyAttrGetOnBLUR');
  tidyAttrGetBGCOLOR := GetProcAddress(LibHandle, 'tidyAttrGetBGCOLOR');
  tidyAttrGetLINK := GetProcAddress(LibHandle, 'tidyAttrGetLINK');
  tidyAttrGetALINK := GetProcAddress(LibHandle, 'tidyAttrGetALINK');
  tidyAttrGetVLINK := GetProcAddress(LibHandle, 'tidyAttrGetVLINK');
  tidyAttrGetTEXT := GetProcAddress(LibHandle, 'tidyAttrGetTEXT');
  tidyAttrGetSTYLE := GetProcAddress(LibHandle, 'tidyAttrGetSTYLE');
  tidyAttrGetABBR := GetProcAddress(LibHandle, 'tidyAttrGetABBR');
  tidyAttrGetCOLSPAN := GetProcAddress(LibHandle, 'tidyAttrGetCOLSPAN');
  tidyAttrGetROWSPAN := GetProcAddress(LibHandle, 'tidyAttrGetROWSPAN');
end;

end.
