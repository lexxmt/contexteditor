object Form1: TForm1
  Left = 264
  Top = 137
  Width = 658
  Height = 438
  Caption = 'VELVEx Kung Fu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 0
    Height = 299
  end
  object LVEx: TVirtualExplorerListviewEx
    Left = 188
    Top = 0
    Width = 462
    Height = 299
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
    TreeOptions.PaintOptions = [toShowTreeLines, toUseBlendedImages, toGhostedIfUnfocused]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETFolderOptions = [toHideRootFolder]
    TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toShellColumnMenu]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toExecuteOnDblClk]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages, toMarkCutAndCopy]
    OnEnumFolder = LVExEnumFolder
    OnRootChanging = LVExRootChanging
    ColumnMenuItemCount = 8
    ViewStyle = vsxReport
    ThumbsOptions.DetailedHints = False
    ThumbsOptions.CacheOptions.DefaultFilename = 'Thumbnails.Cache'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 388
    Width = 650
    Height = 21
    Panels = <
      item
        Width = 150
      end
      item
        Width = 130
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 100
      end>
    object ProgressBar1: TProgressBar
      Left = 0
      Top = 2
      Width = 150
      Height = 17
      Smooth = True
      TabOrder = 0
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 185
    Height = 299
    Align = alLeft
    Lines.Strings = (
      'Image library:'
      ''
      'Supported formats:')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Memo2: TMemo
    Left = 0
    Top = 299
    Width = 650
    Height = 89
    Align = alBottom
    Color = clInfoBk
    Lines.Strings = (
      
        'This demo shows how fast VELVEx is compared to other thumbnail v' +
        'iewers like ACDSee, IrfanView, etc.'
      
        'LoadAllAtOnce is setted to true, so VELVEx will create all the t' +
        'humbnails available in the directory in one pass, without the ne' +
        'ed '
      'to scroll the files.'
      
        'The Memo on the left shows what image library is used (GraphicEx' +
        ', ImageMagick, ImageEn, Envision, etc.), and what image '
      'formats are supported.'
      
        'To change the image library simply uncomment the corresponding c' +
        'onditional define in the VSToolsAddIns.inc file located in your '
      '[VSTools]\Include  directory.'
      'For more information read the comments in that file.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
end
