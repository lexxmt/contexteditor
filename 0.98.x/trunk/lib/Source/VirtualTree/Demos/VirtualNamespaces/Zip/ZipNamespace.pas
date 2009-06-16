unit ZipNamespace;

// under construction

// todo
//   drag and drop: zip extract, zip to zip, move inside zip
//   show zip in zip
//  rename

//  optimize and bug fixes
//  compatibility issues other delphi versions

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ShlObj, Forms, 
  ShellAPI, ActiveX, VirtualPIDLTools, VirtualShellUtilities,
  VirtualNamespace, VirtualShellTypes, VirtualUtilities, VirtualExplorerTree,
  VirtualDataObject, 
  ContentMngr;

const
  SID_INamespaceZip = '{0586974C-9A32-4729-8642-3963AFEF2995}';

  IID_INamespaceZip: TGUID = SID_INamespaceZip;

type
  TPIDLZip = class(TItemID)
  private
    FIsFolder: Boolean;
    FHasFolders: Boolean;
    FCompressedSize: Integer;
    FUnCompressedSize: Integer;
    FDate: Integer;
    FAttributes: Word;
    FIsArchiveFile: Boolean;
  public
    procedure LoadPIDLStream(S: TStream); override;
    procedure SavePIDLStream(S: TStream); override;
    property IsFolder: Boolean read FIsFolder write FIsFolder;
    property HasFolders: Boolean read FHasFolders write FHasFolders;
    property CompressedSize: Integer read FCompressedSize write FCompressedSize;
    property UnCompressedSize: Integer read FUnCompressedSize write FUnCompressedSize;
    property Date: Integer read FDate write FDate;
    property Attributes: Word read FAttributes write FAttributes;
  end;

  TNamespaceZip  = class(TBaseVirtualNamespaceExtension)
  private
    FPIDLZip1: TPIDLZip;  // Helper 1
    FPIDLZip2: TPIDLZip;  // Helper 2
    ContentInfo: TContentInfo;
    PIDLMngr: TPIDLManager;
    procedure Getdata(Sender: TObject; const FormatEtcIn: TFormatEtc;
      var Medium: TStgMedium; var Handled: Boolean);
  protected
    function Attributes(ChildPIDLList: TPIDLList; Attribs: TFolderAttributes): TFolderAttributes; override;
    function CompareItems(ColumnToCompare: integer; ChildPIDL1, ChildPIDL2: PItemIDList): ShortInt; override;
    function CreateIContextMenu(ChildPIDLs: TPIDLList): IContextMenu; override;
    function CreateIDataObject(ChildPIDLs: TPIDLList; ObjectRequestor: TDataObjectType): IDataObject; override;
    function CreateIDropTarget(ChildPIDLs: TPIDLList): IDropTarget; override;
    function CreateIDropTarget: IDropTarget; override;
    function CreateItemID: TItemID; override;
    function CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails; override;
    procedure DisplayName(ChildPIDL: PItemIDList; NameType: TDisplayNameFlags; var StrRet: TStrRet); override;
    function EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function GetSupportedInterfaces: TSupportedInterfaces; override;
    procedure IconIndex(ChildPIDL: PItemIDList; IconStyle: TVirtualIconFlags; var IconIndex: integer); override;
    function RetrieveClassID: TCLSID; override;

  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TContextMenuZip = class(TVirtualIContextMenu)
  private
    FPIDLZip1: TPIDLZip;
    PIDLMngr: TPIDLManager;
  public
    constructor Create(AParentPIDL: PItemIDList; APIDLs: TPIDLList); override;
    destructor Destroy; override;
    function FillMenu(Menu: HMenu; FirstItemIndex, ItemIdFirst, ItemIDLast: Longword; MenuFlags: TContextMenuFlags): Boolean; override;
    function Invoke(Window: HWnd; InvokeInfo: TCMInvokeCommandInfoEx): Boolean; override;
    // property HelperPIDL: TPIDLZip read FPIDLZip1 write FPIDLZip1;
  end;

  TShellDetailsZip = class(TVirtualIShellDetails)
  private
     FPIDLZip1: TPIDLZip;
  public
    constructor Create;
    destructor Destroy; override;
    function GetColumnCount: Cardinal; override;
    function GetColumnDetails(ChildPIDL: PItemIDList; ColumnIndex: integer): WideString; override;
    function GetColumnTitle(ColumnIndex: integer): WideString; override;
    property HelperPIDL: TPIDLZip read FPIDLZip1 write FPIDLZip1;
  end;

  TDropTargetZip = class(TVirtualIDropTarget)
  private
    FAccept: Boolean;
    FSelfDrop: Boolean;
    FPIDLZip1: TPIDLZip;
  public
    procedure Drag_Enter(const DataObject: IDataObject; KeyState: TVirtualDropKeyStates;
      Point: TPoint; var DropEffect: TVirtualDropEffects); override;
    procedure Drag_Leave; override;
    procedure Drag_Over(KeyState: TVirtualDropKeyStates; Point: TPoint;
      var DropEffect: TVirtualDropEffects); override;
    procedure Drag_Drop(const DataObject: IDataObject; KeyState: TVirtualDropKeyStates;
      Point: TPoint; var DropEffect: TVirtualDropEffects); override;
  end;

