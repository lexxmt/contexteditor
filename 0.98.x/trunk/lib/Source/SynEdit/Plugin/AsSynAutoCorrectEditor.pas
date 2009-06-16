unit AsSynAutoCorrectEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, AsSynAutoCorrect, Buttons, Registry;

type
  TfrmAutoCorrectEditor = class(TForm)
    lblLabel1: TLabel;
    lblLabel2: TLabel;
    lbxItems: TListBox;
    pnlSeparator: TPanel;
    btnAdd: TSpeedButton;
    btnDelete: TSpeedButton;
    btnClear: TSpeedButton;
    btnEdit: TSpeedButton;
    btnExit: TSpeedButton;
    bvlSeparator: TBevel;
    procedure FormShow(Sender: TObject);
    procedure lbxItemsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure lbxItemsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    AsSynAutoCorrect: TAsSynAutoCorrect;
  end;

var
  frmAutoCorrectEditor: TfrmAutoCorrectEditor;
  Reg: TRegIniFile;

implementation

{$R *.DFM}

procedure TfrmAutoCorrectEditor.FormShow(Sender: TObject);
var
  i: Integer;

begin
  Reg := TRegIniFile.Create('');
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Aerodynamica\Components\AsSynAutoCorrect', True);

  i := Reg.ReadInteger('', 'Top', 0);
  if i <> 0 then Top := i;

  i := Reg.ReadInteger('', 'Left', 0);
  if i <> 0 then Left := i;

  i := Reg.ReadInteger('', 'Width', 0);
  if i <> 0 then Width := i;

  i := Reg.ReadInteger('', 'Height', 0);
  if i <> 0 then Height := i;

  lbxItems.Items.Assign(AsSynAutoCorrect.ReplaceItems);
end;

procedure TfrmAutoCorrectEditor.lbxItemsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  CurrentText: String;

begin
  CurrentText := lbxItems.Items[Index];

  with lbxItems do
  begin
    Canvas.FillRect(Rect);

    Canvas.TextOut(Rect.Left + 2, Rect.Top, HalfString(CurrentText, True));
    Canvas.TextOut(Rect.Left + (lbxItems.ClientWidth div 2) + 2, Rect.Top, HalfString(CurrentText, False));
  end;
end;

procedure TfrmAutoCorrectEditor.btnAddClick(Sender: TObject);
var
  sReplaceFrom, sReplaceTo: String;

begin
  if InputQuery('Add...', 'Replace:', sReplaceFrom) then
    InputQuery('Add...', 'With:', sReplaceTo)
  else
    Exit;

  with AsSynAutoCorrect do
  begin
    if (sReplaceFrom <> '') and (sReplaceTo <> '') then
    begin
      Add(sReplaceFrom, sReplaceTo);
      lbxItems.Items.Assign(AsSynAutoCorrect.ReplaceItems);
    end;
  end;

  btnDelete.Enabled := not lbxItems.ItemIndex < 0;
  btnEdit.Enabled := not lbxItems.ItemIndex < 0;
end;

procedure TfrmAutoCorrectEditor.btnDeleteClick(Sender: TObject);
begin
  if lbxItems.ItemIndex < 0 then
  begin
    MessageBox(0, 'Please select an item before executing this command!', 'Error', MB_APPLMODAL or MB_ICONERROR);

    Exit;
  end;

  AsSynAutoCorrect.Delete(lbxItems.ItemIndex);
  lbxItems.Items.Assign(AsSynAutoCorrect.ReplaceItems);

  btnDelete.Enabled := not lbxItems.ItemIndex < 0;
  btnEdit.Enabled := not lbxItems.ItemIndex < 0;
end;

procedure TfrmAutoCorrectEditor.btnEditClick(Sender: TObject);
var
  sReplaceFrom, sReplaceTo, CurrentText: String;

begin
  if lbxItems.ItemIndex < 0 then
  begin
    MessageBox(0, 'Please select an item before executing this command!', 'Error', MB_APPLMODAL or MB_ICONERROR);

    Exit;
  end;

  CurrentText := AsSynAutoCorrect.ReplaceItems[lbxItems.ItemIndex];
  sReplaceFrom := HalfString(CurrentText, True);
  sReplaceTo := HalfString(CurrentText, False);

  if InputQuery('Edit...', 'Replace:', sReplaceFrom) then
    InputQuery('Edit...', 'With:', sReplaceTo)
  else
    Exit;

  with AsSynAutoCorrect do
  begin
    Edit(lbxItems.ItemIndex, sReplaceFrom, sReplaceTo);

    lbxItems.Items.Assign(AsSynAutoCorrect.ReplaceItems);
  end;

  btnDelete.Enabled := not lbxItems.ItemIndex < 0;
  btnEdit.Enabled := not lbxItems.ItemIndex < 0;
end;

procedure TfrmAutoCorrectEditor.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAutoCorrectEditor.btnClearClick(Sender: TObject);
begin
  if MessageBox(0, 'Are you sure you want to clear the entire list?', 'Confirmation', MB_APPLMODAL or MB_YESNO or MB_ICONQUESTION) <> IDYES then Exit;

  AsSynAutoCorrect.ReplaceItems.Clear;
  lbxItems.Items.Clear;

  btnDelete.Enabled := not lbxItems.ItemIndex < 0;
  btnEdit.Enabled := not lbxItems.ItemIndex < 0;
end;

procedure TfrmAutoCorrectEditor.lbxItemsClick(Sender: TObject);
begin
  btnDelete.Enabled := not lbxItems.ItemIndex < 0;
  btnEdit.Enabled := not lbxItems.ItemIndex < 0;
end;

procedure TfrmAutoCorrectEditor.FormResize(Sender: TObject);
begin
  if Height < 215 then Height := 215;
  if Width < 272 then Width := 272;
  
  lbxItems.Height := ClientHeight - 66;
  lbxItems.Width := ClientWidth - 17;
  pnlSeparator.Left := (lbxItems.Width div 2) + lbxItems.Left;
  lblLabel2.Left := pnlSeparator.Left;
  pnlSeparator.Height := lbxItems.Height;
end;

procedure TfrmAutoCorrectEditor.FormDestroy(Sender: TObject);
begin
  Reg.WriteInteger('', 'Left', Left);
  Reg.WriteInteger('', 'Top', Top);
  Reg.WriteInteger('', 'Width', Width);
  Reg.WriteInteger('', 'Height', Height);
  
  Reg.Free;
end;

end.
