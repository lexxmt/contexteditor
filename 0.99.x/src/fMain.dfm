object fmMain: TfmMain
  Left = 276
  Top = 96
  Caption = 'ConTEXT'
  ClientHeight = 556
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDefault
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDragDrop = FormDragDrop
  OnDragOver = FormDragOver
  OnResize = FormResize
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 768
    Height = 2
    Align = alTop
    Shape = bsTopLine
  end
  object pnMainBack: TPanel
    Left = 777
    Top = 76
    Width = 750
    Height = 461
    Align = alClient
    BevelOuter = bvNone
    Color = clAppWorkSpace
    FullRepaint = False
    ParentBackground = False
    TabOrder = 0
    Visible = False
  end
  object tabFiles: TTab95Control
    Left = 0
    Top = 53
    Width = 768
    Height = 23
    AllowTabShifting = True
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrack = False
    TabInactiveColor = clBtnFace
    TabInactiveFont.Charset = DEFAULT_CHARSET
    TabInactiveFont.Color = clWindowText
    TabInactiveFont.Height = -11
    TabInactiveFont.Name = 'MS Sans Serif'
    TabInactiveFont.Style = []
    ParentFont = False
    ParentShowHint = False
    PopupMenu = popFileTabs
    ShowHint = True
    TabOrder = 1
    TabStop = False
    UseMSDrawing = True
    Visible = False
    OnChange = tabFilesChange
    OnChanging = tabFilesChanging
    OnMouseDown = tabFilesMouseDown
    OnMouseMove = tabFilesMouseMove
    OnMouseUp = tabFilesMouseUp
    OnTabShift = tabFilesTabShift
  end
  object dockTop: TSpTBXDock
    Left = 0
    Top = 2
    Width = 768
    Height = 51
    FixAlign = True
    object tbMainMenu: TSpTBXToolbar
      Left = 0
      Top = 0
      CloseButton = False
      FloatingMode = fmOnTopOfAllForms
      FullSize = True
      Images = ilToolbar
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      Caption = 'Main Menu'
      object miFile: TSpTBXSubmenuItem
        Action = acFile
        object miNew: TSpTBXItem
          Action = acNew
        end
        object miOpen: TSpTBXItem
          Action = acOpen
        end
        object miSave: TSpTBXItem
          Action = acSave
        end
        object miSaveAs: TSpTBXItem
          Action = acSaveAs
        end
        object miSaveAllFiles: TSpTBXItem
          Action = acSaveAllFiles
        end
        object TBXSeparatorItem18: TSpTBXSeparatorItem
        end
        object miCopyTo: TSpTBXItem
          Action = acCopyTo
        end
        object miRename: TSpTBXItem
          Action = acRename
        end
        object TBXSubmenuItem5: TSpTBXSubmenuItem
          Action = acFileRevert
          object TBXItem64: TSpTBXItem
            Action = acFileRevertToSaved
          end
          object TBXItem63: TSpTBXItem
            Action = acFileRevertToBackup
          end
        end
        object TBXItem61: TSpTBXItem
          Action = acFileChangeToFileDir
        end
        object miFilePrnSep: TSpTBXSeparatorItem
        end
        object miPrint: TSpTBXItem
          Action = acPrint
        end
        object miPageSetup: TSpTBXItem
          Action = acPageSetup
        end
        object miPrintPreview: TSpTBXItem
          Action = acPrintPreview
        end
        object miFileBlockSep: TSpTBXSeparatorItem
        end
        object miInsertFileAtCurrentPosition: TSpTBXItem
          Action = acInsertFileAtCurrentPosition
        end
        object miAppendFile: TSpTBXItem
          Action = acAppendFile
        end
        object miWriteBlockToFile: TSpTBXItem
          Action = acWriteBlockToFile
        end
        object miExport: TSpTBXSubmenuItem
          Action = acExport
          object miExportToHTML: TSpTBXItem
            Action = acExportToHTML
          end
          object miExportToRTF: TSpTBXItem
            Action = acExportToRTF
          end
        end
        object miFileCloseSep: TSpTBXSeparatorItem
        end
        object miClose: TSpTBXItem
          Action = acClose
        end
        object miCloseAll: TSpTBXItem
          Action = acCloseAll
        end
        object N1: TSpTBXSeparatorItem
        end
        object miRecentFiles: TSpTBXSubmenuItem
          Action = acRecentFiles
          object mruFiles: TSpTBXMRUListItem
            MaxItems = 30
            OnClick = mruFilesClick
          end
        end
        object miFileRecentProjects: TSpTBXSubmenuItem
          Action = acProjectRecent
          object mruProjects: TSpTBXMRUListItem
            MaxItems = 30
            OnClick = mruProjectsClick
          end
        end
        object N6: TSpTBXSeparatorItem
        end
        object miExit: TSpTBXItem
          Action = acExit
        end
      end
      object TBXSubmenuItem2: TSpTBXSubmenuItem
        Action = acEdit
        object TBXItem31: TSpTBXItem
          Action = acEditUndo
        end
        object TBXItem30: TSpTBXItem
          Action = acEditRedo
        end
        object TBXSeparatorItem7: TSpTBXSeparatorItem
        end
        object TBXItem29: TSpTBXItem
          Action = acEditCut
        end
        object TBXItem28: TSpTBXItem
          Action = acEditCopy
        end
        object TBXItem27: TSpTBXItem
          Action = acEditPaste
        end
        object TBXItem26: TSpTBXItem
          Action = acEditDelete
        end
        object TBXItem25: TSpTBXItem
          Action = acEditSelectAll
        end
        object TBXItem56: TSpTBXItem
          Action = acEditCopyFilename
        end
        object TBXSeparatorItem8: TSpTBXSeparatorItem
        end
        object TBXItem24: TSpTBXItem
          Action = acEditFind
        end
        object TBXItem23: TSpTBXItem
          Action = acEditReplace
        end
        object TBXItem22: TSpTBXItem
          Action = acEditFindNext
        end
        object TBXItem32: TSpTBXItem
          Action = acEditFindPrevious
        end
        object TBXItem59: TSpTBXItem
          Action = acEditIncrementalSearch
        end
        object TBXSeparatorItem9: TSpTBXSeparatorItem
        end
        object TBXItem36: TSpTBXItem
          Action = acEditToggleSelectionMode
        end
        object TBXItem35: TSpTBXItem
          Action = acEditSortText
        end
        object TBXItem34: TSpTBXItem
          Action = acEditMatchBraces
        end
        object TBXItem33: TSpTBXItem
          Action = acEditSelMatchBraces
        end
      end
      object miView: TSpTBXSubmenuItem
        Action = acView
        object miShowToolbar: TSpTBXItem
          Action = acShowToolbar
        end
        object miShowFileTabs: TSpTBXItem
          Action = acShowFileTabs
        end
        object miSearchResults: TSpTBXItem
          Action = acSearchResults
        end
        object miConsoleOutput: TSpTBXItem
          Action = acConsoleOutput
        end
        object miViewFilePanel: TSpTBXItem
          Action = acViewFilePanel
        end
        object miViewFileList: TSpTBXItem
          Action = acViewFileList
        end
        object miViewBookmarkSeparator: TSpTBXSeparatorItem
        end
        object miSetBookmark: TSpTBXSubmenuItem
          Action = acSetBookmark
        end
        object miJumpToBookmark: TSpTBXSubmenuItem
          Action = acJumpToBookmark
        end
        object miGoToLine: TSpTBXItem
          Action = acGoToLine
        end
        object N2: TSpTBXSeparatorItem
        end
        object miWordwrap: TSpTBXItem
          Action = acWordwrap
        end
        object TBXItem60: TSpTBXItem
          Action = acViewRuler
        end
        object miShowSpecialCharacters: TSpTBXItem
          Action = acShowSpecialCharacters
        end
        object miViewOEMCharset: TSpTBXItem
          Action = acViewOEMCharset
        end
        object N4: TSpTBXSeparatorItem
        end
        object miLockFileForChanges: TSpTBXItem
          Action = acLockFileForChanges
        end
      end
      object TBXSubmenuItem1: TSpTBXSubmenuItem
        Action = acFormat
        object TBXItem49: TSpTBXItem
          Action = acFormatIndentBlock
        end
        object TBXItem48: TSpTBXItem
          Action = acFormatUnindentBlock
        end
        object TBXSeparatorItem10: TSpTBXSeparatorItem
        end
        object TBXItem47: TSpTBXItem
          Action = acFormatToLowerCase
        end
        object TBXItem46: TSpTBXItem
          Action = acFormatToUpperCase
        end
        object TBXItem45: TSpTBXItem
          Action = acFormatInvertCase
        end
        object TBXSeparatorItem11: TSpTBXSeparatorItem
        end
        object TBXItem44: TSpTBXItem
          Action = acFormatReformatParagraph
        end
        object TBXItem43: TSpTBXItem
          Action = acFormatFillBlock
        end
        object TBXItem42: TSpTBXItem
          Action = acFormatInsertCodeFromTemplate
        end
        object TBXItem41: TSpTBXItem
          Action = acFormatCommentUncommentCode
        end
        object TBXItem40: TSpTBXItem
          Action = acFormatInsertTimeStamp
        end
        object TBXSeparatorItem19: TSpTBXSeparatorItem
        end
        object TBXItem66: TSpTBXItem
          Action = acFormatConvertTabsToSpaces
        end
        object TBXItem65: TSpTBXItem
          Action = acFormatConvertSpacesToTabs
        end
        object TBXItem67: TSpTBXItem
          Action = acFormatRemoveComments
        end
        object TBXItem39: TSpTBXItem
          Action = acFormatRemoveTrailingSpaces
        end
      end
      object miProject: TSpTBXSubmenuItem
        Action = acProject
        object miProjectNew: TSpTBXItem
          Action = acProjectNew
        end
        object miProjectOpen: TSpTBXItem
          Action = acProjectOpen
        end
        object miProjectClose: TSpTBXItem
          Action = acProjectClose
        end
        object N11: TSpTBXSeparatorItem
        end
        object miProjectOpenAllFiles: TSpTBXItem
          Action = acProjectOpenAllFiles
        end
        object miProjectCloseAllFiles: TSpTBXItem
          Action = acProjectCloseAllFiles
        end
        object N3: TSpTBXSeparatorItem
        end
        object TBXSubmenuItem3: TSpTBXSubmenuItem
          Action = acProjectFiles
          object groupProjectFiles: TTBGroupItem
          end
        end
        object miProjectRecent: TSpTBXSubmenuItem
          Action = acProjectRecent
        end
        object N9: TSpTBXSeparatorItem
        end
        object miProjectManageFileList: TSpTBXItem
          Action = acProjectManageFileList
        end
      end
      object miTools: TSpTBXSubmenuItem
        Action = acTools
        object miRecordMacro: TSpTBXItem
          Action = acRecordMacro
        end
        object miPlayMacro: TSpTBXItem
          Action = acPlayMacro
        end
        object miManageMacros: TSpTBXItem
          Action = acManageMacros
        end
        object miToolsSep1: TSpTBXSeparatorItem
        end
        object miUserCommand1: TSpTBXItem
          Tag = 1
          Action = acUserCommand1
        end
        object miUserCommand2: TSpTBXItem
          Tag = 2
          Action = acUserCommand2
        end
        object miUserCommand3: TSpTBXItem
          Tag = 3
          Action = acUserCommand3
        end
        object miUserCommand4: TSpTBXItem
          Tag = 4
          Action = acUserCommand4
        end
        object miShellExecute: TSpTBXItem
          Action = acShellExecute
        end
        object TBXSeparatorItem16: TSpTBXSeparatorItem
        end
        object TBXSubmenuItem4: TSpTBXSubmenuItem
          Action = acHTMLTidy
          object TBXItem62: TSpTBXItem
            Action = acHTMLTidyManage
          end
          object TBXSeparatorItem17: TSpTBXSeparatorItem
          end
          object groupTidyProfiles: TTBGroupItem
          end
        end
        object N8: TSpTBXSeparatorItem
        end
        object miFileCompare: TSpTBXItem
          Action = acFileCompare
        end
        object miTextStatistics: TSpTBXItem
          Action = acTextStatistics
        end
        object miToolsSep2: TSpTBXSeparatorItem
        end
        object miSetHighlighter: TSpTBXSubmenuItem
          Action = acSetHighlighter
          object miCustomizeTypes: TSpTBXItem
            Action = acCustomizeTypes
          end
          object N5: TSpTBXSeparatorItem
          end
          object groupHighlighters: TTBGroupItem
          end
        end
        object miConversion: TSpTBXSubmenuItem
          Action = acConversion
          object miConvertToDOS: TSpTBXItem
            Action = acConvertToDOS
          end
          object miConvertToUnicode: TSpTBXItem
            Action = acConvertToUnicode
          end
          object miConvertToUNIX: TSpTBXItem
            Action = acConvertToUNIX
          end
          object miConvertToMAC: TSpTBXItem
            Action = acConvertToMAC
          end
        end
      end
      object miOptions: TSpTBXSubmenuItem
        Action = acOptions
        object miPreferences: TSpTBXItem
          Action = acPreferences
        end
        object miCodeTemplate: TSpTBXItem
          Action = acCodeTemplate
        end
        object miStayOnTop: TSpTBXItem
          Action = acStayOnTop
        end
        object N7: TSpTBXSeparatorItem
        end
        object miExportRegistrySettings: TSpTBXItem
          Action = acExportRegistrySettings
        end
      end
      object miWindow: TSpTBXSubmenuItem
        Action = acWindow
        object miCascade: TSpTBXItem
          Action = acCascade
        end
        object miTileHorizontal: TSpTBXItem
          Action = acTileHorizontal
        end
        object miTileVertical: TSpTBXItem
          Action = acTileVertical
        end
        object TBXSeparatorItem15: TSpTBXSeparatorItem
        end
        object miNextWindow: TSpTBXItem
          Action = acNextWindow
        end
        object miPreviousWindow: TSpTBXItem
          Action = acPreviousWindow
        end
        object miWindowMenuSeparator: TSpTBXSeparatorItem
        end
        object groupOpenWindows: TTBGroupItem
        end
      end
      object miHelp: TSpTBXSubmenuItem
        Action = acHelp
        object miHelpContents: TSpTBXItem
          Action = acHelpContents
        end
        object N10: TSpTBXSeparatorItem
        end
        object miAbout: TSpTBXItem
          Action = acAbout
        end
      end
    end
    object tbToolbar: TSpTBXToolbar
      Left = 0
      Top = 25
      DockPos = 4
      DockRow = 1
      FloatingMode = fmOnTopOfAllForms
      FullSize = True
      Images = ilToolbar
      Options = [tboShowHint]
      ParentShowHint = False
      ShowHint = True
      ShrinkMode = tbsmWrap
      TabOrder = 1
      Caption = 'Main Toolbar'
      object TBXItem5: TSpTBXItem
        Action = acNew
      end
      object TBXItem4: TSpTBXItem
        Action = acOpen
      end
      object TBXItem3: TSpTBXItem
        Action = acSave
      end
      object TBXItem2: TSpTBXItem
        Action = acSaveAllFiles
      end
      object TBXItem1: TSpTBXItem
        Action = acClose
      end
      object TBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object TBXItem7: TSpTBXItem
        Action = acPrint
      end
      object TBXItem6: TSpTBXItem
        Action = acPrintPreview
      end
      object TBXSeparatorItem2: TSpTBXSeparatorItem
      end
      object TBXItem8: TSpTBXItem
        Action = acEditCut
      end
      object TBXItem9: TSpTBXItem
        Action = acEditCopy
      end
      object TBXItem10: TSpTBXItem
        Action = acEditPaste
      end
      object TBXItem11: TSpTBXItem
        Action = acEditUndo
      end
      object TBXItem12: TSpTBXItem
        Action = acEditRedo
      end
      object TBXSeparatorItem3: TSpTBXSeparatorItem
      end
      object TBXItem13: TSpTBXItem
        Action = acEditFind
      end
      object TBXItem14: TSpTBXItem
        Action = acEditFindNext
      end
      object TBXItem15: TSpTBXItem
        Action = acEditReplace
      end
      object TBXSeparatorItem4: TSpTBXSeparatorItem
      end
      object TBXItem16: TSpTBXItem
        Action = acWordwrap
      end
      object TBXItem17: TSpTBXItem
        Action = acStayOnTop
      end
      object TBXSeparatorItem5: TSpTBXSeparatorItem
      end
      object TBXItem18: TSpTBXItem
        Action = acUserCommand1
      end
      object TBXItem19: TSpTBXItem
        Action = acUserCommand2
      end
      object TBXItem20: TSpTBXItem
        Action = acUserCommand3
      end
      object TBXItem21: TSpTBXItem
        Action = acUserCommand4
      end
      object TBXSeparatorItem6: TSpTBXSeparatorItem
      end
      object TBControlItem1: TTBControlItem
        Control = cbHighLighters
      end
      object cbHighLighters: TSpTBXComboBox
        Left = 519
        Top = 0
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnClick = acSetHighlighterExecute
      end
    end
  end
  object dockLeft: TSpTBXMultiDock
    Left = 0
    Top = 76
    Width = 9
    Height = 461
    object dpFilePanel: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 9
      Height = 461
      Caption = 'File Panel'
      FloatingMode = fmOnTopOfAllForms
      TabOrder = 0
      Visible = False
      OnClose = dpFilePanelClose
    end
  end
  object dockBottom: TSpTBXMultiDock
    Left = 9
    Top = 76
    Width = 768
    Height = 461
    object dpBottom: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 768
      Height = 461
      TabOrder = 0
      Visible = False
      OnClose = dpBottomClose
    end
  end
  object dockRight: TSpTBXDock
    Left = 759
    Top = 76
    Width = 9
    Height = 461
    Position = dpRight
  end
  object pnMainStatus: TStatusBar
    Left = 0
    Top = 537
    Width = 768
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'XY'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = 'Insert'
        Width = 80
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 90
      end
      item
        Alignment = taCenter
        Width = 90
      end
      item
        Alignment = taCenter
        Text = 'DOS'
        Width = 65
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
    OnResize = pnMainStatusResize
  end
  object MainInstance: TMainInstance
    Left = 296
    Top = 188
  end
  object hlJavascript: TSynJScriptSyn
    DefaultFilter = 'Javascript files (*.js)|*.js'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NonReservedKeyAttri.Background = clWindow
    NonReservedKeyAttri.Foreground = clFuchsia
    EventAttri.Background = clWindow
    EventAttri.Foreground = clGreen
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 424
    Top = 148
  end
  object hlJava: TSynJavaSyn
    DefaultFilter = 'Java files (*.java)|*.java;*.jav'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    DocumentAttri.Background = clWindow
    DocumentAttri.Foreground = clTeal
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    InvalidAttri.Background = clWindow
    InvalidAttri.Foreground = clFuchsia
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 360
    Top = 148
  end
  object hlHtml: TSynHTMLSyn
    DefaultFilter = 
      'HTML Document (*.htm,*.html,*.asp,*.shtml)|*.htm;*.html;*.asp;*.' +
      'shtml'
    AndAttri.Background = clWindow
    AndAttri.Foreground = clPurple
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    TextAttri.Background = clWindow
    TextAttri.Foreground = clWindowText
    UndefKeyAttri.Background = clWindow
    ValueAttri.Background = clWindow
    ValueAttri.Foreground = clMaroon
    Left = 296
    Top = 148
  end
  object hlCpp: TSynCppSyn
    DefaultFilter = 'C/C++ files (*.c,*.cpp,*.h,*.hpp)|*.c;*.cpp;*.h;*.hpp'
    AsmAttri.Background = clWindow
    AsmAttri.Foreground = clBlue
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    DirecAttri.Background = clWindow
    DirecAttri.Foreground = clTeal
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    InvalidAttri.Background = clWindow
    InvalidAttri.Foreground = clFuchsia
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    FloatAttri.Background = clWindow
    FloatAttri.Foreground = clRed
    HexAttri.Background = clWindow
    HexAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    CharAttri.Background = clWindow
    CharAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 368
    Top = 96
  end
  object hlPas: TSynPasSyn
    AsmAttri.Background = clWindow
    AsmAttri.Foreground = clBlue
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    DirectiveAttri.Background = clWindow
    DirectiveAttri.Foreground = clTeal
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    FloatAttri.Background = clWindow
    FloatAttri.Foreground = clRed
    HexAttri.Background = clWindow
    HexAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    CharAttri.Background = clWindow
    CharAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 328
    Top = 96
  end
  object hlSQL: TSynSQLSyn
    DefaultFilter = 'SQL files (*.sql)|*.sql'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    ConditionalCommentAttri.Background = clWindow
    DataTypeAttri.Background = clWindow
    DataTypeAttri.Foreground = clWindowText
    DefaultPackageAttri.Background = clWindow
    DelimitedIdentifierAttri.Background = clWindow
    ExceptionAttri.Background = clWindow
    ExceptionAttri.Foreground = clRed
    FunctionAttri.Background = clWindow
    FunctionAttri.Foreground = clMaroon
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    PLSQLAttri.Background = clWindow
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    SQLPlusAttri.Background = clWindow
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    TableNameAttri.Background = clWindow
    VariableAttri.Background = clWindow
    VariableAttri.Foreground = clWindowText
    SQLDialect = sqlSybase
    Left = 456
    Top = 148
  end
  object hlPython: TSynPythonSyn
    DefaultFilter = 'Python files (*.py)|*.py'
    CommentAttri.Background = clWindow
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NonKeyAttri.Foreground = clFuchsia
    SystemAttri.Background = clWindow
    SystemAttri.Foreground = clGreen
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    HexAttri.Background = clWindow
    HexAttri.Foreground = clRed
    FloatAttri.Background = clWindow
    FloatAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    DocStringAttri.Background = clWindow
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    ErrorAttri.Background = clWindow
    Left = 552
    Top = 149
  end
  object hlPHP: TSynPHPSyn
    DefaultFilter = 'PHP files (*.php,*.php3,*.phtml)|*.php;*.php3;*.phtml'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    VariableAttri.Background = clWindow
    VariableAttri.Foreground = clTeal
    Left = 584
    Top = 149
  end
  object hlTCL: TSynTclTkSyn
    DefaultFilter = 'Tcl/Tk files (*.tcl)|*.tcl'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    SecondKeyAttri.Background = clWindow
    SecondKeyAttri.Foreground = clBlue
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    OptionsAttri.Background = clNone
    OptionsAttri.Foreground = clNone
    PathAttri.Background = clNone
    PathAttri.Foreground = clNone
    VariableAttri.Background = clNone
    VariableAttri.Foreground = clNone
    Left = 616
    Top = 149
  end
  object TrayIcon: TMyTrayIcon
    Active = False
    ShowDesigning = False
    OnDblClick = acTrayRestoreExecute
    PopupMenu = popTray
    Left = 624
    Top = 376
  end
  object hlXML: TSynXMLSyn
    DefaultFilter = 'XML Document (*.xml,*.xsd,*.xsl,*.xslt)|*.xml;*.xsd;*.xsl;*.xslt'
    ElementAttri.Background = clWindow
    ElementAttri.Foreground = clNavy
    ElementAttri.Style = []
    AttributeAttri.Background = clWindow
    NamespaceAttributeAttri.Background = clWindow
    NamespaceAttributeAttri.Foreground = clGreen
    AttributeValueAttri.Background = clWindow
    AttributeValueAttri.Foreground = clRed
    AttributeValueAttri.Style = []
    NamespaceAttributeValueAttri.Background = clWindow
    NamespaceAttributeValueAttri.Foreground = clBlue
    NamespaceAttributeValueAttri.Style = []
    TextAttri.Background = clWindow
    TextAttri.Style = []
    CDATAAttri.Background = clWindow
    CDATAAttri.Style = []
    EntityRefAttri.Background = clWindow
    EntityRefAttri.Style = []
    ProcessingInstructionAttri.Background = clWindow
    ProcessingInstructionAttri.Foreground = clNavy
    CommentAttri.Background = clWindow
    CommentAttri.Style = [fsItalic]
    DocTypeAttri.Background = clWindow
    DocTypeAttri.Foreground = clTeal
    DocTypeAttri.Style = []
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindow
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    WantBracesParsed = False
    Left = 440
    Top = 98
  end
  object hlPerl: TSynPerlSyn
    DefaultFilter = 'Perl Files (*.pl,*.pm,*.cgi)|*.pl;*.pm;*.cgi'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindow
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clPurple
    Left = 400
    Top = 98
  end
  object hlFortran: TSynFortranSyn
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 488
    Top = 150
  end
  object hlVisualBasic: TSynVBSyn
    DefaultFilter = 'Visual Basic files (*.bas)|*.bas;*.vbs;*.frm;*.cls'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clNavy
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 392
    Top = 148
  end
  object hlFox: TSynFoxproSyn
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    CommentAttri.Style = [fsItalic]
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clNavy
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 520
    Top = 149
  end
  object ilToolbar: TImageList
    Left = 656
    Top = 77
    Bitmap = {
      494C010140004500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001001000001002000000000000010
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000008400000084000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008A5180008A5180008A5180008A5
      180008A51800000000000000000000000000000000000000000008A5180008A5
      180008A5180008A5180000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C00FFDED600FFE7E700636B5A00FFBD
      BD00FFBDBD008C8C8C0000000000000000000000000000008400000084000000
      0000000000000000000000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BB6532009544320000000000BB65320095443200000000000000
      000000000000000000000000000000000000000000000000000008A51800108C
      21000000000000000000000000000000000000000000000000000000000008A5
      1800108C21000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C00FFDED600FFE7E700FFCECE00FFCECE00FFCE
      CE00FFBDBD00FFBDBD008C8C8C00000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000004C80
      4C00000000000000000000000000000000000000000000000000000000000000
      000000000000BB6532009544320000000000BB65320095443200000000000000
      00000000000000000000000000000000000000000000000000000000000008A5
      1800108C210000000000000000000000000000000000000000000000000008A5
      1800108C2100000000000000000000000000395AAD00395AAD0039529C003952
      9C0039529C0039529C008C8C8C00FFE7E700FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD008C8C8C00000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000004C804C0069C4
      80004C804C000000000000000000000000000000000000000000000000000000
      000000000000BB6532009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008A5180008A5180008A5180008A5180008A5180008A5180008A5180008A5
      1800108C21000000000000000000000000004A6BBD00FFBDBD00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD008C8C8C00636B5A00FFCECE00FFCECE00424242004242
      420042424200636B5A008C8C8C00000000000000000000000000000000000000
      000000008400000084000000000000000000000000004C804C0069CA800069C4
      800031C64A004C804C0000000000000000000000000000000000000000000000
      000000000000BB6532009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008A51800108C21000000000000000000000000000000000008A5
      1800108C21000000000000000000000000004A6BBD00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7008C8C8C00FFEFEF00FFCECE00FFCECE0042424200FFCE
      CE00FFCECE00FFBDBD008C8C8C00000000000000000000008400000000000000
      0000000000000000840000008400000000004C804C0069CA800042D66B0069C4
      800031C64A0031C64A004C804C00000000000000000000000000000000000000
      000000000000BB6532009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008A51800108C210000000000000000000000000008A5
      1800108C21000000000000000000000000004A6BBD00F7F7F700F7F7F7004A5A
      5200F7F7F7004A5A52008C8C8C00FFEFEF00FFE7E700FFCECE0042424200FFCE
      CE00FFBDBD00FFBDBD008C8C8C00000000000000000000008400000084000000
      84000000840000008400000084004C804C004C804C004C804C004C804C0069C4
      80004C804C004C804C004C804C004C804C000000000000000000000000000000
      000095443200954432009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008A51800108C2100000000000000000008A5
      1800108C21000000000000000000000000004A6BBD00F7F7F700F7F7F7004A5A
      5200F7F7F7004A5A5200F7F7F7008C8C8C00FFEFEF00FFDED600636B5A00FFBD
      BD00FFBDBD008C8C8C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004C804C0069C4
      80004C804C000000000000000000000000000000000000000000000000009544
      3200BE744100BB6532009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008A51800108C21000000000008A5
      1800108C21000000000000000000000000005A73C600F7F7F7004A5A52004A5A
      5200F7F7F700F7F7F7004A5A5200F7F7F7008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000084000000840000008400
      00000000000084000000840000008400000000000000000000004C804C0069C4
      80004C804C00000000000000000000000000000000000000000095443200BE74
      4100DB8B4500DB8B45009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008A51800108C210008A5
      1800108C21000000000000000000000000005A73C600F7F7F700F7F7F7004A5A
      5200F7F7F7004A5A52004A5A5200F7F7F70039529C0000000000000000000000
      0000000000000000000000000000000000000000000084848400840000000000
      00000000000000000000840000008484840000000000000000004C804C0069C4
      80004C804C00000000000000000000000000000000000000000095443200DB8B
      4500E2994500E29945009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008A5180008A5
      1800108C21000000000000000000000000005A73C600F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F70039529C0000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000000000000000000004C804C0031C6
      4A004C804C00000000000000000000000000000000000000000095443200BB65
      3200DB8B4500DB8B45009544320000000000BB65320095443200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000008A5
      1800108C21000000000000000000000000006384CE00F7F7F7008C9494008C94
      94008C9494008C8C8C008C8C8C00F7F7F70039529C0000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00000000000084000000848484000000000000000000000000004C804C0031C6
      4A004C804C000000000000000000000000000000000000000000000000009544
      3200BE744100BB65320095443200BB653200BB65320095443200BB653200BB65
      3200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006384CE00FFBDBD00FFBDBD00FFBD
      BD00FFBDBD00FFBDBD00FFBDBD00FFBDBD00395AAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000000000000000000004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000000000000
      0000954432009544320095443200954432009544320095443200954432009544
      3200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006384CE006384CE005A73C6005A73
      C6004A6BBD004A6BBD004A6BBD004A6BBD00395AAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000088CC600088CC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A0000B55A
      0000B55A0000B55A0000B55A0000B55A0000088CC60094E7F7005ADEEF00088C
      C600088CC600088CC600088CC600088CC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA500088CC600A5E7F7008CFFFF0084FF
      FF0084F7FF0084F7FF007BF7FF0063DEFF00088CC600088CC600006B0800106B
      0800000000000000000000000000000000000000000000000000000000000000
      0000108C2100108C2100108C2100108C2100108C21000000000008A51800108C
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7ADA5005A5A5A00F7AD
      A5005A5A5A00F7ADA5005A5A5A00F7ADA5000894CE0042ADD6009CFFFF0073F7
      FF007BF7FF0042B594002194420021944A00299C4A00218C4200007B1000008C
      0800087B180000000000000000000000000000000000000000000000000008A5
      1800108C210000000000000000000000000008A5180008A51800108C21000000
      00000000000000000000000000000000000008A5180008A5180008A5180008A5
      180000000000000000000000000008A5180008A51800CE630000CE630000CE63
      0000CE63000000000000D6731000CE630000CE630000F7ADA500F7ADA500F7AD
      A500F7ADA500F7ADA500F7ADA500F7ADA500F7ADA500F7ADA500F7ADA500F7AD
      A500F7ADA500F7ADA5005A5A5A00F7ADA50021A5D60042ADD6009CF7F70073F7
      FF0084FFFF0031945A0029BD4A0029BD4A0021B5420018AD420010A5310008A5
      180000940800006B0000000000000000000000000000000000000000000008A5
      1800000000000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000008A51800108C21000000
      000000000000000000000000000000000000D6731000CE630000000000000000
      0000D6731000D6731000CE63000000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C60029A5D6005ADEEF0042ADD60084FF
      FF0084FFFF0031945A0031C6520039D6630029BD4A0021B5420021B5420010A5
      310008A51800008C0800005200000000000000000000000000000000000008A5
      1800000000000000000000000000000000000000000008A51800108C21000000
      000000000000000000000000000000000000000000000000000008A51800108C
      210000000000000000000000000000000000D6731000108C2100000000000000
      000000000000D6731000CE63000000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C6000000
      00000000000000000000FFC6C600FFC6C60029A5D6007BEFF70042ADD600A5FF
      FF0073FFFF0042B5940031AD5A0029AD630029AD6300088CC60010A5390018B5
      5200089C210010843100088CC6000000000000000000000000000000000008A5
      1800108C21000000000000000000000000000000000008A51800108C21000000
      00000000000000000000000000000000000000000000000000000000000008A5
      180008A5180008A5180008A5180008A51800D6731000CE630000000000000000
      000000000000D6731000CE63000000000000CE630000FFC6C600FFC6C600B55A
      0000FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C60000000000FFC6C600FFC6C600FFC6C60029A5D6008CF7F7006BA5B50042AD
      D60094F7FF0094F7FF0094FFFF008CFFFF0073F7FF0073F7FF0018A531001094
      2900188442007BEFF70021A5D600000000000000000000000000000000000000
      000008A5180008A5180008A5180008A5180008A5180008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008A51800108C2100000000000000000008A51800D6731000D6731000D673
      1000D6731000D6731000CE63000000000000CE630000FFC6C600FFC6C600B55A
      0000B55A0000FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C60000000000FFC6C600FFC6C600FFC6C60029A5D60084F7F700DEBDAD0042AD
      D60042ADD60042ADD60042ADD60042ADD6009CF7FF006BEFF700087B18003194
      5A0052CEF70084F7FF004ACEEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008A51800108C21000000000008A51800108C2100000000000000
      000000000000D6731000CE63000000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C6000000
      000000000000FFC6C600FFC6C600FFC6C60029A5D60084F7F700D6C6BD00FFFF
      F700FFE7D600FFE7BD00DED6B5009CBDB50042ADD60094E7F70073D6C60094F7
      FF006BDEFF0094F7FF0084F7FF00189CD60000000000000000000000000008A5
      1800000000000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008A51800108C2100D6731000CE630000000000000000
      000000000000D6731000CE63000000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C60000000000FFC6C600FFC6C600FFC6C60029A5D60084F7F700D6C6BD00FFFF
      FF00FFEFE700F7E7D600F7E7C600FFDEB500B5C6B50042ADD60042ADD60042AD
      D60042ADD60042ADD60042ADD60031A5D60000000000000000000000000008A5
      1800108C21000000000000000000000000000000000008A51800108C21000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008A5180008A51800D6731000D6731000D673
      1000D6731000CE6300000000000000000000CE630000FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6C600FFC6
      C600FFC6C600FFC6C600FFC6C600FFC6C60031A5D60084F7F700DECEC600FFFF
      FF00FFFFF700FFEFE700F7E7D600F7E7C600FFDEB500FFD69C0073A5AD005AEF
      FF00189CD6000000000000000000000000000000000000000000000000000000
      000008A5180008A5180008A5180008A5180008A51800108C2100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008A51800108C2100000000000000
      000000000000000000000000000000000000CE630000FFDEDE00FFDEDE00FFDE
      DE0084848400FFDEDE00FFDEDE00FFDEDE0084848400FFDEDE00FFDEDE00FFDE
      DE0084848400FFDEDE00FFDEDE00FFDEDE00299CD6009CF7F700E7D6C600FFFF
      FF00FFFFFF00FFFFF700FFEFE700F7E7D600AD736300AD736300AD736300219C
      D600219CD6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000FFDEDE0084848400FFDE
      DE0084848400FFDEDE0084848400FFDEDE0084848400FFDEDE0084848400FFDE
      DE0084848400FFDEDE0084848400FFDEDE0000000000299CD600EFD6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00AD736300DE844200BD5A63000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000E7D6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6DE00AD736300DE8C5200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400AD73630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073849C0000428C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002173AD001873AD0029528400297BB50029A5D600295A
      8C00005294000863A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004AADDE0042B5E7000863A5002994CE0031ADDE00086B
      AD001094C6001094CE000000000000000000BF480000BF480000BF480000BF48
      0000BF480000BF480000BF480000BF480000BF480000BF480000BF480000BF48
      0000BF480000000000000000000000000000BF480000BF480000BF480000BF48
      0000BF480000BF480000BF480000BF480000BF480000BF480000BF480000BF48
      0000BF4800000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000021529400298CC6004ABDEF0042BDEF0042B5E70031ADDE0029A5
      DE0018A5D6001094C60000428C00526384000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000214A940042ADE70052C6F7004ABDEF0063BDE7004A849C001873
      A5001094CE001094C600006BA500216394000000000000000000000000004C80
      4C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004C804C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006BC6E70052C6EF004ABDEF006BC6EF00DEDEDE006B6B6B00295A
      73001094C6000894CE00109CCE0063ADBD0000000000000000004C804C004C80
      4C00000000000000000000000000FF660100D1570000D1570000BF480000BF48
      0000BF48000000000000000000000000000000000000000000004C804C004C80
      4C00000000000000000000000000FF660100D1570000D1570000BF480000BF48
      0000BF48000000000000000000000000000000000000FF00000000000000FF00
      000000000000FF000000FF00000000000000FF00000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      000000000000218C390039A5B5004ABDEF006BC6EF00DEDEDE006B6B6B00316B
      7B0018A5D600189CCE00189CCE0000000000000000004C804C005DB9690069CA
      80004C804C004C804C0000000000FF660100FF660100FF660100FF660100FF66
      0100FF6601000000000000000000000000004C804C004C804C005DB9690069CA
      80004C804C000000000000000000FF660100FF660100FF660100FF660100FF66
      0100FF66010000000000000000000000000000000000FF00000000000000FF00
      000000000000FF0000000000000000000000FF00000000000000000000000000
      0000FF0000000000000000000000000000000000000063A55A00088C1000007B
      00003994290039CE520031AD9C0042B5DE0063C6D600D6D6D60063636300426B
      7B0029A5D60029A5D60000000000000000004C804C0063E7630069CA800018C6
      180018C618004C804C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C804C0063E7630063E7630069CA
      800018C618004C804C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF000000FF00000000000000FF00000000000000FF0000000000
      0000FF00000000000000000000000000000000000000299C29004ADE6B0021B5
      310018AD290039CE520018A5390018A55A0042B54200C6B59C00525252008C73
      630042A5C600189CCE000000000000000000000000004C804C0063E7630069CA
      80004C804C004C804C0000000000FF660100D1570000D1570000BF480000BF48
      0000BF480000BF480000BF480000BF4800004C804C004C804C0069CA800018C6
      18004C804C000000000000000000FF660100D1570000D1570000BF480000BF48
      0000BF480000BF480000BF480000BF48000000000000FF00000000000000FF00
      000000000000FF0000000000000000000000FF000000FF00000000000000FF00
      0000FF00000000000000000000000000000000000000318C18004ADE6B004AE7
      730039D65A0039CE520029C6420021BD310018A51800219418006B8442000000
      00000000000000000000000000000000000000000000000000004C804C004C80
      4C00000000000000000000000000FF660100FF660100FF660100FF660100FF66
      0100FF660100FF660100FF660100FF66010000000000000000004C804C004C80
      4C00000000000000000000000000FF660100FF660100FF660100FF660100FF66
      0100FF660100FF660100FF660100FF66010000000000FF000000FF0000000000
      000000000000FF000000FF00000000000000FF00000000000000000000000000
      0000FF00000000000000000000000000000039A5390021B531004AE773004AE7
      730073D6840073B584001894210010A5180010A51800089C0800529429000000
      0000000000000000000000000000000000000000000000000000000000004C80
      4C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004C804C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094E7A5006BF7940052EF7B004ADE
      6B00D6D6D600A5A5A500217B29000894080008A5100010A5180073C663000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042D663004ADE6B004ADE
      6B00D6D6D600A5A5A500399C420021BD310018A518004AA52900000000000000
      000000000000000000000000000000000000BF480000BF480000BF480000BF48
      0000BF480000BF480000BF480000BF480000BF480000BF480000BF480000BF48
      0000BF480000000000000000000000000000BF480000BF480000BF480000BF48
      0000BF480000BF480000BF480000BF480000BF480000BF480000BF480000BF48
      0000BF4800000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005AE77B004ADE
      6B00CECECE008C8C8C005A944A0052BD4A0063C6630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000042D6
      6300B5A58C00736B63008CB54A0021B529000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      00000000000000000000636363005A5A5A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000000000000000000000000
      00006B6B6B0084848400FFA5A500FF9C9C00FF9C9C00FFA5A5004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000000000000000000006B6B
      6B00FFCECE00FFCECE00FFCECE005A5A5A00FFCECE00FFBDBD00FF9C9C00FFA5
      A5004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B58484000000000000000000000000006B6B6B00FFCE
      CE00FFA5A500FFCECE00FFCECE0084848400FFCECE00FFCECE00FFCECE00FFBD
      BD00FF9C9C004A4A4A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600CE630000EFCE9C00F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000000000000C6ADA500FFF7
      E700F7E7D600CE630000F7E7C600F7DEC600CE630000F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B584840000000000000000006B6B6B00FFCECE00FFBD
      BD00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFBDBD00FFA5A5004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00CE630000EFCE9C00EFCE9C00F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000000000000CEB5AD00FFFF
      F700EFCE9C00CE630000F7E7D600EFCE9C00CE630000EFCE9C00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B584840000000000000000006B6B6B00FFBDBD00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C004A4A4A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700CE630000CE630000CE630000CE630000CE630000F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000000000000D6B5AD00FFFF
      FF00CE630000CE630000CE630000CE630000CE630000CE630000CE630000F7D6
      AD00F7D6A500F7D6A500B5848400000000006B6B6B00FFA5A500FFEFEF00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD00FFA5A5004A4A4A000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600CE630000EFCE9C00F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000000000000D6BDB500FFFF
      FF00FFF7F700EFCE9C00CE630000F7E7D600EFCE9C00CE630000EFCE9C00F7DE
      BD00F7D6B500F7D6AD00B5848400000000006B6B6B00FFCECE00848484005A5A
      5A00FFCECE00FFCECE00FFCECE005A5A5A004242420042424200424242004242
      4200FFCECE0042424200FF9C9C004A4A4A000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00CE630000EFCE9C00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00EFCE9C00CE630000EFCE9C00F7E7D600CE630000EFCE9C00F7DE
      BD00F7DEB500F7DEB500B58484000000000084848400FFCECE00FFFFFF00FFEF
      EF00FFCECE00FFCECE00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FF9C9C004A4A4A000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00EFCE9C00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000F7DEC600F7D6B500B58484000000000084848400FFA5A500FFFFFF00FFEF
      EF00FFCECE00FFCECE00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FFBDBD00FFA5A5004A4A4A000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000DEC6B500FFFF
      FF00CE630000CE630000CE630000CE630000CE630000FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00EFCE9C00CE630000FFEFE700EFCE9C00CE630000EFCE
      9C00E7DEC600C6BDAD00B5848400000000000000000084848400FFEFEF00FFFF
      FF00FFEFEF00FFCECE00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFCECE00FF9C9C004A4A4A00000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000000000C6C6C600000000000000
      000000000000C6C6C60000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE630000FFF7EF00FFF7EF00CE630000C6A5
      9400B5948C00B58C8400B5848400000000000000000084848400FFCECE00FFEF
      EF00FFFFFF00FFEFEF00FFCECE005A5A5A00FFCECE00FFCECE00FFCECE00FFCE
      CE00FFBDBD00FF9C9C004A4A4A00000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00CE630000EFCE9C00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE630000FFFFFF00FFFFF700CE630000BD8C
      7300EFB57300EFA54A00C6846B0000000000000000000000000084848400FFCE
      CE00FFEFEF00FFFFFF00FFEFEF00FFCECE00FFCECE00FFCECE00FFCECE00FFBD
      BD00FF9C9C004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000006B6B
      6B00FFCECE00FFEFEF00FFFFFF005A5A5A00FFCECE00FFCECE00FFBDBD00FF9C
      9C004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B00FFA5A500FFCECE00FFCECE00FFA5A5004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000395A
      AD0039529C0039529C0039529C0039529C0039529C0039529C0039529C003952
      9C0039529C00395AAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A00395AAD00000000000000000000000000000000000000
      00008E2A06008E2A06008E2A06008E2A06008E2A06008E2A06008E2A06008E2A
      06008E2A06008E2A06008E2A06008E2A06000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE008C5A5A0039529C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C00F7EFDE008484840084848400848484008484840084848400848484008484
      8400F7EFDE008C5A5A0039529C00000000000000000000000000000000000000
      00008E2A06008E2A06008E2A06008E2A06008E2A060000000000000000000000
      00008E2A06008E2A06008E2A06008E2A06000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000404040000000
      00000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C00F7EFDE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7
      CE00F7EFDE008C5A5A0039529C00000000000000000000000000000000000000
      000000000000000000008E2A06008E2A0600AB50160000000000000000000000
      0000000000008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000040404000000000004040
      40000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C00F7EFDE008484840084848400848484008484840084848400848484008484
      8400F7EFDE008C5A5A0039529C00000000000000000000000000000000000000
      00000000000000000000000000008E2A06008E2A0600AB501600000000000000
      0000000000008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000040404000000000000000
      00000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE009C6B6B0039529C00000000000000000000000000000000000000
      0000000000000000000000000000000000008E2A06008E2A06008E2A06008E2A
      06008E2A06008E2A06008E2A0600000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000040404000000000004040
      40000000000000000000000000000000000000000000000000004A6BBD00B58C
      8C00FFF7E700FFF7E70000008400F7EFDE00C6C6C6000000840000008400C6C6
      C600FFF7E7009C6B6B0039529C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E2A06008E2A0600AB50
      1600000000008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF0000008400FFFFEF0000008400FFFFEF00FFFFEF000000
      8400FFFFEF009C6B6B0039529C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E2A06008E2A
      0600AB5016008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000040404000000000004040
      40000000000000000000000000000000000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF0000008400FFFFEF00FFFFEF00FFFFEF00FFFFEF000000
      8400FFFFEF00A57B730039529C00000000000000000000000000696969000000
      0000696969000000000000000000000000000000000000000000000000008E2A
      06008E2A06008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000040404000000000000000
      00000000000000000000000000000000000000000000000000005A73C600B58C
      8C00FFFFEF00FFFFEF0000008400FFFFEF00000084000000840000008400C6C6
      C600FFFFEF00A57B730039529C00000000000000000069696900000000000000
      0000000000006969690000000000000000000000000000000000000000000000
      00008E2A06008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040000000000000000000000000000000000040404000000000004040
      40000000000000000000000000000000000000000000000000006384CE00B58C
      8C00FFFFFF000000840000008400FFFFFF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B58C8C0039529C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E2A06008E2A0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000404040000000
      00000000000000000000000000000000000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF0000008400FFFFFF000000840000008400000084000000
      8400FFFFFF00B58C8C0039529C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006384CE00B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B58C8C0039529C00000000000000000000000000696969000000
      0000696969000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006384CE00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00395AAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006384
      CE005A73C6004A6BBD004A6BBD004A6BBD004A6BBD004A6BBD004A6BBD004A6B
      BD004A6BBD004A6BBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001094100039AD390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B7373006B73730000000000000000000000
      000000000000000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000AD0000218C180039AD3900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B7373008C736300A5632100734A2900000000000000
      0000000000000000000000000000000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C0000219C18001884180039AD39000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B635A009C846300D6731800A55A2900000000000000
      0000000000000000000000000000000000004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C0000088C000008840000088C100039AD
      39000000000000000000000000000000000000000000000000005A5252005A52
      52005A525200000000006B635A009C846300D6731800945A2900000000000000
      0000000000000000000000000000000000000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000AD00006BDE6B0052E7520042DE
      420018C6180000B5080000B50000088C0800008C00002194210063AD6300107B
      100039AD39000000000000000000000000000000000084848400B5B5B500BDBD
      BD00B5B5B500A5A5A500736B6300A58C7300D67318008C523100000000000000
      000000000000000000000000000000000000000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      000000000000000000000000000000000000009C080063E7630018D6180008C6
      000000BD000000B5000000A50000008C0000008C080000840000218C180063AD
      6300187B180039AD390000000000000000000000000084848400848484008484
      8400C6C6C600BDBDBD00736B6300CE9C6B00D67318008C5A39005A5252005A52
      52005A5252005A525200636363000000000000000000000000000000000052B5
      FF004AB5FF002184DE005A6B730000000000AD7B7300C6A59C00D6B5A500CEA5
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000001094080063E7630000CE000000C6
      000000BD000000B5000000AD0000009C0000008C080000840000007B0000187B
      210063AD6300187B180039AD3900000000000000000000000000000000000000
      0000B5B5B500C6C6C600736B6300CE9C6300D6732100734A3900B5B5B500ADAD
      AD00ADADAD00B5B5B500A594A5005A5252000000000000000000000000000000
      000052BDFF00B5D6EF00A5948C00B59C8C00F7E7CE00FFFFD600FFFFD600FFFF
      D600E7DEBD00CEADA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000A5000063E76B0000CE000008C6
      000000BD000000B5000000AD000000940000008C08000084000000840000007B
      0000298C310063AD6300187B210039AD3900000000009C9C9C00636363006363
      6300C6C6C600BDBDBD007B736300DEA56B00D6732100734A3900848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD600FFFFD600FFFF
      DE00FFFFEF00F7F7EF00B58C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000089C00006BE76B0000CE000008C6
      000000BD000000B5000000AD000000940800008C080000840000007B00000073
      0000398C310063AD63001873290039AD3900000000009C9C9C00A5A5A500B5B5
      B500A5A5A5008484840063635A00D6A57300DE7331007B5A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600B55A1800FFFF
      EF00FFFFF700FFFFFF00DED6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009C000063E7630000CE000008C6
      000000BD000000B5000000A50000009400000094000000840000087B08002984
      180063AD6300187B210039AD39000000000000000000000000009C9C9C009C9C
      9C0084848400000000007B736B00F7BD7B00CE73310084635A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEBDA500FFE7AD00F7CE9400FFF7CE00E7D6C600B55A1800E7D6
      C600E7D6C600FFFFEF00F7EFD600C69C94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009408006BEF630018D6180008C6
      000000BD000000B5000000AD080008940000008C000000840000108C180063AD
      6300107B180039AD390000000000000000000000000000000000000000000000
      0000000000000000000063524200A57B5A00A5634200846B6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7C6AD00FFDEAD00EFBD8400B55A1800B55A1800B55A1800B55A
      1800B55A1800FFFFDE00F7F7D600C6AD9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000AD00007BDE7B005AE75A0042DE
      420018C6180000B5080000AD000000940000009400001894210063AD6300107B
      100039AD39000000000000000000000000000000000000000000000000000000
      000000000000000000005A525200A5A5A5006B6B6B005A525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600B55A1800FFEF
      C600FFFFDE00FFFFDE00F7EFD600C6A59C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C0000008C000008840000088C100039AD
      3900000000000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C00000000005A525200A5A5A500B5B5B5005A525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00B55A1800FFF7
      CE00FFF7D600FFFFD600E7DEBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001094080018941800188C180039AD39000000
      0000000000000000000000000000000000000000000000000000527B8400D6D6
      D600636363008C8C8C005A52520094949400C6C6C600C6C6C600000000000000
      00005A5252006B73730000000000000000000000000000000000000000000000
      00000000000000000000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C00001894180039AD3900000000000000
      0000000000000000000000000000000000000000000000000000527B8400B5B5
      B50063636300F7F7F7006B6B6B0094949400ADADAD00B5B5B500C6C6C600BDBD
      BD009C9C9C006B73730000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002194210039AD390000000000000000000000
      000000000000000000000000000000000000000000000000000063636300B5B5
      B5009C9C9C008C8C8C00A5A5A500DEDEDE00CECECE00BDBDBD00ADADAD00949C
      9C006B7373000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000039AD39001094100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000426BF7000818BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000818BD00426BF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039AD3900218C180000AD000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000426BF7000021C6000018C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000018C6000021C600426BF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6846300BD633100B5521000B5521000BD633100C68463000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039AD390018841800219C1800009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000426BF7000018BD001029D6000010C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000010C6001029D6000018BD00426BF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD633100B5521000B5521000B5521000B5521000B5521000B5521000BD63
      3100000000000000000000000000000000000000000000000000000000000000
      000039AD3900088C100008840000088C0000009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000426BF7000021C6001031D6000018CE001018BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001018BD000018CE001031D6000021C600426B
      F70000000000000000000000000000000000000000000000000000000000BD63
      3100B5521000BD633100C68463000000000000000000C6846300BD633100B552
      1000BD63310000000000000000000000000000000000000000000000000039AD
      3900107B100063AD630021942100008C0000088C080000B5000000B5080018C6
      180042DE420052E752006BDE6B0000AD0000000000000000000000000000426B
      F7000021C600527BEF000018D6000018D6000010C6000010BD000010B5001021
      BD004A4ABD00424ABD00424ABD006B63C6006B63C600424ABD00424ABD004A4A
      BD001021BD000010B5000010BD000010C6000018D6000018D600527BEF000021
      C600426BF7000000000000000000000000000000000000000000C6846300B552
      1000BD633100000000000000000000000000000000000000000000000000BD63
      3100B5521000C68463000000000000000000000000000000000039AD3900187B
      180063AD6300218C180000840000008C0800008C000000A5000000B5000000BD
      000008C6000018D6180063E76300009C08000000000000000000426BF7000021
      C600527BEF001031E7000021CE000018CE000018BD000010C6000010B5000008
      A50000089C000008A5003939B5000008AD000008AD003939B5000008A5000008
      9C000008A5000010B5000010C6000018BD000018CE000021CE001031E700527B
      EF000021C600426BF70000000000000000000000000000000000BD633100B552
      100000000000000000000000000000000000000000000000000000000000C684
      6300B5521000BD63310000000000000000000000000039AD3900187B180063AD
      6300187B2100007B000000840000008C0800009C000000AD000000B5000000BD
      000000C6000000CE000063E763001094080000000000426BF7000021C600527B
      EF000021E7000029DE000021D6000018CE000018C6000010C6000008B5000010
      AD000000A5000008A50000009C000008AD000008AD0000009C000008A5000000
      A5000010AD000008B5000010C6000018C6000018CE000021D6000029DE000021
      E700527BEF000021C600426BF700000000000000000000000000B5521000B552
      1000000000000000000000000000000000000000000000000000000000000000
      0000B5521000B5521000000000000000000039AD3900187B210063AD6300298C
      3100007B00000084000000840000008C08000094000000AD000000B5000000BD
      000008C6000000CE000063E76B0000A50000426BF7000021C6005273FF00214A
      EF000029EF000021DE000021D6000018CE000018C6000010BD000010B5000008
      AD0008089C000800A5003939B5000008AD000008AD003939B5000800A5000808
      9C000008AD000010B5000010BD000018C6000018CE000021D6000021DE000029
      EF00214AEF005273FF000021C600426BF7000000000000000000B5521000B552
      10000000000000000000000000000000000000000000CE844200000000000000
      0000B5521000B5521000000000000000000039AD39001873290063AD6300398C
      310000730000007B000000840000008C08000094080000AD000000B5000000BD
      000008C6000000CE00006BE76B00089C0000426BF7000021C600527BEF001042
      E7000021E7000821E7000021CE000018CE000018C6000010BD000008B5000008
      AD000008A5000000A50000009C000008AD000008AD0000009C000000A5000008
      A5000008AD000008B5000010BD000018C6000018CE000021CE000821E7000021
      E7001042E700527BEF000021C600426BF7000000000000000000BD633100B552
      1000C684630000000000000000000000000000000000BD7B5200CE8442000000
      0000B5521000BD63310000000000000000000000000039AD3900187B210063AD
      630029841800087B080000840000009400000094000000A5000000B5000000BD
      000008C6000000CE000063E76300009C000000000000426BF7000021C600426B
      F7000821E7000021D6000021D6000018CE000018C6000010BD000010B5000008
      AD000008A5000808A50000009C000008AD000008AD0000009C000808A5000008
      A5000008AD000010B5000010BD000018C6000018CE000021D6000021D6000821
      E700426BF7000021C600426BF700000000000000000000000000C6846300B552
      1000BD63310000000000000000000000000000000000CE7B3900FF9C0800BD63
      3100B5521000C68463000000000000000000000000000000000039AD3900107B
      180063AD6300108C180000840000008C00000894000000AD080000B5000000BD
      000008C6000018D618006BEF6300009408000000000000000000426BF7000021
      C600527BEF001031D6000021D6000018CE000018C6000010BD000008AD000010
      AD000808A5000800A5003939B5000008AD000008AD003939B5000800A5000808
      A5000010AD000008AD000010BD000018C6000018CE000021D6001031D600527B
      EF000021C600426BF7000000000000000000000000000000000000000000BD63
      3100B552100000000000000000000000000000000000CE6B0800E7840000DE73
      0000BD63310000000000000000000000000000000000000000000000000039AD
      3900107B100063AD630018942100009400000094000000AD000000B5080018C6
      180042DE42005AE75A007BDE7B0000AD0000000000000000000000000000426B
      F7000018BD00527BEF000021D6000021CE000018C6000010BD000810BD001021
      BD00424ABD00424ABD00424ABD00736BBD00736BBD00424ABD00424ABD00424A
      BD001021BD000810BD000010BD000018C6000021CE000021D600527BEF000018
      BD00426BF7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD5A0000D6730000E784
      0000FF9C0800BD6B420000000000000000000000000000000000000000000000
      000039AD3900088C100008840000008C0000009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000426BF7000021C6000829D6000818D6000818BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000818BD000818D6000829D6000021C600426B
      F700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4A0000BD5A0000CE6B
      0800CE7B3900BD7B5200BD6B4200000000000000000000000000000000000000
      00000000000039AD3900188C1800189418001094080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000426BF7000018BD000021CE000021C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000021C6000021CE000018BD00426BF7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039AD390018941800009C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000426BF7000021C6000021C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000021C6000021C600426BF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000039AD39002194210000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000426BF7000810BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000810BD00426BF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000000000000000000000000000AD2F
      0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F
      0000AD2F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A0000000000000000000000000000000000FF4B
      0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B
      0000FF4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000AD2F0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD2F0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A00000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A00000000000000000000000000000000000000
      00000000000000000000AD2F0000FF994700FF4B0000AD2F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD2F0000FF994700FF4B0000AD2F0000000000000000
      00000000000000000000000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B63000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6300000000000000000000000000000000000000
      000000000000AD2F0000FF994700FF994700FF4B0000FF4B0000AD2F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD2F0000FF994700FF994700FF4B0000FF4B0000AD2F00000000
      00000000000000000000000000000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      0000FF4B0000FF4B0000FF4B0000FF4B0000AD2F0000AD2F0000AD2F0000AD2F
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF4B0000FF4B0000FF4B0000FF4B0000AD2F0000AD2F0000AD2F0000AD2F
      00000000000000000000000000000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C80
      4C004C804C004C804C00A57B73000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE
      570052AE57004C804C00A57B73000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE000029
      E7000029E7000029E7000029E7000029E7000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE
      570052AE57004C804C004C804C004C804C0000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B5847300000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE
      570052AE570052AE570052AE57004C804C0000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA
      800052AE570052AE570052AE57004C804C0000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA
      800052AE57004C804C004C804C004C804C0000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA
      800052AE57004C804C00000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C80
      4C004C804C004C804C00000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7E7
      CE008C5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDE
      CE008C5A5A000000000000000000000000000000000000000000000000008000
      0000800000000000000080000000800000000000000000000000000000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500EFDE
      CE008C5A5A000000000000000000000000000000000000000000000000008000
      0000800000000000000080000000800000000000000000000000000000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00EFDE
      CE009C6B63000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7D600EFDE
      CE009C6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C804C004C80
      4C00A57B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE57004C80
      4C00A57B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE570052AE57004C80
      4C004C804C004C804C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4B0000AD2F000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE570052AE570052AE
      570052AE57004C804C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF4B0000FF4B0000FF4B0000FF4B0000AD2F0000AD2F0000AD2F0000AD2F
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF4B0000FF4B0000FF4B0000FF4B0000AD2F0000AD2F0000AD2F0000AD2F
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA800052AE570052AE
      570052AE57004C804C0000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD2F0000FF994700FF994700FF4B0000FF4B0000AD2F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD2F0000FF994700FF994700FF4B0000FF4B0000AD2F00000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE57004C80
      4C004C804C004C804C0000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD2F0000FF994700FF4B0000AD2F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AD2F0000FF994700FF4B0000AD2F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C804C0069CA800052AE57004C80
      4C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD2F0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD2F0000AD2F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C804C004C804C004C804C004C80
      4C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD2F
      0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F0000AD2F
      0000AD2F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF4B
      0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B0000FF4B
      0000FF4B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A0000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A000000000000000000000000000000000000000000000000000000
      00004A4A4A008B838500B4B0B000C2C2C2009C9C9C004A4A4A004A4A4A004A4A
      4A000000000000000000000000000000000000000000CE630000FFFFF700FFFF
      F700FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6AD00FFD6AD00FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE630000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7E7
      CE008C5A5A000000000000000000000000000000000000000000000000004A4A
      4A008B888B009B9498006F6F6F00A0A0A000D7D7D700F9F9F900EBEBEB00B8B7
      B7004A4A4A004A4A4A004A4A4A000000000000000000CE630000FFFFFF002963
      FF002963FF00FFFFF700D6D6D6008C8484008C8484008C8484008C8484006352
      5200FFD6AD00FFD6AD00FFD6AD00CE630000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDE
      CE008C5A5A0000000000000000000000000000000000000000004A4A4A008986
      89008D8A8D00A39EA20068686800686868008B8B8B0091919100A0A0A000B1B2
      B200E5E5E500A7A7A700D0D0D0008680850000000000CE630000FFFFFF0000B5
      FF002963FF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDEB500FFD6
      AD00FFD6AD00FFD6AD00FFD6AD00CE630000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500EFDE
      CE008C5A5A00000000000000000000000000000000004A4A4A00D8D6D900D5D1
      D500AEA9AD0098949800B6B4B600989998006868680068686800686868006868
      6800929292009B9A9C006F6F6F006B6D6B0000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEFD600FFE7C600FFDE
      B500FFD6AD00FFD6AD00FFD6AD00CE630000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00EFDE
      CE009C6B63000000000000000000000000004A4A4A00A8A7A900E0DFE200E0DE
      E000ECECEE00757576007676760094929300BABABB00C5C7C700BFBFBF00A5A5
      A5006868680068686800706F70006D6D6D0000000000CE630000FFFFFF002963
      FF002963FF00FFFFFF00D6D6D6008C8484008C8484008C8484008C8484006352
      5200FFDEB500FFD6AD00FFD6AD00CE630000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7D600EFDE
      CE009C6B6B000000000000000000000000004A4A4A00F3F2F500EBEBED00F7F8
      F900ECEBEE00EBE9EC00D0CFD100A3A2A300807E80006F696A004C804C004C80
      4C004C804C004C804C00A2A2A2004C4C4C0000000000CE630000FFFFFF0000B5
      FF002963FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7E700FFEF
      D600FFE7C600FFDEB500FFD6AD00CE630000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A5000021A5000021A5000021
      A5000021A5000021A50000000000000000004A4A4A00FDFDFD00FBFDFD00F5F5
      F700F4F3F500EEEEF000E7E6E900E2DFE200D8D4D800C6C1C6004C804C0052AE
      570052AE57004C804C00717171000000000000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFEFD600FFE7C600FFDEB500CE630000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE000029E7000029E7000029
      E7000029E7000029E700000000000000000000740400FFFFFF00FDFDFD00FFFF
      FF00FDFCFE00F3F3F500EAE8EB00E0DEE1004C804C004C804C004C804C0052AE
      570052AE57004C804C004C804C004C804C0000000000CE630000FFFFFF002963
      FF002963FF00FFFFFF00D6D6D6008C8484008C8484008C8484008C8484006352
      5200FFF7E700FFEFD600FFE7C600CE630000000000000000000000000000CE63
      0000CE630000CE630000CE630000FFFFFF00FFFFFF00FFDEB500CE6300000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDAD
      AD00B5847300000000000000000000000000057E0E005B5B5B005B5B5B00E9E9
      E800E2E2E30045812C00F5F4F700E9E7EA004C804C0052AE570052AE570052AE
      570052AE570052AE570052AE57004C804C0000000000CE630000FFFFFF0000B5
      FF002963FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7E700FFEFD600CE630000000000000000000000000000CE63
      00000000000000000000CE630000CE630000CE630000CE630000CE6300000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C
      8C00B58C8C00000000000000000000000000087F100004901200000000005B5B
      5B004A4A4A001097260001780900A4A3A4004C804C0069CA800069CA800069CA
      800052AE570052AE570052AE57004C804C0000000000CE630000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7E700CE630000000000000000000000000000CE63
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C
      7B000000000000000000000000000000000005730B000D9C19000C911600097B
      1100037008002EA8480049CC720003750F004C804C004C804C004C804C0069CA
      800052AE57004C804C004C804C004C804C0000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE63000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00BD8484000000
      0000000000000000000000000000000000000000000007800F000EA31B0014AB
      250027B840003ECA60005CE78E0044D27300428A3E00000000004C804C0069CA
      800052AE57004C804C0000000000000000000000000000000000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE6300000000000000000000CE630000FFFFFF00FFFF
      FF00FFDEB500CE63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000077B0D000986
      11000D8A180026AF3D0038C6580030AB4A0000000000000000004C804C004C80
      4C004C804C004C804C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000199F2900138E2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A7D120000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484005050500038383800313131003131310031313100383838008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009898
      9800E0C0B600EAD4CA00F4E0CA00F4E0CA00EAD4CA00EAD4CA00C0ABA1004040
      400058585800848484000000000000000000000000001894CE0021A5D6001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000008080000080800000808000008080
      00008080000080800000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0B6AB00F4E0
      CA00F4F4F400E0E0E000C0A18F00CA987B00D4B6AB00EAF4F400F4EAEA00EAD4
      CA00736A6000505050008484840000000000000000001894CE009CEFFF006BE7
      F70031B5DE0031B5DE0031B5DE0021A5D6001094CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FECC9A00FECC
      9A00FECC9A00EFCE9C00B5848400000000000000000080800000808000008080
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0CAC000F4E0D400F4FF
      FF00C0846A00A1310600AB482300CA988400B6401100AB381100CA988400F4FF
      FF00F4D4CA00605850005858580000000000000000001894CE0094E7F70084FF
      FF007BF7FF0084F7FF007BF7FF0073EFFF006BE7F70031B5DE0031B5DE0021A5
      D600000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000000000000808000008080
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAD4CA00F4FFFF00B660
      4000AB310600B6380B00B68F7B00FFFFFF00D47B5800AB310600A1310600C084
      6A00F4FFFF00EAD4CA004040400084848400000000001894CE0073CEE70094FF
      FF0073F7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF007BEFFF005AD6
      F700189CCE000000000000000000000000000000000000000000C6ADA500FFF7
      E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FECC9A00FECC
      9A00FECC9A00EFCE9400B5848400000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4E0E000F4F4F400CA987B00AB31
      0600C0481C00C0481600C0502300D4735000C0481600C0481C00B6401600A131
      0600D4B6AB00F4EAE0008F847B0048484800000000001894CE0031B5DE0094E7
      F7007BF7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF005AD6
      F70039BDE7000000000000000000000000000000000000000000AD8D8200B8AE
      A700B8AEA700B8AEA700B8AEA700B8AEA700B8AEA700B8AEA700B8AEA700B8AE
      A700B8AEA700B8AEA700A87D7800000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000F4EAE000F4F4F400B6481C00B640
      1600C0501C00C0401100C0735000F4E0D400C0502300B6401100C0481C00B638
      0B00B6603800F4FFFF00D4C0B60038383800000000001894CE0063DEF70031B5
      DE0084FFFF0073F7FF0073EFFF0000630800006B0800007308000063080052D6
      EF005AD6F700189CCE00000000000000000000000000A3522800A3522800A352
      2800A3522800A3522800A3522800A3522800A3522800A3522800A3522800A352
      2800A3522800A3522800A3522800A35228000000000000808000808080000080
      8000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000F4EAE000EAD4CA00B6401100C048
      1C00C0481C00C0401100B66A5000FFFFFF00EA987B00B6310600C0481C00C048
      1600B6401600F4EAEA00EAD4CA0038383800000000001894CE007BF7FF0031B5
      DE0094E7F70094E7F7008CEFFF008CF7FF0073EFFF00006B0800008C08000063
      08006BE7F70039BDE700000000000000000000000000B55A0000BA8E8200E7EE
      EF00E88E6000E88E6000E88E6000E88E6000E88E6000E88E6000E88E6000E88E
      6000E88E6000E7EEEF00BA8E8200B55A00000080800080808000008080000080
      800000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000F4EAE000F4D4C000C0401100C048
      1C00C0481C00C0481600B6381100C0A18F00FFFFFF00E0846000B6380B00C048
      1600B6401600F4EAEA00EAD4CA0038383800000000001894CE0084FFFF006BEF
      FF0031B5DE0031B5DE0031B5DE0031B5DE009CEFFF0073EFFF0000730800008C
      080063DEF70063DEF7001094CE000000000000000000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE630000CE630000CE6300000080800080808000008080000000
      0000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000F4EAE000F4EAE000D4501C00CA50
      1C00C0481600B6401100B6380B00AB310600D4C0B600FFFFFF00CA582A00C040
      1100C0502300FFF4F400EAD4CA0050505000000000001894CE0084F7FF007BF7
      FF007BF7FF007BF7FF0073F7FF0052D6EF0031B5DE0084DEF70000630800089C
      1800006B080094EFFF0031A5D600000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7DEB500B58484000000000000808000C0C0C000008080000000
      0000FFFFFF00C0C0C000C0C0C000FFFFFF008080000000000000000000000000
      000000000000000000000000000000000000F4E0E000FFFFFF00F4845000E048
      1600C0735000EAE0D400CA603800AB1C0000CA846000FFFFFF00D4734800C038
      0B00E0845800FFFFFF00D4B6AB0098989800000000001894CE0084FFFF007BF7
      FF007BF7FF007BEFFF007BF7FF007BF7FF006BE7F70031B5DE000873100018B5
      31000884100031A5D600189CCE00000000000000000000000000DEC6B500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FECC9A00FECC
      9A00FECC9A00F7DEC600B58484000000000000808000C0C0C000808080000080
      800000808000FFFFFF00FFFFFF00C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000F4EAE000F4EAEA00FFEAD400FF73
      3100D46A4000EAFFFF00FFFFFF00E0AB8F00F4FFFF00EAFFFF00E0582300E058
      2300FFEAEA00F4E0D4008F847B0000000000000000001894CE008CFFFF007BF7
      FF007BF7FF007BF7FF0073E7FF007BE7FF007BE7FF00005A000031CE5A0029C6
      520018B53100005A000000000000000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600F7E7
      D600F7E7D600F7DEC600B5848400000000000000000000808000C0C0C0008080
      80008080800000808000C0C0C000FFFFFF00C0C0C00000000000000000000000
      00000000000000000000000000000000000000000000EAD4CA00FFFFFF00FFEA
      C000FFA15800EA986A00EAE0D400EAF4F400EAE0D400F48F6000FF733100FFD4
      C000FFFFFF00EAD4CA00C0C0B60000000000000000001094CE001894CE008CEF
      FF0084F7FF006BE7F700189CCE001094CE001894CE001894CE00005A000042E7
      7300005A00000000000000000000000000000000000000000000E7C6B500FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FECC9A00FECC
      9A00FECC9A00F7E7D600B5848400000000000000000000808000C0C0C000C0C0
      C000808080008080800000808000008080000000000000808000000000000000
      00000000000000000000000000000000000000000000F4EAEA00EAD4CA00FFFF
      FF00FFFFFF00FFF4B600FFD49800FFC07B00FFC07B00FFCA9800FFF4F400FFFF
      FF00EAD4CA00C0C0B60000000000000000000000000000000000000000001894
      CE00189CCE001894CE000000000000000000000000000000000000000000005A
      0000000000000000000000000000000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      F700FFEFDE00FFEFDE00B5848400000000000000000000000000008080000080
      8000C0C0C000C0C0C00080808000808080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000F4EAEA00EAD4
      CA00F4E0E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAE0D400EAD4
      CA00D4D4D4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00B5848400000000000000000000000000000000000000
      0000008080000080800000808000008080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4EA
      E000F4F4EA00F4EAEA00F4EAEA00F4EAEA00F4EAEA00F4EAEA00F4EAEA00F4EA
      E000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500E7C6B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4A18000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF8463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF4A1800FF846300000000008080000080800000808000008080
      00008080000080800000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000008080000080800000808000008080
      00008080000080800000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000008080000080800000808000008080
      00008080000080800000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4A1800FF4A180000000000000000000000
      0000FF4A1800FF84630000000000000000000000000080800000808000008080
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000008080
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000008080
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF945200FF945A00FF4A1800FF4A1800FF4A
      1800FF8C6B000000000000000000000000000000000000000000808000008080
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000008080
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000008080
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF945A00FF9C6300FFA56B00FFB58400FF8C
      6B00FF8463000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF4A1800FF9C6300FFA57300FFB58400FFBD9400FF8C
      6B00FF8463000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF4A1800FF945A00FF9C6300FFAD7B00FFBD9400FFE7CE00FFE7
      CE00FF8C6B000000000000000000000000000000000000808000808080000080
      8000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      8000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      8000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF4A1800FF945A00FFA56B00FFA57300FFBD9400FFE7CE00FFEFE700FFEF
      E700FF8C6B000000000000000000000000000080800080808000008080000080
      800000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000080800080808000008080000080
      800000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      0000000000000000000000000000000000000080800080808000008080000080
      800000000000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      00000000000000000000000000000000000000000000FF4A1800FF4A1800FF4A
      1800FF9C6300FF9C6300FFAD7300FFBD9400FFDEC600FF8C6B00FF8C6B00FF8C
      6B00FF8463000000000000000000000000000080800080808000008080000000
      0000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000080800080808000008080000000
      0000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000080800080808000008080000000
      0000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      000000000000000000000000000000000000FF8C7300FF9C6300FFA57300FFA5
      7300FF8C6B00FFAD7300FFBD9400FFDEC600FF8C6B00FF846300000000000000
      00000000000000000000000000000000000000808000C0C0C000008080000000
      0000FFFFFF00C0C0C000C0C0C000FFFFFF008080000000000000000000000000
      00000000000000000000000000000000000000808000C0C0C000008080000000
      0000FFFFFF00C0C0C000C0C0C000FFFFFF008080000000000000000000000000
      00000000000000000000000000000000000000808000C0C0C000008080000000
      0000FFFFFF00C0C0C000C0C0C000FFFFFF008080000000000000000000000000
      000000000000000000000000000000000000FF8C7300FFA56B00FFB58400FFBD
      9400FFA57300FF8C6B00FFDEC600FF8C6B00FF84630000000000000000000000
      00000000000000000000000000000000000000808000C0C0C000808080000080
      800000808000FFFFFF00FFFFFF00C0C0C000C0C0C00000000000000000000000
      00000000000000000000000000000000000000808000C0C0C000808080000080
      800000808000FFFFFF00FFFFFF00C0C0C000C0C0C00000000000000000000000
      00000000000000000000000000000000000000808000C0C0C000808080000080
      800000808000FFFFFF00FFFFFF00C0C0C000C0C0C00000000000000000000000
      000000000000000000000000000000000000FF8C7300FFAD7300FFBD9400FFC6
      A500FFD6BD00FFDECE00FF8C6B00FF8463000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C0008080
      80008080800000808000C0C0C000FFFFFF00C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C0008080
      80008080800000808000C0C0C000FFFFFF00C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C0008080
      80008080800000808000C0C0C000FFFFFF00C0C0C00000000000000000000000
      000000000000000000000000000000000000FFB59C00FF8C6B00FFBD9400FFDE
      C600FFE7D600FFE7D600FF8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C000C0C0
      C000808080008080800000808000008080000000000000808000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C000C0C0
      C000808080008080800000808000008080000000000000808000000000000000
      0000000000000000000000000000000000000000000000808000C0C0C000C0C0
      C000808080008080800000808000008080000000000000808000000000000000
      00000000000000000000000000000000000000000000FF846300FF8C6B00FFD6
      BD00FFE7D600FFE7D600FF8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000C0C0C000C0C0C00080808000808080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000C0C0C000C0C0C00080808000808080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000C0C0C000C0C0C00080808000808080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000FFB59C00FFBD
      A500FFBDA500FFBDA500FFB59C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000000000000000000000000000000
      000000000000000000000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000314A6300AD7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006300000000000000000000000000004A637B00BD9494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005284B5000873E70031638C00B57B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000AD000000630000000000006B9CC600188CE7004A7BA500C694
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A5FF0039A5FF001073EF003163
      8C00B57B7B000000000000000000000000000000000000000000006300000063
      00000063000000AD000000AD0000006300004AB5FF0052B5FF00218CEF004A7B
      A500C69494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C009C390800EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039A5FF0039A5FF00086B
      E70031638C00B57B7B000000000000000000000000000000000029FF290029FF
      290029FF290000AD000000AD000029FF29000000000052B5FF0052B5FF001884
      E7004A7BA500C694940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFEF
      E7009C9484009C9484009C94840073737300F7D6B500CE6300009C3908009C39
      08009C390800EFCE9C00B584840000000000000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039A5FF0031A5
      FF000873E70031638C00AD7B7B00000000000000000000000000000000000000
      00000000000000AD000029FF290000000000000000000000000052B5FF004AB5
      FF00188CE7004A7BA500BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500CE630000EFCE
      9C009C390800EFCE9400B58484000000000000000000000000000000000052B5
      FF004AB5FF002184DE005A6B730000000000AD7B7300C6A59C00D6B5A500CEA5
      9C000000000000000000000000000000000000000000000000000000000039A5
      FF0031A5FF00106BD60042525A00000000009C635A00B58C8400CEA58C00C68C
      84000000000029FF2900000000000000000000000000000000000000000052B5
      FF004AB5FF002184DE005A6B7300004A0000004A0000004A0000005A0000004A
      0000000000000000000000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD009C390800EFCE9C00B5848400000000000000000000000000000000000000
      000052BDFF00B5D6EF00A5948C00B59C8C00F7E7CE00FFFFD600FFFFD600FFFF
      D600E7DEBD00CEADA50000000000000000000000000000000000000000000000
      000039ADFF00A5CEEF008C7B7300A5847300F7E7C600FFFFCE00FFFFCE00FFFF
      CE00E7D6AD00C69C8C0000000000000000000000000000000000000000000000
      000052BDFF00B5D6EF00185A210042632900315A1800295A1000087310000873
      100021521000CEADA50000000000000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC6009C390800F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD600FFFFD600FFFF
      DE00FFFFEF00F7F7EF00B58C8C00000000000000000000000000000000000000
      000000000000C6A5A500CEA58C00FFEFB500FFFFCE00FFFFCE00FFFFCE00FFFF
      D600FFFFE700F7F7EF00A5737300000000000000000000000000000000000000
      000000000000CEB5B500D6B5A500FFEFC600FFFFD600FFFFD6001863100018BD
      4A00006B080073734200B58C8C00000000000000000000000000D6BDB500FFFF
      FF009C9484009C9484009C94840073737300F7E7CE00CE6300009C3908009C39
      08009C390800F7D6AD00B5848400000000000000000000000000000000000000
      000000000000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600FFFFDE00FFFF
      EF00FFFFF700FFFFFF00DED6BD00000000000000000000000000000000000000
      000000000000B57B7300F7D6A500F7CE8C00FFF7C600FFFFCE00FFFFD600FFFF
      E700FFFFF700FFFFFF00D6CEAD0000000000000000000000000000000000004A
      0000004A0000C6948C00F7DEB500F7D6A500FFF7CE00FFFFD600639C5A0018AD
      390018AD390052733100DED6BD00000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00CE630000F7DE
      BD009C390800F7DEB500B5848400000000000000000000000000000000000000
      000000000000DEBDA500FFE7AD00F7CE9400FFF7CE00FFFFDE00FFFFE700FFFF
      F700FFFFF700FFFFEF00F7EFD600C69C94000000000000000000000000000000
      000000000000D6AD8C00FFE79C00F7C67B00FFF7C600FFFFD600FFFFE700FFFF
      F700FFFFF700FFFFE700F7E7C600B5847B000000000000000000004A0000186B
      1800005A080039632100FFE7AD00F7CE9400004A0000004A0000006B080029C6
      520029CE5A0008731000004A0000004A00000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C6009C390800F7D6B500B5848400000000000000000000000000000000000000
      000000000000E7C6AD00FFDEAD00EFBD8400F7E7B500FFFFD600FFFFDE00FFFF
      E700FFFFE700FFFFDE00F7F7D600C6AD9C000000000000000000000000000000
      000000000000E7B59C00FFD69C00EFAD6B00F7E7A500FFFFCE00FFFFD600FFFF
      E700FFFFE700FFFFD600F7F7CE00B59C840000000000000000000052080021B5
      420021B5420010631800528C3900EFBD8400528C3900218C42001094290042EF
      730031E76B001084210039632100C6AD9C000000000000000000DEC6B500FFFF
      FF009C9484009C9484009C94840073737300FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000000000000000
      000000000000DEBDAD00FFE7B500EFBD8400F7CE9400FFEFC600FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00F7EFD600C6A59C000000000000000000000000000000
      000000000000D6AD9C00FFE7A500EFAD6B00F7C67B00FFEFB500FFFFD600FFFF
      D600FFFFD600FFFFD600F7E7C600B58C840000000000004A00001084210031E7
      6B0042EF730010942900218C4200528C3900F7CE9400529442001063180021B5
      420021B54200186B2900F7EFD600C6A59C000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000000000000000000000000
      000000000000C69C9400FFEFC600FFEFC600F7D6A500F7CE9C00F7E7B500FFF7
      CE00FFF7D600FFFFD600E7DEBD00000000000000000000000000000000000000
      000000000000B5847B00FFEFB500FFEFB500F7CE8C00F7C68400F7E7A500FFF7
      C600FFF7C600FFFFCE00E7D6AD0000000000004A0000004A00000873100029CE
      5A0029C65200006B0800004A0000004A0000F7D6A500F7CE9C00528C3900005A
      0800186B18004A7B3100E7DEBD00000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000000000000000000000000
      00000000000000000000DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD8400F7CE
      9C00FFE7B500FFF7C600BD9C8C00000000000000000000000000000000000000
      00000000000000000000D6B59C00FFFFFF00FFF7EF00F7C67B00EFAD6B00F7C6
      8400FFE7A500FFF7B500AD847300000000000000000000000000004A000018AD
      390018AD3900295A1800DEC6AD00FFFFFF00FFF7EF00F7CE9400EFBD84006394
      4200639C4A00FFF7C600BD9C8C00000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000000000000000000000000000000
      0000000000000000000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000CEADAD00F7E7C600FFEFB500FFE79C00FFE7
      A500F7D6A500C69C840000000000000000000000000000000000004A0000006B
      080018BD4A00004A000000000000D6BDBD00F7EFD600FFEFC600FFE7AD00FFE7
      B500F7DEB500CEAD9C0000000000000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEAD9400CEAD9C00DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C69C7B00C69C8400D6AD8C00D6AD
      8C0000000000000000000000000000000000000000000000000000000000004A
      00000873100008731000004A0000185208004A63290039632100DEBDA500DEBD
      A500000000000000000000000000000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000000000000000000000000000299C
      DE00299CDE00A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD735200C65A0000AD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD4A0000C65A0000BD735200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000299CDE008CD6
      EF0084D6F700CEC6BD00FFEFDE00F7EFE700F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00A57B7300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B55A3100C65A0000CE63
      0000B5521000000000000000000000000000000000000000000000000000B552
      1000CE630000C65A0000B55A3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A000000000000000000299CDE00A5E7FF0094EF
      FF008CF7FF00CEC6BD00F7E7D600F7E7D600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7DEC600F7E7D600A57B7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B55A3100C663
      0000CE630000B55A210000000000000000000000000000000000B55A2100CE63
      0000C6630000B55A310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A000000000000000000299CDE00A5E7FF0094EF
      FF0084EFFF00CEC6BD00F7E7DE00FFE7CE00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7DEC600F7E7D600A57B7300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B55A
      2100CE630000C6630000C68463000000000000000000C6846300C6630000CE63
      0000B55A21000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B63000000000000000000299CDE00ADEFFF00A5EF
      FF0094EFFF00CEC6BD00F7E7E700F7E7D600F7DEC600F7DEC600F7DEBD00F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000AD4A0000BD5A0000BD5A
      0000BD5A0000BD5A0000BD5A0000BD5A0000BD5A0000C6846300000000000000
      0000AD4A0000CE630000B54A00000000000000000000B54A0000CE630000AD4A
      00000000000000000000C6846300BD5A0000BD5A0000BD5A0000BD5A0000BD5A
      0000BD5A0000BD5A0000AD4A00000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000299CDE00B5EFFF00ADEF
      FF00A5EFFF00CEC6BD00F7EFE700F7EFDE00FFE7CE00FFE7CE00FFE7CE00F7DE
      C600F7E7D600EFE7DE00A57B73000000000000000000B5520000D6730000CE6B
      0000CE630000CE630000CE630000CE630000C6630000BD6B4200000000000000
      0000CE9C8400C6630000C6630000C6846300C6846300C6630000C66300000000
      00000000000000000000BD6B4200C6630000CE630000CE630000CE630000CE63
      0000CE6B0000D6730000B55200000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B73000000000000000000299CDE00BDEFFF00BDF7
      FF00ADF7FF00CEC6BD00FFF7EF00FFE7CE00FFDEBD00F7DEBD00F7DEBD00FFDE
      B500F7DEC600F7EFE700A57B73000000000000000000BD5A0000DE7B0000D673
      0000CE630000A5421000CE9C8400CE9C8400CE9C840000000000000000000000
      000000000000AD4A0000CE630000B5521000B5521000CE630000AD4A00000000
      0000000000000000000000000000CE9C8400CE9C8400CE9C8400A5421000CE63
      0000D6730000DE7B0000BD5A00000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B73000000000000000000299CDE00C6EFFF00CEF7
      FF00BDF7FF00CEC6BD00FFF7F700FFF7EF00F7EFE700F7EFE700F7EFDE00F7EF
      DE00F7EFE700EFE7DE00A57B73000000000000000000C6630000E7840000CE63
      0000DE730000CE630000C6846300000000000000000000000000000000000000
      000000000000C6734200CE630000B54A0000B54A0000CE630000C67342000000
      00000000000000000000000000000000000000000000C6846300CE630000DE73
      0000CE630000E7840000C66300000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B58473000000000000000000299CDE00CEEFFF00DEF7
      FF00CEF7FF00CEC6BD00FFF7F700FFFFFF00FFFFFF00FFF7F700F7F7F700EFE7
      DE00D6BDB500C6ADA500A57B73000000000000000000CE630000F7940000B552
      1000B5520000DE7B0000CE6B0000BD7B52000000000000000000000000000000
      000000000000C6734200CE630000B54A0000B54A0000CE630000C67342000000
      000000000000000000000000000000000000BD7B5200CE6B0000DE7B0000B552
      0000B5521000F7940000CE6300000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C000000000000000000299CDE00CEEFFF00E7FF
      FF00DEF7FF00CEC6BD00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00DECE
      C600E7AD7300C6AD8C00000000000000000000000000CE6B0800FF9C0800CE84
      420000000000B5520000E7840000CE6B0000BD63310000000000000000000000
      000000000000B54A0000CE630000B5521000B5521000CE630000B54A00000000
      0000000000000000000000000000BD633100CE6B0000E7840000B55200000000
      0000CE844200FF9C0800CE6B08000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B00000000000000000000000000299CDE00D6F7FF00F7FF
      FF00E7FFFF00CEC6BD00FFEFE700FFF7EF00FFF7EF00FFEFEF00FFF7EF00E7C6
      BD00C6AD8C00299CDE00000000000000000000000000CE732100FFAD3100CE84
      4A000000000000000000C6631000E7840000E77B0000BD520000C67B5200C68C
      7300B5521000C6630000C6630000C6846300C6846300C6630000C6630000B552
      1000C68C7300C67B5200BD520000E77B0000E7840000C6631000000000000000
      0000CE844A00FFAD3100CE7321000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD84840000000000000000000000000000000000299CDE00DEF7FF00FFFF
      FF00F7FFFF00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6
      BD0084C6DE00299CDE00000000000000000000000000CE7B3900FFBD6300C67B
      5200000000000000000000000000B55A2100E77B0000E7840000DE7B0000D673
      0000CE6B0000C6630000AD4A10000000000000000000AD4A1000C6630000CE6B
      0000D6730000DE7B0000E7840000E77B0000B55A210000000000000000000000
      0000C67B5200FFBD6300CE7B39000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      00000000000000000000000000000000000000000000299CDE00DEF7FF00F7F7
      F700ADC6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00B5D6D600DEFF
      FF0084D6F700299CDE00000000000000000000000000CE947B00C6845A000000
      000000000000000000000000000000000000CE9C8400C6631000CE6B0000CE6B
      0000BD5A0000BD6B420000000000000000000000000000000000BD6B4200BD5A
      0000CE6B0000CE6B0000C6631000CE9C84000000000000000000000000000000
      000000000000C6845A00CE947B000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      00000000000000000000000000000000000000000000299CDE00DEF7FF00DECE
      C600BDA59C00A57B7300A57B7300A57B7300A57B7300A57B7300BD9C9400E7EF
      E70094DEF700299CDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000299CDE00B5D6
      E700949C9C00E7DED600F7E7D600F7E7D600F7E7D600CEC6BD00849CA5008CCE
      E700299CDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000299C
      DE00299CDE009C948C009C948C009C948C009C948C009C948C00299CDE00299C
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000848484008484
      84008C8C8C000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00D6CECE009494940039393900525252009C949400C6C6
      C600D6D6D60084848400000000000000000000000000000000004A526300FFEF
      C600F7D6B500EFD6AD00EFCE9C00EFCE9400EFC68C00EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      000000000000AD3900008C290000000000000000000000000000A54200008C29
      0000000000000000000000000000000000000000000029ADD60029ADD60029AD
      D60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD600000000000000000000000000000000009C9C9C009C9C
      9C00F7F7F700FFFFFF00D6D6D6009C9C9C004242420021182100211821003131
      310063636300848484008C8C8C000000000000000000636B8400186BC600636B
      8400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7B00EFBD7B00EFC68400A5636B00000000000000000000000000000000000000
      0000C65A0000A5420000A54200008C29000000000000A5420000AD390000AD39
      00008C2900000000000000000000000000000000000029ADD6009CFFFF006BE7
      FF006BE7FF006BE7FF006BE7FF006BE7FF006BE7FF005ADEFF005ADEFF005ADE
      FF005ADEFF0029ADD6000000000000000000948C8C009C9C9C00EFEFEF00FFFF
      FF00EFE7E700C6C6C6009C9C9C008C8C8C009494940084848400636363003939
      390018212100211821007373730000000000000000000000000031A5FF001073
      D6006B6B8400F7DEBD00EFD6B500EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      8400EFBD7B00EFC68400A5636B00000000000000000000000000000000000000
      0000AD39000000000000000000008C29000000000000AD390000000000000000
      00008C2900000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7FF006BE7FF005ADEFF005ADE
      FF005ADEFF0029ADD60000000000000000009C9C9C00E7E7E700E7E7E700BDBD
      BD00A5A5A500B5ADAD00C6BDBD00A5A5A50094949400948C8C00949494009C94
      94008C8C8C006B6B6B0084848400000000000000000000000000A5635A0031A5
      FF001073D6005A638400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      0000AD3900008C290000000000008C29000000000000AD39000000000000C65A
      00008C2900000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7FF006BE7FF005ADE
      FF005ADEFF0029ADD600000000000000000094949400ADADAD00A5A5A500ADAD
      AD00C6C6C600D6D6D600EFEFEF00EFEFEF00DEDEDE00C6C6C600ADADAD009C9C
      9C00948C8C00949494008C8C8C00000000000000000000000000A5736B00FFF7
      EF0031A5FF00427BAD008C635A00AD7B730094635A00AD7B6B00CEA58400EFC6
      9400EFC68C00EFC68400A5636B00000000000000000000000000000000000000
      0000C65A0000AD390000AD390000AD390000A5948400AD390000AD390000AD39
      00008C2900000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7FF006BE7
      FF005ADEFF0029ADD6000000000000000000948C8C00ADADAD00C6C6C600CECE
      CE00C6C6C600DEDEDE00CECECE00A5ADA500BDBDBD00CECECE00D6D6D600D6D6
      D600C6C6C600B5B5B50094949400000000000000000000000000A5736B00FFFF
      FF00F7EFE700AD8C8C00B58C8400DEBDA500EFD6B500D6B59C00B58C7300CEA5
      8400EFC69400EFC68C00A5636B00000000000000000000000000000000000000
      000000000000C65A0000A54200009C4A18008C634A00AD390000A54200008C29
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7FF006BE7
      FF006BE7FF0029ADD6000000000000000000000000009C9C9C00CECECE00CECE
      CE00DEDEDE00C6C6C600B5B5B500A5D6A500BDC6BD00C6A5A500ADA5A500A5A5
      A500B5B5B500C6BDBD00A5A5A500000000000000000000000000BD846B00FFFF
      FF00FFF7EF00AD847B00DEC6B500F7E7CE00F7E7C600FFFFF700D6B59C00AD7B
      6B00EFCE9C00EFCE9400A5636B00000000000000000000000000000000000000
      00000000000000000000000000008C736B00E7DED60063524200000000000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF006BE7
      FF006BE7FF0029ADD600000000000000000000000000000000009C9C9C00BDBD
      BD00ADADAD00ADADAD00E7E7E700F7EFEF00EFEFEF00EFE7DE00D6D6D600CECE
      CE00B5B5B5009494940000000000000000000000000000000000BD846B00FFFF
      FF00FFFFFF0094636300F7EFDE00F7EFDE00F7E7CE00FFFFEF00EFD6B5009463
      5A00EFCEA500F7D6A500A5636B00000000000000000000000000000000000000
      000000000000000000008C736B00E7DED6009C847B00D6CEBD00635242000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0084EFFF0084EFFF0084EFFF0084EFFF0084EF
      FF006BE7FF0029ADD60000000000000000000000000000000000000000009C9C
      9C00D6D6D600CECECE009C9C9C00BDBDBD00D6D6D600D6D6D600D6D6D600C6C6
      C600ADADAD000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00B58C8400DEC6C600F7EFE700F7EFDE00FFFFD600DEBDA500AD7B
      7300F7D6AD00EFCEA500A5636B00000000000000000000000000000000000000
      000000000000000000009C847B00E7DED60063524200D6CEBD008C736B000000
      0000000000000000000000000000000000000000000029ADD6009CFFFF009CFF
      FF0094F7FF0084EFFF0084EFFF0029ADD60029ADD60029ADD60029ADD60029AD
      D60029ADD60029ADD60000000000088C10000000000000000000000000000000
      0000FFE7E700FFDECE00E7C6BD00E7C6BD00E7CEC600DED6CE00CECECE009494
      9400000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00D6BDBD00BD949400DEC6C600F7EFDE00DEC6B500B58C8400B58C
      7B00DECEB500B5AD9400A5636B00000000000000000000000000000000000000
      0000000000008C736B00E7DED60063524200000000007B7B7300D6CEBD006352
      420000000000000000000000000000000000000000000000000029ADD6009CFF
      FF0084EFFF0084EFFF0029ADD600000000000000000000000000000000000000
      0000000000000000000000000000088C10000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500FFAD9C00000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00D6BDBD00B58C840094636300AD847B00CEA59C00A56B
      5A00A56B5A00A56B5A00A5636B00000000000000000000000000000000000000
      0000000000009C847B009C847B000000000000000000000000007B7B73008C73
      6B0000000000000000000000000000000000000000000000000052CEEF0029AD
      D60029ADD60029ADD60052CEEF00000000000000000000000000000000000000
      000018AD290000000000088C1000007308000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9400000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700D6BDBD00A56B
      5A00E79C5200E78C3100B56B4A00000000000000000000000000000000000000
      00008C736B00E7DED600635242000000000000000000000000007B7B7300D6CE
      BD00635242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000088C100018AD2900088C1000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A0000000000000000000000000000000000000000000000
      00007B7B73006352420000000000000000000000000000000000000000007B7B
      73008C736B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000088C10005AE78C0018AD290000000000000000000000000000000000CE9C
      9C00FFE7D600FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D6BDBD00A56B
      5A00BD846B000000000000000000000000000000000000000000000000000000
      0000635242000000000000000000000000000000000000000000000000000000
      00007B7B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000730800007308000073080018AD2900000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00F7AD9C00F7AD9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B5848400000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000045454500B7B7B700B7B7
      B700B7B7B700B7B7B700B7B7B700B7B7B70055555500454545003F3F3F000000
      0000000000000000000000000000000000000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B5848400000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      00000000000000000000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A005151510045454500D4D4D4006060
      600077777700B7B7B700D6D6D600DCDCDC005555550045454500414141000000
      0000000000000000000000000000000000000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B5848400000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C6000000000000000000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A005151510045454500D6D6D6005454
      540060606000B7B7B700CFCFCF00D6D6D6005555550045454500464646004545
      45003F3F3F000000000000000000000000000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B5848400000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD60000000000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A005151510045454500D9D9D900D6D6
      D600D4D4D400D3D3D300D1D1D100CFCFCF0055555500454545004A4A4A004545
      4500414141000000000000000000000000000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF0000000000000000000000000000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A005151510045454500454545004545
      45004545450045454500454545004545450045454500454545004E4E4E004545
      450046464600454545003F3F3F00000000000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C600000000000000000000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A005151510045454500FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70045454500555555004545
      45004A4A4A004545450041414100000000000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C600000000000000000000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD5252005151510045454500FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70045454500616161004545
      45004E4E4E004545450046464600000000000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C6000000000000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A005151510045454500FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70045454500636363004545
      450055555500454545004A4A4A00000000000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A00007308000000000000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A005151510045454500FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70045454500636363004545
      450061616100454545004E4E4E00000000000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C6000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A005151510045454500FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F70045454500636363004545
      4500636363004545450055555500000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B5848400000000000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD290008841000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A005151510045454500EB8F3000E88C
      2D00E4882900E0842600DC812300D87D2000D77C1F0045454500636363004545
      4500636363004545450061616100000000000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B00000000000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A5180000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000515151004545
      4500FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F7004545
      4500636363004545450063636300000000000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE9473000000000000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      18000884100000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000515151004545
      4500EB8F3000E88C2D00E4882900E0842600DC812300D87D2000D77C1F004545
      4500636363004545450063636300000000000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000730800087B0800088C1000088C1000087B
      08000000000000000000000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      00005151510045454500FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F7004545450063636300000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A00000000000000000000000000000000000000
      00005151510045454500EB8F3000E88C2D00E4882900E0842600DC812300D87D
      2000D77C1F00454545006363630000000000424D3E000000000000003E000000
      2800000040000000100100000100010000000000800800000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF0781FFFFFF
      07C3FE039DFFF93FCFE7FC01CFEFF93FE7E70001E7C7F93FF0070001F383F93F
      F9E70001B901F93FFCE700018000F13FFE670003FFC7E13FFF27000788C7C13F
      FF87007F9CC7C13FFFC7007FC1C7C13FFFE7007FC9C7E00FFFFF007FE3C7F00F
      FFFF007FE3FFFFFFFFFFFFFFF7FFFFFFFFFF9FFFFFFFFFFF000000FFFFFFFFFF
      0000000FF04FFFFF00000007E71F0E0400000003EF9F9F3100000001EF9FCF39
      00000001E79FE03900000001F01FF30100000001FF9FF93900000000EF9FFC39
      00000000E79FFE0300000007F03FFF3F00000007FFFFFFFF0000801FFFFFFFFF
      0000C03FFFFFFFFFFFFFC07FFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFFFFFFF
      FC03FFFFFFFFFFFFFC0300070007E667F800FFFFFFFF9999F800EFFFDFFFFFFF
      F800CE07CE07A975F80182070607AB77800303FF03FF9957800382000600AB27
      801FCE00CE009977001FEFFFDFFFFFFF001FFFFFFFFFFFFF803F00070007FFFF
      C07FFFFFFFFFFFFFE0FFFFFFFFFFFFFFC001C001FC3FFFFFC001C001F00FFE1F
      C001C001E007FC3FC001C001C003FE3FC001C0018001FE3FC001C0018001FE3F
      C001C0010000FE3FC001C0010000FE3FC001C0010000FE3FC001C0010000FE3F
      C001C0018001F63BC001C0018001E003C001C001C003E007C003C003E007FFFF
      C007C007F00FFFFFC00FC00FFC3FFFFFFFFFE003FFFFFFFFFFFFC001F000FFFF
      FFFFC001FFFFFFFFFFFFC001F070FFFFE01FC001FC79E07FF18FC001FE39F8FF
      F18FC001FF01F8FFF18FC001FF89FC7FF01FC001BBC1FC7FF18FC00193E1FE3F
      F18FC00183F1FE3FF18FC001D7F9FF1FE01FC001D7FFFE0FFFFFC001C7FFFFFF
      FFFFC001EFFFFFFFFFFFE003FFFFFFFFFE7FFE7F9FFFFFFFFE3FFC3F0FFFFFFF
      FE1FFC3F07FFE00FFE0FC43F83FFFFFF0007803FC1FFF01F00038001E10FF11F
      0001F000F003F39F00008001F801F39F0000803FF801F39F0001C43FF800F39F
      0003FC3FF800F39F0007FC3FF800F39FFE0FE43FF801E10FFE1FC033FC01FFFF
      FE3FC003FE03FFFFFE7FC007FF0FFFFFFFFFFE7FFE7FFE7FFFFFFC7FFC7FFE3F
      F81FF87FF87FFE1FF00FF07FF07FFE0FE187E000E0000007C7E3C000C0000003
      CFE3800080000001CFF3000000000000CFB3000000000000C793800080000001
      C783C000C0000003E787E000E0000007FF83F07FF07FFE0FFF81F87FF87FFE1F
      FFFFFC7FFC7FFE3FFFFFFE7FFE7FFE7FFFFFFFFFF801F801E007FFFFF801F801
      E007FFFFF801F801FE7FFE7FF801F801FC3FFC3F80018001F81FF81F80018001
      F00FF00F80018000FE7FFE7F80018000FE7FFE7F80008001FE7FFE7F80008001
      FE7FFE7F80008003FE7FFE7F80008007FE7FFE7F8003801FFE7FFE7F8003801F
      FFFFFFFF803F803FFFFFFFFF807F807FFFFFFFFFFFFFFFFFE007FFFFFFFFFFFF
      E007FFFFFFFFFFFFE007E4E7FE7FFE7FE007E4E7FE7FFE7FE007FFCFFE7FFE7F
      E007FFCFFE7FFE7FE007FF9FFE7FFE7FE007FF9FFE7FFE7FE003FF3FFE7FFE7F
      E003FF3FF00FF00FE003FE7FF81FF81FE003FE7FFC3FFC3FFF0FFFFFFE7FFE7F
      FF0FFFFFFFFFE007FFFFFFFFFFFFE007FFFFFFFFFFFFF87F8000FFFFE007F00F
      8000EFFFE007E0018000EFFFE007C0008000EC1FE00780008000E01FE0070000
      8000EC1FE00700008000EFFFE00300018000EC1FE00300008000E01FE0070000
      8000EC1FE00720008000EFFFE00F0000800083FFE01F8043C00183FFFFFFC0C3
      FFFF83FFFFFFF9FFFFFFFFFFFFFFFBFFFFFFF00FFFFFC001003EE0038FFFC001
      007EC001807FC00180FE8001800FC001C1F080008007C001E07600008007C001
      C0360000800380008036000080038000001F000080018000001F00008001C001
      003F00008001C001003F00018003C001801F80018007C001801F8003E3EFC001
      C03FC007FFFFC001F0FFE00FFFFFC001FFFEFFFFFFFFFFFFFFFC003D00300030
      FFF9007D0077007EFE7380FD80F780FEFC07C1FDC1F0C1F8FC07E07DE07EE07E
      FC07C03DC03EC03EF807803980308030F007001F001F001F8007001F001F001F
      003F003F003F003F007F003F003F003F00FF801F801F801F01FF801F801F801F
      81FFC03FC03FC03FC1FFF0FFF0FFF0FF9FFF9FFB9FFFC0010FFF0FF90FFFC001
      07FF07C007FFC00183FF83C083FFC001C1FFC1F9C1FFC001E10FE10BE00FC001
      F003F003F003C001F801F801F801C001F801F801E001C001F800F800C000C001
      F800F800C000C001F800F8008000C001F801F8010001C001FC01FC01C001C003
      FE03FE03C203C007FF0FFF0FE00FC00FF801E001FF8FF1FFF801C001FF87E1FF
      F8018001FFC3C3FFF8018001FFE187FF8001800180318C018001800180301C01
      8001800180781E018001800181F81F818001800180F81F018001800388781E11
      800380038C000031800780038E018071801F80039F03C0F9801F8003FFFFFFFF
      803FC007FFFFFFFF807FE00FFFFFFFFFFFFFFDC7C001FFFFFFFFF003C001F9CF
      8003C0018001F08780030001C001F6B780030001C001F2A780030001C001F007
      80030001C001F80F80038001C001FE3F8003C003C001FC1F8003E007C001FC1F
      8002F00FC001F88FC1FEF03FC001F9CFC1F4F03FC001F1C7FFF1F03FC003F3E7
      FFF1E03FC007F7F7FFF0E07FC00FFFFFC001FFFFC001FFFFC0018FFF8000801F
      C001807F8000001FC001800F80000007C001800780000007C001800780000001
      C001800380000001C001800380000001C001800180000001C001800180000001
      C001800180000001C001800380000001C00180078000C001C003C3C78000C001
      C007FE0F8000F001C00FFFFFC001F00100000000000000000000000000000000
      000000000000}
  end
  object hlInnoSetup: TSynInnoSyn
    DefaultFilter = 'Inno Setup Script Files (*.iss)|*.iss'
    ConstantAttri.Background = clWindow
    ConstantAttri.Style = []
    CommentAttri.Background = clWindow
    CommentAttri.Style = []
    IdentifierAttri.Background = clWindow
    InvalidAttri.Background = clWindow
    InvalidAttri.Foreground = clFuchsia
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    ParameterAttri.Background = clWindow
    ParameterAttri.Foreground = clTeal
    ParameterAttri.Style = []
    SectionAttri.Background = clWindow
    SectionAttri.Foreground = clNavy
    SectionAttri.Style = []
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    Left = 364
    Top = 217
  end
  object alMain: TActionList
    Images = ilToolbar
    OnUpdate = alMainUpdate
    Left = 80
    Top = 202
    object acFile: TAction
      Category = 'File'
      Caption = '&File'
      OnExecute = acFileExecute
    end
    object acNew: TAction
      Category = 'File'
      Caption = '&New'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = acNewExecute
    end
    object acOpen: TAction
      Category = 'File'
      Caption = '&Open...'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = acOpenExecute
    end
    object acSave: TAction
      Category = 'File'
      Caption = '&Save'
      ImageIndex = 2
      ShortCut = 16467
      OnExecute = acSaveExecute
    end
    object acSaveAs: TAction
      Category = 'File'
      Caption = 'Save &As...'
      ShortCut = 24659
      OnExecute = acSaveAsExecute
    end
    object acSaveAllFiles: TAction
      Category = 'File'
      Caption = 'Save A&ll Files'
      ImageIndex = 3
      OnExecute = acSaveAllFilesExecute
    end
    object acCopyTo: TAction
      Category = 'File'
      Caption = 'Cop&y To...'
      OnExecute = acCopyToExecute
    end
    object acRename: TAction
      Category = 'File'
      Caption = 'Rena&me...'
      OnExecute = acRenameExecute
    end
    object acFileRevert: TAction
      Category = 'File'
      Caption = 'Revert'
      OnExecute = acFileRevertExecute
    end
    object acFileRevertToSaved: TAction
      Category = 'File'
      Caption = 'To &Saved...'
      OnExecute = acFileRevertToSavedExecute
    end
    object acFileRevertToBackup: TAction
      Category = 'File'
      Caption = 'To &Backup...'
      OnExecute = acFileRevertToBackupExecute
    end
    object acFileChangeToFileDir: TAction
      Category = 'File'
      Caption = 'Change to File Directory'
      ImageIndex = 57
      OnExecute = acFileChangeToFileDirExecute
    end
    object acPrint: TAction
      Category = 'File'
      Caption = '&Print...'
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = acPrintExecute
    end
    object acPageSetup: TAction
      Category = 'File'
      Caption = 'Pa&ge Setup...'
      OnExecute = acPageSetupExecute
    end
    object acPrintPreview: TAction
      Category = 'File'
      Caption = 'P&rint Preview...'
      ImageIndex = 6
      OnExecute = acPrintPreviewExecute
    end
    object acInsertFileAtCurrentPosition: TAction
      Category = 'File'
      Caption = '&Insert File At Current Position...'
      OnExecute = acInsertFileAtCurrentPositionExecute
    end
    object acAppendFile: TAction
      Category = 'File'
      Caption = 'Appe&nd File...'
      OnExecute = acAppendFileExecute
    end
    object acWriteBlockToFile: TAction
      Category = 'File'
      Caption = '&Write Block To File...'
      OnExecute = acWriteBlockToFileExecute
    end
    object acExport: TAction
      Category = 'File'
      Caption = '&Export'
      OnExecute = acDummyExecute
    end
    object acClose: TAction
      Category = 'File'
      Caption = '&Close'
      ImageIndex = 4
      ShortCut = 16471
      OnExecute = acCloseExecute
    end
    object acCloseAll: TAction
      Category = 'File'
      Caption = 'Close All &Files'
      OnExecute = acCloseAllExecute
    end
    object acRecentFiles: TAction
      Category = 'File'
      Caption = 'Recen&t Files'
      OnExecute = acDummyExecute
    end
    object acFileRecentProjects: TAction
      Category = 'File'
      Caption = 'Recent Pro&jects'
      OnExecute = acDummyExecute
    end
    object acExit: TAction
      Category = 'File'
      Caption = 'E&xit'
      ShortCut = 32856
      OnExecute = acExitExecute
    end
    object acExportToHTML: TAction
      Category = 'Export'
      Caption = 'To &Hypertext markup language (HTML)'
      OnExecute = acExportToHTMLExecute
    end
    object acExportToRTF: TAction
      Category = 'Export'
      Caption = 'To &Rich text format (RTF)'
      OnExecute = acExportToRTFExecute
    end
    object acView: TAction
      Category = 'View'
      Caption = '&View'
      OnExecute = acViewExecute
    end
    object acShowToolbar: TAction
      Category = 'View'
      Caption = '&Toolbar'
      OnExecute = acShowToolbarExecute
    end
    object acShowFileTabs: TAction
      Category = 'View'
      Caption = '&File Tabs'
      OnExecute = acShowFileTabsExecute
    end
    object acSearchResults: TAction
      Category = 'View'
      Caption = 'Search &Results'
      ShortCut = 24646
      OnExecute = acSearchResultsExecute
    end
    object acConsoleOutput: TAction
      Category = 'View'
      Caption = 'Console &Output'
      ShortCut = 24655
      OnExecute = acConsoleOutputExecute
    end
    object acViewFilePanel: TAction
      Category = 'View'
      Caption = 'File &Panel'
      ShortCut = 24645
      OnExecute = acViewFilePanelExecute
    end
    object acViewFileList: TAction
      Category = 'View'
      Caption = 'File &List'
      ShortCut = 24662
      OnExecute = acViewFileListExecute
    end
    object acSetBookmark: TAction
      Category = 'View'
      Caption = '&Set Bookmark'
      OnExecute = acDummyExecute
    end
    object acJumpToBookmark: TAction
      Category = 'View'
      Caption = '&Jump To Bookmark'
      OnExecute = acJumpToBookmarkExecute
    end
    object acGoToLine: TAction
      Category = 'View'
      Caption = '&Go To Line'
      ShortCut = 16455
      OnExecute = acGoToLineExecute
    end
    object acShowSpecialCharacters: TAction
      Category = 'View'
      Caption = 'S&how Special Characters'
      ImageIndex = 63
      ShortCut = 24648
      OnExecute = acShowSpecialCharactersExecute
    end
    object acViewOEMCharset: TAction
      Category = 'View'
      Caption = 'O&EM Charset'
      OnExecute = acViewOEMCharsetExecute
    end
    object acLockFileForChanges: TAction
      Category = 'View'
      Caption = '&Lock File For Changes'
      OnExecute = acLockFileForChangesExecute
    end
    object acProject: TAction
      Category = 'Project'
      Caption = '&Project'
      OnExecute = acProjectExecute
    end
    object acProjectNew: TAction
      Category = 'Project'
      Caption = '&New...'
      OnExecute = acProjectNewExecute
    end
    object acProjectOpen: TAction
      Category = 'Project'
      Caption = '&Open...'
      OnExecute = acProjectOpenExecute
    end
    object acProjectClose: TAction
      Category = 'Project'
      Caption = '&Close'
      OnExecute = acProjectCloseExecute
    end
    object acProjectOpenAllFiles: TAction
      Category = 'Project'
      Caption = '&Open All Files'
      OnExecute = acProjectOpenAllFilesExecute
    end
    object acProjectCloseAllFiles: TAction
      Category = 'Project'
      Caption = 'C&lose All Files'
      OnExecute = acProjectCloseAllFilesExecute
    end
    object acProjectFiles: TAction
      Category = 'Project'
      Caption = '&Project Files'
      OnExecute = acProjectFilesExecute
    end
    object acProjectRecent: TAction
      Category = 'Project'
      Caption = '&Recent Projects'
      OnExecute = acDummyExecute
    end
    object acProjectManageFileList: TAction
      Category = 'Project'
      Caption = '&Manage File List...'
      OnExecute = acProjectManageFileListExecute
    end
    object acTools: TAction
      Category = 'Tools'
      Caption = '&Tools'
      OnExecute = acToolsExecute
    end
    object acRecordMacro: TAction
      Category = 'Tools'
      Caption = '&Record Macro'
      ShortCut = 16503
      OnExecute = acRecordMacroExecute
    end
    object acPlayMacro: TAction
      Category = 'Tools'
      Caption = '&Play Macro'
      ShortCut = 119
      OnExecute = acPlayMacroExecute
    end
    object acManageMacros: TAction
      Category = 'Tools'
      Caption = '&Manage Macros'
      OnExecute = acManageMacrosExecute
    end
    object acUserCommand1: TAction
      Tag = 1
      Category = 'Tools'
      Caption = 'User Command &1'
      ImageIndex = 17
      ShortCut = 120
      OnExecute = acUserCommandExecute
    end
    object acUserCommand2: TAction
      Tag = 2
      Category = 'Tools'
      Caption = 'User Command &2'
      ImageIndex = 18
      ShortCut = 121
      OnExecute = acUserCommandExecute
    end
    object acUserCommand3: TAction
      Tag = 3
      Category = 'Tools'
      Caption = 'User Command &3'
      ImageIndex = 19
      ShortCut = 122
      OnExecute = acUserCommandExecute
    end
    object acUserCommand4: TAction
      Tag = 4
      Category = 'Tools'
      Caption = 'User Command &4'
      ImageIndex = 20
      ShortCut = 123
      OnExecute = acUserCommandExecute
    end
    object acShellExecute: TAction
      Category = 'Tools'
      Caption = 'S&hell Execute'
      ShortCut = 16507
      OnExecute = acShellExecuteExecute
    end
    object acHTMLTidy: TAction
      Category = 'Tools'
      Caption = 'HTML Tidy'
      OnExecute = acHTMLTidyExecute
    end
    object acHTMLTidyManage: TAction
      Category = 'Tools'
      Caption = '&Manage Profiles...'
      OnExecute = acHTMLTidyManageExecute
    end
    object acFileCompare: TAction
      Category = 'Tools'
      Caption = 'C&ompare...'
      OnExecute = acFileCompareExecute
    end
    object acTextStatistics: TAction
      Category = 'Tools'
      Caption = 'S&tatistics...'
      OnExecute = acTextStatisticsExecute
    end
    object acSetHighlighter: TAction
      Category = 'Tools'
      Caption = '&Set Highlighter'
      OnExecute = acSetHighlighterExecute
    end
    object acConversion: TAction
      Category = 'Tools'
      Caption = '&Convert Text To...'
      OnExecute = acConversionExecute
    end
    object acCustomizeTypes: TAction
      Category = 'Tools'
      Caption = '&Customize Types...'
      OnExecute = acCustomizeTypesExecute
    end
    object acConvertToDOS: TAction
      Category = 'Tools'
      Caption = '&DOS (CRLF)'
      OnExecute = acConversionExecute
    end
    object acConvertToUnicode: TAction
      Category = 'Tools'
      Caption = 'U&nicode'
      OnExecute = acConversionExecute
    end
    object acConvertToUNIX: TAction
      Category = 'Tools'
      Caption = '&UNIX (LF only)'
      OnExecute = acConversionExecute
    end
    object acConvertToMAC: TAction
      Category = 'Tools'
      Caption = '&Macintosh (CR only)'
      OnExecute = acConversionExecute
    end
    object acOptions: TAction
      Category = 'Options'
      Caption = '&Options'
      OnExecute = acDummyExecute
    end
    object acPreferences: TAction
      Category = 'Options'
      Caption = '&Environment Options...'
      ImageIndex = 41
      OnExecute = acPreferencesExecute
    end
    object acCodeTemplate: TAction
      Category = 'Options'
      Caption = '&Code Templates...'
      OnExecute = acCodeTemplateExecute
    end
    object acWordwrap: TAction
      Category = 'View'
      Caption = '&Wordwrap'
      ImageIndex = 15
      ShortCut = 24663
      OnExecute = acWordwrapExecute
    end
    object acStayOnTop: TAction
      Category = 'Options'
      Caption = '&Stay On Top'
      ImageIndex = 16
      OnExecute = acStayOnTopExecute
    end
    object acExportRegistrySettings: TAction
      Category = 'Options'
      Caption = 'E&xport Registry Settings...'
      OnExecute = acExportRegistrySettingsExecute
    end
    object acWindow: TAction
      Category = 'Window'
      Caption = '&Window'
      OnExecute = acWindowExecute
    end
    object acCascade: TAction
      Category = 'Window'
      Caption = '&Cascade'
      OnExecute = acCascadeExecute
    end
    object acTileHorizontal: TAction
      Category = 'Window'
      Caption = 'Tile &Horizontal'
      OnExecute = acTileHorizontalExecute
    end
    object acTileVertical: TAction
      Category = 'Window'
      Caption = 'Tile &Vertical'
      OnExecute = acTileVerticalExecute
    end
    object acNextWindow: TAction
      Category = 'Window'
      Caption = '&Next Window'
      OnExecute = acNextWindowExecute
    end
    object acPreviousWindow: TAction
      Category = 'Window'
      Caption = '&Previous Window'
      OnExecute = acPreviousWindowExecute
    end
    object acHelp: TAction
      Category = 'Help'
      Caption = '&Help'
      OnExecute = acDummyExecute
    end
    object acHelpOnKeyword: TAction
      Category = 'Help'
      Caption = 'Help On &Keyword'
      OnExecute = acHelpOnKeywordExecute
    end
    object acHelpContents: TAction
      Category = 'Help'
      Caption = '&Contents'
      ImageIndex = 21
      OnExecute = acHelpContentsExecute
    end
    object acAbout: TAction
      Category = 'Help'
      Caption = '&About...'
      OnExecute = acAboutExecute
    end
    object acEdit: TAction
      Category = 'Edit'
      Caption = '&Edit'
      OnExecute = acDummyExecute
    end
    object acFormat: TAction
      Category = 'Format'
      Caption = 'For&mat'
      OnExecute = acDummyExecute
    end
    object acEditUndo: TAction
      Category = 'Edit'
      Caption = '&Undo'
      ImageIndex = 10
      ShortCut = 16474
      OnExecute = acEditUndoExecute
    end
    object acEditRedo: TAction
      Category = 'Edit'
      Caption = '&Redo'
      ImageIndex = 11
      ShortCut = 24666
      OnExecute = acEditRedoExecute
    end
    object acEditCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      ImageIndex = 7
      ShortCut = 16472
      OnExecute = acEditCutExecute
    end
    object acEditCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      ImageIndex = 8
      ShortCut = 16451
      OnExecute = acEditCopyExecute
    end
    object acEditPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      ImageIndex = 9
      ShortCut = 16470
      OnExecute = acEditPasteExecute
    end
    object acEditDelete: TAction
      Category = 'Edit'
      Caption = '&Delete'
      OnExecute = acEditDeleteExecute
    end
    object acEditSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select &All'
      ShortCut = 16449
      OnExecute = acEditSelectAllExecute
    end
    object acEditFind: TAction
      Category = 'Edit'
      Caption = '&Find...'
      ImageIndex = 12
      ShortCut = 16454
      OnExecute = acEditFindExecute
    end
    object acEditReplace: TAction
      Category = 'Edit'
      Caption = '&Replace...'
      ImageIndex = 14
      ShortCut = 16466
      OnExecute = acEditReplaceExecute
    end
    object acEditFindNext: TAction
      Category = 'Edit'
      Caption = 'Find &Next'
      ImageIndex = 13
      ShortCut = 114
      OnExecute = acEditFindNextExecute
    end
    object acEditFindPrevious: TAction
      Category = 'Edit'
      Caption = 'Find Pr&evious'
      ShortCut = 8306
      OnExecute = acEditFindPreviousExecute
    end
    object acEditIncrementalSearch: TAction
      Category = 'Edit'
      Caption = 'Incremental Searc&h'
      ShortCut = 16459
      OnExecute = acEditIncrementalSearchExecute
    end
    object acEditToggleSelectionMode: TAction
      Category = 'Edit'
      Caption = 'T&oggle Selection Mode'
      ShortCut = 16460
      OnExecute = acEditToggleSelectionModeExecute
    end
    object acEditSortText: TAction
      Category = 'Edit'
      Caption = '&Sort Text'
      ImageIndex = 62
      ShortCut = 8305
      OnExecute = acEditSortTextExecute
    end
    object acEditMatchBraces: TAction
      Category = 'Edit'
      Caption = '&Match Braces'
      ShortCut = 16461
      OnExecute = acEditMatchBracesExecute
    end
    object acEditSelMatchBraces: TAction
      Category = 'Edit'
      Caption = 'Se&lect Text Between Braces'
      ShortCut = 24653
      OnExecute = acEditSelMatchBracesExecute
    end
    object acFormatIndentBlock: TAction
      Category = 'Format'
      Caption = '&Indent Block'
      ImageIndex = 54
      ShortCut = 24649
      OnExecute = acFormatIndentBlockExecute
    end
    object acFormatUnindentBlock: TAction
      Category = 'Format'
      Caption = '&Unindent Block'
      ImageIndex = 53
      ShortCut = 24661
      OnExecute = acFormatUnindentBlockExecute
    end
    object acFormatToLowerCase: TAction
      Category = 'Format'
      Caption = 'To &Lower Case'
      ImageIndex = 58
      ShortCut = 16500
      OnExecute = acFormatToLowerCaseExecute
    end
    object acFormatToUpperCase: TAction
      Category = 'Format'
      Caption = 'To &Upper Case'
      ImageIndex = 60
      ShortCut = 32884
      OnExecute = acFormatToUpperCaseExecute
    end
    object acFormatInvertCase: TAction
      Category = 'Format'
      Caption = 'I&nvert Case'
      ImageIndex = 59
      ShortCut = 116
      OnExecute = acFormatInvertCaseExecute
    end
    object acFormatReformatParagraph: TAction
      Category = 'Format'
      Caption = '&Reformat Paragraph'
      ShortCut = 16450
      OnExecute = acFormatReformatParagraphExecute
    end
    object acFormatFillBlock: TAction
      Category = 'Format'
      Caption = '&Fill Block'
      ShortCut = 16457
      OnExecute = acFormatFillBlockExecute
    end
    object acFormatInsertCodeFromTemplate: TAction
      Category = 'Format'
      Caption = 'In&sert Code From Template'
      ShortCut = 16458
      OnExecute = acFormatInsertCodeFromTemplateExecute
    end
    object acFormatCommentUncommentCode: TAction
      Category = 'Format'
      Caption = '&Comment/Uncomment Code'
      ShortCut = 24643
      OnExecute = acFormatCommentUncommentCodeExecute
    end
    object acFormatInsertTimeStamp: TAction
      Category = 'Format'
      Caption = 'Insert Ti&me Stamp'
      ImageIndex = 61
      ShortCut = 24660
      OnExecute = acFormatInsertTimeStampExecute
    end
    object acFormatRemoveTrailingSpaces: TAction
      Category = 'Format'
      Caption = 'Remove &Trailing Spaces'
      OnExecute = acFormatRemoveTrailingSpacesExecute
    end
    object acTrayRestore: TAction
      Caption = '&Restore'
      OnExecute = acTrayRestoreExecute
    end
    object acEditCopyFilename: TAction
      Category = 'Edit'
      Caption = 'Cop&y Filename'
      OnExecute = acEditCopyFilenameExecute
    end
    object acViewRuler: TAction
      Category = 'View'
      Caption = 'Ruler'
      ImageIndex = 56
      ShortCut = 24658
      OnExecute = acViewRulerExecute
    end
    object acCloseBottomWindow: TAction
      Caption = 'acCloseBottomWindow'
      ShortCut = 27
      OnExecute = acCloseBottomWindowExecute
    end
    object acFormatConvertTabsToSpaces: TAction
      Category = 'Format'
      Caption = 'Convert T&abs To Spaces...'
      OnExecute = acFormatConvertTabsToSpacesExecute
    end
    object acFormatConvertSpacesToTabs: TAction
      Category = 'Format'
      Caption = 'Convert S&paces To Tabs...'
      OnExecute = acFormatConvertSpacesToTabsExecute
    end
    object acFormatRemoveComments: TAction
      Category = 'Format'
      Caption = 'Remove Comm&ents'
      OnExecute = acFormatRemoveCommentsExecute
    end
  end
  object TBXMDIHandler1: TSpTBXMDIHandler
    Toolbar = tbMainMenu
    Left = 692
    Top = 150
  end
  object cntProjectFilesMRU: TTBItemContainer
    Left = 152
    Top = 250
  end
  object TBXPopupMenu1: TSpTBXPopupMenu
    Images = ilToolbar
    Left = 256
    Top = 228
    object TBXItem37: TSpTBXItem
      Action = acClose
    end
    object TBXSeparatorItem12: TSpTBXSeparatorItem
    end
    object TBXItem38: TSpTBXItem
      Action = acEditCut
    end
    object TBXItem50: TSpTBXItem
      Action = acEditCopy
    end
    object TBXItem51: TSpTBXItem
      Action = acEditPaste
    end
    object TBXItem52: TSpTBXItem
      Action = acEditDelete
    end
    object TBXItem58: TSpTBXItem
      Action = acEditCopyFilename
    end
    object TBXSeparatorItem13: TSpTBXSeparatorItem
    end
    object TBXItem53: TSpTBXItem
      Action = acEditSelectAll
    end
  end
  object popTray: TSpTBXPopupMenu
    Left = 657
    Top = 378
    object TBXItem55: TSpTBXItem
      Action = acTrayRestore
    end
    object popTrayExit: TSpTBXItem
      Action = acExit
    end
  end
  object hlCSS: TSynCssSyn
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGray
    PropertyAttri.Background = clWindow
    PropertyAttri.Foreground = clNavy
    PropertyAttri.Style = []
    ColorAttri.Background = clWindow
    ColorAttri.Foreground = clMaroon
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clRed
    KeyAttri.Background = clWindow
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindow
    StringAttri.Background = clWindow
    StringAttri.Foreground = clMaroon
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clGray
    TextAttri.Background = clWindow
    TextAttri.Foreground = clBlack
    ValueAttri.Background = clWindow
    UndefPropertyAttri.Background = clWindow
    UndefPropertyAttri.Foreground = clFuchsia
    UndefPropertyAttri.Style = []
    Left = 429
    Top = 210
  end
  object popFileTabs: TSpTBXPopupMenu
    Images = ilToolbar
    Left = 657
    Top = 170
    object TBXItem54: TSpTBXItem
      Action = acClose
    end
    object TBXSeparatorItem14: TSpTBXSeparatorItem
    end
    object TBXItem57: TSpTBXItem
      Action = acEditCopyFilename
    end
  end
  object hlTxt: TSynTextSyn
    DefaultFilter = 'Text Files (*.*;*.txt;*.ini)|*.*;*.txt;*.ini'
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    IdentifierChars = '_0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    Left = 176
    Top = 368
  end
end