(*
  // objects that contains the data we are dragging
  TDataObjectZip = class (TVirtualDataObject)
  public
    function GetUserData(Format: TFormatEtc; var StgMedium: TStgMedium): Boolean; override;
  end;
*)  


implementation

uses
  ArchivePropertiesFrm, Utilities;

{------------------------------------------------------------------------------}
{                                  TPIDLZip                                    }
{------------------------------------------------------------------------------}
procedure TPIDLZip.LoadPIDLStream(S: TStream);
begin
  inherited;
  S.Read(FIsFolder, SizeOf(FIsFolder));
  S.Read(FHasFolders, SizeOf(FHasFolders));
  S.Read(FCompressedSize, SizeOf(FCompressedSize));
  S.Read(FUnCompressedSize, SizeOf(FUnCompressedSize));
  S.Read(FDate, SizeOf(FDate));
  S.Read(FAttributes, SizeOf(FAttributes));
end;

procedure TPIDLZip.SavePIDLStream(S: TStream);
begin
  inherited;
  S.Write(FIsFolder, SizeOf(FIsFolder));
  S.Write(FHasFolders, SizeOf(FHasFolders));
  S.Write(FCompressedSize, SizeOf(FCompressedSize));
  S.Write(FUnCompressedSize, SizeOf(FUnCompressedSize));
  S.Write(FDate, SizeOf(FDate));
  S.Write(FAttributes, SizeOf(FAttributes));
end;

{------------------------------------------------------------------------------}
{                               TNamespaceZip                                  }
{------------------------------------------------------------------------------}
constructor TNamespaceZip.Create;
begin
  inherited;
  FPIDLZip1 := TPIDLZip.Create(IID_INamespaceZip);
  FPIDLZip2 := TPIDLZip.Create(IID_INamespaceZip);
  PIDLMngr := TPIDLManager.Create;
end;

{------------------------------------------------------------------------------}
destructor TNamespaceZip.Destroy;
begin
  FPIDLZip1.Free;
  FPIDLZip2.Free;
  PIDLMngr.Free;
  inherited;
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.Attributes(ChildPIDLList: TPIDLList;
  Attribs: TFolderAttributes): TFolderAttributes;
begin
  Result := [];
  FPIDLZip1.ItemID := ChildPIDLList.First;
  if (faFolder in Attribs) and (FPIDLZip1.FIsFolder) then
    Include(Result, faFolder);
  if (faHasSubFolder in Attribs) and (FPIDLZip1.FHasFolders) then
     Include(Result, faHasSubFolder);
  if (faDropTarget in Attribs) then
    Include(Result, faDropTarget);
  if (faDelete in Attribs) then
    Include(Result, faDelete);
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.CreateIContextMenu(ChildPIDLs: TPIDLList): IContextMenu;
begin
  // evt check the ChildPIDLs
  Result := TContextMenuZip.Create(AbsolutePIDL, ChildPIDLs) as IContextMenu
end;

{------------------------------------------------------------------------------}
procedure TNamespaceZip.Getdata(
  Sender: TObject; const FormatEtcIn: TFormatEtc; var Medium: TStgMedium; var Handled: Boolean);
begin
(*
  if FormatEtcIn.cfFormat = CF_HDROP then

  FormatEtcIn.ptd := nil;
  FormatEtcIn.dwAspect := DVASPECT_CONTENT;
  FormatEtcIn.lindex := -1;
  FormatEtcIn.tymed := TYMED_HGLOBAL;
*)
//  Medium.
  Handled := True;
