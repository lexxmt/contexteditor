unit FTPNamespace;

interface

{$include ..\..\Include\VSToolsAddIns.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ImgList, ShlObj,
  ShellAPI, ActiveX, ComObj, VirtualPIDLTools, VirtualShellUtilities,
  VirtualNamespace, IdFTPList, IniFiles, VirtualShellTypes, IdFTP, IdURI,
  IdFTPCommon, HostPropsForm;


const
  FTPSITE_FILE = '.\Virtual FTP Explorer\FTPSiteFile.ini';
  FTPSITE_SECTION = 'FTPSites';     // INI file Section header
  FTPSITEDESC_SECTION = 'Descriptions'; // INI file Section Description header
  FTPUSERNAME_SECTION = 'UserNames'; // INI file Section UserName header
  FTPPASSWORD_SECTION = 'Passwords'; // INI file Section UserName header

  SID_IFtpHook = '{D186534D-9E0F-4357-B8DB-CF7945B18D43}';
  SID_IFtpHost = '{B0843767-F3DA-4896-8A48-3B151468CAB3}';
  SID_IFtpFolder = '{A2A2DB96-9919-4311-BC60-5D3A5B011A7F}';

  IID_IFtpHooK: TGUID = SID_IFtpHooK;
  IID_IFtpHost: TGUID = SID_IFtpHost;
  IID_IFtpFolder: TGUID = SID_IFtpFolder;

type

  TFtpHook = class;             // forward

  TFtpHookPIDL = class(TItemID)
  public
    procedure LoadPIDLStream(S: TStream); override;
    procedure SavePIDLStream(S: TStream); override;
  end;

  TFtpVirtualExplorerPIDL = class(TItemID)
  end;

  TFtpHostPIDL = class(TItemID)
  private
    FDescription: string;
    FUserName: string;
    FPassword: string;
  public
    procedure Clear; override;
    procedure LoadPIDLStream(S: TStream); override;
    procedure SavePIDLStream(S: TStream); override;

    property Description: string read FDescription write FDescription;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
  end;

  TFtpFolderPIDL = class(TItemID)
  private
    FIdFTPItem: TIdFTPListItem;
    FFTPPath: string;
    FHost: string;
  public
    constructor Create(AClassID: TGUID); override;
    destructor Destroy; override;

    procedure Clear; override;
    procedure LoadPIDLStream(S: TStream); override;
    procedure SavePIDLStream(S: TStream); override;

    property IdFTPItem: TIdFTPListItem read FIdFTPItem write FIdFTPItem;
    property Host: string read FHost write FHost;
    property FTPPath: string read FFTPPath write FFTPPath;
  end;

  TFtpSiteHelper = class
  private
    FFTPHosts: TStringList;
    FSiteDescriptions: TStringList;
    FSitesLoaded: Boolean;
    FUserNames: TStringList;
    FPasswords: TStringList;
  protected
    procedure AddNewHost(Host, UserName, Password, Description: string);
    procedure DeleteHost(Host: string);
    procedure EditHost(Host, UserName, Password, Description: string);
    procedure LoadHosts(Refresh: Boolean);
    procedure WriteHosts;

    property FTPHosts: TStringList read FFTPHosts write FFTPHosts;
    property SiteDescriptions: TStringList read FSiteDescriptions write FSiteDescriptions;
    property UserNames: TStringList read FUserNames write FUserNames;
    property Passwords: TStringList read FPasswords write FPasswords;
    property SitesLoaded: Boolean read FSitesLoaded write FSitesLoaded;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  // The TFtpHook will create these objects to implement IShellDetails for the
  // TFtpHost objects it creates as children
  TFtpHostDetails = class(TVirtualIShellDetails)
  private
    FPIDLHelper: TFtpHostPIDL;
  public
    constructor Create;
    destructor Destroy; override;

    function GetColumnCount: Cardinal; override;
    function GetColumnDetails(ChildPIDL: PItemIDList; ColumnIndex: integer): WideString; override;
    function GetColumnTitle(ColumnIndex: integer): WideString; override;

    property PIDLHelper: TFtpHostPIDL read FPIDLHelper write FPIDLHelper;
  end;

  // The TFtpHost will create these objects to implement IContextMenu for the
  // objects it creates as children
  TFtpHostContextMenu = class(TVirtualIContextMenu)
  private
    FHelperPIDL: TFtpHostPIDL;
  public
    constructor Create(AParentPIDL: PItemIDList; APIDLs: TPIDLList); override;
    destructor Destroy; override;

    function FillMenu(Menu: HMenu; FirstItemIndex, ItemIdFirst, ItemIDLast: Longword; MenuFlags: TContextMenuFlags): Boolean; override;
    function Invoke(Window: HWnd; InvokeInfo: TCMInvokeCommandInfoEx): Boolean; override;

    property HelperPIDL: TFtpHostPIDL read FHelperPIDL write FHelperPIDL;
  end;

  TFtpHook = class(TBaseVirtualNamespaceExtension)
  private
    FFTPHostPIDL1: TFtpHostPIDL;
    FFTPHostPIDL2: TFtpHostPIDL;
    FSiteEnumCount: Integer;
  protected
    function Attributes(ChildPIDLList: TPIDLList; Attribs: TFolderAttributes): TFolderAttributes; override;
    function CompareItems(ColumnToCompare: integer; ChildPIDL1, ChildPIDL2: PItemIDList): ShortInt; override;
    function CreateIContextMenu(ChildPIDLs: TPIDLList): IContextMenu; override;
    function CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails; override;
    function CreateItemID: TItemID; override;  // must override abstract methods
    procedure DisplayName(ChildPIDL: PItemIDList; NameType: TDisplayNameFlags; var StrRet: TStrRet); override;
    function EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function GetSupportedInterfaces: TSupportedInterfaces; override;
    procedure IconIndex(ChildPIDL: PItemIDList; IconStyle: TVirtualIconFlags; var IconIndex: integer); override;
    function RetrieveClassID: TCLSID; override;

