program VNSZip;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  ZipNamespace in 'ZipNamespace.pas',
  ContentMngr in 'ContentMngr.pas',
  ArchivePropertiesFrm in 'ArchivePropertiesFrm.pas' {ArchivePropertiesForm},
  Utilities in 'Utilities.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