end;


function TNamespaceZip.CreateIDataObject(
  ChildPIDLs: TPIDLList; ObjectRequestor: TDataObjectType): IDataObject;
var
  Path: String;
  HDrop: THDROP;
  PIDL: PItemIDList;
  i: Integer;
  NS: TNamespace;
  FileList: TStringList;
  Data: TVirtualDataObject;
begin
  // we must prepare for shell: files in temp folder
  // own namespace: same zip and other zip

  // ObjectRequestor: clipboard or drag - is there a diffrence for us ??

  FileList := TSTringList.Create;

    // get parent path
  Path := '';
  PIDL := PIDLMngr.CopyPIDL(AbsolutePIDL);
  while NamespaceExtensionFactory.IsVirtualPIDL(PIDL) do
  begin
    FPIDLZip1.ItemID := PIDL;
    Path := FPIDLZip1.InFolderNameASCII + '\' + path;
    PIDL := PIDLMngr.StripLastID(PIDL);
  end;

  // collect child(ren)
  for i := 0 to ChildPIDLs.Count - 1 do
  begin
    FPIDLZip1.ItemID := ChildPIDLs[i];
    if FPIDLZip1.FIsFolder then
      FileList.Add(Path + FPIDLZip1.InFolderNameASCII + '\*.*')
    else
      FileList.Add(Path + FPIDLZip1.InFolderNameASCII);
  end;

  // get archive
  NS := TNamespace.Create(PIDL, nil);

  // extract file to temp folder and return list of real names
  // or semi prepare
  ContentManager.PrepareShellDrag(NS.NameForParsing, Path, FileList);

  Data := TVirtualDataObject.Create;
  Result := Data as IDataObject;
  Data.OnGetData := GetData;

  // Result := TDataObjectZip.Create as IDataObject;
  HDrop := THDrop.Create;
  try
    HDrop.AssignFiles(FileList);
    HDrop.SaveToDataObject(Result)
  finally
    HDrop.Free;
    FileList.Free;
    FreeAndNil(NS);
  end;
end;
 {------------------------------------------------------------------------------}

{------------------------------------------------------------------------------}
function TNamespaceZip.CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails;
begin
  Result := TShelldetailsZip.Create as IShellDetails;
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.CreateIDropTarget(ChildPIDLs: TPIDLList): IDropTarget;
begin
  // Creating an IDropTarget on one or more children (using GetUIObjectOf)
  Result := TDropTargetZip.Create(AbsolutePIDL, ChildPIDLs) as IDropTarget 
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.CreateIDropTarget: IDropTarget;
begin
  // Creating an IDropTarget on the folder itself (using CreateViewObject)
  Result := TDropTargetZip.Create(AbsolutePIDL, nil) as IDropTarget
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.CreateItemID: TItemID;
begin
  Result := TPIDLZip.Create(IID_INamespaceZip)
end;

{------------------------------------------------------------------------------}
procedure TNamespaceZip.DisplayName(ChildPIDL: PItemIDList;
  NameType: TDisplayNameFlags; var StrRet: TStrRet);
begin
  StrRet.uType := STRRET_OFFSET;
  StrRet.uOffset := InFolderNameASCII_Offset
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.CompareItems(ColumnToCompare: integer; ChildPIDL1,
  ChildPIDL2: PItemIDList): ShortInt;
begin
  FPIDLZip1.ItemID := ChildPIDL1;
  FPIDLZip2.ItemID := ChildPIDL2;
  if (FPIDLZip1.FIsFolder) and not (FPIDLZip2.FIsFolder) then
    Result := -1
  else
  if not (FPIDLZip1.FIsFolder) and (FPIDLZip2.FIsFolder) then
    Result := 1
  else
    Result := ShortInt(CompareText(FPIDLZip1.InFolderNameASCII, FPIDLZip2.InFolderNameASCII));
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  path:  String; validEntry: Boolean;
  NS: TNamespace; PIDL: PItemIDList;
