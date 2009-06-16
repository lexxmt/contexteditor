unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, StdCtrls, VirtualExplorerTree,
  VirtualShellToolBar, VirtualTrees, VirtualShellUtilities, ActiveX,
  VirtualWideStrings, ShlObj, VirtualShellNewMenu, ToolWin,
  VirtualShellHistory, VirtualShellNotifier, VirtualShellTypes, ImgList,
  ShellAPI;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    VirtualExplorerTreeview1: TVirtualExplorerTreeview;
    Splitter1: TSplitter;
    VirtualExplorerListview1: TVirtualExplorerListview;
    Panel1: TPanel;
    VirtualExplorerComboBox1: TVirtualExplorerCombobox;
    Panel3: TPanel;
    VirtualShellNewMenu1: TVirtualShellNewMenu;
    VirtualDriveToolbar1: TVirtualDriveToolbar;
    VirtualSpecialFolderToolbar1: TVirtualSpecialFolderToolbar;
    VirtualShellToolbar1: TVirtualShellToolbar;
    VirtualShellMRU1: TVirtualShellMRU;
    PopupMenuMRU: TPopupMenu;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Close1: TMenuItem;
    Tools1: TMenuItem;
    MapToDrive1: TMenuItem;
    UnMapDrive1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure VirtualExplorerListview1Change(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure VirtualExplorerListview1Updating(Sender: TBaseVirtualTree;
      State: TVTUpdateState);
    procedure FormShow(Sender: TObject);
    procedure VirtualExplorerListview1GetPopupMenu(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; const P: TPoint;
      var AskParent: Boolean; var PopupMenu: TPopupMenu);
    procedure ShellNewPopupMenu1CreateNewFile(Sender: TMenu;
      const NewMenuItem: TVirtualShellNewItem; var Path, FileName: String;
      var Allow: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VirtualShellNewMenu1AfterFileCreate(Sender: TMenu;
      const NewMenuItem: TVirtualShellNewItem; const FileName: WideString);
    procedure PopupMenuMRUPopup(Sender: TObject);
    procedure VirtualExplorerListview1RootChanging(
      Sender: TCustomVirtualExplorerTree; const NewValue: TRootFolder;
      const CurrentNamespace, Namespace: TNamespace; var Allow: Boolean);
    procedure Close1Click(Sender: TObject);
    procedure MapToDrive1Click(Sender: TObject);
    procedure UnMapDrive1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VirtualExplorerListview1RootChange(
      Sender: TCustomVirtualExplorerTree);
  private
    { Private declarations }
  public
    { Public declarations }
    Sorting: TSortDirection;
    SortingColumn: Integer;
  end;

var
  Form1: TForm1;

implementation

uses About;

{$R *.DFM}


procedure WalkPIDL(ParsedName, NormalName: TStrings; PIDL: PItemIDList);
var
  NS: TNamespace;
  i: integer;
  TempPIDL: PItemIDList;
begin
  ParsedName.Clear;
  NormalName.Clear;
  TempPIDL := PIDLMgr.CopyPIDL(PIDL);
  if PIDLMgr.IsDesktopFolder(PIDL) then
  begin
    NS := TNamespace.Create(PIDL, nil);
    NS.FreePIDLOnDestroy := False;
    ParsedName.Add(NS.NameForParsing);
    NormalName.Add(NS.NameNormal);
    NS.Free;
  end else
    for i := 0 to PIDLMgr.IDCount(TempPIDL) - 1 do
    begin
      NS := TNamespace.Create(TempPIDL, nil);
      NS.FreePIDLOnDestroy := False;
      ParsedName.Add(NS.NameForParsing);
      NormalName.Add(NS.NameNormal);
      NS.Free;
      PIDLMgr.StripLastID(TempPIDL);
    end;
  PIDLMgr.FreePIDL(TempPIDL)
end;

procedure TForm1.VirtualExplorerListview1Change(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  StatusBar1.Panels[0].Text := 'Selected Count = ' + IntToStr(VirtualExplorerListview1.SelectedCount);
end;

procedure TForm1.VirtualExplorerListview1Updating(Sender: TBaseVirtualTree; State: TVTUpdateState);
begin
  if Assigned(VirtualExplorerListview1.RootNode) then
    StatusBar1.Panels[1].Text := 'Total Objects = ' +
      IntToStr(VirtualExplorerListview1.RootNode.ChildCount);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  VirtualExplorerTreeview1.SetFocus;
  if FileExistsW('Settings.cfg') then
    VirtualShellToolbar1.LoadFromFile('Settings.cfg');
  VirtualShellMRU1.LoadFromRegistry(HKEY_CURRENT_USER, '\Software\VirtualShellTools\MRU');
end;

procedure TForm1.VirtualExplorerListview1GetPopupMenu(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; const P: TPoint;
  var AskParent: Boolean; var PopupMenu: TPopupMenu);
var
  NS: TNamespace;
begin
  PopupMenu := nil;
  if (Sender as TVirtualExplorerListview).ValidateNamespace(Sender.RootNode, NS) then
    if DirExistsW(NS.NameParseAddress) or (PIDLMgr.IsDesktopFolder(NS.AbsolutePIDL)) then
      PopupMenu := VirtualShellNewMenu1;
end;

procedure TForm1.ShellNewPopupMenu1CreateNewFile(Sender: TMenu;
  const NewMenuItem: TVirtualShellNewItem; var Path, FileName: String;
  var Allow: Boolean);
var
  NS: TNamespace;
begin
  if VirtualExplorerListview1.ValidateNamespace(VirtualExplorerListview1.RootNode, NS) then
  begin
    Path := NS.NameForParsing;
    if not DirExistsW(Path) then
      Path := '';
  end
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ChangeNotifier.UnRegisterKernelChangeNotify(VirtualExplorerListview1);
  VirtualShellToolbar1.SaveToFile('Settings.cfg');
  VirtualShellMRU1.SaveToRegistry(HKEY_CURRENT_USER, '\Software\VirtualShellTools\MRU');
end;

procedure TForm1.VirtualShellNewMenu1AfterFileCreate(Sender: TMenu;
  const NewMenuItem: TVirtualShellNewItem; const FileName: WideString);
var
  Node: PVirtualNode;
  NS: TNamespace;
begin
  Assert((toEditable in VirtualExplorerListview1.TreeOptions.MiscOptions), 'You must set the toEditable option to Edit paths');

  if DirExistsW(FileName) or FileExistsW(FileName) then
  begin
    Node := VirtualExplorerListview1.FindNode(FileName);
    // Make sure we can get to the desired folder so we can select the new item
    if not Assigned(Node) then
    begin
      NS := TNamespace.Create(PathToPIDL(FileName), nil);
      Node := VirtualExplorerListview1.AddCustomNode(Node, NS, toCheckSupport in VirtualExplorerListview1.TreeOptions.MiscOptions);
    end;
    if Assigned(Node) then
    begin
      if VirtualExplorerListview1.Header.Columns.Count = 0 then
        VirtualExplorerListview1.EditNode(Node, -1)
      else
        VirtualExplorerListview1.EditNode(Node, 0)
    end
  end
end;

procedure TForm1.PopupMenuMRUPopup(Sender: TObject);
begin
  VirtualShellMRU1.FillPopupMenu(PopupMenuMRU, fpdNewestToOldest, True, 'Clear List...');
end;

procedure TForm1.VirtualExplorerListview1RootChanging(
  Sender: TCustomVirtualExplorerTree; const NewValue: TRootFolder;
  const CurrentNamespace, Namespace: TNamespace; var Allow: Boolean);
begin
  if Assigned(Namespace) then
  begin
    if DirExistsW(Namespace.NameForParsing) then
      ChangeNotifier.NotifyWatchFolder(VirtualExplorerListview1, Namespace.NameForParsing)
    else
      ChangeNotifier.NotifyWatchFolder(VirtualExplorerListview1, '')
  end;

  // Save the state of the header
  if CurrentNamespace.FileSystem then
  begin
    Sorting := VirtualExplorerListview1.Header.SortDirection;
    SortingColumn := VirtualExplorerListview1.Header.SortColumn;
  end
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.MapToDrive1Click(Sender: TObject);
begin
  WNetConnectionDialog(Handle, RESOURCETYPE_DISK)
end;

procedure TForm1.UnMapDrive1Click(Sender: TObject);
begin
  WNetDisconnectDialog(Handle, RESOURCETYPE_DISK)
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  AboutBox.ShowModal
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  ChangeNotifier.RegisterKernelChangeNotify(VirtualExplorerListview1, AllKernelNotifiers);
  // Register some special Folders that the thread will be able to generate
  // notification PIDLs for Virtual Folders too.
  ChangeNotifier.RegisterKernelSpecialFolderWatch(CSIDL_DESKTOP);
  ChangeNotifier.RegisterKernelSpecialFolderWatch(CSIDL_PERSONAL);
  ChangeNotifier.RegisterKernelSpecialFolderWatch(CSIDL_COMMON_DOCUMENTS);
end;

procedure TForm1.VirtualExplorerListview1RootChange(
  Sender: TCustomVirtualExplorerTree);
begin
  // Restore the state of the header
  if VirtualExplorerListview1.RootFolderNamespace.FileSystem then
  begin
    VirtualExplorerListview1.Header.SortDirection := Sorting;
    VirtualExplorerListview1.Header.SortColumn := SortingColumn
  end
end;

end.

