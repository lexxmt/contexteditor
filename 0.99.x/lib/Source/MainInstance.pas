// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit MainInstance;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Forms, JclFileUtils;

type
  TMainInstance = class(TComponent)
  public
    constructor Create(aOwner: TComponent); override;
  end;

const
  wmMainInstanceOpenFile = WM_USER + 1001; //new
  wmMultiInstanceAllowed = WM_USER + 1002;
  wmLockPainting = WM_USER + 1003;

  MI_DELIMITER_CHAR = #09;
  MI_TERMINATOR_CHAR = #27;
  MI_MAX_MSG_LEN = 200;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ConTEXT Components', [TMainInstance]);
end;

var
  MyAppName, MyClassName: array[0..255] of Char;
  NumFound: Integer;
  LastFound, MyPopup: HWND;

function LookAtAllWindows(Handle: HWND; Temp: LongInt): BOOL; stdcall;
var
  WindowName, ClassName: array[0..255] of Char;
begin
  if (GetClassName(Handle, ClassName, SizeOf(ClassName)) > 0) and
    (StrComp(ClassName, MyClassName) = 0) and
    (GetWindowText(Handle, WindowName, SizeOf(WindowName)) > 0) and
    (StrComp(WindowName, MyAppName) = 0) then
  begin
    Inc(NumFound);
    if Handle <> Application.Handle then
      LastFound := Handle;
  end;
  Result := True;
end;

function SendParam(aHandle: hWND): Boolean; //new
var
  s, ss: string;
  i: integer;
  Atom: TAtom;
  seg_num: integer;
  n: integer;
  seg_size: integer;
  str_beg: integer;
  str_len: integer;
begin
  Result := TRUE;

  if (ParamCount = 0) then
    EXIT;

  s := '';
  for i := 1 to ParamCount do
  begin
    ss := Trim(ParamStr(i));
    if ((Length(ss) > 0) and (ss <> '.') and (ss <> '..') and (ss[1] <> '/')) then
      ss := ExpandFileName(ss);
    s := s + MI_DELIMITER_CHAR + ss;
  end;

  if (Length(s) > 0) then
  begin
    if (s[1] = MI_DELIMITER_CHAR) then
      Delete(s, 1, 1);
    s := s + MI_TERMINATOR_CHAR;

    str_len := Length(s);
    seg_num := (str_len + MI_MAX_MSG_LEN - 1) div MI_MAX_MSG_LEN;
    n := 0;
    str_beg := 1;

    while (n < seg_num) do
    begin
      if (n < seg_num - 1) then
        seg_size := MI_MAX_MSG_LEN
      else
        seg_size := str_len - ((seg_num - 1) * MI_MAX_MSG_LEN);

      ss := Copy(s, str_beg, seg_size);

      Atom := GlobalAddAtom(PChar(ss));
      SendMessage(aHandle, wmMainInstanceOpenFile, Atom, Length(ss));
      GlobalDeleteAtom(Atom);

      inc(n);
      inc(str_beg, seg_size);
    end;
  end;
end;

function MultipleInstancesAllowed(aHandle: hWND): boolean;
begin
  result := SendMessage(aHandle, wmMultiInstanceAllowed, 0, 0) = 1;
end;

constructor TMainInstance.Create(aOwner: TComponent);
var
  t: dword;
begin
  inherited;

  NumFound := 0;
  LastFound := 0;
  GetWindowText(Application.Handle, MyAppName, SizeOf(MyAppName));
  GetClassName(Application.Handle, MyClassName, SizeOf(MyClassName));
  EnumWindows(@LookAtAllWindows, 0);

  if (NumFound > 1) then
  begin
    MyPopup := GetLastActivePopup(LastFound);

    if MultipleInstancesAllowed(MyPopup) then
      EXIT;

    BringWindowToTop(LastFound);
    if IsIconic(MyPopup) then
    begin
      ShowWindow(MyPopup, SW_RESTORE);
      SetForegroundWindow(MyPopup);

      t := GetTickCount;
      while (GetTickCount < t + 100) do
        Application.ProcessMessages;
      MyPopup := GetLastActivePopup(LastFound);
    end
    else
      SetForegroundWindow(MyPopup);

    SendParam(MyPopup); //new

    HALT;
  end;
end;

end.

