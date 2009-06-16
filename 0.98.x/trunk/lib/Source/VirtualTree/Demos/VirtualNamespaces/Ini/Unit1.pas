unit Unit1;

//
// THIS PROJECT MUST BE COMPILED WITH A GLOBAL CONDITIONAL DEFINE
//   VIRTUALNAMESPACES
// TO WORK.
//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualShellUtilities, ExtCtrls, VirtualExplorerTree,
  VirtualTrees, VirtualWideStrings, VirtualNamespace, IniNamespace;

type
  TForm1 = class(TForm)
    VirtualExplorerTreeview1: TVirtualExplorerTreeview;
    VirtualExplorerListview1: TVirtualExplorerListview;
    Splitter1: TSplitter;
    procedure VirtualExplorerTreeview1EnumFolder(
      Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
      var AllowAsChild: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.VirtualExplorerTreeview1EnumFolder(
  Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
  var AllowAsChild: Boolean);
begin
  if not Namespace.Folder then
  begin
    // Note we are doing a hard hook so we can create our own details view for the
    // real namespace
    if (ExtractFileExtW( StrUpperW(PWideChar(Namespace.NameInFolder))) = '.INI') then
      NamespaceExtensionFactory.HookPIDL(Namespace.AbsolutePIDL, IID_IniSection, True)
    else
      AllowAsChild := False
  end
end;

end.
