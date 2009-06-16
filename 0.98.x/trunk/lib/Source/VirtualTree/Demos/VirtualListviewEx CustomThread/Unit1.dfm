object Form1: TForm1
  Left = 266
  Top = 138
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 200
    Top = 33
    Height = 418
  end
  object LVEx: TVirtualExplorerListviewEx
    Left = 203
    Top = 33
    Width = 485
    Height = 418
    Active = False
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
    HintMode = hmHint
    Indent = 0
    ParentColor = False
    RootFolder = rfDesktop
    TabOrder = 0
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toReportMode, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowTreeLines, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETFolderOptions = [toHideRootFolder]
    TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toShellColumnMenu]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toExecuteOnDblClk]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages]
    ColumnMenuItemCount = 8
    VirtualExplorerTreeview = VET
    ViewStyle = vsxReport
    ThumbsOptions.BorderSize = 10
    ThumbsOptions.Width = 150
    ThumbsOptions.Height = 150
    ThumbsOptions.DetailedHints = False
    ThumbsOptions.CacheOptions.DefaultFilename = 'Thumbnails.Cache'
    ThumbsOptions.CacheOptions.CentralFolder = 'd:\'
    OnThumbThreadClass = LVExThumbThreadClass
  end
  object VET: TVirtualExplorerTreeview
    Left = 0
    Top = 33
    Width = 200
    Height = 418
    Active = False
    Align = alLeft
    ColumnDetails = cdUser
    DefaultNodeHeight = 17
    DragHeight = 250
    DragWidth = 150
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
    HintMode = hmHint
    ParentColor = False
    RootFolder = rfDesktop
    TabOrder = 2
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETShellOptions = [toContextMenus]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toRemoveContextMenuShortCut]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages]
    VirtualExplorerListview = LVEx
    Columns = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 3
    TabOrder = 4
    Text = 'vsxReport'
    OnClick = ComboBox2Click
    Items.Strings = (
      'vsxIcon'
      'vsxSmallIcon'
      'vsxList'
      'vsxReport'
      'vsxThumbs')
  end
end
