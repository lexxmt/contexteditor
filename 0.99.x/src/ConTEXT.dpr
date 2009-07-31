program ConTEXT;



{.$DEFINE MEMCHECK}

uses
  Forms,
  Windows,
  SysUtils,
  fMain in 'fMain.pas' {fmMain},
  uCommon in 'uCommon.pas',
  fFind in 'fFind.pas' {fmFind},
  uFilehist in 'uFilehist.pas',
  fOptions in 'fOptions.pas' {fmOptions},
  fAbout in 'fAbout.pas' {fmAbout},
  uMacros in 'uMacros.pas',
  fMacroStart in 'fMacroStart.pas' {fmMacroStartRecording},
  uMultiLanguage in 'uMultiLanguage.pas',
  fCustomizeFileTypes in 'fCustomizeFileTypes.pas' {fmCustomizeType},
  fMacroSelect in 'fMacroSelect.pas' {fmMacroSelect},
  fExport in 'fExport.pas' {fmExport},
  fEditor in 'fEditor.pas' {fmEditor},
  fMacroManage in 'fMacroManage.pas' {fmMacroManage},
  uCustomHL in 'uCustomHL.pas',
  uCodeTemplate in 'uCodeTemplate.pas' {fmCodeTemplate},
  fCodeTemplateEdit in 'fCodeTemplateEdit.pas' {fmCodeTemplateEdit},
  fCodeTemplateInsert in 'fCodeTemplateInsert.pas' {fmCTInsert},
  uProject in 'uProject.pas',
  fDTestPrintPreview in 'fDTestPrintPreview.pas' {fmPrnPreview},
  fDPageSetup in 'fDPageSetup.pas' {fmPageSetup},
  uPrinting in 'uPrinting.pas',
  uCmdLine in 'uCmdLine.pas',
  fFilePane in 'fFilePane.pas' {fmFileExplorer},
  uScrollListBox in 'uScrollListBox.pas',
  fFavorites in 'fFavorites.pas' {fmFavorites},
  fProjectFiles in 'fProjectFiles.pas' {frmProjectFiles},
  fHistory in 'fHistory.pas' {fmHistory},
  fFileList in 'fFileList.pas' {fmFileList},
  uCommonClass in 'uCommonClass.pas',
  uFileIconPool in 'uFileIconPool.pas',
  fFileTree in 'fFileTree.pas' {fmFileTree},
  fFileCompare in 'fFileCompare.pas' {fmFileCompare},
  fFileCompareSettings in 'fFileCompareSettings.pas' {fmFileCompareSettings},
  fFileCompareResults in 'fFileCompareResults.pas' {fmFileCompareResults},
  frFileCompareFileChoice in 'frFileCompareFileChoice.pas' {frameFileCompareFileChoice: TFrame},
  fTextStats in 'fTextStats.pas' {fmTextStats},
  fBottomWindowSearchResults in 'fBottomWindowSearchResults.pas',
  fBottomWindowOutputConsole in 'fBottomWindowOutputConsole.pas',
  fBottomWindowPage in 'fBottomWindowPage.pas' {fmBottomWindowPage},
  fBottomWindowContainer in 'fBottomWindowContainer.pas' {fmBottomWindowContainer},
  uSynAttribs in 'uSynAttribs.pas',
  uHighlighter in 'uHighlighter.pas',
  uEnvOptions in 'uEnvOptions.pas',
  uEditorPlugins in 'uEditorPlugins.pas',
  fIncrementalSearch in 'fIncrementalSearch.pas' {fmIncrementalSearch},
  uRuler in 'uRuler.pas',
  uHTMLTidy in 'uHTMLTidy.pas',
  fHTMLTidyProfile in 'fHTMLTidyProfile.pas' {fmHTMLTidyProfile},
  fHTMLTidyManageProfiles in 'fHTMLTidyManageProfiles.pas' {fmHTMLTidyManageProfiles},
  uEditorFileHandler in 'uEditorFileHandler.pas',
  fFileExplorer in 'fFileExplorer.pas';

{$R *.RES}
{$R _ConTEXT_.RES}

begin
  {$IFDEF MEMCHECK}
    MemChk;
  {$ENDIF MEMCHECK}

  StartDir:=GetCurrentDir;
  ApplicationDir:=ExtractFilePath(ParamStr(0));

  Application.Initialize;
  Application.Title := 'ConTEXT';
  Application.HintHidePause:=9999;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmFind, fmFind);
  SetCurrentDir(StartDir);

  Application.Run;
end.


