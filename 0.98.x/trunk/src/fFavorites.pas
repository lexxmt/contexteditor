// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFavorites;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ImgList, ComCtrls, uCommon, Registry, IniFiles,
  uCommonClass, TB2Item, TBX, TB2Dock, TB2Toolbar, Menus;

type
  TDirectoryChangeEvent = procedure(Sender:TObject; NewDir:string) of object; 

  TfmFavorites = class(TForm)
    lv: TListView;
    acFileExpl: TActionList;
    acAdd: TAction;
    acRemove: TAction;
    acOpen: TAction;
    acShowPath: TAction;
    acMoveUp: TAction;
    acMoveDown: TAction;
    acAddCurrent: TAction;
    acAddAll: TAction;
    TBXDock1: TTBXDock;
    TBXToolbar1: TTBXToolbar;
    TBXPopupMenu1: TTBXPopupMenu;
    TBItemContainer1: TTBItemContainer;
    TBXSubmenuItem1: TTBXSubmenuItem;
    TBXItem5: TTBXItem;
    TBXItem4: TTBXItem;
    TBXItem2: TTBXItem;
    TBXItem3: TTBXItem;
    TBXItem1: TTBXItem;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBXItem7: TTBXItem;
    TBXItem6: TTBXItem;
    TBXSeparatorItem2: TTBXSeparatorItem;
    TBXItem8: TTBXItem;
    procedure acAddExecute(Sender: TObject);
    procedure acRemoveExecute(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acShowPathExecute(Sender: TObject);
    procedure acFileExplUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure lvDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure lvStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure acMoveUpExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
    procedure acAddCurrentExecute(Sender: TObject);
    procedure acAddAllExecute(Sender: TObject);
  private
    FPathVisible       :boolean;
    fChanged           :boolean;
    fConfigLoaded      :boolean;
    FOnDirectoryChange :TDirectoryChangeEvent;

    procedure LoadFavorites;
    procedure SaveFavorites;

    procedure AddFile(fname:string; const Position:integer = -1);
    function  RemoveFile(n:integer):boolean;
    procedure SelectItem(n:integer);
    procedure SetPathVisible(Value:boolean);

    procedure LoadConfig;
    procedure SaveConfig;

    property  PathVisible :boolean read FPathVisible write SetPathVisible;
  public
    property OnDirectoryChange :TDirectoryChangeEvent read FOnDirectoryChange write FOnDirectoryChange;
  end;

implementation

uses
  uMultiLanguage, fMain, fFilePane, fEditor;

{$R *.DFM}

const
  FAVORITES_SECTION = 'ConTEXT Favorites';
  FAVORITES_FNAME   = 'Favorites.ini';


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure CopyItemProperties(Src, Dest :TListItem);
begin
  Dest.Caption:=Src.Caption;
  Dest.ImageIndex:=Src.ImageIndex;
  Dest.StateIndex:=Src.StateIndex;
  Dest.Data:=Src.Data;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFavorites.SetPathVisible(Value:boolean);
var
  i   :integer;
  rec :TFileData;
begin
  if (FPathVisible<>Value) then begin
    FPathVisible:=Value;

    for i:=0 to lv.Items.Count-1 do begin
      rec:=TFileData(lv.Items[i].Data);
      if not Value then
        lv.Items[i].Caption:=ExtractFileName(rec.FileName)
      else
        lv.Items[i].Caption:=rec.FileName;
    end;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                      Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFavorites.LoadConfig;
var
  reg :TRegistry;
begin
  if fConfigLoaded then EXIT;

  LoadFavorites;

  reg:=TRegistry.Create;
  try
    with reg do begin
      OpenKey(CONTEXT_REG_KEY+'FileExplorer',TRUE);
      PathVisible:=ReadRegistryBool(reg,'FavShowPath',TRUE);
    end;
  finally
    reg.Free;
  end;

  fConfigLoaded:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.SaveConfig;
begin
  SaveFavorites;

  with TRegistry.Create do begin
    OpenKey(CONTEXT_REG_KEY+'FileExplorer',TRUE);
    WriteBool('FavShowPath',PathVisible);
    Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.LoadFavorites;
var
  iniF          :TIniFile;
  i             :integer;
  s             :string;
begin
  lv.Items.BeginUpdate;
  lv.Items.Clear;

  iniF:=TIniFile.Create(ApplicationDir+FAVORITES_FNAME);

  try
    with iniF do begin
      i:=0;
      s:='';
      repeat
        s:=ReadString(FAVORITES_SECTION,'File'+IntToStr(i),'');
        AddFile(s);
        inc(i);
      until (Length(s)=0);
    end;
  finally
    iniF.Free;
    lv.Items.EndUpdate;
  end;

  fChanged:=FALSE;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.SaveFavorites;
var
  iniF :TIniFile;
  i    :integer;
begin
  if not fChanged then EXIT;

  DeleteFile(ApplicationDir+FAVORITES_FNAME);

  iniF:=TIniFile.Create(ApplicationDir+FAVORITES_FNAME);

  try
    with iniF do begin
      for i:=0 to lv.Items.Count-1 do
        WriteString(FAVORITES_SECTION,'File'+IntToStr(i),TFileData(lv.Items[i].Data).FileName);
    end;
  finally
    iniF.Free;
  end;

  fChanged:=FALSE;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.AddFile(fname:string; const Position:integer = -1);
var
  s        :string;
  i        :integer;
  rec      :TFileData;
  attr     :integer;
  Item     :TListItem;
begin
  if (Length(fname)=0) then EXIT;

  i:=0; s:=UpperCase(fname);
  while (i<lv.Items.Count) do begin
    if (s=UpperCase(TFileData(lv.Items[i].Data).FileName)) then
      EXIT;
    inc(i);
  end;

  attr:=FileGetAttr(fname);

  if (attr<>-1) then begin
    rec:=TFileData.Create(fname);

    if (Position=-1) then
      Item:=lv.Items.Add
    else begin
      Item:=lv.Items.Insert(Position);
    end;

    with Item do begin
      if PathVisible then
        Caption:=rec.FileName
      else
        Caption:=ExtractFileName(rec.FileName);
      ImageIndex:=rec.IconIndex;
      Data:=rec;
    end;

    fChanged:=TRUE;
  end;
end;
//------------------------------------------------------------------------------------------
function TfmFavorites.RemoveFile(n:integer):boolean;
begin
  result:=n<lv.Items.Count;
  if not result then EXIT;

  if Assigned(lv.Items[n].Data) then
    TFileData(lv.Items[n].Data).Free;

  lv.Items.Delete(n);

  fChanged:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.SelectItem(n:integer);
begin
  if (n<0) then n:=0;
  if n>lv.Items.Count-1 then
    n:=lv.Items.Count-1;

  if n=-1 then EXIT;
  lv.Selected:=lv.Items[n];
  lv.ItemFocused:=lv.Items[n];
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                       Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acFileExplUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  acRemove.Enabled:=lv.SelCount>0;
  acOpen.Enabled:=lv.SelCount>0;
  acMoveUp.Enabled:=Assigned(lv.Selected) and (lv.Selected.Index>0);
  acMoveDown.Enabled:=Assigned(lv.Selected) and (lv.Selected.Index<lv.Items.Count-1);
  acAddCurrent.Enabled:=fmMain.ActiveEditor<>nil;
  acAddAll.Enabled:=fmMain.ActiveEditor<>nil;
  acShowPath.Checked:=fPathVisible;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acAddExecute(Sender: TObject);
var
  dlg :TOpenDialog;
  i   :integer;
begin
  dlg:=fmMain.CreateOpenDialog(FALSE);

  try
    if dlg.Execute then begin
      for i:=0 to dlg.Files.Count-1 do
        AddFile(dlg.Files[i]);
    end;
  finally
    dlg.Free;
    lv.SetFocus;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acAddCurrentExecute(Sender: TObject);
var
  ed :TfmEditor;
begin
  ed:=fmMain.ActiveEditor;
  if Assigned(ed) and not ed.Unnamed then
    AddFile(ed.FileName);
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acAddAllExecute(Sender: TObject);
var
  ed :TfmEditor;
  n  :integer;
begin
  n:=0;
  while fmMain.Enum(ed, n) do
    if not ed.Unnamed then
      AddFile(ed.FileName);
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acRemoveExecute(Sender: TObject);
var
  i :integer;
  n :integer;
begin
  lv.Items.BeginUpdate;

  n:=0; i:=0;
  while (i<lv.Items.Count) do begin
    if (lv.Items[i].Selected) then begin
      RemoveFile(i);
      n:=i;
    end else
      inc(i);
  end;

  lv.Items.EndUpdate;
  SelectItem(n);
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acOpenExecute(Sender: TObject);
var
  i   :integer;
  str :TStringList;
  rec :TFileData;
begin
  str:=TStringList.Create;

  try
    for i:=0 to lv.Items.Count-1 do
      if (lv.Items[i].Selected) then begin
        rec:=TFileData(lv.Items[i].Data);
        if Assigned(rec) then begin
          if rec.IsDirectory then begin
            if Assigned(FOnDirectoryChange) then
              FOnDirectoryChange(SELF, rec.FileName);
            EXIT;
          end else
            str.Add(rec.FileName);
        end;
      end;
    fmMain.OpenMultipleFiles(str);
  finally
    str.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acShowPathExecute(Sender: TObject);
begin
  PathVisible:=not PathVisible;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acMoveUpExecute(Sender: TObject);
var
  item         :TListItem;
  item1, item2 :TListItem;
  i            :integer;
begin
  if not acMoveUp.Enabled then EXIT;

  item:=TListItem.Create(lv.Items);
  item1:=lv.Items[lv.Selected.Index-1];
  item2:=lv.Selected;

  CopyItemProperties(item1, item);
  CopyItemProperties(item2, item1);
  CopyItemProperties(item, item2);

  for i:=0 to lv.Items.Count-1 do
    lv.Items[i].Selected:=FALSE;

  lv.Selected:=item1;
  lv.ItemFocused:=item1;
  item1.MakeVisible(FALSE);
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.acMoveDownExecute(Sender: TObject);
var
  item         :TListItem;
  item1, item2 :TListItem;
  i            :integer;
begin
  if not acMoveDown.Enabled then EXIT;

  item:=TListItem.Create(lv.Items);
  item1:=lv.Items[lv.Selected.Index+1];
  item2:=lv.Selected;

  CopyItemProperties(item1, item);
  CopyItemProperties(item2, item1);
  CopyItemProperties(item, item2);

  for i:=0 to lv.Items.Count-1 do
    lv.Items[i].Selected:=FALSE;

  lv.Selected:=item1;
  lv.ItemFocused:=item1;
  item1.MakeVisible(FALSE);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Drag'n'drop
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFavorites.lvStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
  str :TStringList;
  rec :TFileData;
  i   :integer;
begin
  with lv do begin
    if (SelCount>1) then
      DragCursor:=crMultiDrag
    else
      DragCursor:=crDrag;
  end;

  str:=TStringList.Create;
  for i:=0 to lv.Items.Count-1 do
    if lv.Items[i].Selected then begin
      rec:=TFileData(lv.Items[i].Data);
      if not rec.IsDirectory then
        str.Add(rec.FileName);
    end;

  TFilePanelDragFiles.Create(fmMain.FilePanel, lv, str);
  str.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.lvDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=Assigned(fmMain.FilePanel.DragFiles);
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.lvDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  ItemUnderCursor   :TListItem;
  i                 :integer;
begin
  ItemUnderCursor:=(Sender as TListView).GetItemAt(X,Y);

  if Assigned(fmMain.FilePanel.DragFiles) then begin

    for i:=0 to fmMain.FilePanel.DragFiles.FileList.Count-1 do
    if Assigned(ItemUnderCursor) then
      AddFile(fmMain.FilePanel.DragFiles.FileList[i], ItemUnderCursor.Index)
    else
      AddFile(fmMain.FilePanel.DragFiles.FileList[i]);

    lv.Arrange(arSnapToGrid);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFavorites.FormCreate(Sender: TObject);
begin
  lv.SmallImages:=fmMain.FileIconPool.ImageList;

  LoadConfig;

  acAdd.Hint:=mlStr(ML_EXPL_HINT_ADD,'Add files to favorites');
  acAddCurrent.Hint:=mlStr(ML_PRJFILES_HINT_ADD_CURRENT,'Add current editing file to list');
  acAddAll.Hint:=mlStr(ML_PRJFILES_HINT_ADD_ALL,'Add all open files to list');
  acRemove.Hint:=mlStr(ML_PRJFILES_HINT_REMOVE,'Remove selected file from list');
  acOpen.Hint:=mlStr(ML_EXPL_HINT_OPEN,'Open selected files');
  acShowPath.Hint:=mlStr(ML_EXPL_HINT_TOGGLEPATH,'Toggle show/hide path');
  acMoveUp.Hint:=mlStr(ML_EXPL_HINT_MOVEUP,'Move item up');
  acMoveDown.Hint:=mlStr(ML_EXPL_HINT_MOVEDOWN,'Move item down');

  acAdd.Caption:=mlStr(ML_FAV_ADD,'&Add');
  acAddCurrent.Caption:=mlStr(ML_PRJFILES_CAPT_ADD_CURRENT,'Add &Current File');
  acAddAll.Caption:=mlStr(ML_PRJFILES_CAPT_ADD_ALL,'A&dd All Files');
  acRemove.Caption:=mlStr(ML_FAV_REMOVE,'&Remove');
  acOpen.Caption:=mlStr(ML_FAV_OPEN,'&Open');
  acShowPath.Caption:=mlStr(ML_FAV_SHOW_PATH,'&Show Path');
  acMoveUp.Caption:=mlStr(ML_FAV_MOVE_UP,'Move &Up');
  acMoveDown.Caption:=mlStr(ML_FAV_MOVE_DOWN,'Move &Down');
end;
//------------------------------------------------------------------------------------------
procedure TfmFavorites.FormDestroy(Sender: TObject);
begin
  SaveConfig;
end;
//------------------------------------------------------------------------------------------

end.

