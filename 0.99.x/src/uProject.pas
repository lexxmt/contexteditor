// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uProject;

interface

{$I ConTEXT.inc}

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, ComCtrls95, Graphics, IniFiles, uCommon, fEditor,
  uMultiLanguage, JclFileUtils, uCommonClass;

{$M+}
type
  TPrjFileData = class(TFileData)
  private
    fOpened    :boolean;
    fMakeFile  :boolean;
    fTop       :integer;
    fLeft      :integer;
    fHeight    :integer;
    fTopLine   :integer;
    fCursorX   :integer;
    fCursorY   :integer;
    fWidth     :integer;
    fBookmarks :TBookmarkList;
    fHighlighterName :string;
  published
    constructor Create(AFileName:string); override;
    destructor Destroy; override;

    property Left            :integer read fLeft;
    property Top             :integer read fTop;
    property Width           :integer read fWidth;
    property Height          :integer read fHeight;
    property TopLine         :integer read fTopLine;
    property CursorX         :integer read fCursorX;
    property CursorY         :integer read fCursorY;
    property Opened          :boolean read fOpened write fOpened;
    property MakeFile        :boolean read fMakeFile;
    property Bookmarks       :TBookmarkList read fBookmarks;
    property HighlighterName :string read fHighlighterName;
  end;
  {$M-}

  TProjectChangeNameEvent = procedure(Sender:TObject; NewFileName:string) of object;

  {$M+}
  TProjectManager = class
  private
    fTabs             :TTab95Control;
    FRelativePath     :boolean;
    FOnChangeFileName :TProjectChangeNameEvent;
    FFileName         :string;
    fProjectRoot: string;

    procedure GetEditorData(fm:TfmEditor; rec:TPrjFileData);
    procedure ApplyEditorData(fm:TfmEditor; rec:TPrjFileData; Maximized:boolean);
    function  GetMakeFile:TPrjFileData;
    procedure SetMakeFile(Value:TPrjFileData);
    procedure SetFileName(const Value: string);
    function RelativeFilenameToAbsolute(S: string): string;
    function AbsoluteFilenameToRelative(S: string): string;
  public
    Active    :boolean;
    Loading   :boolean;
    fPrjFiles :TList;

    constructor Create(tabFiles:TTab95Control);
    destructor Destroy; override;

    function  New(fname:string):boolean;
    function  OpenProjectFile(rec:TPrjFileData; Maximized:boolean):boolean;
    function  Open(fname:string):boolean;
    function  Save(fname:string):boolean;
    function  Close(ConfirmCloseAllFiles:boolean):boolean;
    procedure Clear;
    procedure OpenAllFiles;
    procedure CloseAllFiles;
    procedure RenameFile(OldName,NewName:string);

    procedure Add(rec:TPrjFileData);
    procedure Delete(rec:TPrjFileData);
    procedure UpdateEditorOnClose(fm:TfmEditor);
    procedure UpdateAllEditors;
    function  GetFileIndex(FileName:string):integer;
    function  GetOpenFilesWindows:TList;
  published
    property MakeFile: TPrjFileData read GetMakeFile write SetMakeFile;
    property RelativePath: boolean read FRelativePath write FRelativePath;
    property OnChangeFileName: TProjectChangeNameEvent read FOnChangeFileName write FOnChangeFileName;
    property FileName: string read FFileName write SetFileName;
    property ProjectRoot: string read fProjectRoot write fProjectRoot;
  end;
  {$M-}
function IsProjectFile(fname:string):boolean;

implementation

uses
  fMain;

const
  SIGNATURE     = 'ConTEXT project file';
  INVALID_VALUE = -9999;


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function IsProjectFile(fname:string):boolean;
var
  iniF :TIniFile;
begin
  result:=FileExists(fname) and (UpperCase(ExtractFileExt(fname))='.CPR');

  if result then begin
    try
      iniF:=TIniFile.Create(fname);
      result:=(UpperCase(iniF.ReadString('General','Signature',''))=UpperCase(SIGNATURE));
      iniF.Free;
    except
    end;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                      TPrjFileData
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TPrjFileData.Create(AFileName:string);
begin
  inherited;

  fBookmarks:=TBookmarkList.Create;
end;
//------------------------------------------------------------------------------------------
destructor TPrjFileData.Destroy;
begin
  fBookmarks.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Constructor, destructor
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TProjectManager.Create(tabFiles:TTab95Control);
begin
  fTabs:=tabFiles;
  fPrjFiles:=TList.Create;
end;
//------------------------------------------------------------------------------------------
destructor TProjectManager.Destroy;
begin
  fPrjFiles.Free;

  inherited;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TProjectManager.GetMakeFile:TPrjFileData;
