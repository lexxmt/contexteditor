// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit FilesWatch;

interface

{$I ConTEXT.inc}

uses
  Windows, SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Common;

type
  TFilesWatch = class
  private
    files      :TStringList;
    file_times :array[0..15] of integer;

    function CheckFileTime(n:integer):boolean;
  public
    procedure UpdateFileNames(fnames:TStringList);

    function  Check:boolean;
    procedure ResetTimes;
    procedure UpdateTimes;
    function  ReloadDlg:integer;

    constructor Create;
    destructor  Destroy; override;
  end;

implementation

{/////////////////////////////////////////////////////////////////
                  Project files watch functions
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
procedure TFilesWatch.UpdateFileNames(fnames:TStringList);
begin
  ResetTimes;
  files.Clear;
  files.AddStrings(fnames);
end;
{----------------------------------------------------------------}
function TFilesWatch.CheckFileTime(n:integer):boolean;
begin
  result:=(file_times[n]=-1) or (FileAge(files[n])=file_times[n]) or (FileAge(files[n])=-1);
end;
{----------------------------------------------------------------}
function TFilesWatch.Check:boolean;
var
  i  :integer;
  ok :boolean;
begin
  ok:=TRUE;
  i:=0;
  while ok and (i<files.Count) do begin
    ok:=CheckFileTime(i);
    inc(i);
  end;

  result:=ok;
end;
{----------------------------------------------------------------}
procedure TFilesWatch.ResetTimes;
begin
  FillChar(file_times,SizeOf(file_times),-1);
end;
{----------------------------------------------------------------}
procedure TFilesWatch.UpdateTimes;
var
  i  :integer;
begin
  i:=0;
  while (i<files.Count) do begin
    file_times[i]:=FileAge(files[i]);
    inc(i);
  end;
end;
{----------------------------------------------------------------}
function TFilesWatch.ReloadDlg:integer;
begin
//  result:=Msg_Dialog(mlStr(MSG_FILESWATCH_WARNING,'Warning'),
//                     mlStr(MSG_FILESWATCH_CHANGED,'Project files has been changed by some other application. Reload project from disk?'),
//                     BTN_YES+BTN_NO, BTN_YES, icoExclamation);
end;
{----------------------------------------------------------------}


{/////////////////////////////////////////////////////////////////
                     Constructor, Destructor
/////////////////////////////////////////////////////////////////}
{----------------------------------------------------------------}
constructor TFilesWatch.Create;
begin
  files:=TStringList.Create;
  ResetTimes;
end;
{----------------------------------------------------------------}
destructor TFilesWatch.Destroy;
begin
  files.Free;

  inherited Destroy;
end;
{----------------------------------------------------------------}
end.

