unit ConTEXTSynEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEdit, SynEditKeyCmds, SynEditMiscProcs, Clipbrd,
  ExtCtrls, SynEditHighlighter, SynEditSearch, ComCtrls,
  SynEditTypes, ShellAPI, StdCtrls, Math,
  SynHighlighterText, SynEditTextBuffer, JclStrings, SynEditMiscClasses;

type
  TTabsConversion = (tcTabsToSpaces, tcSpacesToTabs);

  pTBufferCoord = ^TBufferCoord;


  TBufferCoordList = class(TList)
  private
    function Get(Index: integer): pTBufferCoord;
    procedure Put(Index: integer; const Value: pTBufferCoord);
  public
    function Add(Coord: TBufferCoord): integer; reintroduce;
    procedure Clear; override;
    property Items[Index: integer]: pTBufferCoord read Get write Put; default;
  end;

  TTextLineData = class
  private
    fModified: boolean;
    fSaved: boolean;
  public
    property Modified: boolean read fModified write fModified;
    property Saved: boolean read fSaved write fSaved;
  end;

  TConTEXTSynEdit = class(TSynEdit)
  private
    fSelectionSaved: boolean;
    fSavedBlockBegin: TBufferCoord;
    fSavedBlockEnd: TBufferCoord;
    fSavedSelectionMode: TSynSelectionMode;
    fStateSaved: boolean;
    fSavedStateTopLine: integer;
    fSavedStateLeftChar: integer;
    fSavedStateCaretXY: TBufferCoord;
    fLockPaintTransientProc: TPaintTransient;
    fLockPaintCounter: integer;
    fDisableAutoTrimLine: boolean;
    fTrimTrailingSpaces: boolean;
    fOldOnAddedUndoEvent: TNotifyEvent;
    fChangeTrackerChangedColor: TColor;
    fChangeTrackerEnabled: boolean;
    fChangeTrackerSavedColor: TColor;
    fOldOnGutterPaintEvent: TGutterPaintEvent;

    procedure DoBlockIndentEx;
    procedure DoBlockUnindentEx;
    procedure DoColumnPasteFixCaretPosition(CaretXYBeforePaste: TBufferCoord);
    procedure OnAddedUndoEvent(Sender: TObject);
  protected
    fBlockIndent: integer;
    procedure DoOnProcessCommand(var Command: TSynEditorCommand;
      var AChar: char; Data: pointer); override;
    procedure DoHomeKey(var Command: TSynEditorCommand);
    procedure DoEndKey(var Command: TSynEditorCommand);
    procedure OnGutterPaintEvent(Sender: TObject; aLine, X, Y: Integer);
  public
    procedure SaveSelection;
    procedure RestoreSelection;
    procedure SaveState;
    procedure RestoreState;
    procedure ExecuteCommand(Command: TSynEditorCommand; AChar: char;
      Data: pointer); override;
    function  GetCharAt(X, Y: integer): char;
    function  GetCharAtCursor: char;
    constructor Create(AOwner: TComponent); override;
    procedure LockPaint(Value: boolean);
    function ConvertTabsAndSpaces(Conversion: TTabsConversion; TabWidth: integer): boolean;
    procedure TrimLine(LineNumber: integer);
    function RemoveTrailingSpaces: boolean;
    function RemoveComments: boolean;
    function GetLineRect(Line: integer): TRect;
    procedure InvalidateChangeTracker();

    property DisableAutoTrimLine: boolean read fDisableAutoTrimLine write fDisableAutoTrimLine;
  published
    property BlockIndent: integer read fBlockIndent write fBlockIndent;
    property TrimTrailingSpaces: boolean read fTrimTrailingSpaces write fTrimTrailingSpaces;

    property ChangeTrackerEnabled: boolean read fChangeTrackerEnabled write fChangeTrackerEnabled;
    property ChangeTrackerChangedColor: TColor read fChangeTrackerChangedColor write fChangeTrackerChangedColor;
    property ChangeTrackerSavedColor: TColor read fChangeTrackerSavedColor write fChangeTrackerSavedColor;
  end;

procedure Register;