var
  i :integer;
begin
  result:=nil;
  i:=0;
  while (i<fPrjFiles.Count) do begin
    if TPrjFileData(fPrjFiles[i]).MakeFile then begin
      result:=fPrjFiles[i];
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.SetMakeFile(Value:TPrjFileData);
var
  i   :integer;
  rec :TPrjFileData;
begin
  for i:=0 to fPrjFiles.Count-1 do begin
    rec:=fPrjFiles[i];
    rec.fMakeFile:=(rec=Value);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.SetFileName(const Value: string);
begin
  if (FFileName<>Value) then begin
    FFileName:=Value;

    if Assigned(FOnChangeFileName) then
      FOnChangeFileName(SELF, Value);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Load and save functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TProjectManager.New(fname:string):boolean;
var
  i      :integer;
  locked :boolean;
begin
  result:=Close(TRUE);

  if result then begin
    fname:=GetFileLongName(fname);
    FileName:=fname;
    fmMain.Caption:='ConTEXT - '+ExtractFileName(fname);
    Active:=TRUE;
    fmMain.acProjectManageFileListExecute(SELF);
    FRelativePath:=FALSE;

    if (fPrjFiles.Count>0) then begin
      locked:=fPrjFiles.Count>2;
      if locked then fmMain.LockPainting(FALSE);
      for i:=0 to fPrjFiles.Count-1 do
        OpenProjectFile(TPrjFileData(fPrjFiles[i]),FALSE);
      if locked then fmMain.UnlockPainting(FALSE);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.OpenProjectFile(rec:TPrjFileData; Maximized:boolean):boolean;
var
  fm :TfmEditor;
begin
  DisableMRUFiles:=TRUE;

  if (fmMain.OpenFile(rec.FileName)) then begin
    fm:=fmMain.ActiveEditor;
    ApplyEditorData(fm,rec,Maximized);
    rec.Opened:=TRUE;
    fm.ProjectFile:=TRUE;
  end else
    rec.Opened:=FALSE;

  result:=rec.Opened;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.Open(fname:string):boolean;
var
  n              :integer;
  i, ii          :integer;
  iniF           :TIniFile;
  s              :string;
  fm             :TfmEditor;
  active_file    :integer;
  active_fm      :TfmEditor;
  rec            :TPrjFileData;
  sect           :string;
  maximized      :boolean;
  bm_count       :integer;
begin
  result:=FALSE;
  if not IsProjectFile(fname) then EXIT;

  if not Close(TRUE) then EXIT;

  Clear;
  try
    iniF:=TIniFile.Create(fname);

    n:=iniF.ReadInteger('General','FilesCount',0);
    active_file:=iniF.ReadInteger('General','ActiveFile',0);
    maximized:=iniF.ReadBool('General','Maximized',TRUE);
    FRelativePath:=iniF.ReadBool('General','RelativePath',FALSE);
    fProjectRoot:=iniF.ReadString('General', 'Root', '');

    Loading:=TRUE;

    for i:=1 to n do begin
      sect:='File'+IntToStr(i);
      s:=iniF.ReadString(sect,'Name','');

      if (Length(s)>0) then begin
        rec:=TPrjFileData.Create(s);

        with rec do begin
          fLeft:=iniF.ReadInteger(sect,'Left',INVALID_VALUE);
          fTop:=iniF.ReadInteger(sect,'Top',INVALID_VALUE);
          fWidth:=iniF.ReadInteger(sect,'Width',INVALID_VALUE);
          fHeight:=iniF.ReadInteger(sect,'Height',INVALID_VALUE);
          fCursorX:=iniF.ReadInteger(sect,'CursorX',0);
          fCursorY:=iniF.ReadInteger(sect,'CursorY',0);
          fTopLine:=iniF.ReadInteger(sect,'TopLine',0);
          fOpened:=iniF.ReadBool(sect,'Open',FALSE);
          fMakeFile:=iniF.ReadBool(sect,'MakeFile',FALSE);
          fHighlighterName:=iniF.ReadString(sect,'Highlighter','');
        end;

        bm_count:=iniF.ReadInteger(sect,'BookmarkCount',0);
        for ii:=0 to bm_count-1 do begin
          rec.Bookmarks.Add(
            iniF.ReadInteger(sect,'Bookmark'+IntToStr(ii)+'Index',0),
            iniF.ReadInteger(sect,'Bookmark'+IntToStr(ii)+'X',0),
            iniF.ReadInteger(sect,'Bookmark'+IntToStr(ii)+'Y',0)
          );
        end;

        Add(rec);
      end;
    end;

    fmMain.Caption:='ConTEXT - '+ExtractFileName(fname);
    FileName:=fname;

    try
      active_fm:=nil;
      fmMain.LockPainting(FALSE);

      for i:=0 to fPrjFiles.Count-1 do begin
        rec:=TPrjFileData(fPrjFiles[i]);
        rec.FileName:=RelativeFilenameToAbsolute(rec.FileName);

        if (rec.Opened and OpenProjectFile(rec,maximized)) then begin
          fm:=fmMain.ActiveEditor;
          if (i+1=active_file) then
            active_fm:=fm;
        end;
      end;

      if Assigned(active_fm) then
        BringEditorToFront(active_fm, TRUE);
    finally
      fmMain.UnlockPainting(FALSE);
      iniF.Free;
      Loading:=FALSE;
    end;

    result:=TRUE;

    if Assigned(fmMain.FilePanel) then
      fmMain.FilePanel.Project:=SELF;
  except
    DlgErrorOpenFile(fname);
  end;

  Active:=Result;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.Save(fname:string):boolean;
