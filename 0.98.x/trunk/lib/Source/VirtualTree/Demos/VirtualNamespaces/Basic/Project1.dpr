program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form2},
  CustomNS in 'CustomNS.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
