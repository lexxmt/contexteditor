program DOSCommandLineProject;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  VirtualThread in '..\..\Source\Common\VirtualThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