var
  i             :integer;
  str           :TStringList;
  str_bookmarks :TStringList;
  n             :integer;
  rec           :TPrjFileData;
  fm            :TfmEditor;
  ll            :TList;
  s: string;
begin
  result:=TRUE;
  if not Active or (Length(fname)=0) then EXIT;

  if Assigned(fmMain.FilePanel) and Assigned(fmMain.FilePanel.ProjectForm) then begin
    ll:=fmMain.FilePanel.ProjectForm.GeTPrjFileDataList;
    fPrjFiles.Clear;

    for i:=0 to ll.Count-1 do
      fPrjFiles.Add(ll[i]);
    ll.Free;
  end;

  str:=TStringList.Create;

  fm:=fmMain.ActiveEditor;
  if Assigned(fm) then begin
    n:=GetFileIndex(fm.FileName)+1;
  end else
    n:=0;

  str.Add('[General]');
  str.Add('Signature='+SIGNATURE);
  str.Add('FilesCount='+IntToStr(fPrjFiles.Count));
  str.Add('ActiveFile='+IntToStr(n));
  str.Add('Maximized='+IntToStr(integer(fmMain.FindMaximizedForm<>nil)));
  str.Add('RelativePath='+IntToStr(integer(FRelativePath)));
  str.Add('Root='+fProjectRoot);

  for i:=0 to fPrjFiles.Count-1 do begin
    rec:=TPrjFileData(fPrjFiles[i]);
    str.Add('');
    str.Add(Format('[File%d]',[i+1]));

    if (rec.Opened) then begin
      fm:=fmMain.FindOpenedFile(rec.FileName);
      if Assigned(fm) then
        GetEditorData(fm,rec);
    end;

    if (PathIsUnc(rec.FileName)) then
      s := rec.FileName
    else
      s := AbsoluteFilenameToRelative(rec.FileName);

    str.Add('Name=' + s);
    str.Add('Open='+IntToStr(integer(rec.Opened)));
    str.Add('Left='+IntToStr(rec.Left));
    str.Add('Top='+IntToStr(rec.Top));
    str.Add('Width='+IntToStr(rec.Width));
    str.Add('Height='+IntToStr(rec.Height));
    str.Add('TopLine='+IntToStr(rec.TopLine));
    str.Add('CursorX='+IntToStr(rec.CursorX));
    str.Add('CursorY='+IntToStr(rec.CursorY));
    str.Add('Highlighter='+rec.HighlighterName);

    str_bookmarks:=rec.Bookmarks.SaveToFormattedList;
    str.AddStrings(str_bookmarks);
    str_bookmarks.Free;

    if rec.MakeFile then
      str.Add('MakeFile=1');
  end;

  try
    str.SaveToFile(fname);
  except
    result:=FALSE;
    DlgErrorSaveFile(fname);
  end;

  str.Free;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.Close(ConfirmCloseAllFiles:boolean):boolean;
var
  ed :TfmEditor;
  n  :integer;
