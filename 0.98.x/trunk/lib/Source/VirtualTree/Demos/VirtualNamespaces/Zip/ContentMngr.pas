unit ContentMngr;  //ContentManager
// Original code november 2002 Gerard Slurink
// May be distributed and modified freely
// Still under construction!

// Contains:
//   TContentManager for access to zip-archive or similar content
//   Use the global ContentManager instance that is created automatically
// Interface:
//   - EnumFirstChild reads the archive and returns the first child of the given path
//     which is the relative path in zip-archive
//   - EnumNextChild assumes that EnumFirstChild has been called (not checked) and
//     returns the next child or nil if no more children
//   - Execute opens or executes the file specified in APath which is the full path
//     in the archive, including the filename
//   - GetContentInfo returns the info on the file specified in APath which is the full
//     path in the archive, including the filename
//   - Content for Max (default = 10) files is cached
//
// Made as general as possible, it should be easy to use for other formats.
// Modifications need to be made only in TContainer.Load and TContentManager.Execute and
// addfiles and deletefiles, and .. 
// Ok, Ok, some more calls are being made to ZipMaster as more functinality is added
// I will see if i can take this out to a separeate object

// BTW ZipMaster is part of DelphiZip  available at http://www.geocities.com/rjpeters_au/zipmaster.html

// TContentManager is not thread safe yet !

interface
uses
  ZipMstr,
  Classes, SysUtils, ShlObj, Windows, Controls, Forms, ShellApi,
  VirtualPIDLTools,
  Utilities;

type
  TContentInfo = class
  private
    FirstChild: TContentInfo;
    Next: TContentInfo;
  public
    Name: String;
    IsFolder: Boolean;
    HasFolders: Boolean;
    CompressedSize: Integer;
    UnCompressedSize: Integer;
    Date: Integer;
    Attributes: Word;
    CRC: Integer;
  end;

  TContentTree = class
  private
    FRoot: TContentInfo;
    FEnum: TContentInfo;

  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure AddNode(const APath: String; ANode: TContentInfo);
    function Find(const APath: String): TContentInfo;
    function GetFirstChild(const APath: String): TContentInfo;
    function GetNextChild: TContentInfo;
    // future methods to implement:
    // procedure Delete(const APath: String);
    // Procedure Rename(const oldPath, newPath: String)
  end;

  TContainer = class
  private
    FFileName: String;
    ContentTree: TContentTree;
    procedure Load(const FileName: String);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TContentManager = class
  private
    FMax: Integer;
    FCount: Integer;
    FReplacePos: Integer;       // must still think about this one
    Containers: array of TContainer;
    function GetContainer(const AFileName: String): TContainer;
    procedure SetMax(value: Integer);
    procedure ChangePath(Sender: TObject; var OldFileName: String; var IsChanged: Boolean);


  public
    constructor Create;
    destructor Destroy; override;
    procedure AddFiles(const AFileName, APath: String; AFileList: TStringList);
    procedure DeleteFiles(const AFileName: String; AFileList: TStringList);
    function EnumFirstChild(const AFileName, APath: String): TContentInfo;
    function EnumNextChild(const AFileName: String): TContentInfo;
    procedure Execute(const AFileName, APath: String);
    procedure ExtractFiles(const AFileList: TStringList; const DestinationRoot: String);
    function GetContentInfo(const AFileName, APath: String): TContentInfo;
    procedure PrepareShellDrag(const AFileName, APath: String; AFileList: TStringList);
    property Max: Integer read FMax write SetMax;
  end;

var
  ContentManager : TContentManager;

implementation

{------------------------------------------------------------------------------}
{                                  TContentTree                                }
{------------------------------------------------------------------------------}
// Tree data structure that can hold hierarchical information such as the structure
// of files in a (zip) archive (translates a list to a tree)
// Interface:
//   Create a TContentNode and add it to the Tree with AddNode(path-to-node, node)
//   path-to-node is the relatve path in zip-archive, without the filename
//   Access with GetFirstChild/GetNextChild
//   GetNextChild assumes that GetFirstChild has been called before (not checked)
//   Can be used also without ContentManager

constructor TContentTree.Create;
begin
  FRoot := TContentInfo.Create;
end;

{------------------------------------------------------------------------------}
destructor TContentTree.Destroy;
begin
  Clear;
  FRoot.Free;
  inherited;
end;

{------------------------------------------------------------------------------}
procedure TContentTree.Clear;

  procedure ClearContentsTree(node: TContentInfo);
  begin
    if node.FirstChild <> nil then
      ClearContentsTree(node.FirstChild);
    if node.Next <> nil then
      ClearContentsTree(node.Next);
    node.Free;
  end;

begin
  Assert(FRoot <> nil);
  if FRoot.FirstChild <> nil then
    ClearContentsTree(FRoot.FirstChild);
  FRoot.FirstChild := nil;
  FRoot.Next := nil;
