// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fProjectFiles;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, Menus, ActnList, uMultiLanguage, DirLabel,
  StdCtrls, ExtCtrls, uProject, uCommon, JclFileUtils, uCommonClass, fEditor,
  TB2Item, SpTBXItem, TB2Dock, TB2Toolbar;

type
  TfrmProjectFiles = class(TForm)
    acFileExpl: TActionList;
    acAdd: TAction;
    acAddCurrent: TAction;
    acAddAllFiles: TAction;
    acMoveUp: TAction;
    acMoveDown: TAction;
    acOpen: TAction;
    acClose: TAction;
    acRemove: TAction;
    acShowRelative: TAction;
    pnRelativePath: TPanel;
    Label1: TLabel;
    labDir: TDirLabel;
    acSetMakeFile: TAction;
    Panel1: TPanel;
    labProjectName: TDirLabel;
    lv: TListView;
    TBXDock1: TSpTBXDock;
    TBXToolbar1: TSpTBXToolbar;
    TBItemContainer1: TTBItemContainer;
    TBXSubmenuItem1: TSpTBXSubmenuItem;
    TBXItem1: TSpTBXItem;
    TBXItem2: TSpTBXItem;
    TBXItem3: TSpTBXItem;
    TBXSeparatorItem1: TSpTBXSeparatorItem;
    TBXItem4: TSpTBXItem;
    TBXItem5: TSpTBXItem;
    TBXItem6: TSpTBXItem;
    TBXItem7: TSpTBXItem;
    TBXSeparatorItem2: TSpTBXSeparatorItem;
    TBXItem8: TSpTBXItem;
    TBXItem9: TSpTBXItem;
    TBXSeparatorItem3: TSpTBXSeparatorItem;
    TBXItem10: TSpTBXItem;
    TBXPopupMenu1: TSpTBXPopupMenu;
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acFileExplUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acAddCurrentExecute(Sender: TObject);
    procedure acAddAllFilesExecute(Sender: TObject);
    procedure acMoveUpExecute(Sender: TObject);
    procedure acMoveDownExecute(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRemoveExecute(Sender: TObject);
    procedure acShowRelativeExecute(Sender: TObject);
    procedure acSetMakeFileExecute(Sender: TObject);
    procedure lvCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure lvDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    FRelativePath: boolean;
    FProject      :TProjectManager;

    function  GetSelectedFile:TPrjFileData;
    procedure SetRelativePath(Value: boolean);
    function  GetFileName(rec:TPrjFileData):string;
    function  InsertFileToList(Index:integer; rec:TPrjFileData):TListItem;
    function  AddFileToList(rec:TPrjFileData):TListItem;
    procedure AddEditorToList(ed:TfmEditor);
    function  FileOpenInEditor(rec:TPrjFileData):boolean;
    procedure SelectItem(n:integer);
    function  FileExistInList(fname:string):boolean;

    procedure OnProjectChangeName(Sender:TObject; NewFileName:string);

    procedure ProjectToForm;
    procedure ClearList;
    procedure DeselectAll;

    procedure SetProject(Value: TProjectManager);

    property SelectedFile  :TPrjFileData read GetSelectedFile;
    property RelativePath  :boolean read FRelativePath write SetRelativePath;
  public
    procedure RefreshFileList;
    function  GeTPrjFileDataList:TList;

    property Project       :TProjectManager read FProject write SetProject;
  end;


implementation

uses
  fMain, fFilePane;

{$R *.DFM}



////////////////////////////////////////////////////////////////////////////////////////////
//				   Static functions
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
procedure TfrmProjectFiles.SetProject(Value: TProjectManager);
begin
  FProject:=Value;
  ProjectToForm;

  if Assigned(Project) then begin
    RelativePath:=Project.RelativePath;
    labProjectName.DirName:=' '+Project.FileName;
    labProjectName.Hint:=Project.FileName;
    Project.OnChangeFileName:=OnProjectChangeName;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.SetRelativePath(Value: boolean);
begin
  FRelativePath:=Value;

  if Value then
    labDir.DirName:=' '+ExtractFilePath(Project.FileName);

  pnRelativePath.Visible:=Value;
  Project.RelativePath:=Value;

  RefreshFileList;
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.GetSelectedFile:TPrjFileData;
begin
  if Assigned(lv.Selected) then
    result:=TPrjFileData(lv.Selected.Data)
  else
    result:=nil;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.ClearList;
begin
  with lv.Items do begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.DeselectAll;
var
  i :integer;
begin
  for i:=0 to lv.Items.Count-1 do
    if lv.Items[i].Selected then
      lv.Items[i].Selected:=FALSE;
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.GeTPrjFileDataList:TList;
var
  i  :integer;
  ll :TList;
begin
  ll:=TList.Create;

  for i:=0 to lv.Items.Count-1 do
    ll.Add(lv.Items[i].Data);

  result:=ll;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.ProjectToForm;
var
  i   :integer;
begin
  ClearList;

  if Assigned(Project) then begin
    lv.Items.BeginUpdate;

    for i:=0 to Project.fPrjFiles.Count-1 do begin
      AddFileToList(Project.fPrjFiles[i]);
    end;
    SelectItem(0);

    lv.Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.GetFileName(rec:TPrjFileData):string;
var
  path :string;
begin
  if not RelativePath then
    result:=rec.FileName
  else begin
    path:=LowerCase(ExtractFilePath(Project.FileName));
    if (LowerCase(Copy(rec.FileName,1,Length(path)))=path) then begin
      result:=Copy(rec.FileName,Length(path)+1,255);
    end else
      result:=rec.FileName;
  end;
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.InsertFileToList(Index:integer; rec:TPrjFileData):TListItem;
var
  Item :TListItem;
begin
  if not FileExistInList(rec.FileName) then begin
    Item:=lv.Items.Insert(Index);
    with Item do begin
      Caption:=GetFileName(rec);
      ImageIndex:=rec.IconIndex;
      Data:=rec;
    end;
    lv.Selected:=Item;
  end else
    Item:=nil;

  result:=Item;
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.AddFileToList(rec:TPrjFileData):TListItem;
begin
  result:=InsertFileToList(lv.Items.Count, rec);
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.AddEditorToList(ed:TfmEditor);
var
  rec :TPrjFileData;
begin
  if Assigned(ed) and not (ed.Unnamed) and not FileExistInList(ed.FileName) then begin
    rec:=TPrjFileData.Create(ed.FileName);
    rec.Opened:=TRUE;

    if Assigned(AddFileToList(rec)) then
      Project.Add(rec)
    else
      rec.Free;
  end;
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.FileOpenInEditor(rec:TPrjFileData):boolean;
var
  ed :TfmEditor;
begin
  ed:=fmMain.FindOpenedFile(rec.FileName);
  result:=Assigned(ed);
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.SelectItem(n:integer);
begin
  if (n>lv.Items.Count-1) then
    n:=lv.Items.Count-1;

  if (n<0) then EXIT;

  DeselectAll;

  lv.Selected:=lv.Items[n];
end;
//------------------------------------------------------------------------------------------
function TfrmProjectFiles.FileExistInList(fname:string):boolean;
var
  i   :integer;
  rec :TPrjFileData;
begin
  fname:=UpperCase(fname);
  i:=0; result:=FALSE;
  while (i<lv.Items.Count) do begin
    rec:=TPrjFileData(lv.Items[i].Data);
    if Assigned(rec) and (fname=UpperCase(rec.FileName)) then begin
      result:=TRUE;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.RefreshFileList;
var
  i :integer;
begin
  for i:=0 to lv.Items.Count-1 do begin
    lv.Items[i].Caption:=GetFileName(TPrjFileData(lv.Items[i].Data));
    lv.Items[i].ImageIndex:=TPrjFileData(lv.Items[i].Data).IconIndex;
  end;

  lv.Repaint;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                       Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acFileExplUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  acOpen.Enabled:=Assigned(Project) and Assigned(SelectedFile);
  acClose.Enabled:=Assigned(Project) and Assigned(SelectedFile);
  acRemove.Enabled:=Assigned(Project) and Assigned(SelectedFile);
  acSetMakeFile.Enabled:=Assigned(Project) and Assigned(SelectedFile);
  acAdd.Enabled:=Assigned(Project);
  acAddCurrent.Enabled:=Assigned(Project);
  acAddAllFiles.Enabled:=Assigned(Project);
  acMoveUp.Enabled:=Assigned(Project) and Assigned(SelectedFile) and (lv.Selected.Index>0);
  acMoveDown.Enabled:=Assigned(Project) and Assigned(SelectedFile) and (lv.Selected.Index<lv.Items.Count-1);
  acShowRelative.Enabled:=Assigned(Project);
  acShowRelative.Checked:=fRelativePath;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acAddExecute(Sender: TObject);
var
  dlgOpen :TOpenDialog;
  rec     :TPrjFileData;
  i       :integer;
  locked  :boolean;
begin
  dlgOpen:=TOpenDialog.Create(SELF);

  try
    with dlgOpen do begin
      Filter:='All files (*.*)|*.*';
      Options:=[ofHideReadOnly,ofEnableSizing,ofAllowMultiSelect];
      Title:=acAdd.Hint;

      if Execute and (Files.Count>0) then begin
        DeselectAll;
        locked:=Files.Count>2;
        if locked then fmMain.LockPainting(FALSE);
        lv.Items.BeginUpdate;

        for i:=0 to Files.Count-1 do begin
          rec:=TPrjFileData.Create(GetFileLongName(Files[i]));
          if not Assigned(AddFileToList(rec)) then
            rec.Free
          else
            fProject.Add(rec);

          acOpenExecute(SELF);
        end;

        lv.Items.EndUpdate;
        if locked then fmMain.UnlockPainting(FALSE);
      end;
    end;
  finally
    dlgOpen.Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acAddCurrentExecute(Sender: TObject);
begin
  AddEditorToList(fmMain.ActiveEditor);
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acAddAllFilesExecute(Sender: TObject);
var
  n   :integer;
  ed  :TfmEditor;
begin
  n:=0;
  while fmMain.Enum(ed,n) do
    AddEditorToList(ed);
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acMoveUpExecute(Sender: TObject);
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
procedure TfrmProjectFiles.acMoveDownExecute(Sender: TObject);
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
procedure TfrmProjectFiles.acOpenExecute(Sender: TObject);
var
  rec :TPrjFileData;
begin
  rec:=SelectedFile;
  if not Assigned(rec) then EXIT;

  if Project.OpenProjectFile(rec, fmMain.FindMaximizedForm<>nil) then begin
    BringToFront;

    rec.Opened:=FileOpenInEditor(rec);

    lv.Invalidate;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acCloseExecute(Sender: TObject);
var
  ed  :TfmEditor;
  rec :TPrjFileData;
begin
  rec:=SelectedFile;
  if not Assigned(rec) then EXIT;

  ed:=fmMain.FindOpenedFile(rec.FileName);
  if Assigned(ed) then begin
    rec.Opened:=FALSE;
    ed.Close;
    lv.Invalidate;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acRemoveExecute(Sender: TObject);
var
  n   :integer;
  ed  :TfmEditor;
  rec :TPrjFileData;
  i   :integer;
begin
  if Assigned(lv.Selected) then
    n:=lv.Selected.Index
  else
    n:=0;

  lv.Items.BeginUpdate;
  try
    i:=0;
    while (i<lv.Items.Count) do begin
      if lv.Items[i].Selected then begin
        rec:=TPrjFileData(lv.Items[i].Data);
        if Assigned(rec) then begin
          ed:=fmMain.FindOpenedFile(rec.FileName);
          if Assigned(ed) then
            ed.Close;
          Project.Delete(rec);
        end;
        lv.Items.Delete(i);
      end else
        inc(i);
    end;
  finally
    lv.Items.EndUpdate;
  end;

  SelectItem(n);
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acShowRelativeExecute(Sender: TObject);
begin
  RelativePath:=not RelativePath;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.acSetMakeFileExecute(Sender: TObject);
var
  rec :TPrjFileData;
begin
  rec:=SelectedFile;
  if not Assigned(rec) then EXIT;

  if rec.MakeFile then
    Project.MakeFile:=nil
  else
    Project.MakeFile:=rec;

  RefreshFileList;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                       lv events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.lvCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  rec :TPrjFileData;
begin
  rec:=TPrjFileData(Item.Data);

  if Assigned(rec) then with Sender.Canvas do begin
    if rec.MakeFile then
      Font.Color:=clBlue;

    if rec.Opened then
      Font.Style:=Font.Style+[fsBold];
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.lvStartDrag(Sender: TObject;
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
procedure TfrmProjectFiles.lvDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:=Assigned(fmMain.FilePanel.DragFiles);
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.lvDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  ItemUnderCursor   :TListItem;
  i                 :integer;
  rec               :TPrjFileData;
  Item              :TListItem;
begin
  ItemUnderCursor:=(Sender as TListView).GetItemAt(X,Y);

  if Assigned(fmMain.FilePanel.DragFiles) then begin
    DeselectAll;
    for i:=0 to fmMain.FilePanel.DragFiles.FileList.Count-1 do begin
      rec:=TPrjFileData.Create(fmMain.FilePanel.DragFiles.FileList[i]);

      if Assigned(ItemUnderCursor) then
        Item:=InsertFileToList(ItemUnderCursor.Index, rec)
      else
        Item:=AddFileToList(rec);

      if Assigned(Item) then
        Project.Add(rec)
      else
        rec.Free;
    end;

    lv.Arrange(arSnapToGrid);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                       Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.OnProjectChangeName(Sender: TObject; NewFileName: string);
begin
//  labProjectName.DirName:=NewFileName;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.FormCreate(Sender: TObject);
begin
  lv.SmallImages:=fmMain.FileIconPool.ImageList;

  acAdd.Hint:=mlStr(ML_PRJFILES_HINT_ADD,'Add file to project workspace');
  acAddCurrent.Hint:=mlStr(ML_PRJFILES_HINT_ADD_CURRENT,'Add current editing file to list');
  acAddAllFiles.Hint:=mlStr(ML_PRJFILES_HINT_ADD_ALL,'Add all open files to list');
  acRemove.Hint:=mlStr(ML_PRJFILES_HINT_REMOVE,'Remove selected file from list');
  acOpen.Hint:=mlStr(ML_PRJFILES_HINT_OPEN_FILE,'Open selected file for editing');
  acClose.Hint:=mlStr(ML_PRJFILES_HINT_CLOSE_FILE,'Close selected file');
  acMoveUp.Hint:=mlStr(ML_PRJFILES_HINT_MOVE_UP,'Move selected item up');
  acMoveDown.Hint:=mlStr(ML_PRJFILES_HINT_MOVE_DN,'Move selected item down');
  acShowRelative.Hint:=mlStr(ML_PRJFILES_HINT_RELATIVE_TO,'Toggle relative file paths');
  acSetMakeFile.Hint:=mlStr(ML_PRJFILES_HINT_SET_MAKEFILE,'Set Make file for this project');

  acAdd.Caption:=mlStr(ML_FAV_ADD,'&Add');
  acAddCurrent.Caption:=mlStr(ML_PRJFILES_CAPT_ADD_CURRENT,'Add &Current File');
  acAddAllFiles.Caption:=mlStr(ML_PRJFILES_CAPT_ADD_ALL,'A&dd All Files');
  acRemove.Caption:=mlStr(ML_FAV_REMOVE,'&Remove');
  acOpen.Caption:=mlStr(ML_FAV_OPEN,'&Open');
  acClose.Caption:=mlStr(ML_PRJFILES_CAPT_CLOSE,'&Close');
  acShowRelative.Caption:=mlStr(ML_FAV_SHOW_PATH,'&Show Path');
  acMoveUp.Caption:=mlStr(ML_FAV_MOVE_UP,'Move &Up');
  acMoveDown.Caption:=mlStr(ML_FAV_MOVE_DOWN,'Move &Down');
  acSetMakeFile.Caption:=mlStr(ML_PRJFILES_CAPT_SET_MAKEFILE,'Set &Make File');
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.FormActivate(Sender: TObject);
begin
  acFileExpl.State := asNormal;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.FormDeactivate(Sender: TObject);
begin
  acFileExpl.State := asSuspended;
end;
//------------------------------------------------------------------------------------------
procedure TfrmProjectFiles.FormDestroy(Sender: TObject);
begin
  if Assigned(Project) then
    Project.OnChangeFileName:=nil;
end;
//------------------------------------------------------------------------------------------

end.

