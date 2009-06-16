// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fBottomWindowSearchResults;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fBottomWindowPage, StdCtrls, TB2Item, TBX, Menus, ActnList,
  ScrollListBox, Clipbrd, ExtCtrls, uCommonClass, DirLabel, ComCtrls,
  SynEditTypes, uMultiLanguage, uCommon, JclStrings;

type
  TfmBottomWindowSearchResults = class(TfmBottomWindowPage)
    lbResults: THScrollListBox;
    bmpMarker: TImage;
    pnProgress: TPanel;
    ProgressBar: TProgressBar;
    labMessage: TLabel;
    labSearchingFile: TDirLabel;
    btnStop: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure lbResultsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbResultsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure pnProgressResize(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    procedure SetProgressVisible(const Value: boolean);
    procedure SetProgress(const Value: integer);
    procedure SetProgressMax(const Value: integer);
    procedure SetProgressCurrentFile(const Value: string);
    procedure SetProgressMessage(const Value: string);
  protected
    procedure LoadSettings; override;
    procedure SaveSettings; override;
  public
    class function GetDefaultCaption:string; override;

    procedure SelectFirstItem;
    procedure Add(FindTextResult: TFindTextResult);
    procedure AddList(List: TFindTextResultList);
    procedure AppendList(List: TFindTextResultList);

    function JumpToLineInSourceEnabled:boolean; override;
    function CopySelectedLineToClipboardEnabled:boolean; override;
    function CopyAllToClipboardEnabled:boolean; override;
    function ClearContentsEnabled:boolean; override;

    procedure JumpToLineInSource; override;
    procedure CopySelectedLineToClipboard; override;
    procedure CopyAllToClipboard; override;
    procedure ClearContents; override;

    property ProgressVisible: boolean write SetProgressVisible;
    property ProgressMessage: string write SetProgressMessage; 
    property Progress: integer write SetProgress;
    property ProgressMax: integer write SetProgressMax;
    property ProgressCurrentFile: string write SetProgressCurrentFile;
  end;


implementation

{$R *.dfm}

uses
  fMain, fEditor;

const
  ATTR_BOLD_BEG = #01;
  ATTR_BOLD_END = #02;
  ATTR_BLUE_BEG = #03;
  ATTR_BLUE_END = #04;
  ATTR_CHARS = [ATTR_BOLD_BEG, ATTR_BOLD_END, ATTR_BLUE_BEG, ATTR_BLUE_END];


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function FilterString(s: string): string;
begin
  result:=StrRemoveChars(s, ATTR_CHARS);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SetProgressVisible(const Value: boolean);
begin
  if Value then begin
    labMessage.Caption:='';
    ProgressBar.Position:=0;
    labSearchingFile.DirName:='';
  end;

  pnProgress.Visible:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SetProgressMessage(const Value: string);
begin
  labMessage.Caption:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SetProgress(const Value: integer);
begin
  ProgressBar.Position:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SetProgressMax(const Value: integer);
begin
  ProgressBar.Max:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SetProgressCurrentFile(const Value: string);
begin
  labSearchingFile.DirName:=Value;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
class function TfmBottomWindowSearchResults.GetDefaultCaption: string;
begin
  result:=mlStr(ML_FIND_PANEL_CAPTION, 'Search Results');
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowSearchResults.ClearContentsEnabled: boolean;
begin
  result:=lbResults.Items.Count>0;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowSearchResults.CopyAllToClipboardEnabled: boolean;
begin
  result:=lbResults.Items.Count>0;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowSearchResults.CopySelectedLineToClipboardEnabled: boolean;
begin
  result:=lbResults.ItemIndex<>-1;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowSearchResults.JumpToLineInSourceEnabled: boolean;
begin
  result:=lbResults.ItemIndex<>-1;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.ClearContents;
var
  i: integer;
begin
  for i:=0 to lbResults.Items.Count-1 do
    if Assigned(lbResults.Items.Objects[i]) then
      TFindTextResult(lbResults.Items.Objects[i]).Free;

  lbResults.ClearList;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.CopyAllToClipboard;
var
  buff: PChar;
  str: TStringList;
  i: integer;
  Data: TFindTextResult;
begin
  if not CopyAllToClipboardEnabled then EXIT;

  str:=TStringList.Create;

  for i:=0 to lbResults.Items.Count-1 do begin
    Data:=TFindTextResult(lbResults.Items.Objects[i]);
    str.Add(Format('%s (%d): %s', [Data.FileName, Data.Position.Line, Data.OriginalLine]));
  end;

  if (str.Count>0) then begin
    buff:=str.GetText;
    Clipboard.SetTextBuf(buff);
    StrDispose(buff);
  end;

  str.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.CopySelectedLineToClipboard;
var
  buff: PChar;
  str: TStringList;
  Data: TFindTextResult;
begin
  if not CopySelectedLineToClipboardEnabled then EXIT;

  str:=TStringList.Create;

  Data:=TFindTextResult(lbResults.Items.Objects[lbResults.ItemIndex]);
  str.Add(Format('%s (%d): %s', [Data.FileName, Data.Position.Line, Data.OriginalLine]));

  buff:=str.GetText;
  Clipboard.SetTextBuf(buff);
  StrDispose(buff);
  str.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.JumpToLineInSource;
var
  FindResult: TFindTextResult;
  Editor: TfmEditor;
begin
  if not JumpToLineInSourceEnabled then EXIT;

  FindResult:=TFindTextResult(lbResults.Items.Objects[lbResults.ItemIndex]);
  if Assigned(FindResult) then begin
    if fmMain.OpenFile(FindResult.FileName) then begin
      Editor:=fmMain.ActiveEditor;
      if Assigned(Editor) then begin
        Editor.SetCursorPos(FindResult.Position.Char-1, FindResult.Position.Line);

        Editor.memo.BlockBegin:=BufferCoord(FindResult.Position.Char, FindResult.Position.Line+1);
        Editor.memo.BlockEnd:=BufferCoord(FindResult.Position.Char+FindResult.Len, FindResult.Position.Line+1);


        Editor.SetCursorPosNice;
        SendMessage(Editor.Handle, WM_MDIACTIVATE, Editor.Handle,0);
        Editor.memo.SetFocus;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SelectFirstItem;
begin
  if (lbResults.Items.Count>0) then begin
    lbResults.ItemIndex:=0;
    JumpToLineInSource;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.Add(FindTextResult: TFindTextResult);
var
  sLine: string;
begin
  if Assigned(FindTextResult) then begin
    with FindTextResult do begin
      sLine:=FindTextResult.Line;
      OriginalLine:=sLine;
      Insert(ATTR_BOLD_BEG, sLine, Position.Char);
      Insert(ATTR_BOLD_END, sLine, Position.Char+Len+1);
      FormattedLine:=Q_TabsToSpaces(sLine, EditorCfg.TabWidth);
    end;

    lbResults.AddString(sLine, FindTextResult);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.AppendList(List: TFindTextResultList);
var
  i: integer;
begin
  for i:=0 to List.Count-1 do
    Add(List[i]);
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.AddList(List: TFindTextResultList);
begin
  ClearContents;
  AppendList(List);
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.LoadSettings;
begin

end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.SaveSettings;
begin

end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.lbResultsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  XY :TPoint;
begin
  if (Button=mbRight) then begin
    lbResults.ItemIndex:=lbResults.ItemAtPos(Point(X,Y),FALSE);

    XY:=lbResults.ClientToScreen(Point(X,Y));
    lbResults.PopupMenu.Popup(XY.X, XY.Y);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.lbResultsDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  s                :string;
  s1, bold_str, s2 :string;
  boldBeg, boldEnd :integer;
  l_pos            :integer;
  oldRect          :TRect;
  Data: TFindTextResult;
  DefaultTextColor: TColor;
  GrayTextColor: TColor;
  ControlFocused: boolean;
const
  TEXT_BEG = 15;

  procedure OutText(Text: string; Color: TColor; Style: TFontStyles);
  begin
    with TListBox(Control).Canvas do begin
      Font.Style:=Style;
      Font.Color:=Color;
      TextOut(l_pos, Rect.top, Text);
      inc(l_pos, TextWidth(Text));
    end;
  end;

begin
  Data:=TFindTextResult(TListBox(Control).Items.Objects[Index]);
  s:=Data.FormattedLine;

  boldBeg:=Pos(ATTR_BOLD_BEG, s);
  boldEnd:=Pos(ATTR_BOLD_END, s);

  if (boldBeg>0) then begin
    s1:=Copy(s, 1, boldBeg-1);
    bold_str:=Copy(s, boldBeg+1, boldEnd-boldBeg-1);
    s2:=Copy(s, boldEnd+1,Length(s));
  end else begin
    s1:=s;
    bold_str:='';
    s2:='';
  end;

  ControlFocused:=TListBox(Control).Focused;

  with TListBox(Control).Canvas do begin
    oldRect:=Rect;

    Rect.Right:=TEXT_BEG;
    Brush.Color:=clWindow;
    FillRect(Rect);

    if (odSelected in State) then begin
      BrushCopy(Bounds(Rect.Left + 2, Rect.Top+1, bmpMarker.Width, bmpMarker.Height),
                bmpMarker.Picture.Bitmap, Bounds(0, 0, bmpMarker.Width, bmpMarker.Height), clRed);

      if ControlFocused then
        Brush.Color:=clHighlight
      else
        Brush.Color:=clInactiveBorder;
    end;

    Rect:=oldRect;
    Rect.Left:=TEXT_BEG;
    FillRect(Rect);

    if (odSelected in State) and ControlFocused then begin
      DefaultTextColor:=clHighLightText;
      GrayTextColor:=clHighLightText;
    end else begin
      DefaultTextColor:=clWindowText;
      GrayTextColor:=clGray;
    end;

    l_pos:=TEXT_BEG+3;

    OutText(Format('%s (%d): ', [Data.FileName, Data.Position.Line]), GrayTextColor, []);
    OutText(s1, DefaultTextColor, []);
    OutText(bold_str, DefaultTextColor, [fsBold]);
    OutText(s2, DefaultTextColor, []);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.pnProgressResize(Sender: TObject);
begin
  btnStop.Left:=pnProgress.Width-btnStop.Width-4;
  labSearchingFile.Width:=btnStop.Left-labSearchingFile.Left-4;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.btnStopClick(Sender: TObject);
begin
//  if Assigned(FindFilesThread) then
//    FindFilesThread.Stop;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowSearchResults.FormDestroy(Sender: TObject);
begin
  ClearContents;
  inherited;
end;
//------------------------------------------------------------------------------------------

end.
