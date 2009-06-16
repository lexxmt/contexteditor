unit Unit1;

// MAKE SURE TO DEFINE "VIRTUALNAMESPACES" under Project>Options>Directories/Conditionals
//
// This is an example of a down and dirty NSE example it works ok for single objects that
// are under a real namespace.  The prefered method is to create a decendant of
// TBaseVirtualNamespaceExtension and implement the necessary methods
//

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CustomNS, VirtualNamespace, VirtualTrees, VirtualExplorerTree,
  VirtualShellUtilities, ShlObj;

type
  TForm2 = class(TForm)
    VirtualExplorerListview1: TVirtualExplorerListview;
    VirtualExplorerTreeview1: TVirtualExplorerTreeview;
    procedure VirtualExplorerListview1CustomNamespace(
      Sender: TCustomVirtualExplorerTree; AParentNode: PVirtualNode);
    procedure VirtualExplorerListview1EnumFolder(
      Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
      var AllowAsChild: Boolean);
    procedure VirtualExplorerListview1GetVETText(
      Sender: TCustomVirtualExplorerTree; Column: TColumnIndex;
      Node: PVirtualNode; Namespace: TNamespace; var Text: WideString);
  private
    { Private declarations }
  protected

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.VirtualExplorerListview1CustomNamespace(
  Sender: TCustomVirtualExplorerTree; AParentNode: PVirtualNode);
{$IFDEF VIRTUALNAMESPACES}
var
  NS: TNamespace;
  CustomPIDL: TGerardsPIDL;
  PIDL, RelativePIDL: PItemIDList;
{$ENDIF VIRTUALNAMESPACES}
begin
  {$IFDEF VIRTUALNAMESPACES}
  // Put it under the desktop
  if VirtualExplorerListview1.ValidateNamespace(AParentNode, NS) then
  begin
    if NS.IsDesktop then
    begin
      CustomPIDL := TGerardsPIDL.Create(IID_IGerardsNamespace);
      CustomPIDL.InFolderNameASCII := 'Gerards Namespace';
      CustomPIDL.Data1 := True;
      CustomPIDL.Data2 := 456;
      RelativePIDL := CustomPIDL.ItemID;
      PIDL := PIDLMgr.AppendPIDL(NS.AbsolutePIDL, RelativePIDL);
      PIDLMgr.FreePIDL(RelativePIDL);
      VirtualExplorerListview1.AddCustomNode(AParentNode, TNamespace.Create(PIDL, nil), False);
      // Any Namespace that has a Virtual Child must be hooked
      NamespaceExtensionFactory.HookPIDL(NS.AbsolutePIDL, IID_IGerardsNamespace, False);
    end
  end
  {$ENDIF VIRTUALNAMESPACES}
end;

procedure TForm2.VirtualExplorerListview1EnumFolder(
  Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
  var AllowAsChild: Boolean);
//var
//  GUID: TGUID;
begin
 // AllowAsChild :=  NamespaceExtensionFactory.ExtractVirtualGUID(Namespace.AbsolutePIDL, GUID)
end;

procedure TForm2.VirtualExplorerListview1GetVETText(
  Sender: TCustomVirtualExplorerTree; Column: TColumnIndex;
  Node: PVirtualNode; Namespace: TNamespace; var Text: WideString);
var
  Helper: TGerardsPIDL;
begin
  // Because details are handled by the Parent of the objects in this case our
  // custom namespace is not a child of the real namespace so it can't show the
  // details.  It is very difficult for VET to handle this case so we will just have
  // to find it ourselves and fix the details.
  if NamespaceExtensionFactory.IsVirtualPIDL(Namespace.RelativePIDL) then
  begin
    if Column > 0 then
    begin
      Helper := TGerardsPIDL.Create(IID_IGerardsNamespace);
      Helper.ItemID := Namespace.RelativePIDL;
      case Column of
        1: if Helper.Data1 then
             Text := 'Data1 = True'
           else
             Text := 'Data1 = False';
        2: Text := 'Data2 = ' + IntToStr(Helper.Data2);
      else
        Text := ''
      end;
      Helper.Free;
    end
  end;
end;

end.
