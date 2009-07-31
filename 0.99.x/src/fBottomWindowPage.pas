// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fBottomWindowPage;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, TB2Item, SpTBXItem, Menus, uMultiLanguage;

type
  TfmBottomWindowPage = class(TForm)
    alDefault: TActionList;
    acJumpToLine: TAction;
    acCopyToClipboard: TAction;
    acCopyLineToClipboard: TAction;
    acClear: TAction;
    acClose: TAction;
    popDefault: TSpTBXPopupMenu;
    TBXItem5: TSpTBXItem;
    TBXSeparatorItem1: TSpTBXSeparatorItem;
    TBXItem4: TSpTBXItem;
    TBXItem3: TSpTBXItem;
    TBXItem2: TSpTBXItem;
    TBXSeparatorItem2: TSpTBXSeparatorItem;
    TBXItem1: TSpTBXItem;
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acJumpToLineExecute(Sender: TObject);
    procedure acCopyToClipboardExecute(Sender: TObject);
    procedure acCopyLineToClipboardExecute(Sender: TObject);
    procedure acClearExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure alDefaultUpdate(Action: TBasicAction; var Handled: Boolean);
  private
  protected
    procedure LoadSettings; virtual;
    procedure SaveSettings; virtual;

    procedure JumpToLineInSource; virtual; abstract;
    procedure CopySelectedLineToClipboard; virtual; abstract;
    procedure CopyAllToClipboard; virtual; abstract;
    procedure ClearContents; virtual; abstract;
    procedure CloseWindow; virtual;

    function JumpToLineInSourceEnabled:boolean; virtual;
    function CopySelectedLineToClipboardEnabled:boolean; virtual;
    function CopyAllToClipboardEnabled:boolean; virtual;
    function ClearContentsEnabled:boolean; virtual;
  public
    class function GetDefaultCaption:string; virtual; abstract;
  end;

  TfmBottomWindowPageClass = class of TfmBottomWindowPage;

implementation

{$R *.dfm}

uses
  fMain;

////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.LoadSettings;
begin
  // virtual holder
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.SaveSettings;
begin
  // virtual holder
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.CloseWindow;
begin
  fmMain.BottomWindowVisible:=FALSE;

  if (Assigned(fmMain.ActiveEditor)) then begin
    SendMessage(fmMain.Handle, WM_SETFOCUS, 0, 0);
    fmMain.ActiveEditor.SetFocusToEditor;
  end;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowPage.ClearContentsEnabled:boolean;
begin
  result:=FALSE;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowPage.CopyAllToClipboardEnabled:boolean;
begin
  result:=FALSE;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowPage.CopySelectedLineToClipboardEnabled:boolean;
begin
  result:=FALSE;
end;
//------------------------------------------------------------------------------------------
function TfmBottomWindowPage.JumpToLineInSourceEnabled:boolean;
begin
  result:=FALSE;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.alDefaultUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  acJumpToLine.Enabled:=JumpToLineInSourceEnabled;
  acCopyToClipboard.Enabled:=CopyAllToClipboardEnabled;
  acCopyLineToClipboard.Enabled:=CopySelectedLineToClipboardEnabled;
  acClear.Enabled:=ClearContentsEnabled;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.acClearExecute(Sender: TObject);
begin
  ClearContents;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.acCloseExecute(Sender: TObject);
begin
  CloseWindow;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.acCopyLineToClipboardExecute(Sender: TObject);
begin
  CopySelectedLineToClipboard;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.acCopyToClipboardExecute(Sender: TObject);
begin
  CopyAllToClipboard;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.acJumpToLineExecute(Sender: TObject);
begin
  JumpToLineInSource;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.FormCreate(Sender: TObject);
begin
  LoadSettings;
  Caption:=GetDefaultCaption;

  acJumpToLine.Caption:=mlStr(ML_EXEC_POP_COMPILER_JUMP_TO_LINE, acJumpToLine.Caption);
  acCopyToClipboard.Caption:=mlStr(ML_EXEC_POP_COPY, acCopyToClipboard.Caption);
  acCopyLineToClipboard.Caption:=mlStr(ML_EXEC_POP_COPY_LINE, acCopyLineToClipboard.Caption);
  acClear.Caption:=mlStr(ML_EXEC_POP_CLEAR, acClear.Caption);
  acClose.Caption:=mlStr(ML_EXEC_POP_HIDE, acClose.Caption);
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.FormActivate(Sender: TObject);
begin
  alDefault.State := asNormal;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.FormDeactivate(Sender: TObject);
begin
  alDefault.State := asSuspended;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowPage.FormDestroy(Sender: TObject);
begin
  SaveSettings;
end;
//------------------------------------------------------------------------------------------


end.