implementation

  var
    _PerformanceTimeFreq, _PerformanceStartTimeCount: Int64;

  procedure _StartTimer;
  begin
    if (_PerformanceTimeFreq=0) then
      QueryPerformanceFrequency(_PerformanceTimeFreq);

    QueryPerformanceCounter(_PerformanceStartTimeCount);
  end;

  procedure _StopTimer;
  var
    _Time: int64;
    _EndTime: int64;
  begin
    QueryPerformanceCounter(_EndTime);
    _Time:=Round(((_EndTime-_PerformanceStartTimeCount)/_PerformanceTimeFreq)*1000);

    ShowMessage(IntToStr(_Time));
  end;

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------------------
function Q_SpacesToTabs(const S: string; TabStop: Integer): string;
var
  I,L,SC,T: Integer;
  P: ^Char;
  C: Char;
begin
  L := 0;
  T := TabStop;
  SC := 0;
  for I := 1 to Length(S) do
  begin
    if T = 0 then
    begin
      Dec(SC);
      T := TabStop;
      if SC > 0 then
        Dec(L,SC);
      SC := 0;
    end;
    Inc(L);
    C := S[I];
    Dec(T);
    if C <> ' ' then
    begin
      if C = #9 then
        T := TabStop;
      SC := 0;
    end else
      Inc(SC);
  end;
  if T = 0 then
  begin
    Dec(SC);
    if SC > 0 then
      Dec(L,SC);
  end;
  SetString(Result,nil,L);
  T := TabStop;
  P := Pointer(Result);
  SC := 0;
  for I := 1 to Length(S) do
  begin
    if T = 0 then
    begin
      T := TabStop;
      if SC <> 0 then
      begin
        if SC > 1 then
          P^ := #9
        else
          P^ := ' ';
        Inc(P);
        SC := 0;
      end;
    end;
    C := S[I];
    Dec(T);
    if C <> ' ' then
    begin
      while SC <> 0 do
      begin
        P^ := ' ';
        Dec(SC);
        Inc(P);
      end;
      P^ := C;
      if C = #9 then
        T := TabStop;
      Inc(P);
    end else
      Inc(SC);
  end;
  if SC <> 0 then
    if T <> 0 then
      repeat
        P^ := ' ';
        Dec(SC);
        Inc(P);
      until SC = 0
    else if SC > 1 then
      P^ := #9
    else
      P^ := ' ';
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  TBufferCoordList
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TBufferCoordList.Add(Coord: TBufferCoord): integer;
var
  pC: pTBufferCoord;
begin
  GetMem(pC, SizeOf(TBufferCoord));
  pC^:=Coord;
  result:=inherited Add(pC);
end;
//------------------------------------------------------------------------------------------
procedure TBufferCoordList.Clear;
var
  i: integer;
begin
  for i:=0 to Count-1 do
    FreeMem(pTBufferCoord(Items[i]));

  inherited;
end;
//------------------------------------------------------------------------------------------
function TBufferCoordList.Get(Index: integer): pTBufferCoord;
begin
  result:=inherited Get(Index);
end;
//------------------------------------------------------------------------------------------
procedure TBufferCoordList.Put(Index: integer; const Value: pTBufferCoord);
begin
  inherited Put(Index, Value);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TConTEXTSynEdit.GetCharAt(X, Y: integer): char;
begin
  if (Y<Lines.Count) and (X<Length(Lines[Y])) then
    result:=Lines[Y][X+1]
  else
    result:=#0;
end;
//------------------------------------------------------------------------------------------
function TConTEXTSynEdit.GetCharAtCursor: char;
begin
  result:=GetCharAt(CaretX-1, CaretY-1);
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.DoBlockIndentEx;
var
  OrgCaretPos,
  BB,BE            : TBufferCoord;
  Run,
  StrToInsert      : PChar;
  e,x,
  i,InsertStrLen   : integer;
  Spaces           : String;
  OrgSelectionMode : TSynSelectionMode;
  UseTabs          : boolean;
  IndentWidth      : integer;