begin
  result:=TRUE;
  if not Active then EXIT;

  if ConfirmCloseAllFiles and (fmMain.MDIChildCount>0) then begin
    case MessageDlg(mlStr(ML_MAIN_CLOSE_ALL_OPEN_FILES,'Close all open files?'),mtCustom,[mbYes,mbNo,mbCancel],0) of
      mrCancel:
        begin
          result:=FALSE;
          EXIT;
        end;
      mrYes:
        begin
          result:=Save(FileName);
          DisableMinimizeWhenClosedAllFiles:=TRUE;
          fmMain.acCloseAllExecute(SELF);
          Application.ProcessMessages;
          DisableMinimizeWhenClosedAllFiles:=FALSE;
        end;
    end;
  end else
    result:=Save(FileName);

  if result then begin
    Clear;
    Active:=FALSE;
    FileName:='';
    fmMain.Caption:='ConTEXT';

    n:=0;
    while fmMain.Enum(ed, n) do
      ed.ProjectFile:=FALSE;

    if Assigned(fmMain.FilePanel) then
      fmMain.FilePanel.Project:=nil;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TProjectManager.AbsoluteFilenameToRelative(S: string): string;
var
  path: string;
  filename: string;
begin
  if (Length(fProjectRoot)>0) then
    path:=fProjectRoot
  else
    path:=ExtractFilePath(fFileName);

  filename:=ExtractFileName(S);
  S:=ExtractFilePath(S);

  path:=PathGetRelativePath(path, S);
  if (Length(path)>0) and (path[1]='\') then
    System.Delete(path, 1, 1);

  if (Length(path)>0) and (path<>'.') then
    result:=path+'\'+filename
  else
    result:=filename;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.RelativeFilenameToAbsolute(S: string): string;
var
  path: string;
begin
  if (PathIsAbsolute(S) or PathIsUNC(S)) then
    result:=S
  else begin
    if (Length(fProjectRoot)>0) then
      path:=fProjectRoot
    else
      path:=ExtractFilePath(fFileName);

    result:=PathCanonicalize(PathGetRelativePath(path, S));
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.ApplyEditorData(fm:TfmEditor; rec:TPrjFileData; Maximized:boolean);
var
  WinPos :TWindowPlacement;
  i      :integer;
  HL     :pTHighlighter;
begin
  with rec do begin
    if (Width<>0) and (Height<>0) then begin
      if (Left=INVALID_VALUE) then fLeft:=fm.Left;
      if (Top=INVALID_VALUE) then fTop:=fm.Top;
      if (Width=INVALID_VALUE) then fWidth:=fm.Width;
      if (Height=INVALID_VALUE) then fHeight:=fm.Height;

      WinPos.length:=SizeOf(TWindowPlacement);
      GetWindowPlacement(fm.Handle,@WinPos);
      WinPos.rcNormalPosition.Left:=Left;
      WinPos.rcNormalPosition.Top:=Top;
      WinPos.rcNormalPosition.Right:=Width+WinPos.rcNormalPosition.Left;
      WinPos.rcNormalPosition.Bottom:=Height+WinPos.rcNormalPosition.Top;
      SetWindowPlacement(fm.Handle,@WinPos);
    end;

    if maximized then
      fm.WindowState:=wsMaximized;

    fm.SetCursorPos(CursorX,CursorY);
    fm.memo.TopLine:=TopLine+1;

    // bookmarks
    for i:=0 to rec.Bookmarks.Count-1 do
      fm.memo.SetBookMark(rec.Bookmarks[i].Index,
                          rec.Bookmarks[i].X,
                          rec.Bookmarks[i].Y);

    // highlighter
    if (Length(rec.HighlighterName)>0) then begin
      HL:=GetHighlighterRecByName(rec.HighlighterName);
      if Assigned(HL) then
        fmMain.SetHighlighter(fm,'',HL);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.GetEditorData(fm:TfmEditor; rec:TPrjFileData);
var
  WinPos  :TWindowPlacement;
  i       :integer;
  HL      :pTHighlighter;
begin
  rec.FileName:=fm.FileName;
  rec.fTopLine:=fm.memo.TopLine-1;
  rec.fOpened:=TRUE;
  fm.GetCursorPos(rec.fCursorX, rec.fCursorY);

  WinPos.length:=SizeOf(TWindowPlacement);
  GetWindowPlacement(fm.Handle,@WinPos);

  rec.fLeft:=WinPos.rcNormalPosition.Left;
  rec.fTop:=WinPos.rcNormalPosition.Top;
  rec.fWidth:=WinPos.rcNormalPosition.Right-WinPos.rcNormalPosition.Left;
  rec.fHeight:=WinPos.rcNormalPosition.Bottom-WinPos.rcNormalPosition.Top;

  // bookmarks
  rec.Bookmarks.Clear;
  for i:=0 to fm.memo.Marks.Count-1 do
    rec.Bookmarks.Add(fm.memo.Marks[i].BookmarkNumber, fm.memo.Marks[i].Char, fm.memo.Marks[i].Line);

  HL:=GetHighlighterRec(fm.memo.Highlighter);
  if Assigned(HL) and (FindHighlighterForFile(fm.FileName)<>HL) then
    rec.fHighlighterName:=HL^.name
  else
    rec.fHighlighterName:='';
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.Clear;
var
  i :integer;
begin
  for i:=0 to fPrjFiles.Count-1 do
    if Assigned(fPrjFiles[i]) then
      TPrjFileData(fPrjFiles[i]).Free;

  fPrjFiles.Clear;

  if Assigned(fmMain.FilePanel) then
    fmMain.FilePanel.Project:=SELF;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.OpenAllFiles;
var
  i         :integer;
  rec       :TPrjFileData;
  maximized :boolean;
begin
  maximized:=fmMain.FindMaximizedForm<>nil;

  fmMain.LockPainting(FALSE);

  for i:=0 to fPrjFiles.Count-1 do begin
    rec:=TPrjFileData(fPrjFiles[i]);
    if Assigned(rec) then
      fmMain.PrjManager.OpenProjectFile(rec,maximized);
  end;

  fmMain.UnlockPainting(FALSE);
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.CloseAllFiles;
var
  i         :integer;
  rec       :TPrjFileData;
  ed        :TfmEditor;
begin
  fmMain.LockPainting(FALSE);

  for i:=0 to fPrjFiles.Count-1 do begin
    rec:=TPrjFileData(fPrjFiles[i]);
    if Assigned(rec) then begin
      ed:=fmMain.FindOpenedFile(rec.FileName);

      if Assigned(ed) then
        ed.Close;
    end;
  end;

  fmMain.UnlockPainting(FALSE);
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.Add(rec:TPrjFileData);
var
  n :integer;
begin
  n:=GetFileIndex(rec.FileName);

  if (n<>-1) then begin
    TPrjFileData(fPrjFiles[n]).Free;
    fPrjFiles[n]:=rec;
  end else
    fPrjFiles.Add(rec);
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.UpdateEditorOnClose(fm:TfmEditor);
var
  n   :integer;
  rec :TPrjFileData;
begin
  if not Active or fm.Unnamed then EXIT;

  n:=GetFileIndex(fm.FileName);
  if (n>-1) then begin
    rec:=TPrjFileData(fPrjFiles[n]);
    GetEditorData(fm,rec);
    rec.Opened:=FALSE;

    if Assigned(fmMain.FilePanel) then
      fmMain.FilePanel.EditorClosingNotification(fm);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.UpdateAllEditors;
var
  i   :integer;
  n   :integer;
  rec :TPrjFileData;
  ed  :TfmEditor;
begin
  if not Active then EXIT;

  i:=0;
  while fmMain.Enum(ed,i) do begin
    if not ed.Unnamed then begin
      n:=GetFileIndex(ed.FileName);
      if (n>-1) then begin
        rec:=TPrjFileData(fPrjFiles[n]);
        GetEditorData(ed,rec);
        rec.Opened:=TRUE;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.RenameFile(OldName, NewName:string);
var
  n   :integer;
  rec :TPrjFileData;
begin
  if (OldName<>NewName) then begin
    n:=GetFileIndex(OldName);
    if (n=-1) then EXIT;

    rec:=TPrjFileData(fPrjFiles[n]);
    rec.FileName:=NewName;

    if Assigned(fmMain.FilePanel) then
      fmMain.FilePanel.ProjectForm.RefreshFileList;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TProjectManager.Delete(rec:TPrjFileData);
var
  n :integer;
begin
  n:=fPrjFiles.IndexOf(rec);
  if (n<>-1) then begin
    TPrjFileData(fPrjFiles[n]).Free;
    fPrjFiles.Delete(n);
  end;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.GetFileIndex(FileName:string):integer;
var
  i :integer;
begin
  result:=-1;
  FileName:=UpperCase(FileName);
  i:=0;
  while (i<fPrjFiles.Count) do begin
    if Assigned(fPrjFiles[i]) and (FileName=UpperCase(TPrjFileData(fPrjFiles[i]).FileName)) then begin
      result:=i;
      BREAK;
    end;
    inc(i);
  end;
end;
//------------------------------------------------------------------------------------------
function TProjectManager.GetOpenFilesWindows:TList;
var
  i   :integer;
  rec :TPrjFileData;
  ll  :TList;
  ed  :TfmEditor;
begin
  ll:=TList.Create;
  for i:=0 to fPrjFiles.Count-1 do begin
    rec:=TPrjFileData(fPrjFiles[i]);
    ed:=fmMain.FindOpenedFile(rec.FileName);
    if Assigned(ed) then
      ll.Add(ed);
  end;
  result:=ll;
end;
//------------------------------------------------------------------------------------------

end.

