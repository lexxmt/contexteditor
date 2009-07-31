// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uMacros;

interface

{$I ConTEXT.inc}

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Menus,
  ExtCtrls,
  ComCtrls,
  Buttons,
  StdCtrls,
  SynEditKeyCmds,
  fEditor,
  uCommon,
  uMultiLanguage;

const
  MAX_MACRO_SIZE = 4096;

type
  TMacroDataTyp = (mdtNone, mdtFindReplace, mdtFill);

  TMacroCmdTyp = record
    DataTyp: TMacroDataTyp;
  end;

  TMacroCmdFind = record
    DataTyp: TMacroDataTyp;
    StrFind: string[255];
    StrReplace: string[255];
    Cfg: TFindDlgCfg;
  end;

  TMacroCmdFill = record
    DataTyp: TMacroDataTyp;
    Str: string[255];
  end;

  pTMacroCmdTyp = ^TMacroCmdTyp;
  pTMacroCmdFind = ^TMacroCmdFind;
  pTMacroCmdFill = ^TMacroCmdFill;

  TMacroCmd = record
    Cmd: TSynEditorCommand;
    AChar: char;
    Data: pointer;
    DataSize: integer;
  end;

  TMacro = record
    Key: word;
    Shift: TShiftState;
    Commands: array[0..MAX_MACRO_SIZE - 1] of TMacroCmd;
    CmdCount: integer;
    Disabled: boolean;
  end;

  pTMacro = ^TMacro;
  pTMacroCmd = ^TMacroCmd;

  ////////////////////////////////////////////////////////////////////////////////////////////

  TMacros = class
  private
    FStopPlayingMacro: boolean;
    CurrEditor: TObject;
    CurrMacro: pTMacro;
    CurrMacroName: string;

    Changed: boolean;

    function MacroCommandToStr(var CmdStr: string; Command: pTMacroCmd): boolean;
  public
    strMacros: TStringList;

    Recording: boolean;
    Playing: boolean;

    constructor Create;
    destructor Destroy; override;

    function StartRecording(Sender: TObject; Name: string; AKey: word; AShift: TShiftState): pTMacro;
    procedure AbortRecording(Sender: TObject);
    function StopRecording(Sender: TObject): boolean;
    procedure AddMacroCommand(Sender: TObject; Command: TSynEditorCommand; AChar: char; Data: pointer);
    function Play(ed: TfmEditor; var AKey: word; var AShift: TShiftState): boolean;
    function PlaybyName(ed: TfmEditor; MacroName: string): boolean;
    procedure StopPlayMacro;
    procedure Clear;
    procedure AddMacro(Name: string; mac: pTMacro);
    procedure DeleteMacro(mac: pTMacro);
    function Count: integer;
    function FindMacroWithShortcut(SC: TShortcut): pTMacro;

    function Load(fname: string): boolean;
    function Save(fname: string): boolean;
  end;

function GetMacroDataSize(DataTyp: TMacroDataTyp): integer;
procedure FreeMacro(Macro: pTMacro);
function DuplicateMacro(Macro: pTMacro): pTMacro;
function AllocMacroCmdData(DataTyp: TMacroDataTyp): pointer;

////////////////////////////////////////////////////////////////////////////////////////////

implementation

uses
  fMain;

const
  DEF_FNAME = 'default.mac';

