program VSN_IniProject1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IniNamespace in 'IniNamespace.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
