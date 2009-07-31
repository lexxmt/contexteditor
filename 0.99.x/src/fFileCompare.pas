// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFileCompare;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, Registry, uCommon, fFileCompareSettings,
  frFileCompareFileChoice, uMultiLanguage;

type
  TfmFileCompare = class(TForm)
    alFileCompare: TActionList;
    acCompare: TAction;
    acSettings: TAction;
    acCancel: TAction;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    frameFile1: TframeFileCompareFileChoice;
    frameFile2: TframeFileCompareFileChoice;
    procedure acCompareExecute(Sender: TObject);
    procedure acSettingsExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fSettings: TFileCompareSettings;
    procedure SettingsToForm;
    procedure FormToSettings;
  public
    property Settings: TFileCompareSettings read fSettings;
  end;


implementation

{$R *.dfm}

uses
  fMain, fEditor, fFileCompareResults;


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.SettingsToForm;
begin
  with fSettings do begin
    frameFile1.FileSelection:=File1Selection;
    frameFile1.EditingFileName:=File1EditingFileName;
    frameFile1.FileFromDiskName:=File1FromDiskFileName;

    frameFile2.FileSelection:=File2Selection;
    frameFile2.EditingFileName:=File2EditingFileName;
    frameFile2.FileFromDiskName:=File2FromDiskFileName;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.FormToSettings;
begin
  with fSettings do begin
    File1Selection:=frameFile1.FileSelection;
    File1EditingFileName:=frameFile1.EditingFileName;
    File1FromDiskFileName:=frameFile1.FileFromDiskName;

    File2Selection:=frameFile2.FileSelection;
    File2EditingFileName:=frameFile2.EditingFileName;
    File2FromDiskFileName:=frameFile2.FileFromDiskName;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.acCompareExecute(Sender: TObject);
begin
  FormToSettings;

  if not Assigned(fmFileCompareResults) then begin
    fmFileCompareResults:=TfmFileCompareResults.Create(fmMain);
  end;

  fmFileCompareResults.Show;

  fmFileCompareResults.File1Info:=frameFile1.CreateFileInfo;
  fmFileCompareResults.File2Info:=frameFile2.CreateFileInfo;
  fmFileCompareResults.Execute(fSettings);
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.acSettingsExecute(Sender: TObject);
begin
  with TfmFileCompareSettings.Create(SELF, fSettings) do
    try
      ShowModal;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.acCancelExecute(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.FormCreate(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);
  fSettings:=TFileCompareSettings.Create;
  SettingsToForm;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileCompare.FormDestroy(Sender: TObject);
begin
  fSettings.Free;
end;
//------------------------------------------------------------------------------------------

end.
