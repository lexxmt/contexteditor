// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uRuler;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RsRuler;

type
  TRuler = class
  private
    fRelativeXPos: integer;
    fLeftIndent: integer;
    procedure SetRelativeXPos(const Value: integer);
    procedure SetLeftIndent(const Value: integer);
  private
    fRuler: TRsRuler;
    fCurrentX: integer;
    fCharWidth: integer;
    fCurrentXOffset: integer;
    fEditor: TForm;
    procedure SetCharWidth(const Value: integer);
    procedure SetCurrentX(const Value: integer);
    procedure SetCurrentXOffset(const Value: integer);
    property RelativeXPos: integer read fRelativeXPos write SetRelativeXPos;
  public
    constructor Create(Editor: TForm);
    destructor Destroy; override;
    property CharWidth: integer read fCharWidth write SetCharWidth;
    property CurrentX: integer read fCurrentX write SetCurrentX;
    property CurrentXOffset: integer read fCurrentXOffset write SetCurrentXOffset;
    property LeftIndent: integer read fLeftIndent write SetLeftIndent;
  end;

implementation


////////////////////////////////////////////////////////////////////////////////////////////
//                                Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TRuler.SetCharWidth(const Value: integer);
begin
  if (fCharWidth<>Value) then begin
    fCharWidth:=Value;
    fRuler.HairBlockWidth:=Value;
    fRuler.Scale:=(Value*100);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TRuler.SetRelativeXPos(const Value: integer);
begin
  if (fRelativeXPos<>Value) then begin
    fRelativeXPos:=Value;
    fRuler.HairLinePos:=(fCharWidth*Value)+1;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TRuler.SetCurrentX(const Value: integer);
begin
  fCurrentX:=Value;
  RelativeXPos:=Value-fCurrentXOffset;
end;
//------------------------------------------------------------------------------------------
procedure TRuler.SetCurrentXOffset(const Value: integer);
begin
  if (fCurrentXOffset<>Value) then begin
    fCurrentXOffset:=Value;
    RelativeXPos:=fCurrentX-fCurrentXOffset;
    fRuler.LeftOffset:=Value;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TRuler.SetLeftIndent(const Value: integer);
begin
  fLeftIndent:=Value;
  fRuler.LeftIndent:=Value;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                               Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TRuler.Create(Editor: TForm);
begin
  fEditor:=Editor;

  fRuler:=TRsRuler.Create(Editor);
  with fRuler do begin
    HairLineStyle:=hlsBlock;
    Height:=23;
    Units:=ruPixel;
    Flat:=TRUE;
    ScaleColor:=clWindow;
    TickColor:=clWindowText;
    Direction:=rdTop;
    ScaleDir:=rsdNormal;
    Scale:=800;
    HairLine:=TRUE;
    HairLinePos:=-1;
    HairBlockWidth:=0;
    LeftOffset:=0;
    Align:=alTop;
    Parent:=Editor;
  end;

  fCurrentX:=-1;
end;
//------------------------------------------------------------------------------------------
destructor TRuler.Destroy;
begin
  fRuler.Free;
  inherited;
end;
//------------------------------------------------------------------------------------------

end.