    property SiteEnumCount: Integer read FSiteEnumCount write FSiteEnumCount;
  public
    constructor Create; override;
    destructor Destroy; override;

    // We need to maniuplate and help the child objects we create which are TFtpHost PIDLs
    property FTPHostPIDL1: TFtpHostPIDL read FFTPHostPIDL1 write FFTPHostPIDL1;
    property FTPHostPIDL2: TFtpHostPIDL read FFTPHostPIDL2 write FFTPHostPIDL2;
  end;


  // The TFtpHost will create these objects to implement IShellDetails for the
  // TFtpFolder objects it creates as children
  TFtpFolderDetails = class(TVirtualIShellDetails)
  private
    FPIDLHelper: TFtpFolderPIDL;
  public
    constructor Create;
    destructor Destroy; override;

    function GetColumnCount: Cardinal; override;
    function GetColumnDetails(ChildPIDL: PItemIDList; ColumnIndex: integer): WideString; override;
    function GetColumnTitle(ColumnIndex: integer): WideString; override;

     property PIDLHelper: TFtpFolderPIDL read FPIDLHelper write FPIDLHelper;
  end;

  // The TFtpHost will create these objects to implement IContextMenu for the
  // objects it creates as children
  TFtpFolderContextMenu = class(TVirtualIContextMenu)
  public
    function FillMenu(Menu: HMenu; FirstItemIndex, ItemIdFirst, ItemIDLast: Longword; MenuFlags: TContextMenuFlags): Boolean; override;
    function Invoke(Window: HWnd; InvokeInfo: TCMInvokeCommandInfoEx): Boolean; override;
  end;

  TFtpHost = class(TBaseVirtualNamespaceExtension)
    private
    FSiteEnumCount: Integer;
    FFolderPIDL1: TFtpFolderPIDL;   // General Use PIDL helper
    FFolderPIDL2: TFtpFolderPIDL;
    FListing: TStringList;
    FListingRetrieved: Boolean;
    FEnumCount: Integer;
    FFTPListItems: TIdFTPListItems;
    FHostPIDL: TFtpHostPIDL;   // General Use PIDL helper
  protected
    function Attributes(ChildPIDLList: TPIDLList; Attribs: TFolderAttributes): TFolderAttributes; override;
    function CompareItems(ColumnToCompare: integer; ChildPIDL1, ChildPIDL2: PItemIDList): ShortInt; override;
    function CreateIContextMenu(ChildPIDLs: TPIDLList): IContextMenu; override;
    function CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails; override;
    function CreateItemID: TItemID; override;  // must override abstract methods
    procedure DisplayName(ChildPIDL: PItemIDList; NameType: TDisplayNameFlags; var StrRet: TStrRet); override;
    function EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function GetSupportedInterfaces: TSupportedInterfaces; override;
    procedure IconIndex(ChildPIDL: PItemIDList; IconStyle: TVirtualIconFlags; var IconIndex: integer); override;
    function RetrieveClassID: TCLSID; override;  // must override abstract methods
    procedure RetrieveListing(Host, Path, UserName, Password: string; Force: Boolean);

    property EnumCount: Integer read FEnumCount write FEnumCount;
    property FolderPIDL1: TFtpFolderPIDL read FFolderPIDL1 write FFolderPIDL1;
    property FolderPIDL2: TFtpFolderPIDL read FFolderPIDL2 write FFolderPIDL2;
    property FTPListItems: TIdFTPListItems read FFTPListItems write FFTPListItems;
    property HostPIDL: TFtpHostPIDL read FHostPIDL write FHostPIDL;
    property Listing: TStringList read FListing write FListing;
    property ListingRetrieved: Boolean read FListingRetrieved write FListingRetrieved;
    property SiteEnumCount: Integer read FSiteEnumCount write FSiteEnumCount;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TFtpFolder = class(TFtpHost)
  protected
    function CreateItemID: TItemID; override;  // must override abstract methods
    function EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function RetrieveClassID: TCLSID; override;  // must override abstract methods
  end;

type
  TFTPCallback = procedure(Feedback: TStrings) of object;

var
  FTP: TIdFTP;
  FTPCallback: TFTPCallback = nil;

implementation

var
  FFtpSiteHelper: TFtpSiteHelper;
  PIDLManager: TPIDLManager;

function FtpSiteHelper: TFtpSiteHelper;
begin
  if not Assigned(FFtpSiteHelper) then
    FFtpSiteHelper := TFtpSiteHelper.Create;
  Result := FFtpSiteHelper
end;

procedure WriteStringToStream(AString: string; AStream: TStream);
var
  Count: Integer;
begin
  Count := Length(AString);
  AStream.Write(Count, SizeOf(Count));
  AStream.Write(PChar(AString)^, Count)
end;

procedure LoadStringFromStream(var AString: string; AStream: TStream);
var
  Count: Integer;
begin
  AStream.Read(Count, SizeOf(Count));
  SetLength(AString, Count);
  AStream.Read(PChar(AString)^, Length(AString));
end;


procedure ProvideFTPHostListing(const Host, Path, UserName, Password: string; var Listing: TStringList);
var
  URL: string;
  IdURI: TIdURI;
  LS: TStringList;
begin
  if not FTP.Connected or not SameText(FTP.Host, Host) then
  begin
    if not SameText(FTP.Host, Host) then
      FTP.Disconnect;
    URL := 'ftp://' + Host + '/' + Path;
    IdURI := TIdURI.Create(URL);
    try
      FTP.Username := UserName;
      FTP.Password := Password;
      FTP.Host := IdURI.Host;
      if IdURI.Port <> '' then
        FTP.Port := StrToInt(IdURI.Port);
      if idURI.Username <> '' then
      begin
        FTP.Username := IdURI.Username;
        FTP.Password := IdURI.Password
      end;
      FTP.Passive := True;
      FTP.Connect;
    finally
      IdURI.Free;
    end
  end;