begin
  Result := nil;
  PIDL := PIDLMngr.CopyPIDL(AbsolutePIDL);
  path := '';
  while NamespaceExtensionFactory.IsVirtualPIDL(PIDL) do
  begin
    FPIDLZip1.ItemID := PIDL;
    path := FPIDLZip1.InFolderNameASCII + '\' + path;
    PIDL := PIDLMngr.StripLastID(PIDL);
  end;
  NS := TNamespace.Create(PIDL, nil);
  try
    ContentInfo := ContentManager.EnumFirstChild(NS.NameForParsing, path);
    if ContentInfo = nil then Exit;
    validEntry := (ContentInfo.IsFolder and (fefFolders in EnumFlags)) or
                  (not ContentInfo.IsFolder and (fefNonFolder in EnumFlags));
    while not validEntry do
    begin
      ContentInfo := ContentManager.EnumNextChild(NS.NameForParsing);
      if ContentInfo = nil then Exit;
      validEntry := (ContentInfo.IsFolder and (fefFolders in EnumFlags)) or
                    (not ContentInfo.IsFolder and (fefNonFolder in EnumFlags));
    end;
    FPIDLZip1.Clear;
    FPIDLZip1.InFolderNameASCII := ContentInfo.Name;
    FPIDLZip1.FIsFolder := ContentInfo.IsFolder;
    FPIDLZip1.FHasFolders := ContentInfo.HasFolders;
    FPIDLZip1.FCompressedSize := ContentInfo.CompressedSize;
    FPIDLZip1.FUnCompressedSize := ContentInfo.UnCompressedSize;
    FPIDLZip1.FDate := ContentInfo.Date;
    Result := FPIDLZip1.ItemID;
  finally
    FreeAndNil(NS);
  end;
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  PIDL: PItemIDList; NS: TNamespace; validEntry: Boolean;
begin
  Result := nil;
  PIDL := PIDLMngr.CopyPIDL(AbsolutePIDL);
  while NamespaceExtensionFactory.IsVirtualPIDL(PIDL) do
    PIDL := PIDLMngr.StripLastID(PIDL);
  NS := TNamespace.Create(PIDL, nil);
  try
    repeat
      ContentInfo := ContentManager.EnumNextChild(NS.NameForParsing);
      if ContentInfo = nil then Exit;
      validEntry := (ContentInfo.IsFolder and (fefFolders in EnumFlags)) or
                    (not ContentInfo.IsFolder and (fefNonFolder in EnumFlags));
    until validEntry; {or exit}
    FPIDLZip1.InFolderNameASCII := ContentInfo.Name;
    FPIDLZip1.FIsFolder := ContentInfo.IsFolder;
    FPIDLZip1.FHasFolders := ContentInfo.HasFolders;
    FPIDLZip1.FCompressedSize := ContentInfo.CompressedSize;
    FPIDLZip1.FUnCompressedSize := ContentInfo.UnCompressedSize;
    FPIDLZip1.FDate := ContentInfo.Date;
    Result := FPIDLZip1.ItemID;
  finally
    FreeAndNil(NS);
  end;
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.GetSupportedInterfaces: TSupportedInterfaces;
begin
  Result := [siIShellDetails, siIContextMenu, siIDropTarget, siIDataObject];
end;

{------------------------------------------------------------------------------}
procedure TNamespaceZip.IconIndex(ChildPIDL: PItemIDList;
             IconStyle: TVirtualIconFlags; var IconIndex: integer);
var
  FileAttrib: DWord; Info: TSHFileInfo; Flags: Longword;
begin
  FPIDLZip1.ItemID := ChildPIDL;
  if FPIDLZip1.FIsFolder then
    FileAttrib := FILE_ATTRIBUTE_DIRECTORY
  else
    FileAttrib := FILE_ATTRIBUTE_NORMAL;
  Flags := SHGFI_SHELLICONSIZE Or SHGFI_SYSICONINDEX Or SHGFI_USEFILEATTRIBUTES;
  SHGetFileInfo(PChar(FPIDLZip1.InFolderNameASCII), FileAttrib, Info, SizeOf(Info), Flags);
  IconIndex := Info.iIcon;
end;

{------------------------------------------------------------------------------}
function TNamespaceZip.RetrieveClassID: TCLSID;
begin
  Result := IID_INamespaceZip
end;

{------------------------------------------------------------------------------}
{                            TContextMenuZip                               }
{------------------------------------------------------------------------------}
constructor TContextMenuZip.Create(AParentPIDL: PItemIDList; APIDLs: TPIDLList);
// we get the parent PIDL in AParentPIDL and the children in APIDLs (no path)
var
  path: String; count, i: Integer;
  PIDL: PItemIDList;
