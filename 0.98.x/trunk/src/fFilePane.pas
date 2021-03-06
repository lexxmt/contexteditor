// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fFilePane;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DirLabel, Tabs, ComCtrls95, ExtCtrls, ComCtrls,
  ImgList, IniFiles, uCommon, ActnList,
  Buttons, Registry, FileCtrl, fFileExplorer, fFavorites, fProjectFiles, JclFileUtils,
  uProject, fEditor, fHistory, uMultiLanguage, Menus, rmTabs3x;

type
  TfmFilePanel = class;
  TFilePanel = (fpNone, fpExplorer, fpFavorites, fpHistory, fpProject);

  TFilePanelDragFiles = class
  private
    fParentFileExplorerForm :TfmFilePanel;
    fSourceControl          :TWinControl;
    fFileList               :TStringList;

    procedure OnEndDrag(Sender, Target: TObject; X, Y: Integer);
  public
    constructor Create(FileExplorerForm:TfmFilePanel; SourceControl:TWinControl; strFiles:TStringList);
    destructor Destroy; override;
    property FileList :TStringList read fFileList;
  end;

  TfmFilePanel = class(TForm)
    Panel1: TPanel;
    tabsFilePane: TrmTabSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tabsFilePaneChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure tabsFilePaneDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    fConfigLoaded         :boolean;
    fmExpl                :TfmExplorer;
    fmFavorites           :TfmFavorites;
    fmProject             :TfrmProjectFiles;
    fmHistory             :TfmHistory;
    FDragSource           :TWinControl;
    FProject              :TProjectManager;
    FActivePanel          :TFilePanel;
    FDragFiles            :TFilePanelDragFiles;
    fRecentFilesVisible: boolean;
    fExplorerVisible: boolean;
    fProjectBrowserVisible: boolean;
    fFavoritesVisible: boolean;

    procedure LoadSettings;
    procedure SaveSettings;
    procedure UpdateTabCaptions;
    procedure SelectActiveTab;

    procedure OnFavChangeDirectory(Sender:TObject; NewDir:string);

    procedure SetProject(Value: TProjectManager);
    procedure SetLockHistoryUpdate(Value:boolean);
    procedure SetActivePanel(const Value: TFilePanel);
    procedure SetExplorerVisible(const Value: boolean);
    procedure SetFavoritesVisible(const Value: boolean);
    procedure SetProjectBrowserVisible(const Value: boolean);
    procedure SetRecentFilesVisible(const Value: boolean);
  public
    procedure EditorClosingNotification(Editor: TfmEditor);
    procedure UpdateHistoryList;

    property ExplorerVisible: boolean read fExplorerVisible write SetExplorerVisible;
    property FavoritesVisible: boolean read fFavoritesVisible write SetFavoritesVisible;
    property RecentFilesVisible: boolean read fRecentFilesVisible write SetRecentFilesVisible;
    property ProjectBrowserVisible: boolean read fProjectBrowserVisible write SetProjectBrowserVisible;
    property ActivePanel: TFilePanel read FActivePanel write SetActivePanel;

    property DragSource: TWinControl read FDragSource write FDragSource;
    property Project: TProjectManager read FProject write SetProject;
    property ProjectForm: TfrmProjectFiles read fmProject;
    property LockHistoryUpdate: boolean write SetLockHistoryUpdate;
    property DragFiles: TFilePanelDragFiles read FDragFiles write FDragFiles;
    property Explorer: TfmExplorer read fmExpl;
  end;


implementation

uses
  fMain;

{$R *.DFM}

type
  TMyWinControl = class(TWinControl);


////////////////////////////////////////////////////////////////////////////////////////////
//                                 TFilePanelDragFiles
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TFilePanelDragFiles.Create(FileExplorerForm:TfmFilePanel; SourceControl:TWinControl; strFiles:TStringList);
begin
  fFileList:=TStringList.Create;
  fFileList.Assign(strFiles);
  fParentFileExplorerForm:=FileExplorerForm;
  fParentFileExplorerForm.DragFiles:=SELF;
  fSourceControl:=SourceControl;
  TMyWinControl(fSourceControl).OnEndDrag:=OnEndDrag;