  if Path <> '' then
    FTP.ChangeDir('/' + PChar(Path))
   else
    FTP.ChangeDir('/');
  FTP.TransferType := ftASCII;
  FTP.List(Listing);

  if Assigned(FTPCallback) then
  begin
    LS := TStringList.Create;
    try
      LS.Add('Listing directory ' + Path);
      LS.Assign(Listing);
      LS.Add('Listing done');
      FTPCallback(LS);
    finally
      LS.Free;
    end;
  end
end;


{ TFtpHookPIDL }

procedure TFtpHookPIDL.LoadPIDLStream(S: TStream);
begin
  inherited;
end;

procedure TFtpHookPIDL.SavePIDLStream(S: TStream);
begin
  inherited;
end;

{ TFtpHostPIDL }

procedure TFtpHostPIDL.Clear;
begin
  inherited;
  Description := '';
  UserName := '';
  Password := '';
end;

procedure TFtpHostPIDL.LoadPIDLStream(S: TStream);
begin
  inherited;
  LoadStringFromStream(FDescription, S);
  LoadStringFromStream(FUserName, S);
  LoadStringFromStream(FPassword, S);
end;

procedure TFtpHostPIDL.SavePIDLStream(S: TStream);
begin
  inherited;
  WriteStringToStream(Description, S);
  WriteStringToStream(UserName, S);
  WriteStringToStream(Password, S);
end;

{ TFtpFolderPIDL }

procedure TFtpFolderPIDL.Clear;
begin
  inherited;
  IdFTPItem.Size := 0;
  IdFTPItem.ItemCount := 0;
  IdFTPItem.Data := '';
  IdFTPItem.FileName := '';
  IdFTPItem.GroupPermissions := '';
  IdFTPItem.GroupName := '';
  IdFTPItem.OwnerName := '';
  IdFTPItem.UserPermissions := '';
  IDFTPItem.OwnerPermissions := '';
  IDFTPItem.ModifiedDate := 0;
  IdFTPItem.LinkedItemName := '';
  IdFTPItem.ItemType := TIdDirItemType(0);
  Host := '';
  FTPPath := '';
end;

constructor TFtpFolderPIDL.Create(AClassID: TGUID);
begin
  inherited;
  IdFTPItem := TIdFTPListItem.Create(nil);
end;

destructor TFtpFolderPIDL.Destroy;
begin
  IdFTPItem.Free;
  inherited;
end;

procedure TFtpFolderPIDL.LoadPIDLStream(S: TStream);
var
  TempS: string;
  TempInt64: Int64;
  TempDate: TDateTime;
  TempInt: Integer;
  TempType: TIdDirItemType;
begin
  inherited;
  S.ReadBuffer(TempInt64, SizeOf(TempInt64));
  IdFTPItem.Size := TempInt64;
  S.ReadBuffer(TempInt, SizeOf(TempInt));
  IdFTPItem.ItemCount := TempInt;
  LoadStringFromStream(TempS, S);
  IdFTPItem.Data := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.FileName := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.GroupPermissions := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.GroupName := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.OwnerPermissions := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.OwnerName := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.UserPermissions := TempS;
  LoadStringFromStream(TempS, S);
  IdFTPItem.LinkedItemName := TempS;
  S.ReadBuffer(TempDate, SizeOf(TempDate));
  IdFTPItem.ModifiedDate := TempDate;
  S.ReadBuffer(TempType, SizeOf(TempType));
  IdFTPItem.ItemType := TempType;
  LoadStringFromStream(FFtpPath, S);
  LoadStringFromStream(FHost, S);
end;

procedure TFtpFolderPIDL.SavePIDLStream(S: TStream);
begin
  inherited;
  S.WriteBuffer(IdFTPItem.Size, SizeOf(IdFTPItem.Size));
  S.WriteBuffer(IdFTPItem.ItemCount, SizeOf(IdFTPItem.ItemCount));
  WriteStringToStream(IdFTPItem.Data, S);
  WriteStringToStream(IdFTPItem.FileName, S);
  WriteStringToStream(IdFTPItem.GroupPermissions, S);
  WriteStringToStream(IdFTPItem.GroupName, S);
  WriteStringToStream(IdFTPItem.OwnerPermissions, S);
  WriteStringToStream(IdFTPItem.OwnerName, S);
  WriteStringToStream(IdFTPItem.UserPermissions, S);
  WriteStringToStream(IdFTPItem.LinkedItemName, S);
  S.WriteBuffer(IdFTPItem.ModifiedDate, SizeOf(IdFTPItem.ModifiedDate));
  S.WriteBuffer(IdFTPItem.ItemType, SizeOf(IdFTPItem.ItemType));
  WriteStringToStream(FtpPath, S);
  WriteStringToStream(Host, S);
end;


{ TFtpHook }

function TFtpHook.Attributes(ChildPIDLList: TPIDLList;
  Attribs: TFolderAttributes): TFolderAttributes;
begin
  Result := [];
  if faHasSubFolder in Attribs then
    Include(Result, faHasSubFolder);
  if faFolder in Attribs then
    Include(Result, faFolder);
end;

function TFtpHook.CompareItems(ColumnToCompare: integer; ChildPIDL1,
  ChildPIDL2: PItemIDList): ShortInt;
begin
  FTPHostPIDL1.ItemID := ChildPIDL1;
  FTPHostPIDL2.ItemID := ChildPIDL2;
  Result := ShortInt(CompareText(FTPHostPIDL1.InFolderNameASCII, FTPHostPIDL2.InFolderNameASCII));
end;

constructor TFtpHook.Create;
begin
  inherited;
  FTPHostPIDL1 := TFtpHostPIDL.Create(IID_IFtpHost);
  FTPHostPIDL2 := TFtpHostPIDL.Create(IID_IFtpHost);
end;

function TFtpHook.CreateIContextMenu(ChildPIDLs: TPIDLList): IContextMenu;
begin
  Result := TFtpHostContextMenu.Create(AbsolutePIDL, ChildPIDLs) as IContextMenu
end;

function TFtpHook.CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails;
var
  NS: TNamespace;
begin
  // If the Child is the RootVirtualPIDL then parent in charge of the details is
  // the FolderDetails.  If it is not then we are overriding the Real folders IShellDetails
  // and need the Host Details
  NS := TNamespace.Create(AbsolutePIDL, nil);
  NS.FreePIDLOnDestroy := False;
  NS.Free;