begin
  inherited;
  count := APIDLs.Count;
  PIDLMngr := TPIDLManager.Create;
  FPIDLZip1 := TPIDLZip.Create(IID_INamespaceZip);


{
  for i := 0 to count -1 do
  begin
   // InvokedPIDL := PIDLMngr.CopyPIDL(APIDLs[0]);
    FPIDLZip1.ItemID := APIDLs[i]; // ChildPIDLs[0];
    path := FPIDLZip1.InFolderNameASCII;
  end;
  (*
  FPIDLZip1.ItemID := AParentPIDL; // ChildPIDLs[0];
  path := FPIDLZip1.InFolderNameASCII;
  *)
  path := '';
  PIDL :=  PIDLMngr.CopyPIDL(APIDLs[0]);
  while NamespaceExtensionFactory.IsVirtualPIDL(PIDL) do
  begin
    FPIDLZip1.Clear;
    FPIDLZip1.ItemID := PIDL;
    if path = '' then
      path := FPIDLZip1.InFolderNameASCII
    else
      path := FPIDLZip1.InFolderNameASCII + '\' + path;
      PIDL := PIDLMngr.StripLastID(PIDL);
    end;
}    
end;

{------------------------------------------------------------------------------}
destructor TContextMenuZip.Destroy;
begin
  PIDLMngr.Free;
  FPIDLZip1.Free;
  inherited;
end;

{------------------------------------------------------------------------------}
function TContextMenuZip.FillMenu(Menu: HMenu; FirstItemIndex,
  ItemIdFirst, ItemIDLast: Longword;
  MenuFlags: TContextMenuFlags): Boolean;
var
   ItemInfo: TMenuItemInfo;
begin
  AddMenuItem(Menu, ItemidFirst, 'Properties', 'zip_properties', 'View file properties');
  AddMenuItemDivider(Menu);
  AddMenuItem(Menu, ItemidFirst + 1, 'Delete', 'delete', 'Delete file');
  AddMenuItem(Menu, ItemidFirst + 2, 'Open', 'zip_open', 'View or execute file');
  FillChar(ItemInfo, SizeOf(ItemInfo), #0);
  ItemInfo.cbSize := SizeOf(TMenuItemInfo);
  ItemInfo.fMask := MIIM_STATE;
  ItemInfo.fState := MFS_DEFAULT;
  SetMenuItemInfo(Menu, 0, True, ItemInfo);
  Result := True;
end;

{------------------------------------------------------------------------------}
function TContextMenuZip.Invoke(Window: HWnd; InvokeInfo: TCMInvokeCommandInfoEx): Boolean;
var
  Item: TVirtualContextMenuItem;
  VerbInvoked: Boolean;
  ratio: Integer;
  path:  String;
  PIDL: PItemIDList; NS: TNamespace;
  ContentInfo: TContentInfo;
  FileList: TSTringList;
  i: Integer;
begin
  Result := False;
  Item := FindMenuItemByInvokeInfo(InvokeInfo, VerbInvoked);

  if Assigned(Item) then
  begin
    FileList := TSTringList.Create;

    // get parent path
    path := '';
    PIDL :=  PIDLMngr.CopyPIDL(ParentPIDL);
    while NamespaceExtensionFactory.IsVirtualPIDL(PIDL) do
    begin
      FPIDLZip1.ItemID := PIDL;
      path := FPIDLZip1.InFolderNameASCII + '\' + path;
      PIDL := PIDLMngr.StripLastID(PIDL);
    end;

    // collect child(ren)
    for i := 0 to ChildPIDLs.Count - 1 do
    begin
      FPIDLZip1.ItemID := ChildPIDLs[i];
      FileList.Add(Path + FPIDLZip1.InFolderNameASCII);
    end;

    // get archive
    NS := TNamespace.Create(PIDL, nil);
    try
      if Item.Verb = 'zip_open' then
        ContentManager.Execute(NS.NameForParsing, FileList[0])
      else if Item.Verb = 'delete' then
      begin
        Screen.Cursor :=crHourGlass;
        try
          ContentManager.DeleteFiles(Ns.NameForParsing, FileList);
          SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_IDLIST, ParentPIDL, ParentPIDL);
