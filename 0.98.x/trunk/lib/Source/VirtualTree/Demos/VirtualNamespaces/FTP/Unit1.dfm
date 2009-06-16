object Form1: TForm1
  Left = 179
  Top = 196
  Width = 747
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 273
    Top = 41
    Height = 316
  end
  object VirtualExplorerListview1: TVirtualExplorerListview
    Left = 276
    Top = 41
    Width = 463
    Height = 316
    Active = True
    Align = alClient
    ColumnDetails = cdShellColumns
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
    Header.Options = [hoColumnResize, hoDblClickResize, hoDrag, hoShowSortGlyphs, hoVisible]
    HintAnimation = hatNone
    HintMode = hmHint
    Indent = 0
    ParentColor = False
    ParentShowHint = False
    RootFolder = rfDesktop
    ShowHint = True
    TabOrder = 0
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toReportMode, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowTreeLines, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETFolderOptions = [toHideRootFolder]
    TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toDragDrop, toShellColumnMenu]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toExecuteOnDblClk]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages]
    OnInitNode = VirtualExplorerListview1InitNode
    ColumnMenuItemCount = 8
    VirtualExplorerTreeview = VirtualExplorerTreeview1
  end
  object VirtualExplorerTreeview1: TVirtualExplorerTreeview
    Left = 0
    Top = 41
    Width = 273
    Height = 316
    Active = True
    Align = alLeft
    ColumnDetails = cdUser
    DefaultNodeHeight = 17
    DragHeight = 250
    DragWidth = 150
    FileObjects = [foFolders, foHidden]
    FileSizeFormat = fsfExplorer
    FileSort = fsFileType
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Shell Dlg 2'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    HintAnimation = hatNone
    HintMode = hmHint
    ParentColor = False
    ParentShowHint = False
    RootFolder = rfDesktop
    ShowHint = True
    TabOrder = 1
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETShellOptions = [toContextMenus, toDragDrop]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toNoRebuildIconListOnAssocChange, toPersistentColumns]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages]
    OnInitNode = VirtualExplorerTreeview1InitNode
    VirtualExplorerListview = VirtualExplorerListview1
    Columns = <>
  end
  object Memo1: TMemo
    Left = 0
    Top = 357
    Width = 739
    Height = 89
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 41
    Align = alTop
    TabOrder = 3
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Quick Jump...'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
