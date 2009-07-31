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

$Id: TidyNodeInterrogation.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyNodeInterrogation;

interface

uses Windows,
     TidyOpaqueTypes, TidyEnums;

type
  TtidyNodeGetTypeFunc = function(node: TidyNode): TidyNodeType;
  TtidyNodeGetNameFunc = function(node: TidyNode): PChar;
  TtidyNodeIsTextFunc = function(node: TidyNode): Bool;
  TtidyNodeIsPropFunc = function(tdoc: TidyDoc; node: TidyNode): Bool;
  TtidyNodeIsHeaderFunc = function(node: TidyNode): Bool;
  TtidyNodeHasTextFunc = function(tdoc: TidyDoc; node: TidyNode): Bool;
  TtidyNodeGetTextFunc = function(tdoc: TidyDoc; node: TidyNode; buf: TidyBuffer): Bool;
  TtidyNodeGetIdFunc = function(node: TidyNode): TidyTagId;
  TtidyNodeIsHTMLFunc = function(node: TidyNode): Bool;
  TtidyNodeIsHEADFunc = function(node: TidyNode): Bool;
  TtidyNodeIsTITLEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBASEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsMETAFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBODYFunc = function(node: TidyNode): Bool;
  TtidyNodeIsFRAMESETFunc = function(node: TidyNode): Bool;
  TtidyNodeIsFRAMEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsIFRAMEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsNOFRAMESFunc = function(node: TidyNode): Bool;
  TtidyNodeIsHRFunc = function(node: TidyNode): Bool;
  TtidyNodeIsH1Func = function(node: TidyNode): Bool;
  TtidyNodeIsH2Func = function(node: TidyNode): Bool;
  TtidyNodeIsPREFunc = function(node: TidyNode): Bool;
  TtidyNodeIsLISTINGFunc = function(node: TidyNode): Bool;
  TtidyNodeIsPFunc = function(node: TidyNode): Bool;
  TtidyNodeIsULFunc = function(node: TidyNode): Bool;
  TtidyNodeIsOLFunc = function(node: TidyNode): Bool;
  TtidyNodeIsDLFunc = function(node: TidyNode): Bool;
  TtidyNodeIsDIRFunc = function(node: TidyNode): Bool;
  TtidyNodeIsLIFunc = function(node: TidyNode): Bool;
  TtidyNodeIsDTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsDDFunc = function(node: TidyNode): Bool;
  TtidyNodeIsTABLEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsCAPTIONFunc = function(node: TidyNode): Bool;
  TtidyNodeIsTDFunc = function(node: TidyNode): Bool;
  TtidyNodeIsTHFunc = function(node: TidyNode): Bool;
  TtidyNodeIsTRFunc = function(node: TidyNode): Bool;
  TtidyNodeIsCOLFunc = function(node: TidyNode): Bool;
  TtidyNodeIsCOLGROUPFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBRFunc = function(node: TidyNode): Bool;
  TtidyNodeIsAFunc = function(node: TidyNode): Bool;
  TtidyNodeIsLINKFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBFunc = function(node: TidyNode): Bool;
  TtidyNodeIsIFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSTRONGFunc = function(node: TidyNode): Bool;
  TtidyNodeIsEMFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBIGFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSMALLFunc = function(node: TidyNode): Bool;
  TtidyNodeIsPARAMFunc = function(node: TidyNode): Bool;
  TtidyNodeIsOPTIONFunc = function(node: TidyNode): Bool;
  TtidyNodeIsOPTGROUPFunc = function(node: TidyNode): Bool;
  TtidyNodeIsIMGFunc = function(node: TidyNode): Bool;
  TtidyNodeIsMAPFunc = function(node: TidyNode): Bool;
  TtidyNodeIsAREAFunc = function(node: TidyNode): Bool;
  TtidyNodeIsNOBRFunc = function(node: TidyNode): Bool;
  TtidyNodeIsWBRFunc = function(node: TidyNode): Bool;
  TtidyNodeIsFONTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsLAYERFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSPACERFunc = function(node: TidyNode): Bool;
  TtidyNodeIsCENTERFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSTYLEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSCRIPTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsNOSCRIPTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsFORMFunc = function(node: TidyNode): Bool;
  TtidyNodeIsTEXTAREAFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBLOCKQUOTEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsAPPLETFunc = function(node: TidyNode): Bool;
  TtidyNodeIsOBJECTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsDIVFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSPANFunc = function(node: TidyNode): Bool;
  TtidyNodeIsINPUTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsQFunc = function(node: TidyNode): Bool;
  TtidyNodeIsLABELFunc = function(node: TidyNode): Bool;
  TtidyNodeIsH3Func = function(node: TidyNode): Bool;
  TtidyNodeIsH4Func = function(node: TidyNode): Bool;
  TtidyNodeIsH5Func = function(node: TidyNode): Bool;
  TtidyNodeIsH6Func = function(node: TidyNode): Bool;
  TtidyNodeIsADDRESSFunc = function(node: TidyNode): Bool;
  TtidyNodeIsXMPFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSELECTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBLINKFunc = function(node: TidyNode): Bool;
  TtidyNodeIsMARQUEEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsEMBEDFunc = function(node: TidyNode): Bool;
  TtidyNodeIsBASEFONTFunc = function(node: TidyNode): Bool;
  TtidyNodeIsISINDEXFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSFunc = function(node: TidyNode): Bool;
  TtidyNodeIsSTRIKEFunc = function(node: TidyNode): Bool;
  TtidyNodeIsUFunc = function(node: TidyNode): Bool;
  TtidyNodeIsMENUFunc = function(node: TidyNode): Bool;

