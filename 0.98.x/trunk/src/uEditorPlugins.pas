// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uEditorPlugins;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Dialogs,
  ConTEXTSynEdit, SynEdit, uCommon, SynEditMiscProcs, JclGraphUtils,
  SynEditHighlighter, SynEditTypes, SynEditTextBuffer, JclStrings, SynEditMiscClasses,
  uCommonClass;

type
  TEmphasizeWordStyle = (ewNone, ewLine, ewDoubleLine, ewWave);

  TEmphasizeWordPlugin = class(TSynEditPlugin)
  private
    fWord: string;
    fWordLen: integer;
    fColor: TColor;
    fStyle: TEmphasizeWordStyle;
    fCaseSensitive: boolean;
    procedure SetWord(const Value: string);
  protected
    procedure AfterPaint(ACanvas: TCanvas; const AClip: TRect; FirstLine, LastLine: integer); override;
    procedure LinesInserted(FirstLine, Count: integer); override;
    procedure LinesDeleted(FirstLine, Count: integer); override;
  public
    constructor Create(AOwner: TCustomSynEdit);
    property Word: string read fWord write SetWord;
    property Style: TEmphasizeWordStyle read fStyle write fStyle;
    property Color: TColor read fColor write fColor;
    property CaseSensitive: boolean read fCaseSensitive write fCaseSensitive;
  end;

implementation


////////////////////////////////////////////////////////////////////////////////////////////
//                              TEmphasizeWordPlugin
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TEmphasizeWordPlugin.Create(AOwner: TCustomSynEdit);
begin
  inherited;
  fColor:=clRed;
  fStyle:=ewWave;
//  fStyle:=ewLine;
//  fStyle:=ewDoubleLine;
end;
//------------------------------------------------------------------------------------------
procedure TEmphasizeWordPlugin.AfterPaint(ACanvas: TCanvas; const AClip: TRect;
  FirstLine, LastLine: integer);
var
  i: integer;
  P: TPoint;
  n: integer;
  search_index: integer;
  s: string;
  canvas_properties_set: boolean;
  drawXdef: integer;
  drawP: TPoint;
  drawW: integer;
  oldPenStyle: TPenStyle;
  found_pos: integer;
begin
  if (fStyle<>ewNone) then begin
    drawW:=Editor.CharWidth*fWordLen;
    canvas_properties_set:=FALSE;

    for i:=FirstLine to LastLine do begin
      n:=Editor.RowToLine(i);
      s:=Editor.Lines[n-1];
      if (Length(s)>0) then begin
        search_index:=1;
        repeat
          if fCaseSensitive then
            found_pos:=StrNPos(s, fWord, search_index)
          else
            found_pos:=StrNIPos(s, fWord, search_index);

          if (found_pos>0) then begin
            drawP:=Editor.RowColumnToPixels(Editor.BufferToDisplayPos(BufferCoord(found_pos, n)));
            inc(drawP.Y, Editor.LineHeight-1);

            with ACanvas do begin
              if not canvas_properties_set then begin
                Pen.Color:=fColor;
                oldPenStyle:=Pen.Style;
                Brush.Style:=bsClear;
                if (fStyle=ewWave) then
                  Pen.Style:=psDot
                else
                  Pen.Style:=psSolid;
                canvas_properties_set:=TRUE;
              end;
              case fStyle of
                ewLine:
                  begin
                    MoveTo(drawP.X, drawP.Y);
                    LineTo(drawP.X+drawW, drawP.Y);
                  end;
                ewDoubleLine:
                  begin
                    MoveTo(drawP.X, drawP.Y);
                    LineTo(drawP.X+drawW, drawP.Y);
                    MoveTo(drawP.X, drawP.Y-2);
                    LineTo(drawP.X+drawW, drawP.Y-2);
                  end;
                ewWave:
                  begin
                    MoveTo(drawP.X+3, drawP.Y);
                    LineTo(drawP.X+drawW, drawP.Y);
                    MoveTo(drawP.X, drawP.Y-1);
                    LineTo(drawP.X+drawW, drawP.Y-1);
                  end;
              end;
            end;
            inc(search_index);
          end;
        until (found_pos=0);
      end;
    end;

    if canvas_properties_set then
      ACanvas.Pen.Style:=oldPenStyle;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TEmphasizeWordPlugin.LinesDeleted(FirstLine, Count: integer);
begin
  //
end;
//------------------------------------------------------------------------------------------
procedure TEmphasizeWordPlugin.LinesInserted(FirstLine, Count: integer);
begin
  //
end;
//------------------------------------------------------------------------------------------
procedure TEmphasizeWordPlugin.SetWord(const Value: string);
begin
  if (fWord<>Value) then begin
    fWord:=Value;
    fWordLen:=Length(fWord);
  end;
end;
//------------------------------------------------------------------------------------------

end.
