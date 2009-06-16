unit IniNamespace;

interface

{$include ..\..\Include\VSToolsAddIns.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ImgList, ShlObj,
  ShellAPI, ActiveX, ComObj, VirtualPIDLTools, VirtualShellUtilities,
  VirtualNamespace, IdFTPList, IniFiles, VirtualShellTypes;

const
  IID_IniHook: TGUID = '{F939525F-5657-45D2-9EAF-55D3D2539BFC}';
  IID_IniSection: TGUID = '{534619D8-8372-4246-82F4-7C45FA985F3B}';
  IID_IniKey: TGUID = '{4FEE8F4A-4B1A-424B-972A-7BC680BF7128}';

type
  TIniHookPIDL = class(TItemID)
  end;

  TIniSectionPIDL = class(TItemID)
  end;

  TIniKeyPIDL = class(TItemID)
   private
    FKeyValue: string;
  published
    procedure LoadPIDLStream(S: TStream); override;
    procedure SavePIDLStream(S: TStream); override;

    property KeyValue: string read FKeyValue write FKeyValue;
  end;

type
  TIniHookDetails = class(TVirtualIShellDetails)
  public
    function GetColumnCount: Cardinal; override;
    function GetColumnDetails(ChildPIDL: PItemIDList; ColumnIndex: integer): WideString; override;
    function GetColumnTitle(ColumnIndex: integer): WideString; override;
  end;

  TIniHook = class(TBaseVirtualNamespaceExtension)
  private
    FSectionPIDL: TIniSectionPIDL;
    FSections: TStringList;
    FEnumCount: Integer;
    FSectionPIDL1: TIniSectionPIDL;
  protected
    function Attributes(ChildPIDLList: TPIDLList; Attribs: TFolderAttributes): TFolderAttributes; override;
    function CompareItems(ColumnToCompare: integer; ChildPIDL1, ChildPIDL2: PItemIDList): ShortInt; override;
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

    property EnumCount: Integer read FEnumCount write FEnumCount;
    property SectionPIDL: TIniSectionPIDL read FSectionPIDL write FSectionPIDL;
    property SectionPIDL1: TIniSectionPIDL read FSectionPIDL1 write FSectionPIDL1;
    property Sections: TStringList read FSections write FSections;
  end;

  TIniSectionDetails = class(TVirtualIShellDetails)
  private
    FKeyPIDL: TIniKeyPIDL;
  public
    constructor Create;
    destructor Destroy; override;

    function GetColumnCount: Cardinal; override;
    function GetColumnDetails(ChildPIDL: PItemIDList; ColumnIndex: integer): WideString; override;
    function GetColumnTitle(ColumnIndex: integer): WideString; override;
    
    property KeyPIDL: TIniKeyPIDL read FKeyPIDL write FKeyPIDL;
  end;

  TIniSection = class(TBaseVirtualNamespaceExtension)
  private
    FEnumCount: Integer;
    FKeys: TStringList;
    FKeyPIDL: TIniKeyPIDL;
    FIniFile: string;
    FKeyPIDL1: TIniKeyPIDL;
    FValues: TStringList;
  protected
    function Attributes(ChildPIDLList: TPIDLList; Attribs: TFolderAttributes): TFolderAttributes; override;
    function CompareItems(ColumnToCompare: integer; ChildPIDL1, ChildPIDL2: PItemIDList): ShortInt; override;
    function CreateItemID: TItemID; override;
    function CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails; override;
    procedure DisplayName(ChildPIDL: PItemIDList; NameType: TDisplayNameFlags; var StrRet: TStrRet); override;
    function EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList; override;
    function GetSupportedInterfaces: TSupportedInterfaces; override;
    procedure IconIndex(ChildPIDL: PItemIDList; IconStyle: TVirtualIconFlags; var IconIndex: integer); override;
    function RetrieveClassID: TCLSID; override;

    function ExtractIniFileName: string;
    procedure ReadKeys(Section: string; IniFile: TIniFile);

  public
    constructor Create; override;
    destructor Destroy; override;

