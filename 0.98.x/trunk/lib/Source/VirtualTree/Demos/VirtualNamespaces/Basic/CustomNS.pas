unit CustomNS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ImgList, ShlObj,
  ShellAPI, ActiveX, ComObj, VirtualPIDLTools, VirtualShellUtilities,
  VirtualNamespace;

const
  SID_IGerardsHookNamespace = '{F41C7411-8364-4DB7-B28A-6B1F0BFA84EC}';
  SID_IGerardsNamespace = '{4A72EDC1-8A8F-47FE-AD29-81C70A804E9B}';

  IID_IGerardsHookNamespace: TGUID = SID_IGerardsHookNamespace;
  IID_IGerardsNamespace: TGUID = SID_IGerardsNamespace;

type
  TGerardsHookPIDL = class(TItemID)
  end;

  TGerardsPIDL = class(TItemID)
  private
    FData1: Boolean;
    FData2: Integer;

  public
    procedure LoadPIDLStream(S: TStream); override;
    procedure SavePIDLStream(S: TStream); override;

    property Data1: Boolean read FData1 write FData1;
    property Data2: Integer read FData2 write FData2;
  end;

  TGerardsHookNamespace = class(TBaseVirtualNamespaceExtension)
  private
    FHelper: TGerardsPIDL;
  protected
    function Attributes(ChildPIDLList: TPIDLList; Attribs: TFolderAttributes): TFolderAttributes; override;
    function CreateItemID: TItemID; override;  // must override abstract methods
    procedure DisplayName(ChildPIDL: PItemIDList; NameType: TDisplayNameFlags; var StrRet: TStrRet); override;
    procedure IconIndex(ChildPIDL: PItemIDList; IconStyle: TVirtualIconFlags; var IconIndex: integer); override;
    function RetrieveClassID: TCLSID; override;

  public
    constructor Create; override;
    destructor Destroy; override;


    property Helper: TGerardsPIDL read FHelper write FHelper;

  end;

  TGerardsNamespace = class(TBaseVirtualNamespaceExtension)
  public
    function CreateItemID: TItemID; override;  // must override abstract methods
    function RetrieveClassID: TCLSID; override;
  end;

implementation

{ TGerardsPIDL }

procedure TGerardsPIDL.LoadPIDLStream(S: TStream);
begin
  inherited;
  S.read(FData1, SizeOf(FData1));
  S.read(FData2, SizeOf(FData2));
end;

procedure TGerardsPIDL.SavePIDLStream(S: TStream);
begin
  inherited;
  S.write(FData1, SizeOf(FData1));
  S.write(FData2, SizeOf(FData2));
end;

{ TGerardsHookNamespace }

function TGerardsHookNamespace.Attributes(ChildPIDLList: TPIDLList;
  Attribs: TFolderAttributes): TFolderAttributes;
begin
  Result := [];
end;

constructor TGerardsHookNamespace.Create;
begin
  inherited;
  FHelper := TGerardsPIDL.Create(IID_IGerardsNamespace);
end;

function TGerardsHookNamespace.CreateItemID: TItemID;
begin
  Result := TGerardsHookPIDL.Create(IID_IGerardsHookNamespace);
end;

destructor TGerardsHookNamespace.Destroy;
begin
  FHelper.Free;
  inherited;
end;

procedure TGerardsHookNamespace.DisplayName(ChildPIDL: PItemIDList;
  NameType: TDisplayNameFlags; var StrRet: TStrRet);
begin
  // The InFolder Name is always stored in the PIDL so we pass back the
  // Offset to the PChar in the PIDL
  StrRet.uType := STRRET_OFFSET;
  StrRet.uOffset := InFolderNameASCII_Offset
end;
         
procedure TGerardsHookNamespace.IconIndex(ChildPIDL: PItemIDList;
  IconStyle: TVirtualIconFlags; var IconIndex: integer);
begin
  IconIndex := 6;
end;

function TGerardsHookNamespace.RetrieveClassID: TCLSID;
begin
  Result := IID_IGerardsHookNamespace
end;

{ TGerardsNamespace }

function TGerardsNamespace.CreateItemID: TItemID;
begin
  Result := TGerardsPIDL.Create(IID_IGerardsNamespace);
end;

function TGerardsNamespace.RetrieveClassID: TCLSID;
begin
  Result := IID_IGerardsNamespace
end;

initialization
  NamespaceExtensionFactory.RegisterNamespaceExtension(
    TGerardsNamespace,
    IID_IGerardsNamespace,
    TGerardsHookNamespace,
    IID_IGerardsHookNamespace
  );

end.
