// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uEnvOptions;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, uCommon, uSafeRegistry, SynHighlighterSQL;

type
  TEnvOptions = class
  private
    fShiftClickClosesFileTab: boolean;
    fRememberLastDir: boolean;
    fDetectFileChanges: boolean;
    fBackupFile: boolean;
    fMinimizeIfNoFiles: boolean;
    fBackupDOSFileName: boolean;
    fAutoUpdateChangedFiles: boolean;
    fRememberFindCfg: boolean;
    fMultipleInstances: boolean;
    fMinimizeToTray: boolean;
    fLastDir: string;
    fBackupDir: string;
    fStartAction: TStartAction;
    fSQLDialect: TSQLDialect;
    procedure SetModified(const Value: boolean);
    procedure LoadSettings;
    procedure SaveSettings;
    procedure SaveCurrentSettings;
  public
    constructor Create;
    destructor Destroy; override;
    property Modified: boolean write SetModified;

    // global
    property ShiftClickClosesFileTab: boolean read fShiftClickClosesFileTab write fShiftClickClosesFileTab;

    // general
    property BackupFile: boolean read fBackupFile write fBackupFile;
    property BackupDir: string read fBackupDir write fBackupDir;
    property BackupDOSFileName: boolean read fBackupDOSFileName write fBackupDOSFileName;
    property DetectFileChanges: boolean read fDetectFileChanges write fDetectFileChanges;
    property AutoUpdateChangedFiles: boolean read fAutoUpdateChangedFiles write fAutoUpdateChangedFiles;
    property MinimizeIfNoFiles: boolean read fMinimizeIfNoFiles write fMinimizeIfNoFiles;
    property MinimizeToTray: boolean read fMinimizeToTray write fMinimizeToTray;
    property StartAction: TStartAction read fStartAction write fStartAction;
    property RememberLastDir: boolean read fRememberLastDir write fRememberLastDir;
    property RememberFindCfg: boolean read fRememberFindCfg write fRememberFindCfg;
    property LastDir: string read fLastDir write fLastDir;
    property MultipleInstances: boolean read fMultipleInstances write fMultipleInstances;

    // misc
    property SQLDialect: TSQLDialect read fSQLDialect write fSQLDialect;
  end;

var
  EnvOptions: TEnvOptions;


implementation


////////////////////////////////////////////////////////////////////////////////////////////
//                                  TEnvOptions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TEnvOptions.Create;
begin
  LoadSettings;
end;
//------------------------------------------------------------------------------------------
destructor TEnvOptions.Destroy;
begin
  SaveCurrentSettings;
  inherited;
end;
//------------------------------------------------------------------------------------------
procedure TEnvOptions.LoadSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+'Global\', TRUE) then begin
        ShiftClickClosesFileTab:=ReadBool('ShiftClickClosesFileTab', TRUE);
      end;

      if OpenKey(CONTEXT_REG_KEY+'General\', TRUE) then begin
        BackupFile:=ReadBool('Backup', TRUE);
        BackupDir:=ReadString('BackupDir', ApplicationDir+'Backup');
        BackupDOSFileName:=ReadBool('BackupDOSFileName', FALSE);
        DetectFileChanges:=ReadBool('DetectFileChanges', TRUE);
        AutoUpdateChangedFiles:=ReadBool('AutoUpdateChangedFiles', FALSE);
        MinimizeIfNoFiles:=ReadBool('MinimizeIfNoFiles', FALSE);
        MinimizeToTray:=ReadBool('MinimizeToTray', FALSE);
        StartAction:=TStartAction(ReadInteger('StartAction', ord(saNone)));
        RememberLastDir:=ReadBool('RememberLastDir', TRUE);
        RememberFindCfg:=ReadBool('RememberFindCfg', FALSE);
        LastDir:=ReadString('LastDir', '');
        MultipleInstances:=ReadBool('MultipleInstances', FALSE);
      end;

      if OpenKey(CONTEXT_REG_KEY+'Misc\', TRUE) then begin
        SQLDialect:=TSQLDialect(ReadInteger('SQLDialect', ord(sqlStandard)));
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TEnvOptions.SaveSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+'Global\', TRUE) then begin
        WriteBool('ShiftClickClosesFileTab', fShiftClickClosesFileTab);
      end;

      if OpenKey(CONTEXT_REG_KEY+'General\', TRUE) then begin
        WriteBool('Backup', fBackupFile);
        WriteString('BackupDir', fBackupDir);
        WriteBool('BackupDOSFileName', fBackupDOSFileName);
        WriteBool('DetectFileChanges', fDetectFileChanges);
        WriteBool('AutoUpdateChangedFiles', fAutoUpdateChangedFiles);
        WriteBool('MinimizeIfNoFiles', fMinimizeIfNoFiles);
        WriteBool('MinimizeToTray', fMinimizeToTray);
        WriteInteger('StartAction', ord(fStartAction));
        WriteBool('RememberLastDir', fRememberLastDir);
        WriteBool('RememberFindCfg', fRememberFindCfg);
        WriteBool('MultipleInstances', fMultipleInstances);
      end;

      if OpenKey(CONTEXT_REG_KEY+'Misc\', TRUE) then begin
        WriteInteger('SQLDialect', ord(fSQLDialect));
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TEnvOptions.SaveCurrentSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+'General\', TRUE) then begin
        WriteString('LastDir', fLastDir);
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TEnvOptions.SetModified(const Value: boolean);
begin
  if Value then
    SaveSettings;
end;
//------------------------------------------------------------------------------------------

initialization
  ApplicationDir:=ExtractFilePath(ParamStr(0));
  EnvOptions:=TEnvOptions.Create;

finalization
  FreeAndNil(EnvOptions);

end.
