// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uSynAttribs;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ConTEXTSynEdit, SynEdit, uCommon, Clipbrd,
  ExtCtrls, SynEditHighlighter, uSafeRegistry,
  SynEditTypes, uHighlighterProcs, uCommonClass;

type
  TMySynAttrib = class
  private
    fName: string;
    fBackground: TColor;
    fForeground: TColor;
    fStyle: TFontStyles;
  public
    procedure AssignToAttrib(HLAttrib: TSynHighlighterAttributes);
    property Name: string read fName write fName;
    property Background: TColor read fBackground write fBackground;
    property Foreground: TColor read fForeground write fForeground;
    property Style: TFontStyles read fStyle write fStyle;
  end;

  TMySynAttribList = class(TList)
  private
    function Get(Index: integer): TMySynAttrib;
    procedure Put(Index: integer; const Value: TMySynAttrib);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadSettings;
    procedure SaveSettings;
    function Add(Attrib: TMySynAttrib): integer; reintroduce;
    function IndexOf(Name: string): integer;
    function Exists(Name: string): boolean;
    procedure AssignToHighlighter(HL: TSynCustomHighlighter);
    procedure AddFromHighlighter(HL: TSynCustomHighlighter);
    procedure Clear; override;
    property Items[Index: integer]: TMySynAttrib read Get write Put; default;
  end;

var
  SynAttribList: TMySynAttribList;

implementation


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TMySynAttrib.AssignToAttrib(HLAttrib: TSynHighlighterAttributes);
begin
  HLAttrib.Foreground:=fForeground;
  HLAttrib.Background:=fBackground;
  HLAttrib.Style:=fStyle;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TMySynAttribList.Get(Index: integer): TMySynAttrib;
begin
  result:=inherited Get(Index);
end;
//------------------------------------------------------------------------------------------
procedure TMySynAttribList.Put(Index: integer; const Value: TMySynAttrib);
begin
  inherited Put(Index, Value);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TMySynAttribList.Add(Attrib: TMySynAttrib): integer;
begin
  if not Exists(Attrib.Name) then
    result:=inherited Add(Attrib)
  else
    result:=-1;
end;
//------------------------------------------------------------------------------------------
procedure TMySynAttribList.Clear;
var
  i: integer;
begin
  for i:=0 to Count-1 do
    Items[i].Free;
  inherited;
end;
//------------------------------------------------------------------------------------------
function TMySynAttribList.IndexOf(Name: string): integer;
var
  i: integer;
begin
  result:=-1;
  Name:=UpperCase(Name);
  i:=0;
  while (i<Count) do begin
    if (Items[i].Name=Name) then begin
      result:=i;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
function TMySynAttribList.Exists(Name: string): boolean;
begin
  result:=(IndexOf(Name)<>-1);
end;
//------------------------------------------------------------------------------------------
procedure TMySynAttribList.LoadSettings;
begin

end;
//------------------------------------------------------------------------------------------
procedure TMySynAttribList.SaveSettings;
begin

end;
//------------------------------------------------------------------------------------------
procedure TMySynAttribList.AssignToHighlighter(HL: TSynCustomHighlighter);
var
  i: integer;
  n: integer;
begin
  for i:=0 to HL.AttrCount-1 do begin
    n:=IndexOf(HL.Attribute[i].Name);
    if (n<>-1) then
      Items[n].AssignToAttrib(HL.Attribute[i]);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TMySynAttribList.AddFromHighlighter(HL: TSynCustomHighlighter);
begin
//  for i:=0 to HL.AttrCount-1 do begin
//    Add(HL.Attribute[i].Name);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Contructor, Destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TMySynAttribList.Create;
begin
  Capacity:=16;
end;
//------------------------------------------------------------------------------------------
destructor TMySynAttribList.Destroy;
begin
  inherited;
end;
//------------------------------------------------------------------------------------------

initialization
//  SynAttribList:=TMySynAttribList.Create;
finalization
//  FreeAndNil(SynAttribList);

end.