    property EnumCount: Integer read FEnumCount write FEnumCount;
    property IniFile: string read FIniFile write FIniFile;
    property KeyPIDL: TIniKeyPIDL read FKeyPIDL write FKeyPIDL;
    property KeyPIDL1: TIniKeyPIDL read FKeyPIDL1 write FKeyPIDL1;
    property Keys: TStringList read FKeys write FKeys;
    property Values: TStringList read FValues write FValues;
  end;


implementation

var
  PIDLManager: TPIDLManager;

{ TIniHook }

function TIniHook.Attributes(ChildPIDLList: TPIDLList;
  Attribs: TFolderAttributes): TFolderAttributes;
begin
  Result := [];
  // The hook displays only sections which by definition are contianers so they are
  // defined folders so the appear in the treeview but do not reply to the HasSubFolders
  // so the "+" is not shown
  if (faFolder in Attribs) then
    Include(Result, faFolder);
end;

function TIniHook.CompareItems(ColumnToCompare: integer; ChildPIDL1,
  ChildPIDL2: PItemIDList): ShortInt;
begin
  SectionPIDL1.ItemID := ChildPIDL1;
  SectionPIDL.ItemID := ChildPIDL2;
  Result := ShortInt(CompareText(SectionPIDL1.InFolderNameASCII, SectionPIDL.InFolderNameASCII));
end;

constructor TIniHook.Create;
begin
  inherited;
  SectionPIDL := TIniSectionPIDL.Create(IID_IniSection);
  SectionPIDL1 := TIniSectionPIDL.Create(IID_IniSection);
  Sections := TStringList.Create;
end;

function TIniHook.CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails;
begin
  // If the Child is the RootVirtualPIDL then parent in charge of the details is
  // the FolderDetails.  If it is not then we are overriding the Real folders IShellDetails
  // and need the Host Details
  if Assigned(ChildPIDL) then
    Result := TIniSectionDetails.Create
  else
    Result := TIniHookDetails.Create
end;

function TIniHook.CreateItemID: TItemID;
begin
  Result := TIniHookPIDL.Create(IID_IniHook)
end;

destructor TIniHook.Destroy;
begin
  FreeAndNil(FSectionPIDL);
  FreeAndNil(FSectionPIDL1);
  FreeAndNil(FSections);
  inherited;
end;

procedure TIniHook.DisplayName(ChildPIDL: PItemIDList;
  NameType: TDisplayNameFlags; var StrRet: TStrRet);
begin
  // We will just use ASCII strings in this example
  StrRet.uType := STRRET_OFFSET;
  StrRet.uOffset := InFolderNameASCII_Offset
end;

function TIniHook.EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  NS: TNamespace;
  Ini: TIniFile;
begin
  Result := nil;
  if fefFolders in EnumFlags then
  begin
    EnumCount := 0;
    NS := TNamespace.Create(AbsolutePIDL, nil);
    Ini := TIniFile.Create(NS.NameForParsing);
    try
     Ini.ReadSections(Sections);
     if Sections.Count > 0 then
     begin
       SectionPIDL.Clear;
       SectionPIDL.InFolderNameASCII := Sections[EnumCount];
       SectionPIDL.Version := EnumCount; // Use the Version to hide the index of the section string
       Result := SectionPIDL.ItemID;
     end
    finally
      FreeAndNil(NS);
      FreeAndNil(Ini);
    end;
  end
end;

function TIniHook.EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList;
begin
  Result := nil;
  if fefFolders in EnumFlags then
  begin
    Inc(FEnumCount);
    if Sections.Count > FEnumCount then
    begin
      SectionPIDL.Clear;
      SectionPIDL.InFolderNameASCII := Sections[EnumCount];
      SectionPIDL.Version := EnumCount; // Use the Version to hide the index of the section string
      Result := SectionPIDL.ItemID;
    end else
      Sections.Clear; // Don't need these any more
  end
end;

function TIniHook.GetSupportedInterfaces: TSupportedInterfaces;
begin
  Result := [siIShellDetails]
end;

procedure TIniHook.IconIndex(ChildPIDL: PItemIDList;
  IconStyle: TVirtualIconFlags; var IconIndex: integer);
var
  FileInfo: TSHFileInfo;
begin
  SHGetFileInfo('*.ini', FILE_ATTRIBUTE_NORMAL, FileInfo, SizeOf(FileInfo),
    SHGFI_USEFILEATTRIBUTES	or SHGFI_SYSICONINDEX);
  IconIndex := FileInfo.iIcon
end;

function TIniHook.RetrieveClassID: TCLSID;
begin
  Result := IID_IniHook
end;

{ TIniSection }

function TIniSection.Attributes(ChildPIDLList: TPIDLList;
  Attribs: TFolderAttributes): TFolderAttributes;
begin
  Result := []; // Section contents never have any sub folders
end;

function TIniSection.CompareItems(ColumnToCompare: integer; ChildPIDL1,
  ChildPIDL2: PItemIDList): ShortInt;
begin
  KeyPIDL1.ItemID := ChildPIDL1;
  KeyPIDL.ItemID := ChildPIDL2;
  Result := ShortInt(CompareText(KeyPIDL1.InFolderNameASCII, KeyPIDL.InFolderNameASCII));
end;

constructor TIniSection.Create;
begin
  inherited;
  KeyPIDL := TIniKeyPIDL.Create(IID_IniKey);
  KeyPIDL1 := TIniKeyPIDL.Create(IID_IniKey);
  Keys := TStringList.Create;
  Values := TStringList.Create;
end;

function TIniSection.CreateIShellDetails(ChildPIDL: PItemIDList): IShellDetails;
begin
  Result := TIniSectionDetails.Create
end;

function TIniSection.CreateItemID: TItemID;
begin
  Result := TIniSectionPIDL.Create(IID_IniSection)
end;

destructor TIniSection.Destroy;
begin
  FreeAndNil(FKeys);
  FreeAndNil(FKeyPIDL);
  FreeAndNil(FKeyPIDL1);
  FreeAndNil(FValues);
  inherited;
end;

procedure TIniSection.DisplayName(ChildPIDL: PItemIDList;
  NameType: TDisplayNameFlags; var StrRet: TStrRet);
begin
  // We will just use ASCII strings in this example
  StrRet.uType := STRRET_OFFSET;
  StrRet.uOffset := InFolderNameASCII_Offset
end;

function TIniSection.EnumFirstChild(EnumFlags: TFolderEnumFlags): PItemIDList;
var
  Ini: TIniFile;
  SectionPIDL: TIniSectionPIDL;
  i: Integer;
begin
  Result := nil;
  if fefNonFolder in EnumFlags then
  begin
    EnumCount := 0;
    SectionPIDL := TIniSectionPIDL.Create(IID_IniSection);
    try
      // Get the section stored in the PIDL that defines us
      SectionPIDL.ItemID := PIDLManager.GetPointerToLastID(AbsolutePIDL);
      IniFile := ExtractIniFileName;
      Ini := TIniFile.Create(IniFile);
      try
       Ini.ReadSection(SectionPIDL.InFolderNameASCII, Keys);