  if not Assigned(ChildPIDL) then
    Result := TFtpHostDetails.Create as IShellDetails
  else
    Result := TFtpFolderDetails.Create as IShellDetails
end;

function TFtpHook.CreateItemID: TItemID;
begin
  Result := TFtpHookPIDL.Create(IID_IFtpHook);
end;

destructor TFtpHook.Destroy;
begin
  FTPHostPIDL1.Free;
  FTPHostPIDL2.Free;
  inherited;
end;

procedure TFtpHook.DisplayName(ChildPIDL: PItemIDList;
  NameType: TDisplayNameFlags; var StrRet: TStrRet);
begin
   // The InFolder Name is always stored in the PIDL so we pass back the
   // Offset to the PChar in the PIDL
   StrRet.uType := STRRET_OFFSET;
   StrRet.uOffset := InFolderNameASCII_Offset
end;

function TFtpHook.EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList;
begin
  Result := nil;
  SiteEnumCount := 0;
  FtpSiteHelper.LoadHosts(False);
  // The FTP sites are stored in the ini file
  // FTP sites are folders so only return if asking for folders
  if fefFolders in EnumFlags then
  begin
    FtpSiteHelper.LoadHosts(False);
    if FtpSiteHelper.FTPHosts.Count > 0 then
    begin
      FTPHostPIDL1.Clear;
      FTPHostPIDL1.InFolderNameASCII := FtpSiteHelper.FTPHosts[SiteEnumCount];
      FTPHostPIDL1.Description := FtpSiteHelper.SiteDescriptions[SiteEnumCount];
      FTPHostPIDL1.UserName := FtpSiteHelper.UserNames[SiteEnumCount];
      FTPHostPIDL1.Password := FtpSiteHelper.Passwords[SiteEnumCount];
      FTPHostPIDL1.Version := SiteEnumCount; // Hide the index of the string in the PIDL
      Result := FTPHostPIDL1.ItemID;
    end
  end
end;

function TFtpHook.EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList;
begin
  Result := nil;
  Inc(FSiteEnumCount);
  if FSiteEnumCount < FtpSiteHelper.FTPHosts.Count then
  begin
    FTPHostPIDL1.Clear;
    FTPHostPIDL1.InFolderNameASCII := FtpSiteHelper.FTPHosts[SiteEnumCount];
    FTPHostPIDL1.Version := SiteEnumCount; // Hide the index of the string in the PIDL
    FTPHostPIDL1.Description := FtpSiteHelper.SiteDescriptions[SiteEnumCount];
    FTPHostPIDL1.UserName := FtpSiteHelper.UserNames[SiteEnumCount];
    FTPHostPIDL1.Password := FtpSiteHelper.Passwords[SiteEnumCount];
    Result := FTPHostPIDL1.ItemID;
  end
end;

function TFtpHook.GetSupportedInterfaces: TSupportedInterfaces;
begin
  // We support IShellDetails for our child objects
  Result := [siIShellDetails, siIContextMenu]
end;

procedure TFtpHook.IconIndex(ChildPIDL: PItemIDList;
  IconStyle: TVirtualIconFlags; var IconIndex: integer);
begin
  IconIndex := ICON_FOLDER
end;

function TFtpHook.RetrieveClassID: TCLSID;
begin
  Result := IID_IFtpHook
end;

{ TFtpHost }

function TFtpHost.Attributes(ChildPIDLList: TPIDLList;
  Attribs: TFolderAttributes): TFolderAttributes;
begin
  Result := [];
  // We don't support more than one PIDL in the list here
  FolderPIDL1.ItemID := ChildPIDLList[0];
  if FolderPIDL1.IdFTPItem.ItemType = ditDirectory then
  begin
    if faHasSubFolder in Attribs then
      Include(Result, faHasSubFolder);
    if faFolder in Attribs then
      Include(Result, faFolder);
  end
end;

function TFtpHost.CompareItems(ColumnToCompare: integer; ChildPIDL1,
  ChildPIDL2: PItemIDList): ShortInt;
begin
  FolderPIDL2.ItemID := ChildPIDL1;
  FolderPIDL1.ItemID := ChildPIDL2;
  if (FolderPIDL1.IdFTPItem.ItemType = ditDirectory) and not (FolderPIDL2.IdFTPItem.ItemType = ditDirectory) then
    Result := 1
  else
  if not (FolderPIDL1.IdFTPItem.ItemType = ditDirectory) and (FolderPIDL2.IdFTPItem.ItemType = ditDirectory) then
    Result := -1
  else
    Result := ShortInt(CompareText(FolderPIDL2.InFolderNameASCII, FolderPIDL1.InFolderNameASCII));
end;

constructor TFtpHost.Create;
begin
  inherited;
  FolderPIDL1 := TFtpFolderPIDL.Create(IID_IFtpFolder);
  FolderPIDL2 := TFtpFolderPIDL.Create(IID_IFtpFolder);
  HostPIDL := TFtpHostPIDL.Create(IID_IFtpHost);
  Listing := TStringList.Create;
  FTPListItems := TIdFTPListItems.Create;
end;

function TFtpHost.CreateIContextMenu(ChildPIDLs: TPIDLList): IContextMenu;
begin
  // Only one selection makes sense here
  if ChildPIDLs.Count = 1 then
    Result := TFtpFolderContextMenu.Create(AbsolutePIDL, ChildPIDLs) as IContextMenu
end;

function TFtpHost.CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails;
begin
  Result := TFtpFolderDetails.Create as IShellDetails
end;

function TFtpHost.CreateItemID: TItemID;
begin
  Result := TFtpVirtualExplorerPIDL.Create(IID_IFtpHost);
end;

destructor TFtpHost.Destroy;
begin
  FolderPIDL1.Free;
  FolderPIDL2.Free;
  HostPIDL.Free;
  Listing.Free;
  FTPListItems.Free;
  inherited;
end;

procedure TFtpHost.DisplayName(ChildPIDL: PItemIDList;
  NameType: TDisplayNameFlags; var StrRet: TStrRet);
begin
  if (dnfForParsing in NameType) and not (dnfInFolder in NameType) then
  begin
    StrRet.uType := STRRET_WSTR;
    FolderPIDL1.ItemID := ChildPIDL;
    StrRet.pOleStr := PIDLMgr.AllocStrGlobal(FolderPIDL1.FTPPath)
  end else
  begin
   // The InFolder Name is always stored in the PIDL so we pass back the
   // Offset to the PChar in the PIDL
   StrRet.uType := STRRET_OFFSET;
   StrRet.uOffset := InFolderNameASCII_Offset
  end
end;

function TFtpHost.EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  Done: Boolean;
begin
  Result := nil;
  EnumCount := 0;
  FtpSiteHelper.LoadHosts(False);
  HostPIDL.ItemID := AbsolutePIDL;
  RetrieveListing(HostPIDL.InFolderNameASCII, '/', FtpSiteHelper.UserNames[EnumCount],
    FtpSiteHelper.Passwords[EnumCount], False);
  Done := False;
  while (EnumCount < FListing.Count) and not Done do
  begin
    if ((FTPListItems[EnumCount].ItemType = ditDirectory) and (fefFolders in EnumFlags)) or
     ((FTPListItems[EnumCount].ItemType = ditFile) and (fefNonFolder in EnumFlags)) then
    begin
      FolderPIDL1.Clear;
      FolderPIDL1.InFolderNameASCII := FTPListItems[EnumCount].FileName;
      FolderPIDL1.IdFTPItem.Assign(FTPListItems[EnumCount]);
      FolderPIDL1.FTPPath := '/' + FolderPIDL1.InFolderNameASCII;
      FolderPIDL1.Host := HostPIDL.InFolderNameASCII;
      Result := FolderPIDL1.ItemID;
      Done := True
    end else