end;

{------------------------------------------------------------------------------}
procedure SeverHead(const path: String; var head, rest: String);
const
  delimiter = '\';
var
  p: Integer;
begin
  p := Pos(delimiter, path);
  if p <> 0 then
  begin
    head := Copy(path, 1, p-1);
    rest := Copy(path, p+1, MaxInt);
  end
  else begin
    head := path;
    rest := '';
  end;
end;

{------------------------------------------------------------------------------}
procedure SeverTail(const path: String; var tail, rest: String);
const
  delimiter = '\';
var
  p: Integer;
begin
  if rest[Length(rest)] = '\' then
    SetLength(rest, Length(rest)-1);
  p := Length(rest);
  while (p > 0) and (rest[p] <> delimiter) do Dec(p);
  if p > 0 then
  begin
    tail := Copy(rest, p+1, MaxInt);
    rest := Copy(rest, 1, p - 1);
  end
  else begin
    tail := rest;
    rest := '';
  end;
end;

{------------------------------------------------------------------------------}
procedure TContentTree.AddNode(const APath: String; ANode: TContentInfo);

  function CreateBranch(const path: String): TContentInfo;
  var
    node: TContentInfo;
    tail, rest: String;
  begin
    Result := ANode;
    rest := path;
    while rest <> '' do
    begin
      SeverTail(rest, tail, rest);
      node := TContentInfo.Create;
      node.Name := tail;
      node.IsFolder := True;
      node.FirstChild := Result;
      node.HasFolders := False; //Result <> ANode;
      Result := node;
    end;
  end;

  procedure AddChild(parentNode: TContentInfo; const path: String);
  // parentNode = head of list
  var
    node, current: TContentInfo;
    head, rest: String;
  begin
    Assert(parentNode <> nil);
    SeverHead(path, head, rest);
    current := parentNode;
    node := parentNode.FirstChild;
    if head = '' then head := ANode.Name; // parentNode is direct parent
    // we are looking for a match or for a place to insert
    while (node <> nil) and (AnsiCompareStr(node.Name, head) < 0) do
    begin
      current := node;
      node := node.Next;
    end;
    if (node = nil) or (not AnsiSameStr(node.Name, head)) then
    begin
      // no match - insert branch at current
      node := CreateBranch(path);
      if current = parentNode then
      begin
        node.Next := current.FirstChild;
        current.FirstChild := node;
      end
      else begin
        node.Next := current.Next;
        current.Next := node;
      end
    end
    else
      AddChild(node, rest);
  end;

begin
  AddChild(FRoot, APath);
end;

{------------------------------------------------------------------------------}
function TContentTree.Find(const APath: String): TContentInfo;

  function SearchSubContentsTree(parentNode: TContentInfo; path: String): TContentInfo;
  var
    node: TContentInfo;
    head, rest: String;
  begin
    SeverHead(path, head, rest);
    node := parentNode.FirstChild;
    while (node <> nil) and (node.Name <> head) do node := node.Next;
    if node <> nil then
    begin
      if rest = '' then
        Result := node
      else
        Result := SearchSubContentsTree(node, rest)
    end
    else
      Result := nil
  end;

begin
  if APath = '' then
    Result := FRoot.FirstChild
  else
    Result := SearchSubContentsTree(FRoot, APath);
end;

{------------------------------------------------------------------------------}
function TContentTree.GetFirstChild(const APath: String): TContentInfo;

  function SearchSubContentsTree(parentNode: TContentInfo; path: String): TContentInfo;
  var
    node: TContentInfo;
    head, rest: String;
  begin
    SeverHead(path, head, rest);
    node := parentNode.FirstChild;
    while (node <> nil) and (node.Name <> head) do node := node.Next;
    if node <> nil then
    begin
      if rest = '' then
        Result := node.FirstChild
      else
        Result := SearchSubContentsTree(node, rest)
    end
    else
      Result := nil
  end;

begin
  if APath = '' then
    Result := FRoot.FirstChild
  else
    Result := SearchSubContentsTree(FRoot, APath);
  FEnum := Result;
  if FEnum <> nil then
    FEnum := FEnum.Next;
end;

{------------------------------------------------------------------------------}
function TContentTree.GetNextChild: TContentInfo;
begin
  Result := FEnum;
  if FEnum <> nil then
    FEnum := FEnum.Next;
end;

{------------------------------------------------------------------------------}
{                                   TContainer                                 }
{------------------------------------------------------------------------------}
constructor TContainer.Create;
begin
  ContentTree := TContentTree.Create;
end;

{------------------------------------------------------------------------------}
destructor TContainer.Destroy;
begin
  ContentTree.Free;
end;

