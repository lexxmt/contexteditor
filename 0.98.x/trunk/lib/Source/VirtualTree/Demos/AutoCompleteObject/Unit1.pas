unit Unit1;

// Demo of how to custom popuplate the Autocomple drop down

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, VirtualExplorerTree, ExtCtrls, VirtualTrees, VirtualWideStrings;

type
  TForm1 = class(TForm)
    ExplorerTreeview1: TVirtualExplorerTreeview;
    ExplorerListview1: TVirtualExplorerListview;
    ExplorerComboBox1: TVirtualExplorerCombobox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure ExplorerComboBox1AutoCompleteUpdateList(Sender: TObject;
      const CurrentEditContents: WideString; EnumList: TWideStringList;
      var Handled: Boolean);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ExplorerComboBox1AutoCompleteUpdateList(Sender: TObject;
  const CurrentEditContents: WideString; EnumList: TWideStringList;
  var Handled: Boolean);
var
  i: integer;
begin   
  if not CheckBox2.Checked then
  begin
    Handled := True; // We are handling the autocomplete list
    EnumList.Add('C:\');
    EnumList.Add('C:\Windows');
    EnumList.Add('C:\Windows\System');
    EnumList.Add('C:\WinNT');
    EnumList.Add('C:\WinNT\System32');
    EnumList.Add('D:\');
    EnumList.Add('Control Panel');
    EnumList.Add('Recycle Bin');

    if CheckBox1.Checked then
    begin
      for i := EnumList.Count - 1 downto 0 do
        if Pos(AnsiUpperCase(CurrentEditContents), AnsiUpperCase(EnumList[i])) = 0 then
          EnumList.Delete(i);
    end;
  end
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    CheckBox1.Enabled := False;
  end else
  begin
    CheckBox1.Enabled := True;
  end
end;

end.
