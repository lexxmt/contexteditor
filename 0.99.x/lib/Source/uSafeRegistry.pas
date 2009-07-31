unit uSafeRegistry;

interface

uses
  SysUtils, Windows, Messages, Classes, StdCtrls, ComCtrls, Registry, Math, Graphics,
  Forms;

type
  TSafeRegistry = class(TRegistry)
  public
    procedure ReadListViewWidths(ListView:TListView);
    procedure WriteListViewWidths(ListView:TListView);

    procedure ReadComboBoxHistory(Key:string; ItemPrefix:string; ComboBox:TComboBox; MaxItems: integer);
    procedure WriteComboBoxHistory(Key:string; ItemPrefix:string; ComboBox:TComboBox; MaxItems: integer);

    procedure ReadFontData(KeyNamePrefix: string; Font: TFont);
    procedure WriteFontData(KeyNamePrefix: string; Font: TFont);

    procedure ReadFormLayout(Form: TForm);
    procedure WriteFormLayout(Form: TForm);

    function ReadString(Name:string; Default:string):string; reintroduce;
    function ReadInteger(Name:string; Default:integer):integer; reintroduce;
    function ReadBool(Name:string; Default:boolean):boolean; reintroduce;
    function ReadFloat(Name:string; Default:double):double; reintroduce;
    function ReadBinaryData(Name:string; var Buffer; BufferSize:integer):integer; reintroduce;
  end;

implementation

////////////////////////////////////////////////////////////////////////////////////////////
//                                     TSafeRegistry
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function TSafeRegistry.ReadString(Name:string; Default:string):string;
begin
  if ValueExists(Name) then
    result:=inherited ReadString(Name)
  else
    result:=Default;
end;
//------------------------------------------------------------------------------------------
function TSafeRegistry.ReadInteger(Name: string; Default: integer): integer;
begin
  if ValueExists(Name) then
    result:=inherited ReadInteger(Name)
  else
    result:=Default;
end;
//------------------------------------------------------------------------------------------
function TSafeRegistry.ReadBool(Name: string; Default: boolean): boolean;
begin
  if ValueExists(Name) then
    result:=inherited ReadBool(Name)
  else
    result:=Default;
end;
//------------------------------------------------------------------------------------------
function TSafeRegistry.ReadFloat(Name:string; Default:double):double;
begin
  if ValueExists(Name) then
    result:=inherited ReadFloat(Name)
  else
    result:=Default;
end;
//------------------------------------------------------------------------------------------
function TSafeRegistry.ReadBinaryData(Name:string; var Buffer; BufferSize:integer):integer;
begin
  if ValueExists(Name) then
    result:=inherited ReadBinaryData(Name, Buffer, BufferSize)
  else
    result:=0;
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.ReadListViewWidths(ListView: TListView);
var
  i :integer;
begin
  for i:=0 to ListView.Columns.Count-1 do
    ListView.Columns[i].Width:=ReadInteger(ListView.Name+IntToStr(i), ListView.Columns[i].Width);
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.WriteListViewWidths(ListView: TListView);
var
  i :integer;
begin
  for i:=0 to ListView.Columns.Count-1 do
    WriteInteger(ListView.Name+IntToStr(i), ListView.Columns[i].Width);
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.ReadComboBoxHistory(Key, ItemPrefix: string; ComboBox: TComboBox; MaxItems: integer);
var
  i: integer;
  s: string;
  n: integer;
begin
  ComboBox.Items.Clear;
  ComboBox.Items.BeginUpdate;
  try
    OpenKey(Key, TRUE);

    n:=ReadInteger('Count', 0);
    n:=Min(n, MaxItems);

    for i:=0 to n-1 do begin
      s:=ReadString(ItemPrefix+IntToStr(i), '');
      if (Length(s)>0) then
        ComboBox.Items.Add(s);
    end;

    ComboBox.Text:=ReadString(ItemPrefix+'Active', '');
  finally
    ComboBox.Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.WriteComboBoxHistory(Key, ItemPrefix: string; ComboBox: TComboBox; MaxItems: integer);
var
  i: integer;
  s: string;
  n: integer;
begin
  s:=ComboBox.Text;
  n:=ComboBox.Items.IndexOf(s);
  if (n<>-1) then
    ComboBox.Items.Delete(n);
  ComboBox.Items.Insert(0, s);

  while (ComboBox.Items.Count>MaxItems) do
    ComboBox.Items.Delete(ComboBox.Items.Count-1);

  OpenKey(Key, TRUE);
  n:=Min(ComboBox.Items.Count, MaxItems);

  for i:=0 to n-1 do
    if (Length(ComboBox.Items[i])>0) then
      WriteString(ItemPrefix+IntToStr(i), ComboBox.Items[i]);

  WriteInteger('Count', n);
  WriteString(ItemPrefix+'Active', s);
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.ReadFontData(KeyNamePrefix: string; Font: TFont);
begin
  with Font do begin
    Name:=ReadString(KeyNamePrefix+'Name', 'Courier New');
    Size:=ReadInteger(KeyNamePrefix+'Size', 10);
    Color:=ReadInteger(KeyNamePrefix+'Color', clWindowText);
    Style:=TFontStyles(byte(ReadInteger(KeyNamePrefix+'Style', 0)));
  end;
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.WriteFontData(KeyNamePrefix: string; Font: TFont);
begin
  with Font do begin
    WriteString(KeyNamePrefix+'Name', Name);
    WriteInteger(KeyNamePrefix+'Size', Size);
    WriteInteger(KeyNamePrefix+'Color', Color);
    WriteInteger(KeyNamePrefix+'Style', byte(Style));
  end;
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.ReadFormLayout(Form: TForm);
var
  WinPos: TWindowPlacement;
begin
  WinPos.length:=SizeOf(TWindowPlacement);
  GetWindowPlacement(Form.Handle, @WinPos);
  WinPos.rcNormalPosition.Left:=ReadInteger('FormLeft', Form.Left);
  WinPos.rcNormalPosition.Top:=ReadInteger('FormTop', Form.Top);
  WinPos.rcNormalPosition.Right:=ReadInteger('FormWidth', Form.Width)+WinPos.rcNormalPosition.Left;
  WinPos.rcNormalPosition.Bottom:=ReadInteger('FormHeight', Form.Height)+WinPos.rcNormalPosition.Top;
  WinPos.showCmd:=SW_HIDE;       // da ne bljesne pri maksimizaciji
  SetWindowPlacement(Form.Handle, @WinPos);

  if ReadBool('FormMaximized', FALSE) then
    Form.WindowState:=wsMaximized;
end;
//------------------------------------------------------------------------------------------
procedure TSafeRegistry.WriteFormLayout(Form: TForm);
var
  WinPos: TWindowPlacement;
begin
  WinPos.length:=SizeOf(TWindowPlacement);
  GetWindowPlacement(Form.Handle, @WinPos);
  WriteInteger('FormLeft', WinPos.rcNormalPosition.Left);
  WriteInteger('FormTop', WinPos.rcNormalPosition.Top);
  WriteInteger('FormWidth', WinPos.rcNormalPosition.Right-WinPos.rcNormalPosition.Left);
  WriteInteger('FormHeight', WinPos.rcNormalPosition.Bottom-WinPos.rcNormalPosition.Top);
  WriteBool('FormMaximized', Form.WindowState=wsMaximized);
end;
//------------------------------------------------------------------------------------------

end.