{------------------------------------------------------------------------------}
procedure TContainer.Load(const FileName: String);
var
  i: Integer;
  path : String;
  ContentInfo: TContentInfo;
  ZipMaster: TZipMaster;
begin
  FFileName := FileName;
  ContentTree.Clear;
  ZipMaster := TZipMaster.Create(nil);
  try
    ZipMaster.ZipFileName := FFileName;
    for i := 0 To Zipmaster.Count - 1 do
    begin
      ContentInfo := TContentInfo.Create;
      ContentInfo.Name := ExtractFileName(ZipDirEntry(ZipMaster.ZipContents[i]^).FileName);
      ContentInfo.IsFolder := False;
      ContentInfo.HasFolders := False;
      ContentInfo.CompressedSize := ZipDirEntry(ZipMaster.ZipContents[i]^).CompressedSize;
      ContentInfo.UnCompressedSize := ZipDirEntry(ZipMaster.ZipContents[i]^).UncompressedSize;
      ContentInfo.Date := ZipDirEntry(ZipMaster.ZipContents[i]^).DateTime;
      ContentInfo.CRC := ZipDirEntry(ZipMaster.ZipContents[i]^).CRC32;
      ContentInfo.Attributes := ZipDirEntry(ZipMaster.ZipContents[i]^).IntFileAttrib;
      path := ExtractFilePath(ZipDirEntry(ZipMaster.ZipContents[i]^).FileName);
      ContentTree.AddNode(path, ContentInfo);
    end;
  finally
    zipMaster.Free;
  end;
end;

{------------------------------------------------------------------------------}
{                                    TContentManager                           }
{------------------------------------------------------------------------------}
constructor TContentManager.Create;
begin
  FMax := 10;
  FCount := 0;
end;

{------------------------------------------------------------------------------}
destructor TContentManager.Destroy;
  var i: Integer;
begin
  for i := 0 to FCount -1  do
    Containers[i].Free
end;

{------------------------------------------------------------------------------}
// stupid way to rename on add, but the only possible way with DelphiZip
var
  droproot : String;

procedure TContentManager.ChangePath(Sender: TObject; var OldFileName: String; var IsChanged: Boolean);
begin
  OldFileName := droproot + '\' + OldFileName;
  IsChanged := True;
end;

{------------------------------------------------------------------------------}
procedure TContentManager.AddFiles(const AFileName, APath: String; AFileList: TStringList);
  // we get zipfile, relative drop path in zip, dropped files
var
  ZipMaster: TZipMaster;
  commonRoot: String;
  i: Integer;
begin
  if AFileList.Count = 0 then Exit;
  ZipMaster := TZipMaster.Create(nil);
  try
    ZipMaster.ZipFileName := AFileName;
    // since toSiblingSelectConstraint is always true all files share the same root
    // otherwhise we must determine the lowest common folder and add from there
    commonRoot := ExtractFilePath(AFileList[0]);
    // add relative paths
    for i := 0 to AFileList.Count - 1 do
    begin
      if DirectoryExists(AFileList[i]) then
        ZipMaster.FSpecArgs.Add(Copy(AFileList[i], Length(commonRoot)+1, MaxInt) + '\*.*')
      else
        ZipMaster.FSpecArgs.Add(Copy(AFileList[i], Length(commonRoot)+1, MaxInt));
    end;
    ZipMaster.RootDir := commonRoot;
    ZipMaster.AddOptions := [AddDirNames, AddRecurseDirs];
    if APath <> '' then
    begin
      droproot:= APath;
      ZipMaster.OnSetNewName := ChangePath;
    end;  
    ZipMaster.Add;
  finally
    ZipMaster.Free;
  end;
  // reread - no optimization, we have to get the details of the added files
  i := 0;
  while (i < FCount) and not (AnsiSameText(Containers[i].FFileName, AFileName)) do Inc(i);
  Containers[i].Load(AFileName);
end;

{------------------------------------------------------------------------------}
procedure TContentManager.DeleteFiles(const AFileName: String; AFileList: TStringList);
var
  ZipMaster: TZipMaster;
  i: Integer;
begin
  ZipMaster := TZipMaster.Create(nil);
  try
    ZipMaster.ZipFileName := AFileName;
    for i := 0 to AFileList.Count - 1 do
    begin
      if self.EnumFirstChild(AFileName, AFileList[i]) <> nil then
        ZipMaster.FSpecArgs.Add(AFileList[i] + '\*.*')
      else
        ZipMaster.FSpecArgs.Add(AFileList[i])
    end;
    ZipMaster.Delete;
  finally
    ZipMaster.Free
  end;
  // reread - could be optimized with a ContenTree.Delete method
  i := 0;
  while (i < FCount) and not (AnsiSameText(Containers[i].FFileName, AFileName)) do Inc(i);
  Containers[i].Load(AFileName);
end;

