unit TBXStrEdit;

// TBX Package
// Copyright 2001-2002 Alex A. Denisov. All Rights Reserved
// See TBX.chm for license and installation instructions
//
// $Id: TBXStrEdit.pas,v 1.4 2002/01/10 11:29:20 alex Exp $

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls;

type
  TStrEditDlg = class(TForm)
    Memo: TMemo;
    OK: TButton;
    Cancel: TButton;
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

implementation

{$R *.dfm}

procedure TStrEditDlg.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Cancel.Click;
end;

end.
