// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uHTMLTidy;

interface

{$I ConTEXT.inc}

{$IFDEF SUPPORTS_HTML_TIDY}

uses
  Classes, SysUtils, uCommon, Dialogs,
  TidyLib, TidyGlobal, TidyEnums, TidyOpaqueTypes, TidyConfigurationOptions,
  JclFileUtils;

type
  THTMLTidy = class;
  
  TTidyProfile = class
  private
    fTidy: THTMLTidy;
    fConfiguration: TTidyConfiguration;
    fFileName: string;
    function GetConfiguration: TTidyConfiguration;
  public
    constructor Create(Tidy: THTMLTidy);
    destructor Destroy; override;
    property Configuration: TTidyConfiguration read GetConfiguration;
    property FileName: string read fFileName;
  end;


  THTMLTidy = class
  private
    fInitSuccessful: boolean;
    fTidy: TLibTidy;
    fEnabled: boolean;
    function IsTidyLibAvailable: boolean;
    function Init: boolean;
    function GetProfile: TTidyConfiguration;
  public
    constructor Create;
    destructor Destroy; override;
    function LoadFromFile(FileName: string): boolean;
    function SaveToFile(FileName: string): boolean;
    procedure SetDefaults;
    function ProfileFileList: TStringList;
    function ProfileList: TStringList;
    property Enabled: boolean read fEnabled;
    property Profile: TTidyConfiguration read GetProfile;
  end;

var
  HTMLTidy: THTMLTidy;

const
  STR_TIDY_ENCODING_ID: array[Low(TidyEncodingID)..High(TidyEncodingID)] of string =
    ('Raw', 'ASCII', 'Latin1', 'UTF8', 'ISO2022', 'MacRoman', 'Win1252',  'UTF16le',
     'UTF16be',  'UTF16', 'Big5', 'ShiftJIS');

  STR_TIDY_DUP_ATTR_MODES: array[Low(TidyDupAttrModes)..High(TidyDupAttrModes)] of string =
    ('Keep first', 'Keep last');

  STR_TIDY_TRISTATE: array[Low(TTidyTriState)..High(TTidyTriState)] of string =
    ('No', 'Yes', 'Auto');

function MakeProfileFilename(Name: string): string;

{$ENDIF}

implementation

{$IFDEF SUPPORTS_HTML_TIDY}

const
  TIDY_LIB_FILENAME = 'libtidy.dll';
  TIDY_DIRECTORY = 'Tidy\';
  PROFILE_EXT = '.tidy';


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function MakeProfileFilename(Name: string): string;
begin
  result:=Format('%s%s%s%s', [ApplicationDir, TIDY_DIRECTORY, Name, PROFILE_EXT]);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   TTidyProfile
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TTidyProfile.Create(Tidy: THTMLTidy);
begin
  fTidy:=Tidy;
end;
//------------------------------------------------------------------------------------------
destructor TTidyProfile.Destroy;
begin
  if Assigned(fConfiguration) then
    FreeAndNil(fConfiguration);

  inherited;
end;
//------------------------------------------------------------------------------------------
function TTidyProfile.GetConfiguration: TTidyConfiguration;
begin
  if not Assigned(fConfiguration) then begin
    fConfiguration:=TTidyConfiguration.Create;
    fTidy.Init;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function THTMLTidy.GetProfile: TTidyConfiguration;
begin
  if Init then
    result:=fTidy.Configuration
  else
    result:=nil;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function THTMLTidy.Init: boolean;
begin
  if (_GlobalTidyLibHandle=0) then
    fInitSuccessful:=TidyGlobal.LoadTidyLibrary('libtidy.dll');

  if not Assigned(fTidy) then begin
    fTidy:=TLibTidy.Create(nil);
    with fTidy do begin
    end;
  end;

  result:=fInitSuccessful;
end;
//------------------------------------------------------------------------------------------
function THTMLTidy.IsTidyLibAvailable: boolean;
begin
  result:=FileExists(ApplicationDir+TIDY_LIB_FILENAME);
end;
//------------------------------------------------------------------------------------------
function THTMLTidy.LoadFromFile(FileName: string): boolean;
begin
  result:=Init and FileExists(FileName) and fTidy.LoadConfigFile(FileName);
end;
//------------------------------------------------------------------------------------------
function THTMLTidy.SaveToFile(FileName: string): boolean;
begin
  ForceDirectories(ApplicationDir+TIDY_DIRECTORY);
  result:=Init and fTidy.SaveConfigFile(FileName);
end;
//------------------------------------------------------------------------------------------
procedure THTMLTidy.SetDefaults;
begin
  if Init then
    fTidy.ResetConfig;
end;
//------------------------------------------------------------------------------------------
function THTMLTidy.ProfileFileList: TStringList;
begin
  result:=TStringList.Create;
  AdvBuildFileList(ApplicationDir+TIDY_DIRECTORY+'*'+PROFILE_EXT, faAnyFile, result, amAny, [flFullNames]);
end;
//------------------------------------------------------------------------------------------
function THTMLTidy.ProfileList: TStringList;
var
  i: integer;
begin
  result:=ProfileFileList;
  for i:=0 to result.Count-1 do
    result[i]:=PathExtractFileNameNoExt(result[i]);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor THTMLTidy.Create;
begin
  fEnabled:=IsTidyLibAvailable;
end;
//------------------------------------------------------------------------------------------
destructor THTMLTidy.Destroy;
begin
  if Assigned(fTidy) then
    FreeAndNil(fTidy);

  inherited;
end;
//------------------------------------------------------------------------------------------


initialization

finalization
  if Assigned(HTMLTidy) then
    FreeAndNil(HTMLTidy);

{$ENDIF}

end.