const
  ERR_SYNTAX_ERR = 1;
  ERR_MACROBEGIN_EXPECTED = 2;
  ERR_LBRACE_EXPECTED = 3;
  ERR_RBRACE_EXPECTED = 4;
  ERR_STRING_EXPECTED = 5;
  ERR_NUMBER_EXPECTED = 6;
  ERR_COMMA_EXPECTED = 7;
  ERR_NUM = 7;

  ERR_STR: array[1..ERR_NUM] of string =
    ('Syntax error.',
    '''MacroBegin'' keyword expected.',
    '''('' expected.',
    '")" expected.',
    'String expected.',
    'Number expected.',
    'Comma expected.'
    );

  ////////////////////////////////////////////////////////////////////////////////////////////
  //                              Static functions
  ////////////////////////////////////////////////////////////////////////////////////////////
  //------------------------------------------------------------------------------------------

function GetMacroDataSize(DataTyp: TMacroDataTyp): integer;
begin
  case DataTyp of
    mdtFindReplace: result := SizeOf(TMacroCmdFind);
    mdtFill: result := SizeOf(TMacroCmdFill);
  else
    result := 0;
  end;
end;
//------------------------------------------------------------------------------------------

procedure FreeMacro(Macro: pTMacro);
var
  i: integer;
begin
  if not Assigned(Macro) then
    EXIT;

  with Macro^ do
  begin
    for i := 0 to CmdCount - 1 do
      if Assigned(Commands[i].Data) then
        FreeMem(Commands[i].Data, Commands[i].DataSize);
  end;

  FreeMem(Macro);
end;
//------------------------------------------------------------------------------------------

function DuplicateMacro(Macro: pTMacro): pTMacro;
var
  mac: pTMacro;
  i: integer;
begin
  result := nil;
  if not Assigned(Macro) then
    EXIT;

  mac := AllocMem(SizeOf(TMacro));
  Move(Macro^, mac^, SizeOf(TMacro));

  // iskopiraj i stringove ako postoje
  for i := 0 to Macro^.CmdCount - 1 do
  begin
    if Assigned(Macro^.Commands[i].Data) then
    begin
      mac^.Commands[i].Data := AllocMem(Macro^.Commands[i].DataSize);
      Move(Macro^.Commands[i].Data^, mac^.Commands[i].Data^, Macro^.Commands[i].DataSize);
    end;
  end;

  result := mac;
end;
//------------------------------------------------------------------------------------------

function AllocMacroCmdData(DataTyp: TMacroDataTyp): pointer;
var
  size: integer;
  rec: pointer;
begin
  size := GetMacroDataSize(DataTyp);

  if (size > 0) then
  begin
    rec := AllocMem(size);
    pTMacroCmdTyp(rec)^.DataTyp := DataTyp;
  end
  else
    rec := nil;

  result := rec;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                              Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

constructor TMacros.Create;
var
  i: integer;
begin
  for i := 1 to ERR_NUM do
    ERR_STR[i] := mlStr(05000 + i, ERR_STR[i]);

  Recording := FALSE;
  Playing := FALSE;
  CurrEditor := nil;
  strMacros := TStringList.Create;
  Changed := FALSE;

  Load(ApplicationDir + DEF_FNAME);
end;
//------------------------------------------------------------------------------------------

destructor TMacros.Destroy;
begin
  Save(ApplicationDir + DEF_FNAME);

  Clear;
  strMacros.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                 Macro functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------

procedure TMacros.Clear;
var
  i: integer;
begin
  for i := 0 to strMacros.Count - 1 do
    FreeMacro(pTMacro(strMacros.Objects[i]));

  Changed := TRUE;

  strMacros.Clear;
end;
//------------------------------------------------------------------------------------------

procedure TMacros.AddMacro(Name: string; mac: pTMacro);
begin
  strMacros.AddObject(Name, pointer(mac));
end;
//------------------------------------------------------------------------------------------

procedure TMacros.DeleteMacro(mac: pTMacro);
var
  n: integer;
begin
  n := strMacros.IndexOfObject(pointer(mac));
  if (n <> -1) then
  begin
    FreeMem(pTMacro(strMacros.Objects[n]));
    strMacros.Delete(n);
  end;
end;
//------------------------------------------------------------------------------------------

function TMacros.StartRecording(Sender: TObject; Name: string; AKey: word; AShift: TShiftState): pTMacro;
begin
  result := nil;
  if Recording then
    EXIT;

  Recording := TRUE;

  CurrEditor := Sender;
  CurrMacro := AllocMem(SizeOf(TMacro));

  CurrMacro^.Key := AKey;
  CurrMacro^.Shift := AShift;
  CurrMacroName := Name;

  if Assigned(Sender) then
    TfmEditor(Sender).RefreshMacroRecording(Recording);

  result := CurrMacro;
end;
//------------------------------------------------------------------------------------------

procedure TMacros.AbortRecording(Sender: TObject);
begin
  if (not Recording) or Playing or (Sender <> CurrEditor) then
    EXIT;

  if Assigned(CurrMacro) then
    FreeMem(CurrMacro);
  CurrMacro := nil;
  Recording := FALSE;

  if Assigned(Sender) then
    TfmEditor(Sender).RefreshMacroRecording(Recording);
end;
//------------------------------------------------------------------------------------------

procedure TMacros.AddMacroCommand(Sender: TObject; Command: TSynEditorCommand; AChar: char; Data: pointer);
var
  DataSize: integer;
begin
  if (not Recording) or Playing or (Sender <> CurrEditor) then
    EXIT;

  case Command of
    ecFillBlock: DataSize := GetMacroDataSize(mdtFill);
    ecFind: DataSize := GetMacroDataSize(mdtFindReplace);
  else
    DataSize := 0;
  end;

  CurrMacro^.Commands[CurrMacro^.CmdCount].Cmd := Command;
  CurrMacro^.Commands[CurrMacro^.CmdCount].AChar := AChar;
  CurrMacro^.Commands[CurrMacro^.CmdCount].Data := Data;
  CurrMacro^.Commands[CurrMacro^.CmdCount].DataSize := DataSize;
  inc(CurrMacro^.CmdCount);
end;
//------------------------------------------------------------------------------------------

function TMacros.StopRecording(Sender: TObject): boolean;
begin
  result := FALSE;
  if not Recording or (Sender <> CurrEditor) then
    EXIT;

  strMacros.AddObject(CurrMacroName, pointer(CurrMacro));
  CurrMacro := nil;
  CurrEditor := nil;
  Recording := FALSE;
  Changed := TRUE;

  if Assigned(Sender) then
    TfmEditor(Sender).RefreshMacroRecording(Recording);
  result := TRUE;
end;
//------------------------------------------------------------------------------------------

function TMacros.Play(ed: TfmEditor; var AKey: word; var AShift: TShiftState): boolean;
var
  i, ii: integer;
  Macro: pTMacro;
begin
  result := FALSE;
  if Recording or Playing then
    EXIT;

  i := 0;
  while (i < strMacros.Count) do
  begin
    Macro := pTMacro(strMacros.Objects[i]);
    if (Macro^.Shift = AShift) and (Macro^.Key = AKey) then
    begin
      if not (Macro^.Disabled) then
      begin
        Playing := TRUE;
        FStopPlayingMacro := FALSE;

        SetLengthyOperation(TRUE);

        // play macro
        ii := 0;
        while (ii < Macro^.CmdCount) and not FStopPlayingMacro do
        begin
          ed.memo.CommandProcessor(Macro^.Commands[ii].Cmd, Macro^.Commands[ii].AChar, Macro^.Commands[ii].Data);
          inc(ii);
        end;

        SetLengthyOperation(FALSE);

        Playing := FALSE;
        result := TRUE;
      end;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------

function TMacros.PlaybyName(ed: TfmEditor; MacroName: string): boolean;
var
  i: integer;
  M: pTMacro;
  old_D: boolean;
begin
  result := FALSE;
  MacroName := Trim(UpperCase(MacroName));
  if (Length(MacroName) = 0) then
    EXIT;

  i := 0;
  while (i < strMacros.Count) do
  begin
    if (UpperCase(strMacros[i]) = MacroName) then
    begin
      M := pTMacro(strMacros.Objects[i]);
      old_D := M^.Disabled;
      M^.Disabled := FALSE;
      Play(ed, M^.Key, M^.Shift);
      M^.Disabled := old_D;
      result := TRUE;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------

procedure TMacros.StopPlayMacro;
begin
  FStopPlayingMacro := TRUE;
end;
//------------------------------------------------------------------------------------------

function TMacros.Count: integer;
begin
  result := strMacros.Count;
end;
//------------------------------------------------------------------------------------------

function TMacros.FindMacroWithShortcut(SC: TShortcut): pTMacro;
var
  i: integer;
begin
  result := nil;
  i := 0;
  while (i < Count) do
  begin
    if (Shortcut((pTMacro(strMacros.Objects[i]).Key), (pTMacro(strMacros.Objects[i]).Shift)) = SC) then
    begin
      result := pTMacro(strMacros.Objects[i]);
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
//                                 File functions
////////////////////////////////////////////////////////////////////////////////////////////

type
  TToken = (
    tkEOF, tkERROR, tkASSIGN, tkColon, tkComma,
    tkLBRACE, tkRBRACE, tkNUMBER, tkIDENT, tkSemiColon,
    tkNOT, tkNEG,
    tkMUL, tkDIV, tkMOD,
    tkADD, tkSUB,
    tkLT, tkLE, tkEQ, tkNE, tkGE, tkGT,
    tkOR, tkXOR, tkAND,
    tkQuote,
    tkString
    );

var
  token: TToken;
  svalue: string;
  numvalue: integer;
  ptr: PChar;

  //------------------------------------------------------------------------------------------

procedure lex;
label
  Error;
var
  c: char;
  s_pos: PChar;

  function NextNonBlankChar: char;
  var
    ptr_: PChar;
  begin
    ptr_ := ptr;
    repeat inc(ptr_)until ((ptr_^ > ' ') or (ptr_^ = #0));
    result := ptr_^;
  end;

  function ConvertNumber(first, last: PChar; base: Word): boolean;
  var
    c: Byte;
  begin
    numvalue := 0;
    while first < last do
    begin
      c := Ord(first^) - Ord('0');
      if (c > 9) then
      begin
        Dec(c, Ord('A') - Ord('9') - 1);
        if (c > 15) then
          Dec(c, Ord('a') - Ord('A'));
      end;
      if (c >= base) then
        break;
      numvalue := numvalue * base + c;
      Inc(first);
    end;
    Result := (first = last);
  end;

begin
  { skip blanks }
  while (ptr^ <> #0) do
  begin
    if (ptr^ > ' ') then
      break;
    inc(ptr);
  end;

  { check EOF }
  if (ptr^ = #0) then
  begin
    token := tkEOF;
    EXIT;
  end;

  token := tkNUMBER;

  { match numbers }
  if CharInSet(ptr^, ['0'..'9']) then
  begin
    s_pos := ptr;
    while CharInSet(s_pos^, ['0'..'9']) do
      inc(s_pos);

    { match simple decimal number }
    if not ConvertNumber(ptr, s_pos, 10) then
      goto Error;
    ptr := s_pos;
    EXIT;
  end;

  { match identifiers }
  if CharInSet(ptr^, ['A'..'Z', 'a'..'z', '_']) then
  begin
    svalue := ptr^;
    inc(ptr);
    while CharInSet(ptr^, ['A'..'Z', 'a'..'z', '0'..'9', '_']) do
    begin
      svalue := svalue + ptr^;
      inc(ptr);
    end;

    token := tkIDENT;
    EXIT;
  end;

  // match strings
  if (ptr^ = '"') then
  begin
    inc(ptr);
    svalue := '';
    while not CharInSet(ptr^, ['"', #00, #13, #13]) do
    begin
      if (ptr^ = '\') and CharInSet((ptr + 1)^, ['"', '\']) then
        inc(ptr);
      svalue := svalue + ptr^;
      inc(ptr);
    end;

    if (ptr^ = '"') then
    begin
      inc(ptr);
      token := tkString;
    end
    else
      token := tkError;

    EXIT;
  end;

  { match operators }
  c := ptr^;
  inc(ptr);
  case c of
    '(':
      begin
        token := tkLBRACE;
      end;
    ')':
      begin
        token := tkRBRACE;
      end;
    ',': token := tkComma;
    ':': token := tkColon;
    ';': token := tkSemiColon;
    '=':
      begin
        token := tkEQ;
        if (ptr^ = '=') then
        begin
          inc(ptr);
          token := tkEQ;
        end;
      end;
    '+':
      begin
        token := tkADD;
      end;
    '-':
      begin
        token := tkSUB;
      end;
    '*':
      begin
        token := tkMUL;
      end;
    '/':
      begin
        token := tkDIV;
      end;
    '%':
      begin
        token := tkMOD;
      end;
    '^':
      begin
        token := tkXOR;
      end;
    '&':
      begin
        token := tkAND;
      end;
    '|':
      begin
        token := tkOR;
      end;
    '<':
      begin
        token := tkLT;
        if (ptr^ = '=') then
        begin
          inc(ptr);
          token := tkLE;
        end
        else if (ptr^ = '>') then
        begin
          inc(ptr);
          token := tkNE;
        end;
      end;
    '>':
      begin
        token := tkGT;
        if (ptr^ = '=') then
        begin
          inc(ptr);
          token := tkGE;
        end
        else if (ptr^ = '<') then
        begin
          inc(ptr);
          token := tkNE;
        end;
      end;
    '!':
      begin
        token := tkNOT;
        if (ptr^ = '=') then
        begin
          inc(ptr);
          token := tkNE;
        end;
      end;
  else
    begin
      token := tkERROR;
      dec(ptr);
    end;
  end;

  EXIT;

  Error:
  token := tkERROR;
end;
//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------

function TMacros.Load(fname: string): boolean;
var
  str: TStringList;
  error: boolean;
  MacroName: string;
  MacroShortCut: string;
  MacroDisabled: string;
  MacroKey: word;
  MacroShift: TShiftState;
  Cmd: integer;
  finished: boolean;
  buff: PChar;
  mac: pTMacro;

  procedure SetError(err: integer);
  var
    ed: TfmEditor;
  begin
    AbortRecording(nil);
    fmMain.OpenFile(fname);

    ed := fmMain.ActiveEditor;
    if Assigned(ed) then
      ed.memo.BlockEnd := ed.memo.BlockBegin;

    MessageDlg(mlStr(ML_MACRO_SYNTAX_ERROR, 'Macros syntax error') + ': ' + ERR_STR[err], mtError, [mbOK], 0);

    error := TRUE;
  end;

  function CheckSyntax(Condition: boolean; Error: integer): boolean;
  begin
    result := Condition;
    if not result then
      SetError(Error);
  end;

  function ParseMacroDefinition: boolean;

    function GetParam(name: string; var value: string; IsLast, Optional: boolean): boolean;
    var
      old_ptr: PChar;
    begin
      old_ptr := ptr;
      result := FALSE;

      lex;
      if (UpperCase(svalue) = name) then
      begin
        lex;
        if CheckSyntax(token = tkColon, ERR_SYNTAX_ERR) then
        begin
          lex;
          if CheckSyntax(token = tkString, ERR_STRING_EXPECTED) then
          begin
            value := svalue;
            if not IsLast then
            begin
              lex;
              if CheckSyntax(token = tkSemiColon, ERR_SYNTAX_ERR) then
                result := TRUE;
            end
            else
              result := TRUE;
          end;
        end;
      end
      else
      begin
        if Optional then
        begin
          result := TRUE;
          ptr := old_ptr;
        end
        else
          SetError(ERR_SYNTAX_ERR);
      end;
    end;

  begin
    lex;
    if (token = tkEOF) then
    begin
      result := FALSE;
      EXIT;
    end;

    if CheckSyntax(UpperCase(svalue) = 'MACROBEGIN', ERR_MACROBEGIN_EXPECTED) then
    begin
      lex;
      if CheckSyntax(token = tkLBrace, ERR_LBRACE_EXPECTED) then
      begin
        if GetParam('NAME', MacroName, FALSE, FALSE) then
        begin

          MacroDisabled := '0';
          GetParam('DISABLED', MacroDisabled, FALSE, TRUE);

          if GetParam('SHORTCUT', MacroShortCut, TRUE, FALSE) then
          begin
            ShortCutToKey(TextToShortcut(MacroShortcut), MacroKey, MacroShift);
            lex;
            CheckSyntax(token = tkRBrace, ERR_RBRACE_EXPECTED);
          end;
        end;
      end;
    end;

    result := not error;
  end;

  function CheckLBrace: boolean;
  begin
    lex;
    result := CheckSyntax(token = tkLBrace, ERR_LBRACE_EXPECTED);
  end;

  function CheckRBrace: boolean;
  begin
    lex;
    result := CheckSyntax(token = tkRBrace, ERR_RBRACE_EXPECTED);
  end;

  function CheckComma: boolean;
  begin
    lex;
    result := CheckSyntax(token = tkComma, ERR_COMMA_EXPECTED);
  end;

  function GetStringParam(var s: string; const FirstParam: boolean = FALSE; const LastParam: boolean = FALSE): boolean;
  begin
    result := TRUE;

    if FirstParam then
      result := CheckLBrace;

    if result then
    begin
      lex;
      result := CheckSyntax(token = tkString, ERR_STRING_EXPECTED);
      if result then
      begin
        s := svalue;
        if LastParam then
          result := CheckRBrace
        else
          result := CheckComma;
      end;
    end;
  end;

  function GetNumberParam(var i: integer; const FirstParam: boolean = FALSE; const LastParam: boolean = FALSE): boolean;
  begin
    result := TRUE;

    if FirstParam then
      result := CheckLBrace;

    if result then
    begin
      lex;
      result := CheckSyntax(token = tkNUMBER, ERR_NUMBER_EXPECTED);
      if result then
      begin
        i := numvalue;
        if LastParam then
          result := CheckRBrace
        else
          result := CheckComma;
      end;
    end;
  end;

  procedure ParseCommand(Cmd: TSynEditorCommand);
  var
    s: string;
    Data: pointer;
    Chr: char;
    num_values: array[1..10] of integer;
    i: integer;
  begin
    Chr := #0;
    Data := nil;

    case Cmd of
      ecChar:
        begin
          if GetStringParam(s, TRUE, TRUE) and CheckSyntax(Length(s) = 1, ERR_SYNTAX_ERR) then
            Chr := s[1];
        end;
      ecFillBlock:
        begin
          if GetStringParam(s, TRUE, TRUE) then
          begin
            Data := AllocMacroCmdData(mdtFill);
            pTMacroCmdFill(Data)^.Str := ShortString(s);
          end;
        end;
      (*
          ecFind:
            with pTMacroCmdFind(Command^.Data)^ do begin
              result:=Format('%s("%s",%d,%d,%d,%d,%d)',
                             [Name,
                              StrFind,
                              ord(Cfg.Origin),
                              ord(Cfg.Scope),
                              integer(Cfg.CaseSensitive),
                              integer(Cfg.WholeWords),
                              ord(Cfg.Direction)
                             ]);
            end;
      *)
      ecFind:
        begin
          if GetStringParam(s, TRUE, FALSE) and
            GetNumberParam(num_values[1]) and
            GetNumberParam(num_values[2]) and
            GetNumberParam(num_values[3]) and
            GetNumberParam(num_values[4]) and
            GetNumberParam(num_values[5], FALSE, TRUE) then
          begin

            Data := AllocMacroCmdData(mdtFindReplace);
            with pTMacroCmdFind(Data)^ do
            begin
              StrFind := ShortString(s);
              Cfg.Origin := TFindOrigin(num_values[1]);
              Cfg.Scope := TFindScope(num_values[2]);
              Cfg.CaseSensitive := boolean(num_values[3]);
              Cfg.WholeWords := boolean(num_values[4]);
              Cfg.Direction := TFindDirection(num_values[5]);
            end;
          end;
        end;
      ecString:
        if GetStringParam(s, TRUE, TRUE) then
        begin
          for i := 1 to Length(s) do
            AddMacroCommand(nil, ecChar, s[i], nil);
        end;
    end;

    if (not error) and not (Cmd = ecString) then
      AddMacroCommand(nil, Cmd, Chr, Data);
  end;

begin
  result := FALSE;

  if FileExists(fname) then
  begin
    str := TStringList.Create;
    try
      str.LoadFromFile(fname);
    except
      str.Free;
      EXIT;
      result := TRUE;
    end;
  end
  else
    EXIT;

  buff := AllocMem(Length(str.Text) + 1);
  try
    StrPCopy(buff, str.Text);
    ptr := buff;

    repeat
      if ParseMacroDefinition then
      begin
        mac := StartRecording(nil, MacroName, MacroKey, MacroShift);

        mac^.Disabled := (MacroDisabled = '1');

        finished := FALSE;
        repeat
          lex;
          if (token = tkIdent) then
          begin
            if IdentToEditorCommand(svalue, Cmd) or (CustomIdentToEditorCommand(svalue, Cmd)) then
            begin
              ParseCommand(Cmd);
            end
            else if CheckSyntax(UpperCase(svalue) = 'MACROEND', ERR_SYNTAX_ERR) then
            begin
              finished := TRUE;
            end;
          end
          else
            CheckSyntax(token = tkEOF, ERR_SYNTAX_ERR);
        until (finished or error or (token in [tkEOF, tkError]));

        if not error then
          StopRecording(nil);
      end;

    until (error or (token in [tkEOF, tkError]));
  finally
    FreeMem(buff);
    str.Free;
    Changed := FALSE;
  end;
end;
//------------------------------------------------------------------------------------------

function TMacros.MacroCommandToStr(var CmdStr: string; Command: pTMacroCmd): boolean;
begin
  result := TRUE;
  case Command^.Cmd of
    ecFillBlock:
      with pTMacroCmdFill(Command^.Data)^ do
      begin
        CmdStr := Format('%s("%s")',
          [CmdStr,
          Str
            ]);
      end;
    ecFind:
      with pTMacroCmdFind(Command^.Data)^ do
      begin
        CmdStr := Format('%s("%s",%d,%d,%d,%d,%d)',
          [CmdStr,
          StrFind,
            ord(Cfg.Origin),
            ord(Cfg.Scope),
            integer(Cfg.CaseSensitive),
            integer(Cfg.WholeWords),
            ord(Cfg.Direction)
            ]);
      end;
  else
    result := FALSE;
  end;
end;
//------------------------------------------------------------------------------------------

function TMacros.Save(fname: string): boolean;
var
  i, ii: integer;
  str: TStringList;
  s: string;
  ss: string;
  mac: pTMacro;
  retry: boolean;

  function FlushString: boolean;
  begin
    result := FALSE;
    if (Length(ss) > 0) then
    begin
      if (Length(ss) = 1) then
        str.Add('  ecChar("' + ss + '")')
      else
        str.Add('  ecString("' + ss + '")');
      ss := '';
      result := TRUE;
    end;
  end;

begin
  result := false;

  if Changed then
  begin
    if (MessageDlg(mlStr(ML_MACRO_SAVE_PROMPT, 'Macros changed, but not saved. Save macro file now?'),
      mtWarning, [mbYes, mbNo], 0) = mrNo) then
    begin
      result := TRUE;
      EXIT;
    end;

    str := TStringList.Create;

    try
      for i := 0 to Count - 1 do
      begin
        mac := pTMacro(strMacros.Objects[i]);
        if Assigned(mac) then
        begin
          // prvo header
          str.Add('');
          str.Add(Format('MacroBegin(Name:"%s"; Disabled:"%d"; Shortcut:"%s")',
            [strMacros[i],
            integer(mac^.Disabled),
              ShortcutToText(Shortcut(mac^.Key, mac^.Shift))
              ]));

          ss := '';
          for ii := 0 to mac^.CmdCount - 1 do
          begin
            if EditorCommandToIdent(mac^.Commands[ii].Cmd, s) or CustomEditorCommandToIdent(mac^.Commands[ii].Cmd, s) then
              if (mac^.Commands[ii].Cmd = ecChar) then
              begin
                if CharInSet(mac^.Commands[ii].AChar, ['"', '\']) then
                  ss := ss + '\';
                ss := ss + mac^.Commands[ii].AChar
              end
              else
              begin
                FlushString;
                MacroCommandToStr(s, @mac^.Commands[ii]);
                str.Add('  ' + s);
              end;
          end;
          FlushString;

          // kraj macroa
          str.Add('MacroEnd');
          str.Add('');
        end;
      end;

      retry := TRUE;
      while retry do
      begin
        try
          str.SaveToFile(fname);
          retry := FALSE;
        except
          retry := MessageDlg(Format(mlStr(ML_MACRO_ERR_SAVING, 'Error saving macro file ''%s''.'), [fname]),
            mtError, [mbOK, mbRetry], 0) = mrRetry;
        end;
      end;

    finally
      str.Free;
    end;
    Changed := FALSE;
  end;
end;
//------------------------------------------------------------------------------------------

end.

