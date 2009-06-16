unit Unit1;

// This demo needs Indy 9.0 to compile
// ALSO DEFINE:
//    VIRTUALNAMESPACES
// in
//    Project>Options>Directories/Contitionals>Conditional Defines
// and recompile

interface

{$include ..\..\..\Include\VSToolsAddIns.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VirtualNamespace, shlobj, ActiveX, VirtualTrees, VirtualExplorerTree, ComObj,
  VirtualWideStrings, VirtualShellUtilities, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, IdURI, IdFTPCommon, StdCtrls, FTPNamespace, Menus;

const
  FTP_FOLDER = 'F:\Program Data\Delphi Projects\3rd Party Components\VirtualShellTools\Demos\VirtualNamespaces\FTP';
  FTP_VIRTUALFOLDER = 'Virtual FTP Explorer';

type
  TForm1 = class(TForm)
    VirtualExplorerListview1: TVirtualExplorerListview;
    Splitter1: TSplitter;
    Memo1: TMemo;
    VirtualExplorerTreeview1: TVirtualExplorerTreeview;
    Panel1: TPanel;
    Button1: TButton;
    procedure VirtualExplorerTreeview1InitNode(Sender: TBaseVirtualTree;
      ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure FormCreate(Sender: TObject);
    procedure VirtualExplorerListview1InitNode(Sender: TBaseVirtualTree;
      ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FTPUpdateCallback(Feedback: TStrings);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.VirtualExplorerTreeview1InitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
{$IFDEF VIRTUALNAMESPACES}
var
  NS: TNamespace;
{$ENDIF}
begin
  {$IFDEF VIRTUALNAMESPACES}
  if VirtualExplorerTreeview1.ValidateNamespace(Node, NS) then
    if NS.Folder and (NS.NameNormal = FTP_VIRTUALFOLDER) then
    begin
      // If you change the HardHook to False then any real objects in the folder
      // will also be shown in the folder with the VSN objects
      // When doing this the details are defined by the real namespaces (the hooked
      // namespace) parent
      //
      // HardHooking hijacks the real namespace and only VSN's are shown under it
      // A concequence of this is we can show our own detail columns and details
      NamespaceExtensionFactory.HookPIDL(NS.AbsolutePIDL, IID_IFtpHost, True);
      Include(InitialStates, ivsHasChildren);
    end
  {$ENDIF}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FTPCallback := FTPUpdateCallback;
end;

procedure TForm1.VirtualExplorerListview1InitNode(Sender: TBaseVirtualTree;
  ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
{$IFDEF VIRTUALNAMESPACES}
var
  NS: TNamespace;
{$ENDIF}
begin
  {$IFDEF VIRTUALNAMESPACES}
  if VirtualExplorerTreeview1.ValidateNamespace(Node, NS) then
    if NS.Folder and (NS.NameNormal = FTP_VIRTUALFOLDER) then
    begin
      // If you change the HardHook to False then any real objects in the folder
      // will also be shown in the folder with the VSN objects
      // When doing this the details are defined by the real namespaces (the hooked
      // namespace) parent
      //
      // HardHooking hijacks the real namespace and only VSN's are shown under it
      // A concequence of this is we can show our own detail columns and details
      NamespaceExtensionFactory.HookPIDL(NS.AbsolutePIDL, IID_IFtpHost, True);
      Include(InitialStates, ivsHasChildren);
    end
  {$ENDIF}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if DirectoryExists(FTP_FOLDER) then
  begin
    VirtualExplorerTreeview1.BrowseTo(FTP_FOLDER);
    VirtualExplorerTreeview1.ScrollIntoView(VirtualExplorerTreeview1.FindNode(FTP_FOLDER), True)
  end else
    ShowMessage('Set the FTP_FOLDER in the program unit to point to the ''Virtual FTP Explorer'' to jump to it quickly');
end;

procedure TForm1.FTPUpdateCallback(Feedback: TStrings);
var
  i: Integer;
begin
  for i := 0 to Feedback.Count - 1 do
    Memo1.Lines.Add(Feedback[i]);
end;

end.
