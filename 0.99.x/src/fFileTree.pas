// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFileTree;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, uCommon, VirtualTrees,
  VirtualExplorerTree;

type
  TfmFileTree = class(TForm)
    pnTop: TPanel;
    btnClose: TSpeedButton;
    tree: TVirtualExplorerTreeview;
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure treeFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
  private
    fInitDirectory: string;
    fFileListView: TVirtualExplorerListview;
    OldOnApplicationDeactivate: TNotifyEvent;
    OldOnApplicationOnShortcut: TShortCutEvent;
    procedure OnApplicationDeactivate(Sender: TObject);
    procedure OnApplicationShortCut(var Msg: TWMKey; var Handled: Boolean);
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner:TComponent; Directory:string; ListView :TVirtualExplorerListview); reintroduce;
  end;


implementation

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////////////////
//                                   Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileTree.treeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  Close; 
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFileTree.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_FILE_EXPLORER_LOAD_DIR:
      begin
        tree.BrowseTo(fInitDirectory, TRUE, TRUE, TRUE, FALSE);
        tree.VirtualExplorerListview:=fFileListView;
        fFileListView.VirtualExplorerTreeview:=tree;
        tree.OnFocusChanged:=treeFocusChanged;
      end;
    else
      inherited;
  end;
end;
//------------------------------------------------------------------------------------------
constructor TfmFileTree.Create(AOwner:TComponent; Directory:string; ListView :TVirtualExplorerListview);
begin
  inherited Create(AOwner);

  fInitDirectory:=Directory;
  fFileListView:=ListView;

  OldOnApplicationDeactivate:=Application.OnDeactivate;
  OldOnApplicationOnShortcut:=Application.OnShortCut;

  Application.OnDeactivate:=OnApplicationDeactivate;
  Application.OnShortCut:=OnApplicationShortCut;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileTree.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_FILE_EXPLORER_LOAD_DIR, 0, 0);
end;
//------------------------------------------------------------------------------------------
procedure TfmFileTree.OnApplicationShortCut(var Msg: TWMKey; var Handled: Boolean);
var
  ss: TShiftState;
begin
  case TranslateShortcut(Msg, ss) of
    VK_ESCAPE:
      begin
        Close;
        Handled:=TRUE;
      end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileTree.OnApplicationDeactivate(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileTree.FormDeactivate(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmFileTree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fFileListView.VirtualExplorerTreeview:=nil;
  Action:=caFree;
  Application.OnDeactivate:=OldOnApplicationDeactivate;
  Application.OnShortCut:=OldOnApplicationOnShortcut;
end;
//------------------------------------------------------------------------------------------

end.