end;
//------------------------------------------------------------------------------------------
destructor TFilePanelDragFiles.Destroy;
begin
  fParentFileExplorerForm.DragFiles:=nil;
  TMyWinControl(fSourceControl).OnEndDrag:=nil;
  fFileList.Free;
  inherited;
end;
//------------------------------------------------------------------------------------------
procedure TFilePanelDragFiles.OnEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  Free;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetExplorerVisible(const Value: boolean);
begin
  if (fExplorerVisible<>Value) then begin
    fExplorerVisible:=Value;
    if Value then
      SetActivePanel(fpExplorer)
    else
      (Parent as TWinControl).Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetFavoritesVisible(const Value: boolean);
begin
  if (fFavoritesVisible<>Value) then begin
    fFavoritesVisible:=Value;
    if Value then
      SetActivePanel(fpFavorites)
    else
      (Parent as TWinControl).Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetProjectBrowserVisible(const Value: boolean);
begin
  if (fProjectBrowserVisible<>Value) then begin
    fProjectBrowserVisible:=Value;
    if Value then
      SetActivePanel(fpProject)
    else
      (Parent as TWinControl).Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetRecentFilesVisible(const Value: boolean);
begin
  if (fRecentFilesVisible<>Value) then begin
    fRecentFilesVisible:=Value;
    if Value then
      SetActivePanel(fpHistory)
    else
      (Parent as TWinControl).Visible:=FALSE;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetProject(Value: TProjectManager);
begin
  FProject:=Value;

  if Assigned(fmProject) then begin
    if Assigned(Value) then
      fmProject.Project:=Value
    else begin
      if not fmMain.ExitingContext and (ActivePanel=fpProject) then
        ActivePanel:=fpHistory;

      fmProject.Free;
      fmProject:=nil;
    end;
  end;

  UpdateTabCaptions;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetLockHistoryUpdate(Value:boolean);
begin
  if Assigned(fmHistory) then
    fmHistory.LockUpdate:=Value;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SetActivePanel(const Value: TFilePanel);
var
  ActiveForm: TForm;
begin
  if (FActivePanel<>Value) then begin
    FActivePanel:=Value;
    ActiveForm:=nil;

    case Value of
      fpExplorer:
        begin
          if not Assigned(fmExpl) then begin
            fmExpl:=TfmExplorer.Create(SELF);
            fmExpl.Parent:=SELF;
          end;
          ActiveForm:=fmExpl;
        end;

      fpFavorites:
        begin
          if not Assigned(fmFavorites) then begin
            fmFavorites:=TfmFavorites.Create(SELF);
            fmFavorites.Parent:=SELF;
            fmFavorites.OnDirectoryChange:=OnFavChangeDirectory;
          end;
          ActiveForm:=fmFavorites;
        end;

      fpHistory:
        begin
          if not Assigned(fmHistory) then begin
            fmHistory:=TfmHistory.Create(SELF);
            fmHistory.Parent:=SELF;
            fmHistory.FilesMRU:=fmMain.mruFiles;
          end;
          ActiveForm:=fmHistory;
        end;

      fpProject:
        begin
          if not Assigned(fmProject) then begin
            fmProject:=TfrmProjectFiles.Create(SELF);
            fmProject.Parent:=SELF;
            fmProject.Project:=Project;
          end;
          ActiveForm:=fmProject;

          {
          if pgProject.TabVisible then
            pcExpl.ActivePage:=pgProject
          else
            ActivePanel:=fpHistory;
          }
        end;
    end;

    if Assigned(ActiveForm) then begin
      ActiveForm.Show;
      ActiveForm.BringToFront;
    end;

    fExplorerVisible:=(Value=fpExplorer);
    fFavoritesVisible:=(Value=fpFavorites);
    fRecentFilesVisible:=(Value=fpHistory);
    fProjectBrowserVisible:=(Value=fpProject);

    SelectActiveTab;

    if Assigned(fmExpl) then
      fmExpl.Active:=(fExplorerVisible);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                      Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.EditorClosingNotification(Editor:TfmEditor);
