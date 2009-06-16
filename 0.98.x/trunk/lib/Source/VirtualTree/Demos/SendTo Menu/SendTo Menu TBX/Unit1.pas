unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, VirtualSendToMenu, ComCtrls, ToolWin, VirtualTrees,
  VirtualExplorerTree, VirtualShellUtilities, ImgList, ActiveX,
  VirtualShellHistory, TB2Item, TBX, TB2Dock, TB2Toolbar, StdCtrls,
  TBXSwitcher, TBXOfficeXPTheme, TBXStripesTheme;

type
  TForm1 = class(TForm)
    VirtualSendToMenu1: TVirtualSendToMenu;
    VirtualExplorerListview1: TVirtualExplorerListview;
    ImageList1: TImageList;
    TBDock1: TTBDock;
    TBXToolbar1: TTBXToolbar;
    TBXItem3: TTBXItem;
    TBXItem2: TTBXItem;
    TBXSubmenuItem1: TTBXSubmenuItem;
    TBXSwitcher1: TTBXSwitcher;
    procedure VirtualExplorerListview1Change(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure VirtualExplorerListview1RootChange(
      Sender: TCustomVirtualExplorerTree);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure VirtualSendToMenu1SendToEvent(Sender: TVirtualSendToMenu;
      SendToTarget: TNamespace; var SourceData: IDataObject);
    procedure TBXSubmenuItem1Popup(Sender: TTBCustomItem;
      FromLink: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.VirtualExplorerListview1Change(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  NS: TNamespace;
begin
  if VirtualExplorerListview1.ValidateNamespace(Node, NS) then
  begin
    TBXSubmenuItem1.Enabled := NS.CanCopy;
    TBXItem3.Enabled := NS.Folder;
    TBXItem2.Enabled := not VirtualExplorerListview1.RootFolderNamespace.IsDesktop;
  end
end;

procedure TForm1.VirtualExplorerListview1RootChange(Sender: TCustomVirtualExplorerTree);
var
  NS: TNamespace;
begin
  TBXItem2.Enabled := not VirtualExplorerListview1.RootFolderNamespace.IsDesktop;
  if VirtualExplorerListview1.ValidateNamespace(VirtualExplorerListview1.GetFirstSelected, NS) then
  begin
    TBXSubmenuItem1.Enabled := NS.CanCopy;
    TBXItem3.Enabled := NS.Folder;
  end else
  begin
    TBXSubmenuItem1.Enabled := False;
    TBXItem3.Enabled := False;
  end
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  VirtualExplorerListview1.BrowseToNextLevel;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  VirtualExplorerListview1.BrowseToPrevLevel;
end;

procedure TForm1.VirtualSendToMenu1SendToEvent(Sender: TVirtualSendToMenu;
  SendToTarget: TNamespace; var SourceData: IDataObject);
begin
  SourceData := VirtualExplorerListview1.SelectedToDataObject;
end;

procedure TForm1.TBXSubmenuItem1Popup(Sender: TTBCustomItem; FromLink: Boolean);
begin
  //Just call this method when the SubmenuItem is about to be showed.
  VirtualSendToMenu1.Populate_TB2000(Sender);
end;

end.
