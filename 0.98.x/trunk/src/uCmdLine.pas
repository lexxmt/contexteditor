// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uCmdLine;

interface

{$I ConTEXT.inc}

uses
  Messages, SysUtils, Windows, Classes, uCommon, JclFileUtils, uProject,
  Dialogs;

type
  TCmdLineCmd     = (cmdNone, cmdOpenFile, cmdSaveFile, cmdCloseFile, cmdExit, cmdFileList, cmdPrjFile, cmdPrintFile, cmdCursorPos, cmdRunMacro, cmdReadOnly);

  TCmdLineParam   = record
                      cmd      :TCmdLineCmd;
                      p_int1   :integer;
                      p_int2   :integer;
                      p_fname  :string;
                      p_fnames :TStringList;
                      p_str    :string;
                    end;
  pTCmdLineParam  = ^TCmdLineParam;

procedure CmdLine_Init;
procedure CmdLine_Done;
function  CmdLine_Analyze(str:TStringList):boolean;
procedure CmdLine_Execute;

implementation

uses
  fMain, fEditor;

var
  Cmds          :TList;
  CmdLineParams :TStringList;
  Params        :TStringList;
  ptr           :integer;

//------------------------------------------------------------------------------------------
procedure CmdLine_Init;
begin
  Cmds:=TList.Create;
  Params:=TStringList.Create;
  ptr:=0;
end;
//------------------------------------------------------------------------------------------
procedure CmdLine_Done;
var
  i   :integer;
  C   :pTCmdLineParam;
begin
  if Assigned(Cmds) then begin
    for i:=0 to Cmds.Count-1 do begin
      C:=pTCmdLineParam(Cmds[i]);
      if Assigned(C.p_fnames) then
        C.p_fnames.Free;
      FreeMem(C);
    end;
    Cmds.Free;
  end;

  if Assigned(Params) then
    Params.Free;
end;
//------------------------------------------------------------------------------------------
function GetFileNames(s:string):TStringList;
var
  rec     :TSearchRec;
  n       :integer;
  ss      :TStringList;
begin
  ss:=TStringList.Create;

  if (Pos('*',s)>0) or (Pos('?',s)>0) then begin
    n:=FindFirst(s, faAnyFile-faDirectory, rec);
    while (n=0) do begin
      ss.Add(GetFileLongName(ExtractFilePath(s)+rec.Name));
      n:=FindNext(rec);
    end;
  end else
    ss.Add(s);

  result:=ss;
end;
//------------------------------------------------------------------------------------------
function GetFileNamesFromFile(s:string):TStringList;
var
  str  :TStringList;
  i    :integer;
  path :string;
  dir  :string;
begin
  path:=ExtractFilePath(GetFileLongName(s));
    dir:=GetCurrentDir;

  str:=TStringList.Create;
  try
    str.LoadFromFile(s);

    SetCurrentDir(ExtractFilePath(s));
    // pobrišimo prazne redove
    i:=0;
    while (i<str.Count) do begin
      str[i]:=Trim(str[i]);
      if (Length(str[i])=0) then
        str.Delete(i)
      else begin
        str[i]:=GetFileLongName(str[i]);
        inc(i);
      end;
    end;
  except
    DlgErrorOpenFile(s);
  end;

  SetCurrentDir(dir);
  result:=str;
end;
//------------------------------------------------------------------------------------------
function GetNextParam(var s:string):boolean;
begin
  result:=(ptr<Params.Count);
  if result then begin
    s:=Params[ptr];
    inc(ptr);
  end;
end;
//------------------------------------------------------------------------------------------
procedure ResolveParams;
var
  i, ii    :integer;
  s        :string;
  ss       :TStringList;