var
  tidyNodeGetType: TtidyNodeGetTypeFunc;
  tidyNodeGetName: TtidyNodeGetNameFunc;
  tidyNodeIsText: TtidyNodeIsTextFunc;
  tidyNodeIsProp: TtidyNodeIsPropFunc;
  tidyNodeIsHeader: TtidyNodeIsHeaderFunc;
  tidyNodeHasText: TtidyNodeHasTextFunc;
  tidyNodeGetText: TtidyNodeGetTextFunc;
  tidyNodeGetId: TtidyNodeGetIdFunc;
  tidyNodeIsHTML: TtidyNodeIsHTMLFunc;
  tidyNodeIsHEAD: TtidyNodeIsHEADFunc;
  tidyNodeIsTITLE: TtidyNodeIsTITLEFunc;
  tidyNodeIsBASE: TtidyNodeIsBASEFunc;
  tidyNodeIsMETA: TtidyNodeIsMETAFunc;
  tidyNodeIsBODY: TtidyNodeIsBODYFunc;
  tidyNodeIsFRAMESET: TtidyNodeIsFRAMESETFunc;
  tidyNodeIsFRAME: TtidyNodeIsFRAMEFunc;
  tidyNodeIsIFRAME: TtidyNodeIsIFRAMEFunc;
  tidyNodeIsNOFRAMES: TtidyNodeIsNOFRAMESFunc;
  tidyNodeIsHR: TtidyNodeIsHRFunc;
  tidyNodeIsH1: TtidyNodeIsH1Func;
  tidyNodeIsH2: TtidyNodeIsH2Func;
  tidyNodeIsPRE: TtidyNodeIsPREFunc;
  tidyNodeIsLISTING: TtidyNodeIsLISTINGFunc;
  tidyNodeIsP: TtidyNodeIsPFunc;
  tidyNodeIsUL: TtidyNodeIsULFunc;
  tidyNodeIsOL: TtidyNodeIsOLFunc;
  tidyNodeIsDL: TtidyNodeIsDLFunc;
  tidyNodeIsDIR: TtidyNodeIsDIRFunc;
  tidyNodeIsLI: TtidyNodeIsLIFunc;
  tidyNodeIsDT: TtidyNodeIsDTFunc;
  tidyNodeIsDD: TtidyNodeIsDDFunc;
  tidyNodeIsTABLE: TtidyNodeIsTABLEFunc;
  tidyNodeIsCAPTION: TtidyNodeIsCAPTIONFunc;
  tidyNodeIsTD: TtidyNodeIsTDFunc;
  tidyNodeIsTH: TtidyNodeIsTHFunc;
  tidyNodeIsTR: TtidyNodeIsTRFunc;
  tidyNodeIsCOL: TtidyNodeIsCOLFunc;
  tidyNodeIsCOLGROUP: TtidyNodeIsCOLGROUPFunc;
  tidyNodeIsBR: TtidyNodeIsBRFunc;
  tidyNodeIsA: TtidyNodeIsAFunc;
  tidyNodeIsLINK: TtidyNodeIsLINKFunc;
  tidyNodeIsB: TtidyNodeIsBFunc;
  tidyNodeIsI: TtidyNodeIsIFunc;
  tidyNodeIsSTRONG: TtidyNodeIsSTRONGFunc;
  tidyNodeIsEM: TtidyNodeIsEMFunc;
  tidyNodeIsBIG: TtidyNodeIsBIGFunc;
  tidyNodeIsSMALL: TtidyNodeIsSMALLFunc;
  tidyNodeIsPARAM: TtidyNodeIsPARAMFunc;
  tidyNodeIsOPTION: TtidyNodeIsOPTIONFunc;
  tidyNodeIsOPTGROUP: TtidyNodeIsOPTGROUPFunc;
  tidyNodeIsIMG: TtidyNodeIsIMGFunc;
  tidyNodeIsMAP: TtidyNodeIsMAPFunc;
  tidyNodeIsAREA: TtidyNodeIsAREAFunc;
  tidyNodeIsNOBR: TtidyNodeIsNOBRFunc;
  tidyNodeIsWBR: TtidyNodeIsWBRFunc;
  tidyNodeIsFONT: TtidyNodeIsFONTFunc;
  tidyNodeIsLAYER: TtidyNodeIsLAYERFunc;
  tidyNodeIsSPACER: TtidyNodeIsSPACERFunc;
  tidyNodeIsCENTER: TtidyNodeIsCENTERFunc;
  tidyNodeIsSTYLE: TtidyNodeIsSTYLEFunc;
  tidyNodeIsSCRIPT: TtidyNodeIsSCRIPTFunc;
  tidyNodeIsNOSCRIPT: TtidyNodeIsNOSCRIPTFunc;
  tidyNodeIsFORM: TtidyNodeIsFORMFunc;
  tidyNodeIsTEXTAREA: TtidyNodeIsTEXTAREAFunc;
  tidyNodeIsBLOCKQUOTE: TtidyNodeIsBLOCKQUOTEFunc;
  tidyNodeIsAPPLET: TtidyNodeIsAPPLETFunc;
  tidyNodeIsOBJECT: TtidyNodeIsOBJECTFunc;
  tidyNodeIsDIV: TtidyNodeIsDIVFunc;
  tidyNodeIsSPAN: TtidyNodeIsSPANFunc;
  tidyNodeIsINPUT: TtidyNodeIsINPUTFunc;
  tidyNodeIsQ: TtidyNodeIsQFunc;
  tidyNodeIsLABEL: TtidyNodeIsLABELFunc;
  tidyNodeIsH3: TtidyNodeIsH3Func;
  tidyNodeIsH4: TtidyNodeIsH4Func;
  tidyNodeIsH5: TtidyNodeIsH5Func;
  tidyNodeIsH6: TtidyNodeIsH6Func;
  tidyNodeIsADDRESS: TtidyNodeIsADDRESSFunc;
  tidyNodeIsXMP: TtidyNodeIsXMPFunc;
  tidyNodeIsSELECT: TtidyNodeIsSELECTFunc;
  tidyNodeIsBLINK: TtidyNodeIsBLINKFunc;
  tidyNodeIsMARQUEE: TtidyNodeIsMARQUEEFunc;
  tidyNodeIsEMBED: TtidyNodeIsEMBEDFunc;
  tidyNodeIsBASEFONT: TtidyNodeIsBASEFONTFunc;
  tidyNodeIsISINDEX: TtidyNodeIsISINDEXFunc;
  tidyNodeIsS: TtidyNodeIsSFunc;
  tidyNodeIsSTRIKE: TtidyNodeIsSTRIKEFunc;
  tidyNodeIsU: TtidyNodeIsUFunc;
  tidyNodeIsMENU: TtidyNodeIsMENUFunc;
  
