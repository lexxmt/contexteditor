// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fTextStats;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMultiLanguage, fEditor, SynEdit, ComCtrls, StdCtrls,
  SynEditHighlighter, JclFileUtils, Clipbrd, uCommon, uSafeRegistry,
  SynEditTypes;

type
  TfmTextStats = class(TForm)
    lvStats: TListView;
    btnClose: TButton;
    btnCopy: TButton;
    procedure btnCopyClick(Sender: TObject);
  private
    fEditor: TfmEditor;
    fStrings: TStrings;
    procedure AddItem(ACaption, Value: string);
    procedure DoStats;
    procedure LoadSettings;
    procedure SaveSettings;
  public
    constructor Create(AOwner: TComponent; Editor: TfmEditor); reintroduce;
    destructor Destroy; override;
  end;

procedure CreateTextStatsDialog(Editor: TfmEditor);

implementation

{$R *.dfm}

uses
  fMain;


////////////////////////////////////////////////////////////////////////////////////////////
//                                Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure CreateTextStatsDialog(Editor: TfmEditor);
begin
  with TfmTextStats.Create(fmMain, Editor) do
    try
      ShowModal;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmTextStats.LoadSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+Name, TRUE) then begin
        ReadListViewWidths(lvStats);
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmTextStats.SaveSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+Name, TRUE) then begin
        WriteListViewWidths(lvStats);
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmTextStats.AddItem(ACaption, Value: string);
begin
  with lvStats.Items.Add do begin
    Caption:=ACaption;
    SubItems.Add(Value);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmTextStats.DoStats;
var
  i, ii: integer;
  s: string;
  len: integer;
  CharCount: integer;
  NonSpaceCharCount: integer;
  NonEmptyLines: integer;
  CommentedCharCount: integer;
  dt: TDateTime;

  function DoCountCommentedChars: integer;
  var
    HL: TSynCustomHighlighter;
    X, Y: integer;
    token: string;
    attr: TSynHighlighterAttributes;
    len: integer;
  begin
    result:=0;

    HL:=fEditor.memo.Highlighter;
    if Assigned(HL) and (HL<>fmMain.hlTxt) then begin
      for Y:=0 to fStrings.Count-1 do begin
        X:=0;
        while (X<Length(fStrings[Y])) do begin
          if fEditor.memo.GetHighlighterAttriAtRowCol(BufferCoord(X+1, Y+1), token, attr) then begin
            len:=Length(token);
            if (attr=HL.CommentAttribute) then begin
              inc(result, len);
              inc(X, len);
            end;
            inc(X, len);
          end else
            BREAK;
        end;
      end;
    end;
  end;

begin
  NonEmptyLines:=0;
  CharCount:=0;
  NonSpaceCharCount:=0;

  for i:=0 to fStrings.Count-1 do begin
    s:=fStrings[i];
    len:=Length(s);

    if (Length(Trim(s))>0) then
      inc(NonEmptyLines);

    inc(CharCount, len);

    for ii:=1 to len do
      if (s[ii]>#32) then
        inc(NonSpaceCharCount);
  end;

  CommentedCharCount:=DoCountCommentedChars;

  if not fEditor.NewFile then begin
    AddItem(mlStr(ML_STATS_FILENAME, 'File name'), fEditor.FileName);

    if GetFileCreation(fEditor.FileName, dt) then
      AddItem(mlStr(ML_STATS_CREATED, 'Created'), DateTimeToStr(dt));
    if GetFileLastWrite(fEditor.FileName, dt) then
      AddItem(mlStr(ML_STATS_MODIFIED, 'Modified'), DateTimeToStr(dt));
  end;

  AddItem(mlStr(ML_STATS_LINES, 'Lines'), IntToStr(fStrings.Count));
  AddItem(mlStr(ML_STATS_NONEMPTY_LINES, 'Non-empty lines'), IntToStr(NonEmptyLines));
  AddItem(mlStr(ML_STATS_CHARS, 'Characters'), IntToStr(CharCount));
  AddItem(mlStr(ML_STATS_CHARS_WITHOUT_BLANKS, 'Characters without blanks'), IntToStr(NonSpaceCharCount));
  AddItem(mlStr(ML_STATS_COMMENTED_CHARS, 'Commented char count'), IntToStr(CommentedCharCount));

  if (CharCount>0) then
    AddItem(mlStr(ML_STATS_COMMENTED_CHARS_PERCENT, 'Commented char count percent'), FormatFloat('0.#', CommentedCharCount/CharCount*100));
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmTextStats.btnCopyClick(Sender: TObject);
var
  buff: PChar;
  str: TStringList;
  i: integer;
  Item: TListItem;
begin
  str:=TStringList.Create;

  for i:=0 to lvStats.Items.Count-1 do begin
    Item:=lvStats.Items[i];
    str.Add(Format('%s'#09'%s', [Item.Caption, Item.SubItems[0]]));
  end;

  if (str.Count>0) then begin
    buff:=str.GetText;
    Clipboard.SetTextBuf(buff);
    StrDispose(buff);
  end;

  str.Free;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TfmTextStats.Create(AOwner: TComponent; Editor: TfmEditor);
begin
  fEditor:=Editor;
  fStrings:=Editor.memo.Lines;

  inherited Create(AOwner);
  lvStats.DoubleBuffered:=TRUE;
  LoadSettings;

  mlApplyLanguageToForm(SELF, Name);

  Screen.Cursor:=crHourGlass;
  try
    DoStats;
  finally
    Screen.Cursor:=crDefault;
  end;
end;
//------------------------------------------------------------------------------------------
destructor TfmTextStats.Destroy;
begin
  SaveSettings;
  inherited;
end;
//------------------------------------------------------------------------------------------

end.
