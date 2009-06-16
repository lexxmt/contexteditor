object MainForm: TMainForm
  Left = 189
  Top = 99
  Width = 835
  Height = 474
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 377
    Top = 0
    Width = 4
    Height = 401
    Cursor = crHSplit
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 401
    Width = 827
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object pnlB: TPanel
    Left = 381
    Top = 0
    Width = 446
    Height = 401
    Align = alClient
    TabOrder = 1
    object VetB: TVirtualExplorerTree
      Left = 16
      Top = 248
      Width = 401
      Height = 153
      Active = True
      ColumnDetails = cdUser
      ColumnMenuItemCount = 8
      DefaultNodeHeight = 17
      DragHeight = 250
      DragWidth = 150
      FileObjects = [foFolders, foNonFolders]
      FileSizeFormat = fsfExplorer
      FileSort = fsFileType
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Shell Dlg 2'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoColumnResize, hoDrag]
      HintMode = hmHint
      ParentColor = False
      RootFolder = rfDesktop
      TabOrder = 0
      TabStop = True
      TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages]
      TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
      TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toDragDrop]
      TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
      TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toExecuteOnDblClk]
      TreeOptions.VETImageOptions = [toImages]
      OnEnumFolder = VetEnumFolder
      OnInitNode = InitNode
      OnPaintText = PaintText
      OnShellExecute = ShellExecute
      Columns = <>
    end
    object Listview: TVirtualExplorerListview
      Left = 22
      Top = 24
      Width = 403
      Height = 209
      Active = True
      ColumnDetails = cdShellColumns
      DefaultNodeHeight = 17
      DragHeight = 250
      DragWidth = 150
      FileObjects = [foFolders, foNonFolders]
      FileSizeFormat = fsfExplorer
      FileSort = fsFileType
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Shell Dlg 2'
      Header.Font.Style = []
      Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoDrag, hoShowSortGlyphs, hoVisible]
      HintAnimation = hatNone
      HintMode = hmHint
      Indent = 0
      ParentColor = False
      ParentShowHint = False
      RootFolder = rfDesktop
      ShowHint = True
      TabOrder = 1
      TabStop = True
      TreeOptions.AutoOptions = [toAutoScroll]
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toReportMode, toToggleOnDblClick]
      TreeOptions.PaintOptions = [toShowTreeLines, toUseBlendedImages]
      TreeOptions.SelectionOptions = [toExtendedFocus, toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
      TreeOptions.VETFolderOptions = [toFoldersExpandable, toHideRootFolder, toForceHideRecycleBin]
      TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toDragDrop, toShellColumnMenu]
      TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
      TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toExecuteOnDblClk]
      TreeOptions.VETImageOptions = [toImages, toThreadedImages]
      OnEnumFolder = VetEnumFolder
      OnPaintText = PaintText
      OnShellExecute = ShellExecute
      ColumnMenuItemCount = 8
      VirtualExplorerTreeview = TreeView
    end
  end
  object pnlA: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 401
    Align = alLeft
    TabOrder = 2
    object TreeView: TVirtualExplorerTreeview
      Left = 17
      Top = 24
      Width = 336
      Height = 193
      Active = True
      ColumnDetails = cdUser
      DefaultNodeHeight = 17
      DragHeight = 250
      DragWidth = 150
      FileObjects = [foFolders, foNonFolders, foHidden]
      FileSizeFormat = fsfExplorer
      FileSort = fsFileType
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Shell Dlg 2'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoColumnResize, hoDrag]
      HintMode = hmHint
      ParentColor = False
      RootFolder = rfDesktop
      TabOrder = 0
      TabStop = True
      TreeOptions.AutoOptions = [toAutoScroll]
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
      TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages]
      TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
      TreeOptions.VETShellOptions = [toContextMenus, toDragDrop]
      TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
      TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread]
      TreeOptions.VETImageOptions = [toImages, toThreadedImages]
      OnEnumFolder = TreeViewEnumFolder
      OnInitNode = InitNode
      OnPaintText = PaintText
      VirtualExplorerListview = Listview
      Columns = <>
    end
    object VetA: TVirtualExplorerTree
      Left = 16
      Top = 240
      Width = 337
      Height = 153
      Active = True
      ColumnDetails = cdUser
      ColumnMenuItemCount = 8
      DefaultNodeHeight = 17
      DragHeight = 250
      DragWidth = 150
      FileObjects = [foFolders, foNonFolders]
      FileSizeFormat = fsfExplorer
      FileSort = fsFileType
      Header.AutoSizeIndex = -1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Shell Dlg 2'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = [hoColumnResize, hoDrag]
      HintMode = hmHint
      ParentColor = False
      RootFolder = rfDesktop
      TabOrder = 1
      TabStop = True
      TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
      TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages]
      TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
      TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toDragDrop, toShellHints, toShellColumnMenu]
      TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
      TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toExecuteOnDblClk, toRightButtonSelect]
      TreeOptions.VETImageOptions = [toImages]
      OnEnumFolder = VetEnumFolder
      OnInitNode = InitNode
      OnPaintText = PaintText
      OnShellExecute = ShellExecute
      Columns = <>
    end
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 136
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object est1: TMenuItem
      Caption = 'Switch View'
      object mnuView1: TMenuItem
        AutoCheck = True
        Caption = 'Treeview and Listview'
        Checked = True
        RadioItem = True
        OnClick = mnuView1Click
      end
      object mnuView2: TMenuItem
        AutoCheck = True
        Caption = 'Two VETs'
        RadioItem = True
        OnClick = mnuView2Click
      end
    end
  end
end