begin
  OrgSelectionMode := ActiveSelectionMode;
  OrgCaretPos := CaretXY;
  x := 1;
  StrToInsert := nil;
  if SelAvail then
  try
    UseTabs:=(eoTabsInBlockIndent in Options) and not (eoTabsToSpaces in Options);
    IndentWidth:=fBlockIndent;

    // keep current selection detail
    BB := BlockBegin;
    BE := BlockEnd;

    // build text to insert
    if (BE.Char = 1) then begin
      e := BE.Line - 1;
      x := 1;
    end else begin
      e := BE.Line;

      if UseTabs then
        x := BE.Char + 1
      else
        x := BE.Char + IndentWidth;
    end;

    if UseTabs then begin
      InsertStrLen := 3 * (e - BB.Line) + 2;
      //               chars per line * lines-1    + last line + null char
      StrToInsert := StrAlloc(InsertStrLen);
      Run := StrToInsert;
      Spaces := TSynTabChar;
      for i := BB.Line to e-1 do
      begin
        StrPCopy(Run, Spaces+#13#10);
        Inc(Run, 3);
      end;
    end else begin
      InsertStrLen := (IndentWidth + 2) * (e - BB.Line) + IndentWidth + 1;
      //               chars per line * lines-1    + last line + null char
      StrToInsert := StrAlloc(InsertStrLen);
      Run := StrToInsert;
      Spaces := StringOfChar(#32, IndentWidth);
      for i := BB.Line to e-1 do
      begin
        StrPCopy(Run, Spaces+#13#10);
        Inc(Run, IndentWidth+2);
      end;
    end;

    StrPCopy(Run, Spaces);

    UndoList.BeginBlock;
    UndoList.AddChange(crIndent, BB, BE, '', smNormal);
    InsertBlock(BufferCoord(1, BB.Line), BufferCoord(1,BB.Line), StrToInsert, TRUE);
    //We need to save the position of the end block for redo
    UndoList.AddChange(crIndent, BufferCoord(BB.Char + IndentWidth, BB.Line), BufferCoord(x, BE.Line), '', smNormal);
    UndoList.EndBlock;
  finally
    StrDispose(StrToInsert);
    ActiveSelectionMode:=OrgSelectionMode;

    if (OrgCaretPos.Char>1) then
      OrgCaretPos.Char:=x;
    SetCaretAndSelection(OrgCaretPos, BufferCoord(BB.Char, BB.Line), BufferCoord(x, BE.Line));
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.DoBlockUnindentEx;
var
  OrgCaretPos,
  BB, BE: TBufferCoord;
  Line, Run,
  FullStrToDelete,
  StrToDelete: PChar;
  Len,
  x, StrToDeleteLen,
  FirstIndent,
  LastIndent,
  e : integer;
  TempString: String;
  OrgSelectionMode : TSynSelectionMode;
  SomethingToDelete : Boolean;
  UseTabs          : boolean;
  IndentWidth      : integer;

  function GetDelLen(UseTabs:boolean) : integer;
  var
    Run : PChar;
  begin
    Result := 0;
    Run := Line;

    if UseTabs then begin
      while (Run[0] = TSynTabChar) and (Result < 1) do begin
        Inc(Result);
        Inc(Run);
        SomethingToDelete := True;
      end;
    end else begin
      while (Run[0] = ' ') and (Result < IndentWidth) do begin
        Inc(Result);
        Inc(Run);
        SomethingToDelete := True;
      end;
    end;
  end;

begin
  OrgSelectionMode := ActiveSelectionMode;
  Len := 0;
  LastIndent := 0;
  if SelAvail then
  begin
    UseTabs:=(eoTabsInBlockIndent in Options) and not (eoTabsToSpaces in Options);
    IndentWidth:=fBlockIndent;

    // store current selection detail
    BB := BlockBegin;
    BE := BlockEnd;
    OrgCaretPos := CaretXY;

    // convert selection to complete lines
    if BE.Char = 1 then
      e := BE.Line - 1
    else
      e := BE.Line;

    if UseTabs then begin
      // build string to delete
      StrToDeleteLen := 3 * (e - BB.Line) + 2;
      //                chars per line * lines-1    + last line + null char
      StrToDelete := StrAlloc(StrToDeleteLen);
      StrToDelete[0] := #0;
      SomethingToDelete := False;
      for x := BB.Line to e-1 do
      begin
         Line := PChar(Lines[x-1]);
         StrCat(StrToDelete,PChar(StringOfChar(TSynTabChar, GetDelLen(UseTabs))));
         StrCat(StrToDelete, PChar(#13#10));
      end;
      Line := PChar(Lines[e-1]);
      StrCat(StrToDelete,PChar(StringOfChar(TSynTabChar, GetDelLen(UseTabs))));
    end else begin
      // build string to delete
      StrToDeleteLen := (IndentWidth + 2) * (e - BB.Line) + IndentWidth + 1;
      //                chars per line * lines-1    + last line + null char
      StrToDelete := StrAlloc(StrToDeleteLen);
      StrToDelete[0] := #0;
      SomethingToDelete := False;
      for x := BB.Line to e-1 do
      begin
         Line := PChar(Lines[x-1]);
         StrCat(StrToDelete,PChar(StringOfChar(' ', GetDelLen(UseTabs))));
         StrCat(StrToDelete, PChar(#13#10));
      end;
      Line := PChar(Lines[e-1]);
      StrCat(StrToDelete,PChar(StringOfChar(' ', GetDelLen(UseTabs))));
    end;

    BeginUpdate;
    try
      FirstIndent := -1;
      // Delete string
      if SomethingToDelete then begin
        FullStrToDelete := StrToDelete;
        CaretY := BB.Line;
        repeat
          Run := GetEOL(StrToDelete);
          if Run <> StrToDelete then begin
            Len := Run - StrToDelete;
            if FirstIndent = -1 then
              FirstIndent := Len;
            TempString := Lines[CaretY - 1];
            if Len > 0 then
              Delete(TempString, 1, Len);
            Lines[CaretY - 1] := TempString;
          end;
          if Run^ = #13 then begin
            Inc(Run);
            if Run^ = #10 then
              Inc(Run);
            CaretY:=CaretY+1;
          end;
          StrToDelete := Run;
        until Run^ = #0;
        LastIndent := Len;
        UndoList.AddChange(crUnindent, BB, BE, FullStrToDelete, smNormal);
      end;

      // restore selection
      ActiveSelectionMode := OrgSelectionMode;
      if FirstIndent = -1 then
        FirstIndent := 0;

      OrgCaretPos.Char:=BE.Char - LastIndent;
      SetCaretAndSelection(OrgCaretPos, BufferCoord(BB.Char - FirstIndent, BB.Line),
        BufferCoord(BE.Char - LastIndent, BE.Line));
    finally
      EndUpdate;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.DoColumnPasteFixCaretPosition(CaretXYBeforePaste: TBufferCoord);
var
  Mem: HGLOBAL;
  P: PChar;
begin
  if (Clipboard.HasFormat(SynEditClipboardFormat)) then begin
    Clipboard.Open;
    try
      Mem:=Clipboard.GetAsHandle(SynEditClipboardFormat);
      P:=GlobalLock(Mem);
      try
        if (Assigned(P) and (PSynSelectionMode(P)^=smColumn)) then begin
          if(CaretXY.Line>Lines.Count-1) then
            Lines.Add('');
          CaretXY:=BufferCoord(CaretXYBeforePaste.Char, CaretXY.Line+1);
        end;
      finally
        GlobalUnlock(Mem);
      end;
    finally
      Clipboard.Close;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.ExecuteCommand(Command: TSynEditorCommand; AChar: char; Data: pointer);
var
  C: TBufferCoord;
begin
  case Command of
    ecBlockIndent:
      if not ReadOnly then
        DoBlockIndentEx;
    ecBlockUnindent:
      if not ReadOnly then
        DoBlockUnindentEx;
    ecToggleCaseBlock, ecUpperCaseBlock, ecLowerCaseBlock:
      begin
        SaveSelection;
        inherited;
        RestoreSelection;
      end;
    ecPaste:
      begin
        C:=CaretXY;
        inherited;
        DoColumnPasteFixCaretPosition(C);
      end;
    else
      inherited;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.SaveSelection;
begin
  fSelectionSaved:=SelAvail;
  if fSelectionSaved then begin
    fSavedBlockBegin:=BlockBegin;
    fSavedBlockEnd:=BlockEnd;
    fSavedSelectionMode:=SelectionMode;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.RestoreSelection;
begin
  if fSelectionSaved then begin
    BlockBegin:=fSavedBlockBegin;
    BlockEnd:=fSavedBlockEnd;
    SelectionMode:=fSavedSelectionMode;
    fSelectionSaved:=FALSE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.SaveState;
begin
  fStateSaved:=TRUE;
  fSavedStateTopLine:=TopLine;
  fSavedStateLeftChar:=LeftChar;
  fSavedStateCaretXY:=CaretXY;
  SaveSelection;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.RestoreState;
begin
  if fStateSaved then begin
    TopLine:=fSavedStateTopLine;
    LeftChar:=fSavedStateLeftChar;
    CaretXY:=fSavedStateCaretXY;
    RestoreSelection;
    fStateSaved:=FALSE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.LockPaint(Value: boolean);
begin
  if Value then begin
    if (fLockPaintCounter=0) then begin
      fLockPaintTransientProc:=OnPaintTransient;
      OnPaintTransient:=nil;
      LockWindowUpdate(Handle);
    end;
    inc(fLockPaintCounter);
  end else begin
    dec(fLockPaintCounter);
    if (fLockPaintCounter<0) then
      fLockPaintCounter:=0;
    if (fLockPaintCounter=0) then begin
      OnPaintTransient:=fLockPaintTransientProc;
      LockWindowUpdate(0);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
function TConTEXTSynEdit.ConvertTabsAndSpaces(Conversion: TTabsConversion; TabWidth: integer): boolean;
var
  i: integer;
  changes_made: boolean;
  str: TStringList;
begin
  str:=TStringList.Create;

  if SelAvail then
    str.Text:=SelText
  else
    str.Text:=Lines.Text;

  changes_made:=FALSE;
  try
    str.BeginUpdate;
    for i:=0 to str.Count-1 do begin
      case Conversion of
        tcTabsToSpaces:
          str[i]:=Q_TabsToSpaces(str[i], TabWidth);
        tcSpacesToTabs:
          str[i]:=Q_SpacesToTabs(str[i], TabWidth);
        else
          ;
      end;

      changes_made:=changes_made or (str[i]<>Lines[i]);
    end;
  finally
    str.EndUpdate;
  end;

  if changes_made then begin
    if SelAvail then
      SelText:=str.Text
    else begin
      SelectAll;
      SelText:=str.Text;
    end;
  end;

  str.Free;

  result:=changes_made;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.TrimLine(LineNumber: integer);
var
  len: integer;
  s: string;
begin
  if (fTrimTrailingSpaces) and (LineNumber>0) and (LineNumber<=Lines.Count) then begin
    s:=Lines[LineNumber-1];
    len:=Length(s);
    if (len>0) and (s[len] in [' ', #09]) then
      Lines[LineNumber-1]:=TrimRight(s);
  end;
end;
//------------------------------------------------------------------------------------------
function TConTEXTSynEdit.RemoveTrailingSpaces: boolean;
var
  i: integer;
  changes_made: boolean;
  str: TStringList;
begin
  str:=TStringList.Create;

  if SelAvail then
    str.Text:=SelText
  else
    str.Text:=Lines.Text;

  changes_made:=FALSE;
  try
    str.BeginUpdate;
    for i:=0 to str.Count-1 do begin
      str[i]:=TrimRight(str[i]);
      changes_made:=changes_made or (str[i]<>Lines[i]);
    end;
  finally
    str.EndUpdate;
  end;

  if changes_made then begin
    if SelAvail then
      SelText:=str.Text
    else begin
      SelectAll;
      SelText:=str.Text;
    end;
  end;

  str.Free;

  result:=changes_made;
end;
//------------------------------------------------------------------------------------------
function TConTEXTSynEdit.RemoveComments: boolean;
var
  SavedCaretXY: TBufferCoord;
  i, ii: integer;
  BuffPos: TBufferCoord;
  Token: string;
  Attri: TSynHighlighterAttributes;
  cBegin, cEnd: TBufferCoord;
  changes_made: boolean;
  end_reached: boolean;
  cBegList, cEndList: TBufferCoordList;
  len: integer;
  s: string;

  function IncPos(dX: integer): boolean;
  var
    len: integer;
  begin
    result:=(BuffPos.Line<=Lines.Count);
    if result then begin
      while ((dX>0) and (BuffPos.Line<=Lines.Count)) do begin
        len:=Length(Lines[BuffPos.Line-1]);
        if (len>0) then begin
          if (BuffPos.Char+dX>len) then begin
            dec(dX, len-BuffPos.Char+1);
            inc(BuffPos.Line);
            BuffPos.Char:=1;
          end else begin
            inc(BuffPos.Char, dX);
            dX:=0;
          end;
        end else begin
          inc(BuffPos.Line);
          dec(dX);
          BuffPos.Char:=1;
        end;
      end;
    end;
    end_reached:=not result;
  end;

begin
  fDisableAutoTrimLine:=TRUE;

  cBegList:=TBufferCoordList.Create;
  cEndList:=TBufferCoordList.Create;

  if SelAvail then begin
    SaveSelection;
    BuffPos:=BlockBegin
  end else
    BuffPos:=BufferCoord(1, 1);

  SavedCaretXY:=CaretXY;

  changes_made:=FALSE;
  end_reached:=FALSE;

  while (not end_reached) do begin
    GetHighlighterAttriAtRowCol(BuffPos, Token, Attri);
    if (Attri=highlighter.CommentAttribute) then begin
      cBegList.Add(BuffPos);

      while TRUE do begin
        cEnd:=BuffPos;
        GetHighlighterAttriAtRowCol(BuffPos, Token, Attri);
        IncPos(Length(Token));
        if (Attri<>highlighter.CommentAttribute) then begin
          cEndList.Add(cEnd);
          BREAK;
        end;
      end;
    end else begin
      len:=Length(Token);
      if (len>0) then
        IncPos(len)
      else
        IncPos(1);
    end;

    if fSelectionSaved then
      end_reached:=end_reached or
                   ((BuffPos.Line>fSavedBlockEnd.Line) or
                    ((BuffPos.Line=fSavedBlockEnd.Line) and (BuffPos.Char>fSavedBlockEnd.Char)));
  end;

  BeginUpdate;
  try
    for i:=cBegList.Count-1 downto 0 do begin
      cBegin:=cBegList[i]^;
      cEnd:=cEndList[i]^;

      if (cEnd.Char=1) then begin
        dec(cEnd.Line);
        len:=Length(Lines[cEnd.Line-1]);
        cEnd.Char:=len+1;
        if (cBegin.Line<cEnd.Line) then begin
          cBegin:=cBegList[i]^;
          cEnd:=cEndList[i]^;
        end else
          if (cBegin.Line=cEnd.Line) then begin
            s:=Copy(Lines[cEnd.Line-1], 1, cBegin.Char-1);
            if (Length(Trim(s))=0) then begin
              cBegin:=cBegList[i]^;
              cBegin.Char:=1;
              cEnd:=cEndList[i]^;
            end;
          end;
      end;

      BlockBegin:=cBegin;
      BlockEnd:=cEnd;
      SelText:='';
      changes_made:=TRUE;

      if (fSelectionSaved) then begin
        dec(fSavedBlockEnd.Line, cEnd.Line-cBegin.Line);
        dec(SavedCaretXY.Line, cEnd.Line-cBegin.Line);
      end;

      if (fTrimTrailingSpaces) then begin
        for ii:=cBegin.Line to cEnd.Line do
          TrimLine(ii);
      end;
    end;
  finally
    EndUpdate;
    CaretXY:=SavedCaretXY;
    RestoreSelection;
  end;

  cBegList.Free;
  cEndList.Free;

  result:=changes_made;
  fDisableAutoTrimLine:=FALSE;
end;
//------------------------------------------------------------------------------------------
function TConTEXTSynEdit.GetLineRect(Line: integer): TRect;
var
  vStartRow: integer;
  vEndRow: integer;
begin
  vStartRow:=LineToRow(Line);
  vEndRow:=LineToRow(Line+1);
  result.TopLeft:=RowColumnToPixels(DisplayCoord(1, vStartRow));
  result.BottomRight:=RowColumnToPixels(DisplayCoord(Width, vEndRow));
  dec(result.Bottom);
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.InvalidateChangeTracker;
begin
  //
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                              Enhanced keyboard functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.DoHomeKey(var Command: TSynEditorCommand);
var
  newXY: TBufferCoord;
  bBegin: TBufferCoord;
  IsFirstLineInParagraph: boolean;
begin
  IsFirstLineInParagraph:=BufferToDisplayPos(CaretXY).Row=LineToRow(CaretY);

  if Wordwrap and (DisplayX=1) and not IsFirstLineInParagraph then begin
    case Command of
      ecLineStart:
        CaretX:=1;
      ecSelLineStart:
        begin
          newXY:=BufferCoord(1, CaretY);
          if SelAvail then
            bBegin:=BlockEnd
          else
            bBegin:=CaretXY;

          SetCaretAndSelection(newXY, bBegin, newXY);
        end;
    end;

    Command:=ecNone;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.DoEndKey(var Command: TSynEditorCommand);
var
  newX: integer;
  newXY: TBufferCoord;
  bBegin: TBufferCoord;
  LastRow: integer;

  function CalcLastRow: integer;
  var
    dXY: TDisplayCoord;
  begin
    dXY:=DisplayCoord(1, DisplayY+1);

    if (DisplayToBufferPos(dXY).Char<>1) then 
      result:=DisplayToBufferPos(dXY).Char
    else
      result:=Length(Lines[CaretY-1]);
  end;

begin
  if Wordwrap then begin
    LastRow:=CalcLastRow;
    if (CaretX>=LastRow-1) then begin
      case Command of
        ecLineEnd:
          CaretX:=Length(Lines[CaretY-1])+1;
        ecSelLineEnd:
          begin
            newXY:=BufferCoord(Length(Lines[CaretY-1])+1, CaretY);
            if SelAvail then
              bBegin:=BlockBegin
            else
              bBegin:=CaretXY;

            SetCaretAndSelection(newXY, bBegin, newXY);
          end;
      end;
      Command:=ecNone;
    end;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.DoOnProcessCommand(var Command: TSynEditorCommand; var AChar: char; Data: pointer);
begin
  inherited;

  case Command of
    ecLineStart, ecSelLineStart:
      DoHomeKey(Command);
    ecLineEnd, ecSelLineEnd:
      DoEndKey(Command);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.OnAddedUndoEvent(Sender: TObject);
var
  UndoItem: TSynEditUndoItem;
  i: integer;
  BegY, EndY: integer;

  procedure MarkChangedLine(Index: integer);
  var
    Data: TTextLineData;
  begin
    Data:=TTextLineData(Lines.Objects[Index]);

    if not Assigned(Data) then begin
      Data:=TTextLineData.Create;
      Lines.Objects[Index]:=Data;
    end;

    Data.Modified:=TRUE;
    Data.Saved:=FALSE;
  end;

begin
  if Assigned(fOldOnAddedUndoEvent) then
    fOldOnAddedUndoEvent(Sender);

  if (ChangeTrackerEnabled) then begin
    UndoItem:=UndoList.PeekItem;

    if Assigned(UndoItem) then begin
      BegY:=UndoItem.ChangeStartPos.Line-1;
      EndY:=UndoItem.ChangeEndPos.Line-1;

      case UndoList.LastChangeReason of
        crInsert, crPaste, crDragDropInsert, crLineBreak:
          begin
            if (UndoList.LastChangeReason=crLineBreak) then
              inc(EndY);

            for i:=BegY to EndY do
              MarkChangedLine(i);

            InvalidateGutterLines(BegY + 1, EndY + 1);
          end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TConTEXTSynEdit.OnGutterPaintEvent(Sender: TObject; aLine, X, Y: Integer);
var
  i: integer;
  Data: TTextLineData;
  R: TRect;
begin
  if Assigned(fOldOnGutterPaintEvent) then
    fOldOnGutterPaintEvent(Sender, aLine, X, Y);

  if (ChangeTrackerEnabled) then begin
    Data:=TTextLineData(Lines.Objects[aLine - 1]);

    if Assigned(Data) then begin
      if (Data.Modified) then begin
        if (Data.Saved) then
          Canvas.Brush.Color:=fChangeTrackerSavedColor
        else
          Canvas.Brush.Color:=fChangeTrackerChangedColor;

        if Gutter.ShowLineNumbers then
          X := Gutter.LeftOffset + Max(GetAutoSizeDigitCount, Gutter.DigitCount) * CharWidth + 5
        else
          X := Gutter.Width - Gutter.RightOffset + 5;

        R:=GetLineRect(aLine);
        R:=Rect(X, R.Top, X + 5, R.Bottom+1);

        Canvas.FillRect(R);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                              Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TConTEXTSynEdit.Create(AOwner: TComponent);
begin
  inherited;
  TSynEditStringList(Lines).AppendNewLineAtEOF:=FALSE;

  Options:=Options+[eoEnhanceEndKey];

  fOldOnAddedUndoEvent:=UndoList.OnAddedUndo;
  UndoList.OnAddedUndo:=OnAddedUndoEvent;

  fOldOnGutterPaintEvent := OnGutterPaint;
  OnGutterPaint := OnGutterPaintEvent;
end;
//------------------------------------------------------------------------------------------

procedure Register;
begin
  RegisterComponents ('SynEdit', [TConTEXTSynEdit]);
end;

end.
