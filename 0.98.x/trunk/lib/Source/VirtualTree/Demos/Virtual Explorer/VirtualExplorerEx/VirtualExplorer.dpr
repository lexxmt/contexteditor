program VirtualExplorer;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  About in 'About.pas' {AboutBox},
  VirtualIconThread in '..\..\Source\Common\VirtualIconThread.pas',
  VirtualUnicodeDefines in '..\..\Source\Common\VirtualUnicodeDefines.pas',
  VirtualShellContainers in '..\..\Source\Common\VirtualShellContainers.pas',
  Filters in 'Filters.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Virtual Explorer Demo for VirtualShellTools';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