//          NamespaceExtensionFactory.ChangeNotify(SHCNE_UPDATEDIR, ParentPIDL, ParentPIDL);
        finally
          Screen.Cursor := crDefault;
        end
      end
      else if Item.Verb = 'zip_properties' then
      begin
        with TArchivePropertiesForm.Create(nil) do
        begin
          ContentInfo := ContentManager.GetContentInfo(NS.NameForParsing, FileList[0]);
          Caption := ContentInfo.Name + ' Properties';
          imIcon.Picture.Icon.handle := GetLargeFileIcon(ContentInfo.Name);
          fpName.Caption := ContentInfo.Name;
          if ContentInfo.IsFolder then
            fpType.Caption := 'Folder'
          else
            fpType.Caption := GetFileType(ContentInfo.Name);
          fpPath.Caption := ExtractFilePath(path);
          fpSize.Caption := MakeSizeString(ContentInfo.UncompressedSize);
          fpPackedSize.Caption := MakeSizeString(ContentInfo.CompressedSize);
          if ContentInfo.CompressedSize = 0 then
            ratio := 0
          else
            ratio := (ContentInfo.CompressedSize * 100) DIV ContentInfo.UncompressedSize;
          fpRatio.Caption := IntToStr(ratio) + ' % of original';
          gauge.Progress := ratio;
          if ContentInfo.Date = 0 then
            fpModified.Caption := '-'
          else
            fpModified.Caption := DateTimeToStr(FileDateToDateTime(ContentInfo.Date));
          fpCRC.Caption := format('%x', [ContentInfo.CRC]);
          Show;
        end;
      end;
      Result := True;
    finally
      FreeAndNil(NS);
      FileList.Free;
    end
  end;
end;

{------------------------------------------------------------------------------}
{                               TShellDetailsZip                               }
{------------------------------------------------------------------------------}
constructor TShellDetailsZip.Create;
begin
  FPIDLZip1 := TPIDLZip.Create(IID_INamespaceZip);
end;

{------------------------------------------------------------------------------}
destructor TShellDetailsZip.Destroy;
begin
  FPIDLZip1.Free;
  inherited;
end;

{------------------------------------------------------------------------------}
function TShellDetailsZip.GetColumnCount: Cardinal;
begin
  Result := 4; // 5 with Attributes
end;

{------------------------------------------------------------------------------}
function TShellDetailsZip.GetColumnDetails(ChildPIDL: PItemIDList;
  ColumnIndex: integer): WideString;
begin
  FPIDLZip1.ItemID := ChildPIDL;
  Result := '';
  case ColumnIndex of
    0: Result := FPIDLZip1.InFolderNameASCII;
    1: if FPIDLZip1.FUnCompressedSize > 0 then
         Result := MakeSizeString(FPIDLZip1.FUnCompressedSize)
       else
         Result := '';
    2: if FPIDLZip1.IsFolder then
           Result := 'Folder'
        else
          Result := GetFileType(FPIDLZip1.InFolderNameASCII);
    3: if FPIDLZip1.Date > 0 then
         Result := DateTimeToStr(FileDateToDateTime(FPIDLZip1.Date))
       else
         Result := '';
    4: Result := MakeAttributeString(FPIDLZip1.Attributes);
  end;
end;

{------------------------------------------------------------------------------}
function TShellDetailsZip.GetColumnTitle(ColumnIndex: integer): WideString;
begin
  case ColumnIndex of
    0: Result := 'Name';
    1: Result := 'Size';
    2: Result := 'Type';
    3: Result := 'Modified';
    4: Result := 'Attributes';
  end;
end;

{------------------------------------------------------------------------------}
{                                TDropTargetZip                                }
{------------------------------------------------------------------------------}
procedure TDropTargetZip.Drag_Drop(const DataObject: IDataObject;
  KeyState: TVirtualDropKeyStates; Point: TPoint;
  var DropEffect: TVirtualDropEffects);
var
  HDrop: THDROP;
  FileList: TStringList;
  NS: TNameSpace;
  PIDL: PItemIDList;
  PIDLMngr: TPIDLManager;
  path: String; // relative path in zip file

  FGD: TFileGroupDescriptorW;
  i, Size: Integer;
  Stream: TStream;
  Descriptor: TFileDescriptorW;