      Inc(FEnumCount)
  end
end;

function TFtpHost.EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  Done: Boolean;
begin
  Result := nil;
  Inc(FEnumCount);
  Done := False;
  while (EnumCount < FListing.Count) and not Done do
  begin
    if ((FTPListItems[EnumCount].ItemType = ditDirectory) and (fefFolders in EnumFlags)) or
     ((FTPListItems[EnumCount].ItemType = ditFile) and (fefNonFolder in EnumFlags)) then
    begin
      FolderPIDL1.Clear;
      FolderPIDL1.InFolderNameASCII := FTPListItems[EnumCount].FileName;
      FolderPIDL1.IdFTPItem.Assign(FTPListItems[EnumCount]);
      FolderPIDL1.FTPPath := '/' + FolderPIDL1.InFolderNameASCII;
      FolderPIDL1.Host := HostPIDL.InFolderNameASCII;
      Result := FolderPIDL1.ItemID;
      Done := True
    end else
      Inc(FEnumCount)
  end
end;

function TFtpHost.GetSupportedInterfaces: TSupportedInterfaces;
begin
  // We support IShellDetails for our child objects
  Result := [siIShellDetails, siIContextMenu]
end;

procedure TFtpHost.IconIndex(ChildPIDL: PItemIDList;
  IconStyle: TVirtualIconFlags; var IconIndex: integer);
var
  FileInfo: TSHFileInfo;
  Flags: Longword;
  S: string;
begin
  FolderPIDL2.ItemID := ChildPIDL;
  if FolderPIDL2.IdFTPItem.ItemType = ditDirectory then
  begin
    if ifOpen in IconStyle then
      IconIndex := ICON_FOLDEROPEN
    else
      IconIndex := ICON_FOLDER
  end else
  begin
     Flags := SHGFI_SHELLICONSIZE	or SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES;
    if ifOpen in IconStyle then
      Flags := Flags or SHGFI_OPENICON;

