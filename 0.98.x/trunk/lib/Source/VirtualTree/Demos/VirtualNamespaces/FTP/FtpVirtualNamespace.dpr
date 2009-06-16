program FtpVirtualNamespace;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  VirtualNamespace in '..\..\..\Source\Common\VirtualNamespace.pas',
  FTPNamespace in 'FTPNamespace.pas',
  HostPropsForm in 'HostPropsForm.pas' {HostPropForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(THostPropForm, HostPropForm);
  Application.Run;
end.