{------------------------------------------------------------------------------}
function TContentManager.GetContainer(const AFileName: String): TContainer;
  var i: Integer;
begin
  i := 0;
  while (i < FCount) and not (AnsiSameText(Containers[i].FFileName, AFileName)) do Inc(i);
  // set some MRU info ?
  // if no more room we can replace on mixed FIFO and/or MRU base
  if i < FCount then
    Result := Containers[i]
  else begin
    if FCount < FMax then
    begin
      Inc(FCount);
      SetLength(Containers, FCount);
      Containers[FCount-1] := TContainer.Create;
      Containers[FCount-1].Load(AFileName);
      Result := Containers[FCount-1];
    end
    else begin
      Containers[FReplacePos].Load(AFileName);
      Result := Containers[FReplacePos];
      Inc(FReplacePos);
      if FReplacePos = FMax Then
        FReplacePos := 0;
    end;
  end;
end;

{------------------------------------------------------------------------------}
function TContentManager.EnumFirstChild(const AFileName, APath: String): TContentInfo;
begin
  Result := GetContainer(AFileName).ContentTree.GetFirstChild(APath);
end;

{------------------------------------------------------------------------------}
function TContentManager.EnumNextChild(const AFileName: String): TContentInfo;
begin
  Result := GetContainer(AFileName).ContentTree.GetNextChild;
end;

{------------------------------------------------------------------------------}
procedure TContentManager.Execute(const AFileName, APath: String);
  var path: String;
begin
  Screen.Cursor := crAppStart;
  try
    path := GetSystemTemp;
    with TZipMaster.Create(nil) do
    try
      ZipFileName :=AFileName;
      FSpecArgs.Clear;
      FSpecArgs.Add(APath);
      ExtrBaseDir := path;
      ExtrOptions := [ExtrOverwrite]; // ExtrDirNames
      Extract;
      path := path + ExtractFileName(APath);
      // make it readonly so user cannot edit it
      FileSetAttr(path, faReadOnly);
      // to cleanup on close:
      // tempFiles.Add(path);
    finally
      Free;
    end;
    ShellExecute(Application.Handle, 'open', pChar(path), '', nil, SW_NORMAL);
  finally
    Screen.Cursor := crDefault;
  end;
end;

{------------------------------------------------------------------------------}
procedure TContentManager.ExtractFiles(
  const AFileList: TStringList; const DestinationRoot: String);
  var ZipMaster: TZipMaster;
begin
  ZipMaster := TZipMaster.Create(nil);
  try
    // we still must do some renaming ... (path trimming)
    ZipMaster.FSpecArgs.Assign(AFileList);
    ZipMaster.ExtrBaseDir := DestinationRoot;
    ZipMaster.Extract;
  finally
    ZipMaster.Free;
  end;
end;

{------------------------------------------------------------------------------}
function TContentManager.GetContentInfo(const AFileName, APath: String): TContentInfo;
begin
  Result := GetContainer(AFileName).ContentTree.Find(APath);
end;

{------------------------------------------------------------------------------}

procedure TContentManager.PrepareShellDrag(const AFileName, APath: String; AFileList: TStringList);
  var tempRoot, trimmedPath: String; p, i: Integer;
begin
  // best would be to rename on extract but DelphiZip does not provide this possibility
  // so we have rename after extraction
  Screen.Cursor := crAppStart;
  try
    tempRoot := 'C:\temp\'; //GetSystemTemp;
    with TZipMaster.Create(nil) do
    try
      ZipFileName := AFileName;
      FSpecArgs.Assign(AFileList);
      ExtrBaseDir := tempRoot;
      ExtrOptions := [ExtrOverwrite, ExtrDirNames];
      Extract;

      for i := 0 to AFileList.count - 1 do
      begin
        p := Pos('\*.*', AFileList[i]);
        if p > 0 then // it is a folder
        begin
          AFileList[i] := Copy(AFileList[i], 1, p-1);
          trimmedPath := Copy(AFileList[i], Length(APath) + 1, MaxInt);
          if APath <> '' then
            MoveDirectory(tempRoot + AFileList[i], tempRoot + trimmedPath);
          AFileList[i] := tempRoot + trimmedPath;
        end
        else begin
          RenameFile(tempRoot + AFileList[i], ExtractFilename(AFileList[i]));
          AFileList[i] := tempRoot + ExtractFilename(AFileList[i]);
        end;
      end;
      if APath <> '' then
        DeleteDirectory(tempRoot + APath);
      // tempFiles.Add(path);
    finally
      Free;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

{------------------------------------------------------------------------------}
procedure TContentManager.SetMax(value: Integer);
begin
  FMax := value;
  if Length(Containers) > FMax then
    SetLength(Containers, FMax);
end;

{------------------------------------------------------------------------------}
initialization
  ContentManager := TContentManager.Create;

finalization
  ContentManager.Free;

end.
