program VirtualListviewEx;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uColorForm in 'uColorForm.pas' {ColorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TColorForm, ColorForm);
  Application.Run;
end.