begin
  if Assigned(fmProject) then
    fmProject.RefreshFileList;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.LoadSettings;
var
  reg :TRegistry;
begin
  if fConfigLoaded then EXIT;

  reg:=TRegistry.Create;
  try
    with reg do begin
      OpenKey(CONTEXT_REG_KEY+'FileExplorer',TRUE);

      Width:=ReadRegistryInteger(reg,'Width',Width);
      ActivePanel:=TFilePanel(ReadRegistryInteger(reg,'ActivePanel',ord(fpExplorer)));
    end;
  finally
    reg.Free;
  end;

  fConfigLoaded:=TRUE;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SaveSettings;
begin
  with TRegistry.Create do begin
    OpenKey(CONTEXT_REG_KEY+'FileExplorer',TRUE);
    WriteInteger('Width',Width);
    WriteInteger('ActivePanel',ord(ActivePanel));
    Free;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.UpdateTabCaptions;
begin
  with tabsFilePane.Tabs do begin
    Clear;
    AddObject(mlStr(ML_EXPL_PAGE_EXPLORER, 'File Explorer'), pointer(fpExplorer));
    AddObject(mlStr(ML_EXPL_PAGE_FAVORITES, 'Favorites'), pointer(fpFavorites));
    AddObject(mlStr(ML_EXPL_PAGE_HISTORY, 'History'), pointer(fpHistory));

    if Assigned(FProject) then
      AddObject(mlStr(ML_EXPL_PAGE_PROJECT, 'Project'), pointer(fpProject));
  end;

  SelectActiveTab;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.SelectActiveTab;
var
  i: integer;
begin
  i:=0;
  while (i<tabsFilePane.Tabs.Count) do begin
    if (TFilePanel(tabsFilePane.Tabs.Objects[i])=fActivePanel) then begin
      tabsFilePane.TabIndex:=i;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.UpdateHistoryList;
begin
  if Assigned(fmHistory) then
    fmHistory.UpdateList;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                Explorer - Drag and drop
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.tabsFilePaneDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  n: integer;
  source_ok :boolean;
begin
  Accept:=TRUE;
  source_ok:=Assigned(DragFiles);
  n:=tabsFilePane.ItemAtPos(Point(X, Y));

  if ((n<>-1) and source_ok) then
    ActivePanel:=TFilePanel(tabsFilePane.Tabs.Objects[n]);
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                       Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.tabsFilePaneChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  ActivePanel:=TFilePanel(tabsFilePane.Tabs.Objects[NewTab]);
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.OnFavChangeDirectory(Sender:TObject; NewDir:string);
begin
  if not DirectoryExists(NewDir) then begin
    ShowMessage('Folder doesn''t exists anymore');
    EXIT;
  end;

  ActivePanel:=fpExplorer;
  fmExpl.Directory:=NewDir;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.FormCreate(Sender: TObject);
begin
  UpdateTabCaptions;
  LoadSettings;
end;
//------------------------------------------------------------------------------------------
procedure TfmFilePanel.FormDestroy(Sender: TObject);
begin
  SaveSettings;

  if Assigned(fmExpl) then
    FreeAndNil(fmExpl);

  if Assigned(fmFavorites) then
    FreeAndNil(fmFavorites);

  if Assigned(fmProject) then
    FreeAndNil(fmProject);

  if Assigned(fmHistory) then
    FreeAndNil(fmHistory);
end;
//------------------------------------------------------------------------------------------

end.


