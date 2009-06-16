// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit rmMyDiff;

interface

{$I ConTEXT.inc}

uses windows, Messages, controls, classes, stdctrls, Grids, extctrls, sysutils, Graphics,
  rmListControl, JclStrings, SynEditMiscProcs;

type
  EDiffException = Exception;

  TDiffLineType = (dlNone, dlNormal, dlDeleted, dlInserted, dlChanged);
  TDiffPanel = (dpLeft, dpRight);

  TrmDiffBlock = record
    startLine: integer;
    EndLine: integer;
  end;

  TrmDiffLine = class
  private
    fIndex: integer;
    fTyp: TDiffLineType;
  public
    constructor Create(Typ: TDiffLineType; Index: integer);
    property Typ: TDiffLineType read fTyp;
    property Index: integer read fIndex;
  end;

{
  TrmDiffObject = class(TObject)
  private
    fSource1, fSource2: TrmDiffBlock;
  public
    property Source1: TrmDiffBlock read fSource1 write fSource1;
    property Source2: TrmDiffBlock read fSource2 write fSource2;
  end;
}
  TrmDiffOption = (fdoCaseSensitive, fdoIgnoreCharacters, fdoIgnoreTrailingWhiteSpace, fdoIgnoreLeadingWhiteSpace);
  TrmDiffOptions = set of TrmDiffOption;

  TrmDiffProgressEvent = procedure(PercentComplete: integer) of object;
  TrmDiffOnDoubleClick = procedure(Sender: TObject; Panel: TDiffPanel; DiffLine: TrmDiffLine) of object;

  TrmMyCustomDiffViewer = class;

  TrmCharacterSet = set of char;

  TrmMyCustomDiffEngine = class(TComponent)
  private
  { Private }
    fSource1, fSource2: TStringList;
    fDiffSource1, fDiffSource2 : TStringList;
    fAttachedViewers : TList;
    fSource1Count, fSource2Count: integer;
    fBlankLines1, fBlankLines2: integer;
    fOptions: TrmDiffOptions;
    fOnDiffCompleted: TNotifyEvent;
    fOnProgress: TrmDiffProgressEvent;
    fMatchDepth: integer;
    fIgnoreChars: TrmCharacterSet;
    fMultiLineCommentOpen, fStringOpen: boolean;
    fLineNumbers: boolean;
    fSrc1CurrLine: integer;
    fSrc2CurrLine: integer;
    fLineNumbersWidth: integer;
    fTabWidth: integer;
    function AtEOF: boolean;
    procedure AddLine(DiffStrings: TStringList; ControlChar: char; var LineNumber: integer; Line: string);
    procedure MoveDown(Amount1, Amount2: integer);
    procedure CompareData;
    procedure StartCompare;
    procedure SetMatchDepth(const Value: integer);
    procedure ClearData;
    function RemoveCharacters(st:string):string;
  protected
  { protected }
    function MatchLines(level1, level2, MatchDepth: integer): boolean; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure DiffStarted; virtual;
    procedure DiffFound(Source1, Source2: TrmDiffBlock); virtual;
    procedure DiffCompleted; virtual;

    procedure AttachViewer(viewer:TrmMyCustomDiffViewer);
    procedure RemoveViewer(viewer:TrmMyCustomDiffViewer);

    property MatchDepth: integer read fMatchDepth write SetMatchDepth default 3;
    property DiffOptions: TrmDiffOptions read fOptions write fOptions;
    property OnDiffCompleted: TNotifyEvent read fOnDiffCompleted write fOnDiffCompleted;
    property OnDiffProgress: TrmDiffProgressEvent read fOnProgress write fOnProgress;
    property DiffSource1 : TStringList read fDiffSource1;
    property DiffSource2 : TStringList read fDiffSource2;
    property IgnoreCharacters : TrmCharacterSet read fIgnoreChars write fIgnoreChars;
    property LineNumbers: boolean read fLineNumbers write fLineNumbers;
    property TabWidth: integer read fTabWidth write fTabWidth;
  public
  { Public }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CompareFiles(file1, file2: string);
    procedure CompareStreams(Strm1, Strm2: TStream);
  end;

  TrmMyDiffEngine = class(TrmMyCustomDiffEngine)
  public
    property DiffSource1;
    property DiffSource2;
    property IgnoreCharacters;
  published
  { Published }
    property MatchDepth;
    property DiffOptions;
    property LineNumbers;
    property OnDiffCompleted;
    property OnDiffProgress;
    property TabWidth;
  end;

  TrmMyCustomDiffViewer = class(TCustomControl)
  private
  { Private }
    fDiff: TrmMyCustomDiffEngine;
    fEBGColor: TColor;
    fSimpleViewer: boolean;
    fITColor: TColor;
    fDColor: TColor;
    fCTColor: TColor;
    fInsertedBGColor: TColor;
    fChangedBGColor: TColor;
    fDeletedBGColor: TColor;

    procedure SetEBGColor(const Value: TColor);
    procedure SetSimpleViewer(const Value: boolean);
    procedure SetCTColor(const Value: TColor);
    procedure SetDTColor(const Value: TColor);
    procedure SetITColor(const Value: TColor);
    procedure wmEraseBKGrnd(var msg: tmessage); message wm_erasebkgnd;
    procedure SetChangedBGColor(const Value: TColor);
    procedure SetDeletedBGColor(const Value: TColor);
    procedure SetInsertedBGColor(const Value: TColor);
  protected
  { protected }
    function GetSrc1Label: string; virtual;
    function GetSrc2Label: string; virtual;
    procedure SetSrc1Label(const Value: string); virtual;
    procedure SetSrc2Label(const Value: string); virtual;
    procedure SetDiff(const Value: TrmMyCustomDiffEngine); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property DiffEngine: TrmMyCustomDiffEngine read fDiff write SetDiff;
    function GetMapData: string;
    procedure MapClick(Sender: TObject; IndicatorPos: integer); virtual; Abstract;

    property ChangedTextColor: TColor read fCTColor write SetCTColor default clWindowText;
    property ChangedBGColor: TColor read fChangedBGColor write SetChangedBGColor default clYellow;
    property EmptyBGColor: TColor read fEBGColor write SetEBGColor default clBtnFace;
    property DeletedTextColor: TColor read fDColor write SetDTColor default clWindowText;
    property DeletedBGColor: TColor read fDeletedBGColor write SetDeletedBGColor default clWindow;
    property InsertedTextColor: TColor read fITColor write SetITColor default clWindowText;
    property InsertedBGColor: TColor read fInsertedBGColor write SetInsertedBGColor default clWindow;

    property SimpleDiffViewer: boolean read fSimpleViewer write SetSimpleViewer default true;
    property Src1Label : string read GetSrc1Label write SetSrc1Label;
    property Src2Label : string read GetSrc2Label write SetSrc2Label;
  public
  { Public }
    constructor Create(AOwner: TComponent); override;
    procedure DiffferenceCompleted; virtual;
  published
  { Published }
    property Align;
    property Font;
  end;

  TrmMyDiffViewer = class(TrmMyCustomDiffViewer)
  private
  { Private }
    fDrawing: boolean;
    fsource1: TrmListControl;
    fsource2: TrmListControl;
    fBevel: TBevel;
    fPanel: TPanel;
    fLabel1, fLabel2: TLabel;
    fScrollInProgress: boolean;
    fIHC: boolean;
    fLockSelIndex: boolean;
    fOnDblClick: TrmDiffOnDoubleClick;
    procedure UpdateVScrollBar;
    procedure UpdateHScrollBar;
    procedure scrollChanged(Sender: TObject; ScrollBar: integer);
    procedure Drawing(Sender: TObject; Canvas: TCanvas; Selected: boolean; var str: string);
    procedure cmFontChanged(var Msg: TMessage); message cm_fontchanged;
    procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure WMHScroll(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure SetIHC(const Value: boolean);
    procedure SetLockSelIndex(const Value: boolean);
    procedure OnListControlDblClick(Sender: TObject);
    function GetNextDiffAvailable: boolean;
    function GetPrevDiffAvailable: boolean;
  protected
  { protected }
    function GetSrc1Label: string; override;
    function GetSrc2Label: string; override;
    procedure SetSrc1Label(const Value: string); override;
    procedure SetSrc2Label(const Value: string); override;
    procedure Resize; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure ResetIndex(Index, Pos: integer);
    procedure MapClick(Sender: TObject; IndicatorPos: integer); override;
    function GetNextDiff(StartIndex: integer; SkipIfInBlock: boolean): integer;
    function GetPrevDiff(StartIndex: integer; SkipIfInBlock: boolean): integer;
  public
  { Public }
    procedure DiffferenceCompleted; override;

    constructor Create(AOwner: TComponent); override;
    procedure Loaded; override;

    procedure FirstDiff;
    procedure LastDiff;
    procedure NextDiff;
    procedure PrevDiff;
    procedure UpdateScrollBars;

    property NextDiffAvailable: boolean read GetNextDiffAvailable;
    property PrevDiffAvailable: boolean read GetPrevDiffAvailable;
  published
  { Published }
    property TabStop;
    property DiffEngine;
    property EmptyBGColor;
    property ChangedTextColor;
    property ChangedBGColor;
    property DeletedTextColor;
    property DeletedBGColor;
    property InsertedTextColor;
    property InsertedBGColor;
    property SimpleDiffViewer;
    property IndependantHorzControl: boolean read fIHC write SetIHC default False;
    property LockSelectedIndex:boolean read fLockSelIndex write SetLockSelIndex default true;
    property Src1Label;
    property Src2Label;
    property OnDblClick: TrmDiffOnDoubleClick read fOnDblClick write fOnDblClick;
  end;

implementation

uses rmLibrary, math, Forms;

type
  TrmMyListControl = class(TrmListControl);

const
  NormalLine = #1;
  DeletedLine = #2;
  InsertedLine = #3;
  ChangedLine = #4;
  EmptyLine = #5;

function Q_TabsToSpaces(const S: string; TabStop: Integer): string;
var
  I,L,T: Integer;
  P      :^Char;
begin
  T := TabStop;
  L := 0;
  for I := 1 to Length(S) do
    if S[I] <> #9 then begin
      Inc(L);
      Dec(T);
      if T = 0 then
        T := TabStop;
    end else begin
      Inc(L,T);
      T := TabStop;
    end;
  SetString(Result,nil,L);
  T := TabStop;
  P := Pointer(Result);
  for I := 1 to Length(S) do
    if S[I] <> #9 then begin
      P^ := S[I];
      Dec(T);
      Inc(P);
      if T = 0 then
        T := TabStop;
    end else begin
      repeat
        P^ := ' ';
        Dec(T);
        Inc(P);
      until T = 0;
      T := TabStop;
    end;
end;

{ TrmDiffLine }

constructor TrmDiffLine.Create(Typ: TDiffLineType; Index: integer);
begin
  fTyp:=Typ;
  fIndex:=Index;
end;

{ TrmDiff }

constructor TrmMyCustomDiffEngine.Create;
begin
  inherited;
  fSource1 := TStringList.Create;
  fSource2 := TStringList.Create;
  fDiffSource1 := TStringList.create;
  fDiffSource2 := TStringList.create;
  fAttachedViewers := TList.create;
  fSource1Count := -1;
  fSource2Count := -1;
  fMatchDepth := 3;
  fIgnoreChars := [#0..#32];
  fMultiLineCommentOpen:=false;
  fStringOpen:=false;
  fTabWidth:=8;
end;

destructor TrmMyCustomDiffEngine.Destroy;
begin
  ClearData;
  fSource1.Free;
  fSource2.Free;
  fDiffSource1.free;
  fDiffSource2.free;
  fAttachedViewers.Free;
  inherited;
end;

procedure TrmMyCustomDiffEngine.CompareFiles(file1, file2: string);
begin
  ClearData;
  fSource1.LoadFromFile(File1);
  fSource2.LoadFromFile(File2);
  StartCompare;
end;

procedure TrmMyCustomDiffEngine.CompareStreams(Strm1, Strm2: TStream);
begin
  ClearData;
  fSource1.LoadFromStream(Strm1);
  fSource2.LoadFromStream(Strm2);
  StartCompare;
end;

procedure TrmMyCustomDiffEngine.StartCompare;

  procedure ConvertStringlistTabs(Strings: TStringList);
  var
    i: integer;
  begin
    for i:=0 to Strings.Count-1 do
      Strings[i]:=Q_TabsToSpaces(Strings[i], fTabWidth);
  end;
  
begin
  ConvertStringlistTabs(fSource1);
  ConvertStringlistTabs(fSource2);

  fSource1Count := fSource1.Count;
  fSource2Count := fSource2.count;

  if fLineNumbers then
    fLineNumbersWidth:=Max(Length(IntToStr(fSource1Count)), Length(IntToStr(fSource2Count)));

  DiffStarted;

  while not AtEOF do
    CompareData;

  DiffCompleted;
end;

procedure TrmMyCustomDiffEngine.CompareData;
var
  depth, level, tmp: integer;
  db1, db2: TrmDiffBlock;
  wEOF: boolean;
  CheckDepth: integer;
  src1_cnt, src2_cnt: integer;
begin
  while (not atEOF) and matchLines(0, 0, 0) do
    MoveDown(1, 1);

  if AtEOF then
    exit;

  wEOF := false;
  depth := 0;
  level := 0;

  src1_cnt:=fSource1.count-fSrc1CurrLine;
  src2_cnt:=fSource2.count-fSrc2CurrLine;

  if (fSource1Count = src1_cnt) and (fSource2Count = src2_cnt) then
    checkdepth := 1
  else
    CheckDepth := fMatchDepth;
  while true do
  begin
    try
      if MatchLines(level, depth, CheckDepth) then
        break;

      if (level <> depth) and (MatchLines(depth, level, CheckDepth)) then
        break;

      if (level < depth) then
        inc(level)
      else
      begin
        inc(depth);
        level := 0;
      end;
    except
      wEOF := true;
      level := src2_cnt - 1;
      depth := src1_cnt - 1;
    end;
  end;

  if not wEOF then
  begin
    if MatchLines(level, depth, CheckDepth) then
    begin
      tmp := level;
      level := depth;
      depth := tmp;
    end;
  end;

  db1.startLine := fSource1Count - src1_cnt;
  db1.endline := db1.startline + depth;

  db2.startLine := fSource2Count - src2_cnt;
  db2.endline := db2.startline + level;

  try
     DiffFound(db1, db2);
  except
      //Do Nothing
  end;
end;

function TrmMyCustomDiffEngine.AtEOF: boolean;
begin
  result := (fSrc1CurrLine=fSource1.count) or (fSrc2CurrLine=fSource2.count);
end;

function TrmMyCustomDiffEngine.MatchLines(level1, level2, MatchDepth: integer): boolean;
var
  s1, s2: string;
  loop: integer;
  src1_cnt, src2_cnt: integer;
begin
  result := true;

  src1_cnt:=fSource1.count-fSrc1CurrLine;
  src2_cnt:=fSource2.count-fSrc2CurrLine;

  for loop := 0 to MatchDepth do
  begin
    if level1 + loop >= src1_cnt then
      s1 := ''
    else
      s1 := fSource1[fSrc1CurrLine + level1 + loop];

    if level2 + loop >= src2_cnt then
      s2 := ''
    else
      s2 := fSource2[fSrc2CurrLine + level2 + loop];

    if (fdoIgnoreCharacters in fOptions) and (fIgnoreChars <> []) then
    begin
      s1 := RemoveCharacters(s1);
      s2 := RemoveCharacters(s2);
    end;

    if ((fdoIgnoreTrailingWhiteSpace in fOptions) and
       (fdoIgnoreLeadingWhiteSpace in fOptions)) then
    begin
      s1 := Trim(s1);
      s2 := Trim(s2);
    end
    else
    if fdoIgnoreTrailingWhiteSpace in fOptions then
    begin
      s1 := TrimRight(s1);
      s2 := TrimRight(s2);
    end
    else if fdoIgnoreLeadingWhiteSpace in fOptions then
    begin
      s1 := TrimLeft(s1);
      s2 := TrimLeft(s2);
    end;

    if not (fdoCaseSensitive in fOptions) then begin
      StrLowerInPlace(s1);
      StrLowerInPlace(s2);
    end;
    result := result and (compareStr(s1, s2) = 0);

    if not result then
      break;
  end;
end;

procedure TrmMyCustomDiffEngine.AddLine(DiffStrings: TStringList; ControlChar: char; var LineNumber: integer; Line: string);
var
  DiffLine: TrmDiffLine;
  Typ: TDiffLineType;
  s: string;
begin
  inc(LineNumber);

  case ControlChar of
    NormalLine: Typ:=dlNormal;
    DeletedLine: Typ:=dlDeleted;
    InsertedLine: Typ:=dlInserted;
    ChangedLine: Typ:=dlChanged;
    else
      Typ:=dlNone;
  end;

  DiffLine:=TrmDiffLine.Create(Typ, LineNumber);

  if fLineNumbers then begin
    s:=IntToStr(LineNumber);
    while (Length(s)<fLineNumbersWidth) do
      s:=' '+s;

    s:=ControlChar+s+': '+Line;
  end else
    s:=ControlChar + Line;

  DiffStrings.AddObject(s, DiffLine);
end;

procedure TrmMyCustomDiffEngine.MoveDown(Amount1, Amount2: integer);
begin
  while Amount1 > 0 do
  begin
    dec(Amount1);
    try
       AddLine(fDiffSource1, NormalLine, fSrc1CurrLine, fSource1[fSrc1CurrLine]);
       // fSource1.delete(0);
    except
      amount1 := 0;
    end;
  end;

  while Amount2 > 0 do
  begin
    dec(Amount2);
    try
       AddLine(fDiffSource2, NormalLine, fSrc2CurrLine, fSource2[fSrc2CurrLine]);
       // fSource2.delete(0);
    except
      amount2 := 0;
    end;
  end;

  if assigned(fOnProgress) then
  begin
    try
      fOnProgress(round((((fSource1Count + fSource2Count) - ((fSource1.Count-fSrc1CurrLine) + (fSource2.count-fSrc2CurrLine))) / (fSource1Count + fSource2Count)) * 100));
    except
         //Do Nothing...
    end;
  end;
end;

procedure TrmMyCustomDiffEngine.Notification(AComponent: TComponent;
  Operation: TOperation);
var
   Index : integer;
begin
  inherited;
  if operation = opremove then
  begin
    index := fAttachedViewers.indexof(AComponent);
    if index <> -1 then
       fAttachedViewers.Delete(index);
  end;
end;

procedure TrmMyCustomDiffEngine.SetMatchDepth(const Value: integer);
begin
  if (fMatchDepth <> value) and (value > 0) and (value < 100) then
    fMatchDepth := Value;
end;

{ TrmMyCustomDiffViewer }

constructor TrmMyCustomDiffViewer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 150;
  width := 250;

  ControlStyle := ControlStyle - [csAcceptsControls];

  fEBGColor := clBtnFace;

  fSimpleViewer := true;
end;

procedure TrmMyCustomDiffViewer.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (operation = opRemove) then
  begin
    if (AComponent = fDiff) then
      fDiff := nil;
  end;
end;

procedure TrmMyCustomDiffViewer.SetDiff(const Value: TrmMyCustomDiffEngine);
begin
  if value <> fDiff then
  begin
    if assigned(fDiff) then
      fDiff.RemoveViewer(self);

    fDiff := Value;
    
    if assigned(fDiff) then
    begin
      fDiff.FreeNotification(self);
      fDiff.AttachViewer(self);
    end
  end;
end;

procedure TrmMyCustomDiffViewer.SetEBGColor(const Value: TColor);
begin
  if (fEBGColor<>Value) then begin
    fEBGColor:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetSimpleViewer(const Value: boolean);
begin
  if (fSimpleViewer<>Value) then begin
    fSimpleViewer:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetCTColor(const Value: TColor);
begin
  if (fCTColor<>Value) then begin
    fCTColor:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetDTColor(const Value: TColor);
begin
  if (fDColor<>Value) then begin
    fDColor:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetITColor(const Value: TColor);
begin
  if (fITColor<>Value) then begin
    fITColor:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetChangedBGColor(const Value: TColor);
begin
  if (fChangedBGColor<>Value) then begin
    fChangedBGColor:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetDeletedBGColor(const Value: TColor);
begin
  if (fDeletedBGColor<>Value) then begin
    fDeletedBGColor:=Value;
    Invalidate;
  end;
end;

procedure TrmMyCustomDiffViewer.SetInsertedBGColor(const Value: TColor);
begin
  if (fInsertedBGColor<>Value) then begin
    fInsertedBGColor:=Value;
    Invalidate;
  end;
end;

function TrmMyCustomDiffViewer.GetMapData: string;
var
  loop: integer;
  wstr: string;
begin
  wstr := '';
  if assigned(DiffEngine) and (DiffEngine.fDiffSource1.count > 0) then
  begin
     setlength(wStr, DiffEngine.fDiffSource1.count);
     for loop := 0 to DiffEngine.fDiffSource1.Count - 1 do
     begin
       case DiffEngine.fDiffSource1[loop][1] of
         NormalLine: wstr[loop + 1] := NormalLine;
         DeletedLine: wstr[loop + 1] := DeletedLine;
         ChangedLine: wstr[loop + 1] := ChangedLine;
         EmptyLine: wstr[loop + 1] := InsertedLine;
       end;
     end;
  end;
  result := wstr;
end;

procedure TrmMyCustomDiffViewer.DiffferenceCompleted;
begin
end;

function TrmMyCustomDiffViewer.GetSrc1Label: string;
begin
   result := 'Source 1';
end;

function TrmMyCustomDiffViewer.GetSrc2Label: string;
begin
   result := 'Source 2';
end;

procedure TrmMyCustomDiffViewer.SetSrc1Label(const Value: string);
begin
   //do nothing...
end;

procedure TrmMyCustomDiffViewer.SetSrc2Label(const Value: string);
begin
   //do nothing...
end;

procedure TrmMyCustomDiffViewer.wmEraseBKGrnd(var msg: tmessage);
begin
  msg.result := 1;
end;

{ TrmMyDiffViewer }

procedure TrmMyDiffViewer.cmFontChanged(var Msg: TMessage);
begin
  inherited;
  fsource1.font.Assign(font);
  fsource2.font.Assign(font);
end;

constructor TrmMyDiffViewer.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle - [csAcceptsControls];

  BevelEdges := [beLeft, beTop, beRight, beBottom];
  BevelInner := bvLowered;
  BevelOuter := bvLowered;
  BevelKind := bkTile;

  fDrawing := false;
  fScrollInProgress := false;
  fIHC := false;
  fLockSelIndex := true;

  fPanel := TPanel.create(self);
  with fPanel do
  begin
    ControlStyle := ControlStyle - [csAcceptsControls];
    ParentFont:=FALSE;
    ParentBackground:=FALSE;
    Parent := self;
    align := altop;
    FullRepaint:=FALSE;
    BevelInner := bvNone;
    BevelOuter := bvRaised;
  end;

  fLabel1 := TLabel.create(fPanel);
  with fLabel1 do
  begin
    parent := fPanel;
    align := alLeft;
    AutoSize := false;
    Caption := 'Source 1';
    Alignment := taCenter;
  end;

  fLabel2 := TLabel.create(fPanel);
  with fLabel2 do
  begin
    parent := fPanel;
    align := alClient;
    AutoSize := false;
    Caption := 'Source 2';
    Alignment := taCenter;
  end;

  fSource1 := TrmListControl.create(self);
  with fSource1 do
  begin
    name := 's1';
    parent := self;
    align := alLeft;
    font.assign(self.font);
    TabStop := true;
    OnScroll := ScrollChanged;
    OnFormatDrawing := Drawing;
    ScrollBars := ssNone;
    DoubleBuffered:=TRUE;
    ShowFocusRect:=TRUE;
    OnDblClick:=OnListControlDblClick;
    VeritcalScrollByChar:=TRUE;
  end;

  fBevel := TBevel.Create(self);
  with fBevel do
  begin
    parent := self;
    align := alLeft;
    width := 2;
  end;

  fSource2 := TrmListControl.create(self);
  with fSource2 do
  begin
    name := 's2';
    parent := self;
    align := alLeft;
    font.assign(self.font);
    TabStop := true;
    OnScroll := ScrollChanged;
    OnFormatDrawing := Drawing;
    ScrollBars := ssNone;
    ShowFocusRect:=TRUE;
    DoubleBuffered:=TRUE;
    OnDblClick:=OnListControlDblClick;
    VeritcalScrollByChar:=TRUE;
  end;
end;

procedure TrmMyDiffViewer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.style := Params.style or WS_VSCROLL;
  if not fIHC then
    Params.style := Params.style or WS_HSCROLL;
end;

procedure TrmMyDiffViewer.DiffferenceCompleted;
var
   wLongLine : integer;
begin
  inherited;
  fSource1.Items.BeginUpdate;
  fSource2.Items.BeginUpdate;
  try
     fSource1.Items.assign(DiffEngine.DiffSource1);
     fSource2.Items.assign(DiffEngine.DiffSource2);
    UpdateVScrollBar;
    UpdateHScrollBar;
  finally
    fSource1.Items.EndUpdate;
    fSource2.Items.EndUpdate;
  end;
  wLongLine := max(fSource1.LongestLineLength, fSource2.LongestLineLength);
  fSource1.LongestLineLength := wLongLine;
  fSource2.LongestLineLength := wLongLine;
  invalidate;
end;

procedure TrmMyDiffViewer.Drawing(Sender: TObject; Canvas: TCanvas;
  Selected: boolean; var str: string);
var
  status: char;
//  ListControl: TrmMyListControl;
begin
  if (Length(str)=0) then EXIT;

  status := str[1];
  delete(str, 1, 1);

//  ListControl:=TrmMyListControl(Sender);

  Canvas.Font.Color := clWindowText;
  case status of
    NormalLine: Canvas.brush.color := clWindow;
    ChangedLine, DeletedLine, InsertedLine:
      begin
        if SimpleDiffViewer then begin
          Canvas.Font.Color:=ChangedTextColor;
          Canvas.Brush.Color:=ChangedBGColor;
        end else begin
          case status of
            ChangedLine:
              begin
                Canvas.Font.Color:=ChangedTextColor;
                Canvas.Brush.Color:=ChangedBGColor;
              end;
            DeletedLine:
              begin
                Canvas.Font.Color:=DeletedTextColor;
                Canvas.Brush.Color:=DeletedBGColor;
              end;
            InsertedLine:
              begin
                Canvas.Font.Color:=InsertedTextColor;
                Canvas.Brush.Color:=InsertedBGColor;
              end;
          end;
        end;

        if not SimpleDiffViewer then
        begin
          case status of
            DeletedLine: Canvas.Font.Color := DeletedTextColor;
            InsertedLine: Canvas.Font.Color := InsertedTextColor;
          end;
        end;
      end;
    EmptyLine: Canvas.Brush.Color := fEBGColor;
  end;

  if (Selected) then
  begin
//    Canvas.font.color := clHighlightText;
//    Canvas.Brush.Color := clHighlight;
{
    LineHeight:=Canvas.textheight('X');
    wRect:=rect(0, 0, ListControl.ClientWidth, LineHeight);
    OffsetRect(wRect, 0, LineHeight*(ListControl.ItemIndex-ListControl.InternalTopIndex));

    Canvas.Pen.Color:=clHighlight;
    Canvas.Brush.Color := clHighlight;
    Canvas.Brush.Style:=bsBDiagonal;
//    Canvas.Rectangle(wRect);
    Canvas.FillRect(wRect);
    Canvas.Brush.Style:=bsSolid;
}
  end;
end;

function TrmMyDiffViewer.GetSrc1Label: string;
begin
   result := fLabel1.Caption;
end;

function TrmMyDiffViewer.GetSrc2Label: string;
begin
   result := flabel2.caption;
end;

procedure TrmMyDiffViewer.Loaded;
begin
  inherited;
  fsource1.left := 0;
  fBevel.left := fsource1.width;
  fSource2.left := fBevel.left + fBevel.width;
  fPanel.height := Canvas.TextHeight('X') + 4;
  Resize;
end;

procedure TrmMyDiffViewer.MapClick(Sender: TObject; IndicatorPos: integer);
begin
   ResetIndex(IndicatorPos, IndicatorPos);
end;

procedure TrmMyDiffViewer.ResetIndex(Index, Pos: integer);
begin
  fSource1.VScrollPos := pos;
  fSource1.ItemIndex := Index;
  fSource2.VScrollPos := pos;
  fSource2.ItemIndex := Index;
  UpdateVScrollBar;
end;

procedure TrmMyDiffViewer.Resize;
var
  wcw: integer;
begin
  inherited;
  wcw := ClientWidth div 2;
  fLabel1.width := wcw;
  fLabel2.width := wcw;

  wcw := ClientWidth - fBevel.width;
  fSource1.Width := wcw div 2;
  fSource2.Width := fSource1.Width + (wcw mod 2);

  UpdateVScrollBar;
  UpdateHScrollBar;
end;

procedure TrmMyDiffViewer.scrollChanged(Sender: TObject; ScrollBar: integer);
begin
  if fScrollInProgress then exit;
  fScrollInProgress := true;
  try
    if fIHC and (ScrollBar = sb_Horz) then
      exit;
    if (sender = fsource1) then
    begin
      if ScrollBar = SB_VERT then
      begin
        if fLockSelIndex then
        begin
           fSource2.ItemIndex := fSource1.ItemIndex;
           fSource2.SelCount := fsource1.SelCount;
        end;
        fSource2.VScrollPos := fSource1.VScrollPos;
      end
      else
        fSource2.HScrollPos := fSource1.HScrollPos;
    end
    else if (sender = fSource2) then
    begin
      if ScrollBar = SB_VERT then
      begin
        if fLockSelIndex then
        begin
           fSource1.ItemIndex := fSource2.ItemIndex;
           fSource1.SelCount := fSource2.SelCount;
        end;
        fSource1.VScrollPos := fSource2.VScrollPos;
      end
      else
        fSource1.HScrollPos := fSource2.HScrollPos;
    end;
    if ScrollBar = SB_VERT then
      UpdateVScrollBar
    else
      UpdateHScrollBar;
  finally
    fScrollInProgress := false;
  end;
end;

procedure TrmMyDiffViewer.SetIHC(const Value: boolean);
begin
  if fIHC <> Value then
  begin
    fIHC := Value;
    if fIHC then
    begin
         fsource1.ScrollBars := ssHorizontal;
         fSource2.ScrollBars := ssHorizontal;
    end
    else
    begin
         fsource1.ScrollBars := ssNone;
         fSource2.ScrollBars := ssNone;
    end;
    RecreateWnd;
  end;
end;

procedure TrmMyDiffViewer.SetLockSelIndex(const Value: boolean);
begin
  if fLockSelIndex <> Value then
  begin
     fLockSelIndex := Value;
     if fLockSelIndex then
     begin
        fsource2.VScrollPos := fsource1.VScrollPos;
        fsource2.ItemIndex := fsource1.itemIndex;
     end;
  end;
end;

procedure TrmMyDiffViewer.OnListControlDblClick(Sender: TObject);
begin
  if Assigned(fOnDblClick) then begin
    if (Sender=fsource1) and (fsource1.ItemIndex<>-1) then
      fOnDblClick(fsource1, dpLeft, TrmDiffLine(fsource1.Items.Objects[fsource1.ItemIndex]))
    else
      if (Sender=fsource2) and (fsource2.ItemIndex<>-1) then
        fOnDblClick(fsource2, dpRight, TrmDiffLine(fsource2.Items.Objects[fsource2.ItemIndex]));
  end;
end;

procedure TrmMyDiffViewer.SetSrc1Label(const Value: string);
begin
   fLabel1.caption := value;
end;

procedure TrmMyDiffViewer.SetSrc2Label(const Value: string);
begin
   fLabel2.caption := value;
end;

procedure TrmMyDiffViewer.UpdateHScrollBar;
var
  wScrollInfo: TScrollInfo;
begin
  if fIHC then
    exit;

  with wScrollInfo do
  begin
    cbSize := sizeof(TScrollInfo);
    fMask := SIF_POS or SIF_RANGE {or SIF_DISABLENOSCROLL};
    nMin := 0;
    nMax := fsource1.HScrollSize;
    nPos := fsource1.HScrollPos;
  end;

  SetScrollInfo(Handle, SB_HORZ, wScrollInfo, True);
end;

procedure TrmMyDiffViewer.UpdateVScrollBar;
var
  wScrollInfo: TScrollInfo;
begin
  with wScrollInfo do
  begin
    cbSize := sizeof(TScrollInfo);
    fMask := SIF_POS or SIF_RANGE {or SIF_DISABLENOSCROLL};
    nMin := 0;
    nMax := fsource1.VScrollSize;
    nPos := fsource1.VScrollPos;
  end;

  SetScrollInfo(Handle, SB_VERT, wScrollInfo, True);
end;

procedure TrmMyDiffViewer.UpdateScrollBars;
begin
  //UpdateVScrollBar;
  //UpdateHScrollBar;

  RecreateWnd;
end;

procedure TrmMyDiffViewer.WMHScroll(var Msg: TWMHScroll);
begin
  inherited;
  if not fIHC then
  begin
    fsource1.Dispatch(msg);
    UpdateHScrollBar;
  end;
end;

procedure TrmMyDiffViewer.WMVScroll(var Msg: TWMVScroll);
begin
  inherited;
  fsource1.Dispatch(msg);
  UpdateVScrollBar;
end;

function TrmMyDiffViewer.GetNextDiff(StartIndex: integer; SkipIfInBlock: boolean): integer;
var
  pos1, pos2: integer;

  function GetPos(str: TStringList): integer;
  var
    i: integer;
    DiffLine: TrmDiffLine;
  begin
    i:=StartIndex;
    result:=-1;

    if SkipIfInBlock then begin
      while (i<str.Count) do begin
        DiffLine:=TrmDiffLine(str.Objects[i]);
        if not(Assigned(DiffLine) and not (DiffLine.Typ in [dlNone, dlNormal])) then
          BREAK;
        inc(i);
      end;
    end;

    while (i<str.Count) do begin
      DiffLine:=TrmDiffLine(str.Objects[i]);
      if Assigned(DiffLine) and not (DiffLine.Typ in [dlNone, dlNormal]) then begin
        result:=i;
        BREAK;
      end;
      inc(i);
    end;

  end;

begin
  pos1:=GetPos(fsource1.Items);
  pos2:=GetPos(fsource2.Items);

  if (pos1<>-1) and (pos2<>-1) then
    result:=Min(pos1, pos2)
  else
    result:=Max(pos1, pos2);
end;

function TrmMyDiffViewer.GetPrevDiff(StartIndex: integer; SkipIfInBlock: boolean): integer;
var
  pos1, pos2: integer;

  function GetPos(str: TStringList): integer;
  var
    i: integer;
    DiffLine: TrmDiffLine;
  begin
    i:=StartIndex;
    result:=-1;

    if SkipIfInBlock then begin
      while (i>=0) do begin
        DiffLine:=TrmDiffLine(str.Objects[i]);
        if not(Assigned(DiffLine) and not (DiffLine.Typ in [dlNone, dlNormal])) then
          BREAK;
        dec(i);
      end;
    end;

    while (i>=0) do begin
      DiffLine:=TrmDiffLine(str.Objects[i]);
      if Assigned(DiffLine) and not (DiffLine.Typ in [dlNone, dlNormal]) then begin
        result:=i;
        BREAK;
      end;
      dec(i);
    end;

    if (result<>-1) then begin
      while (i>=0) do begin
        DiffLine:=TrmDiffLine(str.Objects[i]);
        if not(Assigned(DiffLine) and not (DiffLine.Typ in [dlNone, dlNormal])) then
          BREAK;
        dec(i);
      end;
      result:=i+1;
    end;
  end;

begin
  pos1:=GetPos(fsource1.Items);
  pos2:=GetPos(fsource2.Items);
  result:=Max(pos1, pos2);
end;

function TrmMyDiffViewer.GetNextDiffAvailable: boolean;
begin
  result:=(GetNextDiff(fsource1.ItemIndex+1, TRUE)<>-1);
end;

function TrmMyDiffViewer.GetPrevDiffAvailable: boolean;
begin
  result:=(GetPrevDiff(fsource1.ItemIndex+1, TRUE)<>-1);
end;

procedure TrmMyDiffViewer.FirstDiff;
begin
  fsource1.ItemIndex:=GetNextDiff(0, FALSE);
end;

procedure TrmMyDiffViewer.LastDiff;
var
  n: integer;
begin
  n:=GetPrevDiff(fsource1.Items.Count-1, FALSE);

  if (n<>-1) then begin
    TrmMyListControl(fsource1).InternalTopIndex:=n-5;
    fsource1.ItemIndex:=n
  end;
end;

procedure TrmMyDiffViewer.NextDiff;
var
  n: integer;
begin
  n:=GetNextDiff(fsource1.ItemIndex+1, TRUE);

  if (n<>-1) then begin
    TrmMyListControl(fsource1).InternalTopIndex:=n-5;
    fsource1.ItemIndex:=n
  end;
end;

procedure TrmMyDiffViewer.PrevDiff;
var
  n: integer;
  ItemHeight: integer;
begin
  n:=GetPrevDiff(fsource1.ItemIndex-1, TRUE);

  if (n<>-1) then begin
    ItemHeight:=TrmMyListControl(fsource1).Canvas.TextHeight('X');

    TrmMyListControl(fsource1).InternalTopIndex:=n-(fsource1.ClientHeight div ItemHeight)+5;
    fsource1.ItemIndex:=n;
  end;
end;


procedure TrmMyCustomDiffEngine.ClearData;
var
  i: integer;
begin
  with fDiffSource1 do
    for i:=0 to Count-1 do
      if Assigned(Objects[i]) then
        Objects[i].Free;

  with fDiffSource2 do
    for i:=0 to Count-1 do
      if Assigned(Objects[i]) then
        Objects[i].Free;

  fDiffSource1.Clear;
  fDiffSource2.Clear;
  fSource1.Clear;
  fSource2.Clear;
end;

procedure TrmMyCustomDiffEngine.DiffStarted;
begin
  fBlankLines1 := 0;
  fBlankLines2 := 0;
  fSrc1CurrLine:=0;
  fSrc2CurrLine:=0;
end;

procedure TrmMyCustomDiffEngine.DiffFound(Source1, Source2: TrmDiffBlock);
var
  s1diff, s2diff: integer;
begin
  Source1.startline := source1.startline + fBlankLines1;
  Source1.Endline := source1.EndLine + fBlankLines1;

  Source2.startline := source2.startline + fBlankLines2;
  Source2.Endline := source2.Endline + fBlankLines2;

  s1diff := source1.endline - source1.startline;
  s2diff := source2.endline - source2.startline;

  if (s1diff = 0) and (s2diff > 0) then
  begin
    while s2diff > 0 do
    begin
      fDiffSource1.Add(EmptyLine + ' ');
      Inc(fBlankLines1);

      AddLine(fDiffSource2, InsertedLine, fSrc2CurrLine, fSource2[fSrc2CurrLine]);
      // fSource2.delete(0);
      dec(s2Diff);
    end;
  end
  else if (s1diff > 0) and (s2diff = 0) then
  begin
    while s1diff > 0 do
    begin
      AddLine(fDiffSource1, DeletedLine, fSrc1CurrLine, fSource1[fSrc1CurrLine]);
      // fSource1.delete(0);

      fDiffSource2.Add(Emptyline + '');
      Inc(fBlankLines2);
      dec(s1Diff);
    end;
  end
  else if (s1diff > 0) and (s2diff > 0) then
  begin
    if s1diff > s2diff then
    begin
      while s2diff > 0 do
      begin
        AddLine(fDiffSource1, ChangedLine, fSrc1CurrLine, fSource1[fSrc1CurrLine]);
        // fSource1.delete(0);

        AddLine(fDiffSource2, ChangedLine, fSrc2CurrLine, fSource2[fSrc2CurrLine]);
        // fSource2.delete(0);
        dec(s2Diff);
        dec(s1Diff);
      end;

      while s1Diff > 0 do
      begin
        AddLine(fDiffSource1, DeletedLine, fSrc1CurrLine, fSource1[fSrc1CurrLine]);
        // fSource1.delete(0);

        fDiffSource2.Add(EmptyLine + ' ');
        Inc(fBlankLines2);
        dec(s1Diff);
      end;
    end
    else
    begin
      while s1diff > 0 do
      begin
        AddLine(fDiffSource1, ChangedLine, fSrc1CurrLine, fSource1[fSrc1CurrLine]);
        // fSource1.delete(0);

        AddLine(fDiffSource2, ChangedLine, fSrc2CurrLine, fSource2[fSrc2CurrLine]);
        // fSource2.delete(0);
        dec(s1Diff);
        dec(s2Diff);
      end;

      while s2Diff > 0 do
      begin
        AddLine(fDiffSource2, InsertedLine, fSrc2CurrLine, fSource2[fSrc2CurrLine]);
        // fSource2.delete(0);

        fDiffSource1.Add(EmptyLine + ' ');
        Inc(fBlankLines1);
        dec(s2Diff);
      end;
    end;
  end
  else
    raise Exception.create('This should never happen');
end;

procedure TrmMyCustomDiffEngine.DiffCompleted;
var
   loop : integer;
begin
  while (fSrc1CurrLine<fSource1.count) do
  begin
    AddLine(fDiffSource1, NormalLine, fSrc1CurrLine, fSource1[fSrc1CurrLine]);
    // fSource1.delete(0);
  end;

  while (fSrc2CurrLine<fSource2.count) do
  begin
    AddLine(fDiffSource2, NormalLine, fSrc2CurrLine, fSource2[fSrc2CurrLine]);
    // fSource2.delete(0);
  end;

  while fDiffSource1.count < fDiffSource2.count do
    fDiffSource1.Add(EmptyLine + ' ');

  while fDiffSource2.count < fDiffSource1.count do
    fDiffSource2.Add(EmptyLine + ' ');

  for loop := 0 to fAttachedViewers.count-1 do
     TrmMyCustomDiffViewer(fattachedViewers[loop]).DiffferenceCompleted;

  if assigned(fOnDiffCompleted) then
     fOnDiffCompleted(self);
end;

procedure TrmMyCustomDiffEngine.AttachViewer(viewer: TrmMyCustomDiffViewer);
begin
   if fAttachedViewers.indexof(viewer) = -1 then
      fAttachedViewers.add(viewer);
end;

procedure TrmMyCustomDiffEngine.RemoveViewer(viewer: TrmMyCustomDiffViewer);
var
   index : integer;
begin
   index := fAttachedViewers.indexof(viewer);
   if index <> -1 then
      fAttachedViewers.Delete(index);
end;

function TrmMyCustomDiffEngine.RemoveCharacters(st: string): string;
var
   loop, len : integer;
begin
   len := length(st);
   result := '';
   loop := 0;
   while loop < len do
   begin
      inc(loop);
      if not (st[loop] in fIgnoreChars) then
         result := result + st[loop];
   end;
end;

end.
