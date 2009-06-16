unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  TidyLib,                      // Contains THTMLTidy
  TidyGlobal,                   // Contains the initialization function
  TidyEnums,                    // Contains data structures used by tidy
  TidyOpaqueTypes,              // Contains types used by tidy
  TidyConfigurationOptions,     // Contains functions to access configuration values
  StdCtrls;

type
  TfMain = class(TForm)
    mOutput: TMemo;
    Button1: TButton;
    Button2: TButton;
    OpenDialog: TOpenDialog;
    mMessages: TMemo;
    mInput: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure TidyOnReportHandler(Sender: TObject; TidyDocument: TidyDoc;
      ReportLevel: TidyReportLevel; Line, Col: LongWord;
      Message: string; var KillMessage: boolean);
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.Button1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
    mInput.Lines.LoadFromFile(OpenDialog.FileName);
end;

procedure TfMain.Button2Click(Sender: TObject);
var
  Tidy: TLibTidy;
begin
  // Clear all current messages
  mMessages.Clear;

  // First Step: Initialize LibTidy. If we don't do it manually here, it is
  // done be the constructor of THTMLTidy, but this allows as the specify an
  // exact location of the dll file. Be sure to call "LoadTidyLibrary", but
  // not one of the "InitTidyLibrary" functions used internally.
  if not TidyGlobal.LoadTidyLibrary('libtidy.dll') then
  begin
    Application.MessageBox('TidyLib is not available.', 'Error', 16);
    exit;
  end;

  // Second Step: Create an instance of THTMLTidy. You can do this via the form
  // designer or at run-time; note that the latter approach is often the better
  // one.
  Tidy := TLibTidy.Create(Self);

  // Third Step: We load a configuration file. This is of course optinal, we
  // do it just to show how it works. If the file does not exist, nothing will
  // happen.
  Tidy.LoadConfigFile('tidy-standard-settings.txt');

  // Fourth Step: We change some configuration values. Be aware that THTMLTidy
  // commits this values not to LibTidy until we tell it to do so or it is
  // necessary because of actions like Saving the config file or Clean and
  // Repair.
  Tidy.Configuration.IndentContent := tsYes;  
  Tidy.Configuration.IndentSpaces := 5;
  Tidy.Configuration.UpperCaseTags := False;
  Tidy.Configuration.NumEntities := True;
  Tidy.Configuration.AccessibilityCheckLevel := 2;
  Tidy.Configuration.InlineTags := 'foo,bar';

  // Fifth Step: We change some configuration values manually be directly
  // accessing the tidy library.
  // IMPORTANT: As THTMLTidy does not know anything about these changes, they
  // will be overridden the next time the options will be assigned to LibTidy.
  // Normally there is absolutely NO reason to assign option directly, but if
  // you have to, call "AssignConfigToTidy" BEFORE changing values and
  // "LoadConfigFromTidy" AFTER it is done:
  Tidy.AssignConfigToTidy;
  tidyOptSetBool(Tidy.TidyDocument, TidyWord2000, True);
  Tidy.LoadConfigFromTidy;

  // Sixth Step: We assign an event handler for the OnReport Event. This handler
  // will always be called when Tidy outputs a message. This is the easiest way
  // to get Tidy's output. Alternatively, you can use the ReportCallback
  // property, which does the same job. You CANNOT use ReportCallback and
  // OnReport together. Choose one.
  Tidy.OnReport := TidyOnReportHandler;

  // Finally, we can let do Tidy some real work. First, we have to give it
  // some input. There are 3 possibilities: PareFile, ParseString, ParseStdIn
  // The names should explain themselves. We have an input memo, so we use
  // ParseString.
  Tidy.ParseString(mInput.Text);

  // Now we can execute HTMLTidy. There are two methods:
  //   - CleanAndRepairOnly: Cleans and repairs the code;
  //   - RunDiagnosticsAndRepair: Runs some diagnostics in ADDITION to
  //     CleanAndRepair;
  // Both methods return the repaired code.
  mOutput.Text := Tidy.RunDiagnosticsAndRepair;

  // Ninth Step: We free the THTMLTidy object
  Tidy.Free;
end;

procedure TfMain.TidyOnReportHandler(Sender: TObject;
  TidyDocument: TidyDoc; ReportLevel: TidyReportLevel; Line, Col: LongWord;
  Message: string; var KillMessage: boolean);
var
  RLevel: string;
begin
  // Make a descriptive string for ReportLevel
  case ReportLevel of
    TidyInfo: RLevel := '(Info) ';
    TidyWarning: RLevel := '(Warning) ';
    TidyConfig: RLevel := '(Configuration) ';
    TidyError: RLevel := '(Errror) ';
    TidyFatal: RLevel := '(Fatal) ';
    TidyBadDocument: RLevel := '(Bad Document) ';
    TidyAccess: RLevel := '(Accessibility) ';
  end;

  // Output the message
  mMessages.Lines.Add(IntToStr(Line) + ': ' +
                      IntToStr(Col) + '     ' + RLevel + Message);
end;

end.