       for i := 0 to Keys.Count - 1 do
       begin
         Values.Add('');
         Values[i] := Ini.ReadString(SectionPIDL.InFolderNameASCII, Keys[i], '');
       end;

       if Keys.Count > 0 then
       begin
         KeyPIDL.Clear;
         KeyPIDL.InFolderNameASCII := Keys[EnumCount];
         KeyPIDL.KeyValue := Values[EnumCount];
         Ini.ReadString(SectionPIDL.InFolderNameASCII, KeyPIDL.InFolderNameASCII, KeyPIDL.KeyValue);
         KeyPIDL.Version := EnumCount; // Use the Version to hide the index of the section string
         Result := KeyPIDL.ItemID;
       end
      finally
        FreeAndNil(Ini);
      end;
    finally
      SectionPIDL.Free
    end
  end
end;

function TIniSection.EnumNextChild(EnumFlags: TFolderEnumFlags): PItemIDList;
begin
  Result := nil;
  if fefNonFolder in EnumFlags then
  begin
    Inc(FEnumCount);
    if Keys.Count > EnumCount then
    begin
      KeyPIDL.Clear;
      KeyPIDL.InFolderNameASCII := Keys[EnumCount];
      KeyPIDL.KeyValue := Values[EnumCount];
      KeyPIDL.Version := EnumCount; // Use the Version to hide the index of the section string
      Result := KeyPIDL.ItemID;
    end else
    begin
      // Don't need them any more
      Values.Clear;
      Keys.Clear
    end
  end
end;

function TIniSection.ExtractIniFileName: string;
var
  PIDLCopy: PItemIDList;
  NS: TNamespace;
begin
  NS := nil;
  // Make a copy so we don't screw up the original
  PIDLCopy := PIDLManager.CopyPIDL(AbsolutePIDL);
  try
    // This is destructive
    PIDLManager.StripLastID(PIDLCopy);
    while NamespaceExtensionFactory.IsVirtualPIDL(PIDLCopy) do
      PIDLManager.StripLastID(PIDLCopy);
    NS := TNamespace.Create(PIDLCopy, nil);
    NS.FreePIDLOnDestroy := False;
    Result := NS.NameForParsing
  finally
    PIDLManager.FreePIDL(PIDLCopy);
    NS.Free;
  end;
end;

function TIniSection.GetSupportedInterfaces: TSupportedInterfaces;
begin
  Result := [siIShellDetails]
end;

procedure TIniSection.IconIndex(ChildPIDL: PItemIDList;
  IconStyle: TVirtualIconFlags; var IconIndex: integer);
var
  FileInfo: TSHFileInfo;
begin
  SHGetFileInfo('*.ini', FILE_ATTRIBUTE_NORMAL, FileInfo, SizeOf(FileInfo),
    SHGFI_USEFILEATTRIBUTES	or SHGFI_SYSICONINDEX);
  IconIndex := FileInfo.iIcon
end;

procedure TIniSection.ReadKeys(Section: string; IniFile: TIniFile);
begin
  if Assigned(IniFile) then
  begin
    IniFile.ReadSectionValues(Section, Keys);
  end;
end;

function TIniSection.RetrieveClassID: TCLSID;
begin
  Result := IID_IniSection
end;

{ TInitHookDetails }

function TIniHookDetails.GetColumnCount: Cardinal;
begin
  Result := 1;
end;

function TIniHookDetails.GetColumnDetails(ChildPIDL: PItemIDList;
  ColumnIndex: integer): WideString;
begin
  // For now VET does not call the handler for column 0
end;

function TIniHookDetails.GetColumnTitle(ColumnIndex: integer): WideString;
begin
  Result := 'Sections'
end;

{ TIniSectionDetails }

constructor TIniSectionDetails.Create;
begin
  KeyPIDL := TIniKeyPIDL.Create(IID_IniKey);
end;

destructor TIniSectionDetails.Destroy;
begin
  FreeAndNil(FKeyPIDL);
  inherited;
end;

function TIniSectionDetails.GetColumnCount: Cardinal;
begin
  Result := 2;
end;

function TIniSectionDetails.GetColumnDetails(ChildPIDL: PItemIDList;
  ColumnIndex: integer): WideString;
begin
  KeyPIDL.ItemID := ChildPIDL;
  if ColumnIndex = 0 then
    Result := KeyPIDL.InFolderNameASCII
  else
  if ColumnIndex = 1 then
    Result := KeyPIDL.KeyValue
end;

function TIniSectionDetails.GetColumnTitle(
  ColumnIndex: integer): WideString;
begin
  if ColumnIndex = 0 then
    Result := 'Key'
  else
    Result := 'Value'
end;

{ TIniKeyPIDL }

procedure TIniKeyPIDL.LoadPIDLStream(S: TStream);
begin
  inherited;
  KeyValue := ReadString(S);
end;

procedure TIniKeyPIDL.SavePIDLStream(S: TStream);
begin
  inherited;
  WriteString(KeyValue, S);
end;

initialization
  PIDLManager := TPIDLManager.Create;
  NamespaceExtensionFactory.RegisterNamespaceExtension(TIniSection, IID_IniSection,
    TIniHook, IID_IniHook);


finalization
  PIDLManager.Free;

end.