procedure InitTidyLibrary(LibHandle: THandle);

implementation

procedure InitTidyLibrary;
Begin
  tidyNodeGetType := GetProcAddress(LibHandle, 'tidyNodeGetType');
  tidyNodeGetName := GetProcAddress(LibHandle, 'tidyNodeGetName');
  tidyNodeIsText := GetProcAddress(LibHandle, 'tidyNodeIsText');
  tidyNodeIsProp := GetProcAddress(LibHandle, 'tidyNodeIsProp');
  tidyNodeIsHeader := GetProcAddress(LibHandle, 'tidyNodeIsHeader');
  tidyNodeHasText := GetProcAddress(LibHandle, 'tidyNodeHasText');
  tidyNodeGetText := GetProcAddress(LibHandle, 'tidyNodeGetText');
  tidyNodeGetId := GetProcAddress(LibHandle, 'tidyNodeGetId');
  tidyNodeIsHTML := GetProcAddress(LibHandle, 'tidyNodeIsHTML');
  tidyNodeIsHEAD := GetProcAddress(LibHandle, 'tidyNodeIsHEAD');
  tidyNodeIsTITLE := GetProcAddress(LibHandle, 'tidyNodeIsTITLE');
  tidyNodeIsBASE := GetProcAddress(LibHandle, 'tidyNodeIsBASE');
  tidyNodeIsMETA := GetProcAddress(LibHandle, 'tidyNodeIsMETA');
  tidyNodeIsBODY := GetProcAddress(LibHandle, 'tidyNodeIsBODY');
  tidyNodeIsFRAMESET := GetProcAddress(LibHandle, 'tidyNodeIsFRAMESET');
  tidyNodeIsFRAME := GetProcAddress(LibHandle, 'tidyNodeIsFRAME');
  tidyNodeIsIFRAME := GetProcAddress(LibHandle, 'tidyNodeIsIFRAME');
  tidyNodeIsNOFRAMES := GetProcAddress(LibHandle, 'tidyNodeIsNOFRAMES');
  tidyNodeIsHR := GetProcAddress(LibHandle, 'tidyNodeIsHR');
  tidyNodeIsH1 := GetProcAddress(LibHandle, 'tidyNodeIsH1');
  tidyNodeIsH2 := GetProcAddress(LibHandle, 'tidyNodeIsH2');
  tidyNodeIsPRE := GetProcAddress(LibHandle, 'tidyNodeIsPRE');
  tidyNodeIsLISTING := GetProcAddress(LibHandle, 'tidyNodeIsLISTING');
  tidyNodeIsP := GetProcAddress(LibHandle, 'tidyNodeIsP');
  tidyNodeIsUL := GetProcAddress(LibHandle, 'tidyNodeIsUL');
  tidyNodeIsOL := GetProcAddress(LibHandle, 'tidyNodeIsOL');
  tidyNodeIsDL := GetProcAddress(LibHandle, 'tidyNodeIsDL');
  tidyNodeIsDIR := GetProcAddress(LibHandle, 'tidyNodeIsDIR');
  tidyNodeIsLI := GetProcAddress(LibHandle, 'tidyNodeIsLI');
  tidyNodeIsDT := GetProcAddress(LibHandle, 'tidyNodeIsDT');
  tidyNodeIsDD := GetProcAddress(LibHandle, 'tidyNodeIsDD');
  tidyNodeIsTABLE := GetProcAddress(LibHandle, 'tidyNodeIsTABLE');
  tidyNodeIsCAPTION := GetProcAddress(LibHandle, 'tidyNodeIsCAPTION');
  tidyNodeIsTD := GetProcAddress(LibHandle, 'tidyNodeIsTD');
  tidyNodeIsTH := GetProcAddress(LibHandle, 'tidyNodeIsTH');
  tidyNodeIsTR := GetProcAddress(LibHandle, 'tidyNodeIsTR');
  tidyNodeIsCOL := GetProcAddress(LibHandle, 'tidyNodeIsCOL');
  tidyNodeIsCOLGROUP := GetProcAddress(LibHandle, 'tidyNodeIsCOLGROUP');
  tidyNodeIsBR := GetProcAddress(LibHandle, 'tidyNodeIsBR');
  tidyNodeIsA := GetProcAddress(LibHandle, 'tidyNodeIsA');
  tidyNodeIsLINK := GetProcAddress(LibHandle, 'tidyNodeIsLINK');
  tidyNodeIsB := GetProcAddress(LibHandle, 'tidyNodeIsB');
  tidyNodeIsI := GetProcAddress(LibHandle, 'tidyNodeIsI');
  tidyNodeIsSTRONG := GetProcAddress(LibHandle, 'tidyNodeIsSTRONG');
  tidyNodeIsEM := GetProcAddress(LibHandle, 'tidyNodeIsEM');
  tidyNodeIsBIG := GetProcAddress(LibHandle, 'tidyNodeIsBIG');
  tidyNodeIsSMALL := GetProcAddress(LibHandle, 'tidyNodeIsSMALL');
  tidyNodeIsPARAM := GetProcAddress(LibHandle, 'tidyNodeIsPARAM');
  tidyNodeIsOPTION := GetProcAddress(LibHandle, 'tidyNodeIsOPTION');
  tidyNodeIsOPTGROUP := GetProcAddress(LibHandle, 'tidyNodeIsOPTGROUP');
  tidyNodeIsIMG := GetProcAddress(LibHandle, 'tidyNodeIsIMG');
  tidyNodeIsMAP := GetProcAddress(LibHandle, 'tidyNodeIsMAP');
  tidyNodeIsAREA := GetProcAddress(LibHandle, 'tidyNodeIsAREA');
  tidyNodeIsNOBR := GetProcAddress(LibHandle, 'tidyNodeIsNOBR');
  tidyNodeIsWBR := GetProcAddress(LibHandle, 'tidyNodeIsWBR');
  tidyNodeIsFONT := GetProcAddress(LibHandle, 'tidyNodeIsFONT');
  tidyNodeIsLAYER := GetProcAddress(LibHandle, 'tidyNodeIsLAYER');
  tidyNodeIsSPACER := GetProcAddress(LibHandle, 'tidyNodeIsSPACER');
  tidyNodeIsCENTER := GetProcAddress(LibHandle, 'tidyNodeIsCENTER');
  tidyNodeIsSTYLE := GetProcAddress(LibHandle, 'tidyNodeIsSTYLE');
  tidyNodeIsSCRIPT := GetProcAddress(LibHandle, 'tidyNodeIsSCRIPT');
  tidyNodeIsNOSCRIPT := GetProcAddress(LibHandle, 'tidyNodeIsNOSCRIPT');
  tidyNodeIsFORM := GetProcAddress(LibHandle, 'tidyNodeIsFORM');
  tidyNodeIsTEXTAREA := GetProcAddress(LibHandle, 'tidyNodeIsTEXTAREA');
  tidyNodeIsBLOCKQUOTE := GetProcAddress(LibHandle, 'tidyNodeIsBLOCKQUOTE');
  tidyNodeIsAPPLET := GetProcAddress(LibHandle, 'tidyNodeIsAPPLET');
  tidyNodeIsOBJECT := GetProcAddress(LibHandle, 'tidyNodeIsOBJECT');
  tidyNodeIsDIV := GetProcAddress(LibHandle, 'tidyNodeIsDIV');
  tidyNodeIsSPAN := GetProcAddress(LibHandle, 'tidyNodeIsSPAN');
  tidyNodeIsINPUT := GetProcAddress(LibHandle, 'tidyNodeIsINPUT');
  tidyNodeIsQ := GetProcAddress(LibHandle, 'tidyNodeIsQ');
  tidyNodeIsLABEL := GetProcAddress(LibHandle, 'tidyNodeIsLABEL');
  tidyNodeIsH3 := GetProcAddress(LibHandle, 'tidyNodeIsH3');
  tidyNodeIsH4 := GetProcAddress(LibHandle, 'tidyNodeIsH4');
  tidyNodeIsH5 := GetProcAddress(LibHandle, 'tidyNodeIsH5');
  tidyNodeIsH6 := GetProcAddress(LibHandle, 'tidyNodeIsH6');
  tidyNodeIsADDRESS := GetProcAddress(LibHandle, 'tidyNodeIsADDRESS');
  tidyNodeIsXMP := GetProcAddress(LibHandle, 'tidyNodeIsXMP');
  tidyNodeIsSELECT := GetProcAddress(LibHandle, 'tidyNodeIsSELECT');
  tidyNodeIsBLINK := GetProcAddress(LibHandle, 'tidyNodeIsBLINK');
  tidyNodeIsMARQUEE := GetProcAddress(LibHandle, 'tidyNodeIsMARQUEE');
  tidyNodeIsEMBED := GetProcAddress(LibHandle, 'tidyNodeIsEMBED');
  tidyNodeIsBASEFONT := GetProcAddress(LibHandle, 'tidyNodeIsBASEFONT');
  tidyNodeIsISINDEX := GetProcAddress(LibHandle, 'tidyNodeIsISINDEX');
  tidyNodeIsS := GetProcAddress(LibHandle, 'tidyNodeIsS');
  tidyNodeIsSTRIKE := GetProcAddress(LibHandle, 'tidyNodeIsSTRIKE');
  tidyNodeIsU := GetProcAddress(LibHandle, 'tidyNodeIsU');
  tidyNodeIsMENU := GetProcAddress(LibHandle, 'tidyNodeIsMENU');
end;

end.