    S := '*' + ExtractFileExt(FolderPIDL2.IdFTPItem.FileName);
    FillChar(FileInfo, SizeOf(FileInfo), #0);
    SHGetFileInfo(PChar(S), FILE_ATTRIBUTE_NORMAL, FileInfo, SizeOf(FileInfo), Flags);
    IconIndex := FileInfo.iIcon;
  end
end;

function TFtpHost.RetrieveClassID: TCLSID;
begin
  Result := IID_IFtpHost
end;

procedure TFtpHost.RetrieveListing(Host, Path, UserName, Password: string; Force: Boolean);
begin
  if not ListingRetrieved or Force then
  begin
    ProvideFTPHostListing(Host, Path, UserName, Password, FListing);
    FTPListItems.Assign(FTP.DirectoryListing);
    ListingRetrieved := True
  end
end;

{ TFtpFolder }

function TFtpFolder.CreateItemID: TItemID;
begin
  Result := TFtpFolderPIDL.Create(IID_IFtpFolder);
end;

function TFtpFolder.EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  Done: Boolean;
begin
  Result := nil;
  EnumCount := 0;
  FtpSiteHelper.LoadHosts(False);
  FolderPIDL2.ItemID := AbsolutePIDL;
  RetrieveListing(FolderPIDL2.Host, FolderPIDL2.FTPPath, FtpSiteHelper.UserNames[EnumCount],
    FtpSiteHelper.Passwords[EnumCount], False);
  Done := False;
  while (EnumCount < FListing.Count) and not Done do
  begin
    if ((FTPListItems[EnumCount].ItemType = ditDirectory) and (fefFolders in EnumFlags)) or
     ((FTPListItems[EnumCount].ItemType = ditFile) and (fefNonFolder in EnumFlags)) then
    begin
      FolderPIDL1.Clear;
      FolderPIDL1.InFolderNameASCII := FTPListItems[EnumCount].FileName;
      FolderPIDL1.IdFTPItem.Assign(FTPListItems[EnumCount]);
      FolderPIDL1.FTPPath := FolderPIDL2.FTPPath + '/' + FolderPIDL1.InFolderNameASCII;
      FolderPIDL1.Host := FolderPIDL2.Host;
      Result := FolderPIDL1.ItemID;
      Done := True
    end else
      Inc(FEnumCount)
  end
end;

function TFtpFolder.EnumNextChild(
  EnumFlags: TFolderEnumFlags): PItemIDList;
var
  Done: Boolean;
begin
  Result := nil;
  Inc(FEnumCount);
  FolderPIDL2.ItemID := AbsolutePIDL;
  Done := False;
  while (EnumCount < FListing.Count) and not Done do
  begin
    if ((FTPListItems[EnumCount].ItemType = ditDirectory) and (fefFolders in EnumFlags)) or
     ((FTPListItems[EnumCount].ItemType = ditFile) and (fefNonFolder in EnumFlags)) then
    begin
      FolderPIDL1.Clear;
      FolderPIDL1.InFolderNameASCII := FTPListItems[EnumCount].FileName;
      FolderPIDL1.IdFTPItem.Assign(FTPListItems[EnumCount]);
      FolderPIDL1.FTPPath := FolderPIDL2.FTPPath + '/' + FolderPIDL1.InFolderNameASCII;
      FolderPIDL1.Host := FolderPIDL2.Host;
      Result := FolderPIDL1.ItemID;
      Done := True
    end else
      Inc(FEnumCount)
  end
end;

function TFtpFolder.RetrieveClassID: TCLSID;
begin
  Result := IID_IFtpFolder
end;

{ TFtpSiteHelper }

procedure TFtpSiteHelper.AddNewHost(Host, UserName, Password,
  Description: string);
begin
  LoadHosts(True);
  FTPHosts.Add(Host);
  SiteDescriptions.Add(Description);
  UserNames.Add(UserName);
  Passwords.Add(Password);
  WriteHosts;
end;

constructor TFtpSiteHelper.Create;
begin
  FTPHosts := TStringList.Create;
  SiteDescriptions := TStringList.Create;
  UserNames := TStringList.Create;
  Passwords := TStringList.Create;
end;

procedure TFtpSiteHelper.DeleteHost(Host: string);
var
  i, Index: Integer;
begin
  LoadHosts(True);
  Index := -1;
  for i := 0 to FTPHosts.Count - 1 do
  begin
    if FTPHosts[i] = Host then
      Index := i;
  end;
  if Index > -1 then
  begin
    FTPHosts.Delete(Index);
    SiteDescriptions.Delete(Index);
    UserNames.Delete(Index);
    Passwords.Delete(Index);
    WriteHosts;
  end;
end;

destructor TFtpSiteHelper.Destroy;
begin
  FTPHosts.Free;
  SiteDescriptions.Free;
  UserNames.Free;
  Passwords.Free;
  inherited;
end;

procedure TFtpSiteHelper.EditHost(Host, UserName, Password,
  Description: string);
var
  i: Integer;
  Found: Boolean;
begin
  LoadHosts(True);
  Found := False;
  for i := 0 to FTPHosts.Count - 1 do
  begin
    if FTPHosts[i] = Host then
    begin
      SiteDescriptions[i] := Description;
      UserNames[i] := UserName;
      Passwords[i] := Password;
      WriteHosts;
      Found := True;
    end;
  end;
  if not Found then
    AddNewHost(Host, UserName, Password, Description);
end;

procedure TFtpSiteHelper.LoadHosts(Refresh: Boolean);
var
  FtpINI: TIniFile;
  i, Position: Integer;
begin
  if not SitesLoaded or Refresh then
  begin
    FtpINI := TIniFile.Create(FTPSITE_FILE);
    try
      FtpINI.ReadSectionValues(FTPSITE_SECTION, FTPHosts);
      for i := 0 to FTPHosts.Count - 1 do
      begin
        Position := Pos('=', FTPHosts[i]);
        if (Position > -1) and (Position < Length(FTPHosts[i])) then
          FTPHosts[i] := string( PChar( @FTPHosts[i][Position + 1]))
      end;
      FtpINI.ReadSectionValues(FTPSITEDESC_SECTION, SiteDescriptions);
      for i := 0 to SiteDescriptions.Count - 1 do
      begin
        Position := Pos('=', SiteDescriptions[i]);
        if (Position > -1) and (Position < Length(SiteDescriptions[i])) then
          SiteDescriptions[i] := string( PChar( @SiteDescriptions[i][Position + 1]))
      end;
      FtpINI.ReadSectionValues(FTPUSERNAME_SECTION, UserNames);
      for i := 0 to UserNames.Count - 1 do
      begin
        Position := Pos('=', UserNames[i]);
        if (Position > -1) and (Position < Length(UserNames[i])) then
          UserNames[i] := string( PChar( @UserNames[i][Position + 1]))
      end;
      FtpINI.ReadSectionValues(FTPPASSWORD_SECTION, Passwords);
      for i := 0 to Passwords.Count - 1 do
      begin
        Position := Pos('=', Passwords[i]);
        if (Position > -1) and (Position < Length(Passwords[i])) then
          Passwords[i] := string( PChar( @Passwords[i][Position + 1]))
      end;
      SitesLoaded := True
    finally
      FtpINI.Free
    end
  end
end;

procedure TFtpSiteHelper.WriteHosts;
var
  FtpINI: TIniFile;
  i: Integer;
begin
  FtpINI := TIniFile.Create(FTPSITE_FILE);
  try
    FtpINI.EraseSection(FTPSITE_SECTION);
    FtpINI.EraseSection(FTPSITEDESC_SECTION);
    FtpINI.EraseSection(FTPUSERNAME_SECTION);
    FtpINI.EraseSection(FTPPASSWORD_SECTION);
    for i := 0 to FTPHosts.Count - 1 do
    begin
      FtpINI.WriteString(FTPSITE_SECTION, 'Site'+IntToStr(i), FTPHosts[i]);
      FtpINI.WriteString(FTPSITEDESC_SECTION, 'Site'+IntToStr(i), SiteDescriptions[i]);
      FtpINI.WriteString(FTPUSERNAME_SECTION, 'Site'+IntToStr(i), UserNames[i]);
      FtpINI.WriteString(FTPPASSWORD_SECTION, 'Site'+IntToStr(i), Passwords[i]);
    end;
  finally
    FtpINI.Free
  end
end;

{ TFtpHostDetails }

constructor TFtpHostDetails.Create;
begin
  PIDLHelper := TFtpHostPIDL.Create(IID_IFtpHost);
end;

destructor TFtpHostDetails.Destroy;
begin
  PIDLHelper.Free;
  inherited;
end;

function TFtpHostDetails.GetColumnCount: Cardinal;
begin
  Result := 2;
end;

function TFtpHostDetails.GetColumnDetails(ChildPIDL: PItemIDList;
  ColumnIndex: integer): WideString;
begin
  Result := '';
  if Assigned(ChildPIDL) then
    if PIDLMgr.IDCount(ChildPIDL) = 1 then
    begin
      PIDLHelper.ItemID := ChildPIDL;
      case ColumnIndex of
        0: Result := PIDLHelper.InFolderNameASCII;
        1: Result := PIDLHelper.Description
      end
    end
end;

function TFtpHostDetails.GetColumnTitle(ColumnIndex: integer): WideString;
begin
  case ColumnIndex of
    0:  Result := 'Host';
    1:  Result := 'Description';
  else
    Result := '';
  end
end;

{ TFtpFolderDetails }

constructor TFtpFolderDetails.Create;
begin
  PIDLHelper := TFtpFolderPIDL.Create(IID_IFtpFolder);
end;

destructor TFtpFolderDetails.Destroy;
begin
  PIDLHelper.Free;
  inherited;
end;

function TFtpFolderDetails.GetColumnCount: Cardinal;
begin
  Result := 7
end;

function TFtpFolderDetails.GetColumnDetails(ChildPIDL: PItemIDList;
  ColumnIndex: integer): WideString;
begin
  PIDLHelper.ItemID := ChildPIDL;
  Result := '';
  case ColumnIndex of
    0: Result := PIDLHelper.FIdFTPItem.FileName;
    1: Result := IntToStr(PIDLHelper.FIdFTPItem.Size);
    2: Result := DateTimeToStr(PIDLHelper.FIdFTPItem.ModifiedDate);
    3: Result := PIDLHelper.FIdFTPItem.OwnerName;
    4: Result := PIDLHelper.FIdFTPItem.GroupName;
    5: Result := PIDLHelper.FIdFTPItem.OwnerPermissions + PIDLHelper.FIdFTPItem.GroupPermissions + PIDLHelper.FIdFTPItem.UserPermissions;
    6: Result := PIDLHelper.FIdFTPItem.LinkedItemName;
  end;
end;

function TFtpFolderDetails.GetColumnTitle(ColumnIndex: integer): WideString;
begin
  case ColumnIndex of
    0: Result := 'FileName';
    1: Result := 'Size';
    2: Result := 'Modified Date';
    3: Result := 'Owner Name';
    4: Result := 'Group Name';
    5: Result := 'Permissions';
    6: Result := 'Linked Name';
  end;
end;

{ TFtpHostContextMenu }

constructor TFtpHostContextMenu.Create(AParentPIDL: PItemIDList;
  APIDLs: TPIDLList);
begin
  inherited;
  HelperPIDL := TFtpHostPIDL.Create(IID_IFtpHost);
end;

destructor TFtpHostContextMenu.Destroy;
begin
  HelperPIDL.Free;
  inherited;
end;

function TFtpHostContextMenu.FillMenu(Menu: HMenu; FirstItemIndex,
  ItemIdFirst, ItemIDLast: Longword;
  MenuFlags: TContextMenuFlags): Boolean;
begin
  AddMenuItem(Menu, ItemidFirst, 'Properties', 'ftp_properties', 'Set the properties of the Host');
  AddMenuItemDivider(Menu);
  AddMenuItem(Menu, ItemidFirst + 1, 'Delete Host', 'ftp_deletehost', 'Deletes the FTP Host');
  AddMenuItem(Menu, ItemidFirst + 2, 'Add New Host...', 'ftp_addhost', 'Creates a new Host');
  Result := True;
end;

function TFtpHostContextMenu.Invoke(Window: HWnd; InvokeInfo: TCMInvokeCommandInfoEx): Boolean;
var
  Item: TVirtualContextMenuItem;
  VerbInvoked, NewHost: Boolean;
begin
  Result := False;
  Item := FindMenuItemByInvokeInfo(InvokeInfo, VerbInvoked);
  if Assigned(Item) then
  begin
    HelperPIDL.ItemID := ChildPIDLs[0];
    if Item.Verb = 'ftp_deletehost' then
    begin
      FtpSiteHelper.DeleteHost(HelperPIDL.InFolderNameASCII);
      SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_IDLIST, PIDLMgr.CopyPIDL(ParentPIDL),
        PIDLMgr.CopyPIDL(ParentPIDL));
    end else
    begin
      NewHost := True;
      if Item.Verb = 'ftp_properties' then
      begin
        HostPropForm.Edit1.Text := HelperPIDL.InFolderNameASCII;
        HostPropForm.Edit2.Text := HelperPIDL.UserName;
        HostPropForm.Edit3.Text := HelperPIDL.Password;
        HostPropForm.Edit4.Text := HelperPIDL.Description;
        NewHost := False;
      end else
      if Item.Verb = 'ftp_addhost' then
      begin
        HostPropForm.Edit1.Text := '';
        HostPropForm.Edit2.Text := '';
        HostPropForm.Edit3.Text := '';
        HostPropForm.Edit4.Text := '';
      end;
      if HostPropForm.ShowModal = mrOK then
      begin
        if NewHost then
          FtpSiteHelper.AddNewHost(HostPropForm.Edit1.Text, HostPropForm.Edit2.Text,
            HostPropForm.Edit3.Text, HostPropForm.Edit4.Text)
        else
          FtpSiteHelper.EditHost(HostPropForm.Edit1.Text, HostPropForm.Edit2.Text,
            HostPropForm.Edit3.Text, HostPropForm.Edit4.Text);
        SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_IDLIST, PIDLMgr.CopyPIDL(ParentPIDL),
          PIDLMgr.CopyPIDL(ParentPIDL));
      end
    end;

    Result := True;
  end
