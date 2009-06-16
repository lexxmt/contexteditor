unit MainFrm;
// DEFINE "VIRTUALNAMESPACES" under Project>Options>Directories/Conditionals

// under construction

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls,
  VirtualNamespace, VirtualTrees, VirtualExplorerTree, VirtualShellUtilities,
  ZipNamespace, Utilities, Menus;

type
  TMainForm = class(TForm)
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    est1: TMenuItem;
    mnuView2: TMenuItem;
    pnlB: TPanel;
    VetB: TVirtualExplorerTree;
    Listview: TVirtualExplorerListview;
    pnlA: TPanel;
    TreeView: TVirtualExplorerTreeview;
    VetA: TVirtualExplorerTree;
    mnuView1: TMenuItem;
    procedure TreeViewEnumFolder(
      Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
      var AllowAsChild: Boolean);
//    procedure VetAGetVETText(
//      Sender: TCustomVirtualExplorerTree; Column: TColumnIndex;
//      Node: PVirtualNode; Namespace: TNamespace; var Text: WideString);
    procedure InitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure ShellExecute(
      Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
      var WorkingDir, CmdLineArgument: WideString; var Allow: Boolean);
    procedure PaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure mnuView1Click(Sender: TObject);
    procedure mnuView2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure VetEnumFolder(Sender: TCustomVirtualExplorerTree;
      Namespace: TNamespace; var AllowAsChild: Boolean);
  private
  protected
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

{$R ZipMsgUS.res}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TreeView.Align := alClient;
  ListView.Align := alClient;
  VetA.Align := alClient;
  VetB.Align := alClient;
  mnuView1Click(self);
end;

procedure TMainForm.InitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  NS: TNameSpace;
begin
  if TCustomVirtualExplorerTree(Sender).ValidateNamespace(node, NS) then
    if LowerCase(NS.Extension) = '.zip' then
    begin
      NamespaceExtensionFactory.HookPIDL(NS.AbsolutePIDL, IID_INamespaceZip, True);
      Include(InitialStates, ivsHasChildren);
    end
end;

procedure TMainForm.TreeViewEnumFolder(
  Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
  var AllowAsChild: Boolean);
var
  GUID: TGUID;
begin
  AllowAsChild :=
    (NameSpace.Folder or (Namespace.Extension = '.zip')) and
    (NameSpace.IsMyComputer or NameSpace.IsNetworkNeighborhoodChild or
     NameSpace.FileSystem or
     NamespaceExtensionFactory.ExtractVirtualGUID(Namespace.AbsolutePIDL, GUID))
    and not Namespace.Link;
end;

(*
procedure TMainForm.VetAGetVETText(
  Sender: TCustomVirtualExplorerTree; Column: TColumnIndex;
  Node: PVirtualNode; Namespace: TNamespace; var Text: WideString);
var
  Helper: TPIDLZip;
begin
  if NamespaceExtensionFactory.IsVirtualPIDL(Namespace.RelativePIDL) then
  begin
    if Column > 0 then
    begin
      Helper := TPIDLZip.Create(IID_INamespaceZip);
      Helper.ItemID := Namespace.RelativePIDL;
      case Column of
        1: if not Helper.IsFolder then
             Text := IntToStr(Helper.UnCompressedSize)
            else
             Text := '';
        2: if Helper.IsFolder then
             Text := 'File Folder'
           else
             Text := 'File';
        3: begin
             if Helper.Date > 0 then
               Text := DateTimeToStr(FileDateToDateTime(Helper.Date));
           end;
        4: Text := MakeAttributeString(Helper.Attributes);
      else
        Text := ''
      end;
      Helper.Free;
    end
  end;
end;
*)

procedure TMainForm.ShellExecute(
  Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
  var WorkingDir, CmdLineArgument: WideString; var Allow: Boolean);
var
  GUID: TGUID;
  APIDLArray: TPIDLArray;
  Node: PVirtualNode; NS: TNamespace;
begin
  Node := Sender.GetFirstSelected;
  if TCustomVirtualExplorerTree(Sender).ValidateNamespace(Node, NS) and
     NamespaceExtensionFactory.ExtractVirtualGUID(NS.AbsolutePIDL, GUID) then
  begin
    SetLength(APIDLArray, 1);
    APIDLArray[0] := Namespace.RelativePIDL;
    Namespace.ExecuteContextMenuVerb('zip_open', APIDLArray);
    Allow := False;
  end;
end;

procedure TMainForm.PaintText(
  Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  NS: TNameSpace; GUID: TGUID;
begin
  if TCustomVirtualExplorerTree(Sender).ValidateNamespace(Node, NS) and
       NamespaceExtensionFactory.ExtractVirtualGUID(NS.AbsolutePIDL, GUID) then
    TargetCanvas.Font.Color := clGreen;
end;

procedure TMainForm.mnuView1Click(Sender: TObject);
begin
  TreeView.Visible := True;
  ListView.Visible := True;
  VetA.Visible := False;
  VetB.Visible := False;
end;

procedure TMainForm.mnuView2Click(Sender: TObject);
begin
  TreeView.Visible := False;
  ListView.Visible := False;
  VetA.Visible := True;
  VetB.Visible := True;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.VetEnumFolder(Sender: TCustomVirtualExplorerTree;
  Namespace: TNamespace; var AllowAsChild: Boolean);
var
  GUID: TGUID;
begin
  AllowAsChild :=
    (NameSpace.Folder) or // (Namespace.Extension = '.zip')) and
    (NameSpace.IsMyComputer or NameSpace.IsNetworkNeighborhoodChild or
     NameSpace.FileSystem or
     NamespaceExtensionFactory.ExtractVirtualGUID(Namespace.AbsolutePIDL, GUID))
    and not Namespace.Link;
end;

end.