begin
  Params.Clear;
  ss:=TStringList.Create;

  for i:=0 to CmdLineParams.Count-1 do begin
    s:=CmdLineParams[i];
    if (Length(s)>0) then begin
      if (s[1]='/') then begin
        ii:=2;
        while (ii<=Length(s)) do begin
          if (s[ii]='/') then begin
            Insert(#13#10,s,ii);
            inc(ii,2);
          end;
          inc(ii);
        end;
        ss.Text:=s;
        for ii:=0 to ss.Count-1 do
          if (Length(ss[ii])>1) then
            Params.Add(ss[ii]);
      end else
        Params.Add(s);
    end;
  end;

  ss.Free;
end;
//------------------------------------------------------------------------------------------
function CmdLine_Analyze(str:TStringList):boolean;
var
  s,ss :string;
  C    :pTCmdLineParam;
  X,Y  :integer;
  i    :integer;
begin
  result:=FALSE;

  i:=0;
  while (i<str.Count) do begin
    if (str[i]='.') or (str[i]='..') then
      str.Delete(i)
    else
      inc(i);
  end;

  CmdLineParams:=str;
  if (CmdLineParams.Count=0) then EXIT;

  ResolveParams;

  while GetNextParam(s) do begin
    C:=AllocMem(SizeOf(TCmdLineParam));

    if (s[1]='/') then begin
      s:=UpperCase(s);
      Delete(s,1,1);
      if (Length(s)=0) then CONTINUE;

      if (s='P') then begin
        if GetNextParam(s) then begin
          C.cmd:=cmdPrintFile;
          C.p_fnames:=GetFileNames(s);
          Cmds.Add(C);
        end;
        CONTINUE;
      end;

      if (s[1]='G') then begin
        i:=2;
        // parametar X
        ss:='';
        while (i<=Length(s)) and (s[i] in ['0'..'9']) do begin
          ss:=ss+s[i];
          inc(i);
        end;
        // separator
        X:=StrToIntDef(ss,1)-1;
        while (i<=Length(s)) and (not (s[i] in ['0'..'9'])) do inc(i);
        // parametar Y
        ss:='';
        while (i<=Length(s)) and (s[i] in ['0'..'9']) do begin
          ss:=ss+s[i];
          inc(i);
        end;
        Y:=StrToIntDef(ss,1)-1;
        C.cmd:=cmdCursorPos;
        C.p_int1:=X;
        C.p_int2:=Y;
        Cmds.Add(C);

        CONTINUE;
      end;

      if (s='M') then begin
        if GetNextParam(s) then begin
          C.cmd:=cmdRunMacro;
          C.p_str:=RemoveQuote(s);
          Cmds.Add(C);
        end;
        CONTINUE;
      end;

      if (s='I') then begin
        if GetNextParam(s) then begin
          C.cmd:=cmdFileList;
          C.p_fnames:=GetFileNamesFromFile(s);
          Cmds.Add(C);
        end;
        CONTINUE;
      end;

      if (s='R') then begin
        C.cmd:=cmdReadOnly;
        Cmds.Add(C);
        CONTINUE;
      end;

      if (s='S') then begin
        C.cmd:=cmdSaveFile;
        Cmds.Add(C);
        CONTINUE;
      end;

      if (s='C') then begin
        C.cmd:=cmdCloseFile;
        Cmds.Add(C);
        CONTINUE;
      end;

      if (s='E') then begin
        C.cmd:=cmdExit;
        Cmds.Add(C);
        CONTINUE;
      end;

      // ako smo došli do ovdje, parametar je nepoznat
      FreeMem(C);
    end else begin
      C.p_fnames:=GetFileNames(s);

      if (C.p_fnames.Count=1) and (IsProjectFile(C.p_fnames[0])) then begin
        C.cmd:=cmdPrjFile;
        C.p_fname:=C.p_fnames[0];
        C.p_fnames.Clear;
      end else
        C.cmd:=cmdOpenFile;

      Cmds.Add(C);
    end;
  end;
  result:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure CmdLine_Execute;
var
  i, ii      :integer;
  cmd        :pTCmdLineParam;
  editors    :TList;
  print_only :boolean;
  open_count :integer;
  locked     :boolean;
begin
  editors:=TList.Create;

  open_count:=0;
  for i:=0 to Cmds.Count-1 do begin
    cmd:=pTCmdLineParam(Cmds[i]);
    if (cmd^.cmd in [cmdOpenFile, cmdFileList]) then
      inc(open_count,cmd.p_fnames.Count);
  end;

  locked:=open_count>2;

  if locked then
    fmMain.LockPainting(FALSE);

  print_only:=TRUE;
  for i:=0 to Cmds.Count-1 do begin
    cmd:=pTCmdLineParam(Cmds[i]);

    case cmd.cmd of
      cmdOpenFile, cmdFileList:
        begin
          editors.Clear;
          if (cmd.p_fnames.Count>1) then begin
            for ii:=0 to cmd.p_fnames.Count-1 do begin
              fmMain.OpenFile(cmd.p_fnames[ii]);
              editors.Add(fmMain.ActiveEditor);
            end;
          end else begin
            for ii:=0 to cmd.p_fnames.Count-1 do begin
              fmMain.OpenFileFromCommandLine(cmd.p_fnames[ii]);
              editors.Add(fmMain.ActiveEditor);
            end;
          end;
        end;
      cmdPrjFile:
        begin
          editors.Free;
          fmMain.OpenProjectFile(cmd.p_fname);
          editors:=fmMain.PrjManager.GetOpenFilesWindows;
        end;
      cmdPrintFile:
        begin
          editors.Clear;
          for ii:=0 to cmd.p_fnames.Count-1 do
            if (Length(cmd.p_fnames[ii])>0) then
              fmMain.OpenPrintAndCloseFile(cmd.p_fnames[ii]);
        end;
      cmdCursorPos:
        for ii:=0 to editors.Count-1 do
          with TfmEditor(editors[ii]) do begin
            memo.LeftChar:=0;
            SetCursorPos(cmd.p_int1, cmd.p_int2);
            SetCurrentLineAtCenter;
          end;
      cmdRunMacro:
        for ii:=0 to editors.Count-1 do
          fmMain.Macros.PlaybyName(TfmEditor(editors[ii]), cmd.p_str);
      cmdReadOnly:
        for ii:=0 to editors.Count-1 do
          TfmEditor(editors[ii]).Locked:=TRUE;
      cmdSaveFile:
        for ii:=0 to editors.Count-1 do
          TfmEditor(editors[ii]).Save;
      cmdCloseFile:
        begin
          for ii:=0 to editors.Count-1 do
            TfmEditor(editors[ii]).Close;
          editors.Clear;
        end;
      cmdExit:
        begin
          PostMessage(fmMain.Handle, WM_CLOSE, 0, 0);
        end;
    end;

    print_only:=print_only and (cmd.cmd=cmdPrintFile);
  end;

  if locked then
    fmMain.UnlockPainting(FALSE);

  if (Cmds.Count>0) and print_only and (fmMain.MDIChildCount=0) then
    PostMessage(fmMain.Handle, WM_CLOSE, 0, 0);

  editors.Free;
end;
//------------------------------------------------------------------------------------------
end.