end;

{ TFtpFolderContextMenu }

function TFtpFolderContextMenu.FillMenu(Menu: HMenu; FirstItemIndex,
  ItemIdFirst, ItemIDLast: Longword;
  MenuFlags: TContextMenuFlags): Boolean;
begin
   // It is a very bad idea to use the same verb names as the shell uses like properties,
   // delete, cut, etc....
   AddMenuItem(Menu, ItemIDFirst, 'Properties...', 'ftp_properties', 'Shows Properties for the selected items');
   AddMenuItemDivider(Menu);
   if cmCanRename in MenuFlags then
     AddMenuItem(Menu, ItemIDFirst+1, 'Rename', 'ftp_rename', 'Renames the selected item');
   AddMenuItem(Menu, ItemIDFirst+2, 'Delete', 'ftp_delete', 'Deletes the selected items');
   AddMenuItemDivider(Menu);
   AddMenuItem(Menu, ItemIDFirst+3, 'Copy', 'ftp_copy', 'Shows Properties for the selected items');
   AddMenuItem(Menu, ItemIDFirst+4, 'Cut', 'ftp_cut', 'Shows Properties for the selected items');
   Result := False;
end;

function TFtpFolderContextMenu.Invoke(Window: HWnd; InvokeInfo: TCMInvokeCommandInfoEx): Boolean;
var
  Item: TVirtualContextMenuItem;
  VerbInvoked: Boolean;
begin
  Result := False;
  Item := FindMenuItemByInvokeInfo(InvokeInfo, VerbInvoked);
  if Assigned(Item) then
  begin
    Result := True;
  end
end;

initialization
  NamespaceExtensionFactory.RegisterNamespaceExtension(TFtpHost, IID_IFtpHost,
    TFtpHook, IID_IFtpHook);
  NamespaceExtensionFactory.RegisterNamespaceExtension(TFtpFolder, IID_IFtpFolder,
    nil, GUID_NULL);
  FTP := TIdFTP.Create(nil);
  PIDLManager := TPIDLManager.Create;

finalization
  FTP.Free;
  FFtpSiteHelper.Free;
  PIDLManager.Free;

end.