begin
  // JIM
  FGD := TFileGroupDescriptorW.Create;
  FGD.LoadFromDataObject(DataObject);
  Stream := TFileStream.Create('c:\Junk.txt', fmCreate or fmShareExclusive);
  for i := 0 to FGD.DescriptorCount - 1 do
  begin
    Descriptor := FGD.FileDescriptor[i];
    // The Stream gotten from the IDataObject does on implement IStream.Seek so
    // we have to get its size from the Descriptor.
    Stream.CopyFrom(FGD.GetFileStream(DataObject, i), Descriptor.nFileSizeLow);
  end;
  FGD.Free;
  Stream.Free;
  // JIM



  PIDLMngr := TPIDLManager.Create;
  if FSelfDrop then
  begin
    path := '';
    NS := TNamespace.Create(PIDLMngr.CopyPIDL(ParentPIDL), nil);
  end
  else begin
    FPIDLZip1.ItemID := ChildPIDLs[0]; // ChildPIDLs.Count-1]; //
    // get relative path in zip file
    path := FPIDLZip1.InFolderNameASCII;
    PIDL :=  PIDLMngr.CopyPIDL(ParentPIDL);
    while NamespaceExtensionFactory.IsVirtualPIDL(PIDL) do
    begin
     //  FPIDLZip1.Clear;
      FPIDLZip1.ItemID := PIDL;
      path := FPIDLZip1.InFolderNameASCII + '\' + path;
      PIDL := PIDLMngr.StripLastID(PIDL);
    end;
    NS := TNamespace.Create(PIDL, nil);
  end;

  // get the dropped files
  HDrop := THDrop.Create;
  try
    FileList := TStringList.Create;
    HDrop.LoadFromDataObject(DataObject);
    HDrop.FileNames(FileList);
    ContentManager.AddFiles(NS.NameForParsing, path, FileList);

//    SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_IDLIST, ParentPIDL, ParentPIDL);
    NamespaceExtensionFactory.ChangeNotify(SHCNE_UPDATEDIR, ParentPIDL, ParentPIDL);

   // inofrm if moved
    if vdksShift in KeyState then
      DropEffect := [vdeMove]

  finally
    HDrop.Free;
    PIDLMngr.Free;
  end;
end;

{------------------------------------------------------------------------------}
procedure TDropTargetZip.Drag_Enter(const DataObject: IDataObject;
  KeyState: TVirtualDropKeyStates; Point: TPoint;
  var DropEffect: TVirtualDropEffects);
var
  FormatEtc: TFormatEtc;
begin
  // This will be called once while dragover will be called many time
  // to speed up we could calculate parameters here that remain constant during the
  // dragover and save them (keystate does not remain constant)
  FormatEtc.cfFormat := CF_HDROP;
  FormatEtc.ptd := nil;
  FormatEtc.dwAspect := DVASPECT_CONTENT;
  FormatEtc.lindex := -1;
  FormatEtc.tymed := TYMED_HGLOBAL;
  FAccept := Succeeded(DataObject.QueryGetData(FormatEtc));


  FAccept := True;


  // check here the formats, if we will accept the drop


  // Self drop means the object was created in a CreateViewObject interface call
  // and not a GetUIObjectOf.  The difference is CreateViewObject means get an
  // object of the current item and not one of its children.
  if FAccept then
  begin
    FSelfDrop := Self.ChildPIDLs.Count = 0;
    if not FSelfDrop then
    begin
      FPIDLZip1 := TPIDLZip.Create(IID_INamespaceZip);
      FPIDLZip1.ItemID := self.ChildPIDLs[0];
    end;
  end;
end;

{------------------------------------------------------------------------------}
procedure TDropTargetZip.Drag_Leave;
begin
  if FAccept and not FSelfDrop then
    FPIDLZip1.Free;
end;

{------------------------------------------------------------------------------}
procedure TDropTargetZip.Drag_Over(KeyState: TVirtualDropKeyStates;
  Point: TPoint; var DropEffect: TVirtualDropEffects);
begin
  if FAccept and (FSelfDrop or FPIDLZip1.FIsFolder) then
  begin
      //  if in same tree use vdksControl ?
    if vdksShift in KeyState then
      DropEffect := [vdeMove]
    else
      DropEffect := [vdeCopy];
  end
  else
    DropEffect := [vdeNone];
end;

initialization
  NamespaceExtensionFactory.RegisterNamespaceExtension(
    TNamespaceZip, IID_INamespaceZip, TNamespaceZip, IID_INamespaceZip);

end.



