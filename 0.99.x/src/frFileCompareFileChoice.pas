// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit frFileCompareFileChoice;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, fFileCompareSettings, ActnList, fFileCompareResults,
  uMultiLanguage;

type
  TframeFileCompareFileChoice = class(TFrame)
    gbFile: TGroupBox;
    rbEditingFile: TRadioButton;
    rbFileFromDisk: TRadioButton;
    cbFileList: TComboBox;
    eFileName: TEdit;
    btnBrowse: TButton;
    rbCurrentFile: TRadioButton;
    alFileCompareChoice: TActionList;
    acBrowse: TAction;
    procedure acBrowseExecute(Sender: TObject);
    procedure alFileCompareChoiceUpdate(Action: TBasicAction;
      var Handled: Boolean);
  private
    fSelectedFileName: string;
    procedure OpenFilesToForm;
    procedure SetFileSelection(const Value: TFileCompareFileSelection);
    procedure SetFileFromDiskName(const Value: string);
    function GetFileFromDiskName: string;
    function GetFileSelection: TFileCompareFileSelection;
    function GetEditingFileName: string;
    procedure SetEditingFileName(const Value: string);
    function GetSelectedEditor: TObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CreateFileInfo: TFileCompareInfo;

    property FileSelection: TFileCompareFileSelection read GetFileSelection write SetFileSelection;
    property EditingFileName: string read GetEditingFileName write SetEditingFileName;
    property FileFromDiskName: string read GetFileFromDiskName write SetFileFromDiskName;
    property SelectedEditor: TObject read GetSelectedEditor;

    property SelectedFileName: string read fSelectedFileName;
  end;

implementation

{$R *.dfm}

uses
  fMain, fEditor;


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TframeFileCompareFileChoice.GetFileSelection: TFileCompareFileSelection;
begin
  if rbCurrentFile.Checked then
    result:=fsCurrent
  else
    if rbEditingFile.Checked then
      result:=fsEditingFile
    else
      result:=fsFileFromDisk;
end;
//------------------------------------------------------------------------------------------
procedure TframeFileCompareFileChoice.SetFileSelection(const Value: TFileCompareFileSelection);
begin
  case Value of
    fsEditingFile:
      rbEditingFile.Checked:=TRUE;
    fsFileFromDisk:
      rbFileFromDisk.Checked:=TRUE;
    else
      rbCurrentFile.Checked:=TRUE;
  end;
end;
//------------------------------------------------------------------------------------------
function TframeFileCompareFileChoice.GetFileFromDiskName: string;
begin
  result:=eFileName.Text;
end;
//------------------------------------------------------------------------------------------
procedure TframeFileCompareFileChoice.SetFileFromDiskName(const Value: string);
begin
  eFileName.Text:=Value;
end;
//------------------------------------------------------------------------------------------
function TframeFileCompareFileChoice.GetEditingFileName: string;
begin
  if (cbFileList.ItemIndex<>-1) then
    result:=cbFileList.Items[cbFileList.ItemIndex]
  else
    result:='';
end;
//------------------------------------------------------------------------------------------
procedure TframeFileCompareFileChoice.SetEditingFileName(const Value: string);
begin
  cbFileList.ItemIndex:=cbFileList.Items.IndexOf(Value);
end;
//------------------------------------------------------------------------------------------
function TframeFileCompareFileChoice.GetSelectedEditor: TObject;
begin
  if (cbFileList.ItemIndex<>-1) and (FileSelection=fsEditingFile) then
    result:=cbFileList.Items.Objects[cbFileList.ItemIndex]
  else
    result:=nil;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TframeFileCompareFileChoice.OpenFilesToForm;
var
  i: integer;
  ed: TfmEditor;
  str: TStringList;
begin
  str:=fmMain.GetEditorStrList;
  try
    for i:=0 to str.Count-1 do begin
      ed:=TfmEditor(str.Objects[i]);
      cbFileList.Items.AddObject(ed.FileName, ed);
    end;
  finally
    str.Free;
  end;
end;
//------------------------------------------------------------------------------------------
function TframeFileCompareFileChoice.CreateFileInfo: TFileCompareInfo;
var
  editor: TObject;
begin
  fSelectedFileName:='';
  editor:=nil;

  case FileSelection of
    fsCurrent:
      if (fmMain.ActiveEditor<>nil) then begin
        fSelectedFileName:=fmMain.ActiveEditor.FileName;
      end;
    fsEditingFile:
      begin
        fSelectedFileName:=EditingFileName;
        editor:=SelectedEditor;
      end;
    fsFileFromDisk:
      begin
        fSelectedFileName:=FileFromDiskName;
      end;
  end;

  result:=TFileCompareInfo.Create(fSelectedFileName, FileSelection, editor);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TframeFileCompareFileChoice.alFileCompareChoiceUpdate(
  Action: TBasicAction; var Handled: Boolean);
begin
  cbFileList.Enabled:=rbEditingFile.Checked;
  eFileName.Enabled:=rbFileFromDisk.Checked;
  acBrowse.Enabled:=rbFileFromDisk.Checked;
end;
//------------------------------------------------------------------------------------------
procedure TframeFileCompareFileChoice.acBrowseExecute(Sender: TObject);
var
  dlg: TOpenDialog;
begin
  dlg:=fmMain.CreateOpenDialog(FALSE);
  dlg.FileName:=eFileName.Text;
  if dlg.Execute then
    eFileName.Text:=dlg.FileName;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TframeFileCompareFileChoice.Create(AOwner: TComponent);
begin
  inherited;
  mlApplyLanguageToForm(SELF, Name);
  OpenFilesToForm;
end;
//------------------------------------------------------------------------------------------
destructor TframeFileCompareFileChoice.Destroy;
begin
  inherited;
end;
//------------------------------------------------------------------------------------------

end.
