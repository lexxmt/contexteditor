object Form1: TForm1
  Left = 139
  Top = 122
  Width = 820
  Height = 596
  Caption = 'Form1'
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
    Left = 249
    Top = 25
    Width = 6
    Height = 537
    ResizeStyle = rsUpdate
  end
  object VET: TVirtualExplorerTree
    Left = 0
    Top = 25
    Width = 249
    Height = 537
    Active = True
    Align = alLeft
    ColumnDetails = cdUser
    ColumnMenuItemCount = 8
    DefaultNodeHeight = 17
    DragHeight = 250
    DragWidth = 150
    FileObjects = [foFolders, foNonFolders, foHidden]
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
    TabOrder = 0
    TabStop = True
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages, toGhostedIfUnfocused]
    TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toExecuteOnDblClk]
    TreeOptions.VETImageOptions = [toImages, toMarkCutAndCopy]
    OnChange = VETChange
    Columns = <>
  end
  object PageControlShellBrowser: TPageControl
    Left = 255
    Top = 25
    Width = 557
    Height = 537
    ActivePage = TabSheetIShellFolder
    Align = alClient
    TabOrder = 1
    object TabSheetIShellFolder: TTabSheet
      Caption = 'IShellFolder'
      object GroupBoxCapabilities: TGroupBox
        Left = 0
        Top = 0
        Width = 549
        Height = 177
        Align = alTop
        Caption = 'Capabilities'
        TabOrder = 0
        object CheckBoxCanCopy: TCheckBox
          Left = 8
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Can Copy'
          TabOrder = 0
        end
        object CheckBoxCanRename: TCheckBox
          Left = 8
          Top = 120
          Width = 97
          Height = 17
          Caption = 'Can Rename'
          TabOrder = 1
        end
        object CheckBoxCanDelete: TCheckBox
          Left = 8
          Top = 56
          Width = 97
          Height = 17
          Caption = 'Can Delete'
          TabOrder = 2
        end
        object CheckBoxHasPropSheet: TCheckBox
          Left = 128
          Top = 104
          Width = 121
          Height = 17
          Caption = 'Has Property Sheet'
          TabOrder = 3
        end
        object CheckBoxCanLink: TCheckBox
          Left = 8
          Top = 72
          Width = 97
          Height = 17
          Caption = 'Can Link'
          TabOrder = 4
        end
        object CheckBoxCanMove: TCheckBox
          Left = 8
          Top = 104
          Width = 97
          Height = 17
          Caption = 'Can Move'
          TabOrder = 5
        end
        object CheckBoxGhosted: TCheckBox
          Left = 128
          Top = 88
          Width = 97
          Height = 17
          Caption = 'Ghosted'
          TabOrder = 6
        end
        object CheckBoxLink: TCheckBox
          Left = 288
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Link (shortcut)'
          TabOrder = 7
        end
        object CheckBoxReadOnly: TCheckBox
          Left = 288
          Top = 88
          Width = 97
          Height = 17
          Caption = 'Read Only'
          TabOrder = 8
        end
        object CheckBoxShared: TCheckBox
          Left = 288
          Top = 120
          Width = 97
          Height = 17
          Caption = 'Shared'
          TabOrder = 9
        end
        object CheckBoxFileSystem: TCheckBox
          Left = 128
          Top = 56
          Width = 97
          Height = 17
          Caption = 'File System'
          TabOrder = 10
        end
        object CheckBoxFileSysAncestor: TCheckBox
          Left = 128
          Top = 40
          Width = 129
          Height = 17
          Caption = 'File System Ancestor'
          TabOrder = 11
        end
        object CheckBoxFolder: TCheckBox
          Left = 128
          Top = 72
          Width = 97
          Height = 17
          Caption = 'Folder'
          TabOrder = 12
        end
        object CheckBoxRemovable: TCheckBox
          Left = 288
          Top = 104
          Width = 97
          Height = 17
          Caption = 'Removable'
          TabOrder = 13
        end
        object CheckBoxHasSubFolders: TCheckBox
          Left = 128
          Top = 120
          Width = 97
          Height = 17
          Caption = 'Has Sub Folders'
          TabOrder = 14
        end
        object CheckBoxBrowsable: TCheckBox
          Left = 8
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Browsable'
          TabOrder = 15
        end
        object CheckBoxCanMoniker: TCheckBox
          Left = 8
          Top = 88
          Width = 97
          Height = 17
          Caption = 'Can Moniker'
          TabOrder = 16
        end
        object CheckBoxCompressed: TCheckBox
          Left = 8
          Top = 136
          Width = 97
          Height = 17
          Caption = 'Compressed'
          TabOrder = 17
        end
        object CheckBoxDropTarget: TCheckBox
          Left = 8
          Top = 152
          Width = 97
          Height = 17
          Caption = 'Drop Target'
          TabOrder = 18
        end
        object CheckBoxEncrypted: TCheckBox
          Left = 128
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Encrypted'
          TabOrder = 19
        end
        object CheckBoxHidden: TCheckBox
          Left = 128
          Top = 136
          Width = 97
          Height = 17
          Caption = 'Hidden'
          TabOrder = 20
        end
        object CheckBoxHasStorage: TCheckBox
          Left = 128
          Top = 152
          Width = 97
          Height = 17
          Caption = 'Has Storage'
          TabOrder = 21
        end
        object CheckBoxIsSlow: TCheckBox
          Left = 288
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Is Slow'
          TabOrder = 22
        end
        object CheckBoxNewContent: TCheckBox
          Left = 288
          Top = 56
          Width = 97
          Height = 17
          Caption = 'New Content'
          TabOrder = 23
        end
        object CheckBoxNonEnumerated: TCheckBox
          Left = 288
          Top = 72
          Width = 97
          Height = 17
          Caption = 'NonEnumerated'
          TabOrder = 24
        end
        object CheckBoxStorage: TCheckBox
          Left = 288
          Top = 136
          Width = 97
          Height = 17
          Caption = 'Storage'
          TabOrder = 25
        end
        object CheckBoxStorageAncestor: TCheckBox
          Left = 288
          Top = 152
          Width = 113
          Height = 17
          Caption = 'Storage Ancestor'
          TabOrder = 26
        end
        object CheckBoxStream: TCheckBox
          Left = 424
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Stream'
          TabOrder = 27
        end
      end
      object GroupBoxInterfaces: TGroupBox
        Left = 0
        Top = 177
        Width = 549
        Height = 104
        Align = alTop
        Caption = 'Interfaces'
        TabOrder = 1
        object CheckBoxIContextMenu: TCheckBox
          Left = 16
          Top = 16
          Width = 97
          Height = 17
          Caption = 'IContextMenu'
          TabOrder = 0
        end
        object CheckBoxIContextMenu2: TCheckBox
          Left = 16
          Top = 32
          Width = 97
          Height = 17
          Caption = 'IContextMenu2'
          TabOrder = 1
        end
        object CheckboxIContextMenu3: TCheckBox
          Left = 16
          Top = 48
          Width = 97
          Height = 17
          Caption = 'IContextMenu3'
          TabOrder = 2
        end
        object CheckboxIExtractImage: TCheckBox
          Left = 16
          Top = 64
          Width = 97
          Height = 17
          Caption = 'IExtractImage'
          TabOrder = 3
        end
        object CheckBoxIExtractImage2: TCheckBox
          Left = 16
          Top = 80
          Width = 97
          Height = 17
          Caption = 'IExtractImage2'
          TabOrder = 4
        end
        object CheckBoxIDataObject: TCheckBox
          Left = 120
          Top = 16
          Width = 97
          Height = 17
          Caption = 'IDataObject'
          TabOrder = 5
        end
        object CheckBoxIDropTarget: TCheckBox
          Left = 120
          Top = 32
          Width = 97
          Height = 17
          Caption = 'IDropTarget'
          TabOrder = 6
        end
        object CheckBoxIExtractIconA: TCheckBox
          Left = 120
          Top = 48
          Width = 97
          Height = 17
          Caption = 'IExtractIconA'
          TabOrder = 7
        end
        object CheckBoxIShellDetails: TCheckBox
          Left = 120
          Top = 80
          Width = 97
          Height = 17
          Caption = 'IShellDetails'
          TabOrder = 8
        end
        object CheckBoxIShellIcon: TCheckBox
          Left = 232
          Top = 16
          Width = 97
          Height = 17
          Caption = 'IShellIcon'
          TabOrder = 9
        end
        object CheckBoxIShellIconOverlay: TCheckBox
          Left = 232
          Top = 32
          Width = 113
          Height = 17
          Caption = 'IShellIconOverlay'
          TabOrder = 10
        end
        object CheckboxIShellLink: TCheckBox
          Left = 232
          Top = 48
          Width = 97
          Height = 17
          Caption = 'IShellLink'
          TabOrder = 11
        end
        object CheckBoxIQueryInfo: TCheckBox
          Left = 232
          Top = 64
          Width = 97
          Height = 17
          Caption = 'IQueryInfo'
          TabOrder = 12
        end
        object CheckBoxIShellFolder2: TCheckBox
          Left = 232
          Top = 80
          Width = 97
          Height = 17
          Caption = 'IShellFolder2'
          TabOrder = 13
        end
        object CheckBoxIExtractIconW: TCheckBox
          Left = 120
          Top = 64
          Width = 97
          Height = 17
          Caption = 'IExtractIconW'
          TabOrder = 14
        end
        object CheckBoxICategoryProvider: TCheckBox
          Left = 344
          Top = 16
          Width = 113
          Height = 17
          Caption = 'ICategoryProvider'
          TabOrder = 15
        end
        object CheckBoxIBrowserFrameOptions: TCheckBox
          Left = 344
          Top = 32
          Width = 137
          Height = 17
          Caption = 'IBrowserFrameOptions'
          TabOrder = 16
        end
        object CheckBoxIQueryAssociations: TCheckBox
          Left = 344
          Top = 48
          Width = 121
          Height = 17
          Caption = 'IQueryAssociations'
          TabOrder = 17
        end
      end
      object GroupBoxNameRelativeToFolder: TGroupBox
        Left = 0
        Top = 281
        Width = 549
        Height = 104
        Align = alTop
        Caption = 'Name Relative To Folder'
        TabOrder = 2
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Normal'
        end
        object Label2: TLabel
          Left = 16
          Top = 32
          Width = 35
          Height = 13
          Caption = 'Parsing'
        end
        object Label3: TLabel
          Left = 16
          Top = 48
          Width = 55
          Height = 13
          Caption = 'Addressbar'
        end
        object Label4: TLabel
          Left = 16
          Top = 64
          Width = 93
          Height = 13
          Caption = 'Parsing Addressbar'
        end
        object Label5: TLabel
          Left = 16
          Top = 80
          Width = 32
          Height = 13
          Caption = 'Editing'
        end
        object LabelNameFolderNormal: TLabel
          Left = 120
          Top = 16
          Width = 115
          Height = 13
          Caption = 'LabelNameFolderNormal'
        end
        object LabelNameFolderParsing: TLabel
          Left = 120
          Top = 32
          Width = 117
          Height = 13
          Caption = 'LabelNameFolderParsing'
        end
        object LabelNameFolderAddressbar: TLabel
          Left = 120
          Top = 48
          Width = 137
          Height = 13
          Caption = 'LabelNameFolderAddressbar'
        end
        object LabelNameFolderParsingAddressbar: TLabel
          Left = 120
          Top = 64
          Width = 172
          Height = 13
          Caption = 'LabelNameFolderParsingAddressbar'
        end
        object LabelNameFolderEditing: TLabel
          Left = 120
          Top = 80
          Width = 114
          Height = 13
          Caption = 'LabelNameFolderEditing'
        end
      end
      object GroupBoxNameRelativeToDesktop: TGroupBox
        Left = 0
        Top = 385
        Width = 549
        Height = 105
        Align = alTop
        Caption = 'Name Relative To Desktop'
        TabOrder = 3
        object Label6: TLabel
          Left = 16
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Normal'
        end
        object Label7: TLabel
          Left = 16
          Top = 32
          Width = 35
          Height = 13
          Caption = 'Parsing'
        end
        object Label8: TLabel
          Left = 16
          Top = 48
          Width = 55
          Height = 13
          Caption = 'Addressbar'
        end
        object Label9: TLabel
          Left = 16
          Top = 64
          Width = 93
          Height = 13
          Caption = 'Parsing Addressbar'
        end
        object Label10: TLabel
          Left = 16
          Top = 80
          Width = 32
          Height = 13
          Caption = 'Editing'
        end
        object LabelNameDesktopNormal: TLabel
          Left = 120
          Top = 16
          Width = 124
          Height = 13
          Caption = 'LabelNameDesktopNormal'
        end
        object LabelNameDesktopParsing: TLabel
          Left = 120
          Top = 32
          Width = 126
          Height = 13
          Caption = 'LabelNameDesktopParsing'
        end
        object LabelNameDesktopAddressbar: TLabel
          Left = 120
          Top = 48
          Width = 146
          Height = 13
          Caption = 'LabelNameDesktopAddressbar'
        end
        object LabelNameDesktopParsingAddressbar: TLabel
          Left = 120
          Top = 64
          Width = 181
          Height = 13
          Caption = 'LabelNameDesktopParsingAddressbar'
        end
        object LabelNameDesktopEditing: TLabel
          Left = 120
          Top = 80
          Width = 123
          Height = 13
          Caption = 'LabelNameDesktopEditing'
        end
      end
    end
    object TabSheetIcons: TTabSheet
      Caption = 'Icons'
      ImageIndex = 1
      object Label11: TLabel
        Left = 176
        Top = 136
        Width = 117
        Height = 13
        Caption = 'ExtraLarge Image Index'
      end
      object Label12: TLabel
        Left = 176
        Top = 152
        Width = 91
        Height = 13
        Caption = 'Large Image Index'
      end
      object Label13: TLabel
        Left = 176
        Top = 168
        Width = 88
        Height = 13
        Caption = 'Small Image Index'
      end
      object Label14: TLabel
        Left = 176
        Top = 256
        Width = 69
        Height = 13
        Caption = 'Overlay Index'
      end
      object Label17: TLabel
        Left = 176
        Top = 272
        Width = 93
        Height = 13
        Caption = 'Overlay Icon Index'
      end
      object LabelExLargeImageIndex: TLabel
        Left = 344
        Top = 32
        Width = 122
        Height = 13
        Caption = 'LabelExLargeImageIndex'
      end
      object LabelLargeImageIndex: TLabel
        Left = 344
        Top = 48
        Width = 110
        Height = 13
        Caption = 'LabelLargeImageIndex'
      end
      object LabelSmallImageIndex: TLabel
        Left = 344
        Top = 64
        Width = 107
        Height = 13
        Caption = 'LabelSmallImageIndex'
      end
      object LabelExLargeOpenImageIndex: TLabel
        Left = 344
        Top = 136
        Width = 148
        Height = 13
        Caption = 'LabelExLargeOpenImageIndex'
      end
      object LabelLargeOpenImageIndex: TLabel
        Left = 344
        Top = 152
        Width = 136
        Height = 13
        Caption = 'LabelLargeOpenImageIndex'
      end
      object LabelSmallOpenImageIndex: TLabel
        Left = 344
        Top = 168
        Width = 133
        Height = 13
        Caption = 'LabelSmallOpenImageIndex'
      end
      object Label26: TLabel
        Left = 176
        Top = 32
        Width = 117
        Height = 13
        Caption = 'ExtraLarge Image Index'
      end
      object Label27: TLabel
        Left = 176
        Top = 48
        Width = 91
        Height = 13
        Caption = 'Large Image Index'
      end
      object Label28: TLabel
        Left = 176
        Top = 64
        Width = 88
        Height = 13
        Caption = 'Small Image Index'
      end
      object LabelOverlayIndex: TLabel
        Left = 344
        Top = 256
        Width = 91
        Height = 13
        Caption = 'LabelOverlayIndex'
      end
      object LabelOverlayIconIndex: TLabel
        Left = 344
        Top = 272
        Width = 112
        Height = 13
        Caption = 'LabelOverlayIconIndex'
      end
      object GroupBoxIconNormal: TGroupBox
        Left = 8
        Top = 8
        Width = 161
        Height = 89
        Caption = 'Normal Icons'
        TabOrder = 0
        object ImageNormalExtraLarge: TImage
          Left = 9
          Top = 25
          Width = 48
          Height = 48
        end
        object ImageNormalLarge: TImage
          Left = 65
          Top = 41
          Width = 32
          Height = 32
        end
        object ImageNormalSmall: TImage
          Left = 105
          Top = 57
          Width = 16
          Height = 16
        end
      end
      object GroupBoxIconsOpen: TGroupBox
        Left = 8
        Top = 112
        Width = 161
        Height = 89
        Caption = 'Open Icons'
        TabOrder = 1
        object ImageOpenExtraLarge: TImage
          Left = 9
          Top = 25
          Width = 48
          Height = 48
        end
        object ImageOpenSmall: TImage
          Left = 105
          Top = 57
          Width = 16
          Height = 16
        end
        object ImageOpenLarge: TImage
          Left = 65
          Top = 41
          Width = 32
          Height = 32
        end
      end
      object GroupBoxIconOverlays: TGroupBox
        Left = 8
        Top = 216
        Width = 161
        Height = 97
        Caption = 'Overlays'
        TabOrder = 2
        object ImageExtraLargeOverlay: TImage
          Left = 9
          Top = 25
          Width = 48
          Height = 48
        end
        object ImageLargeOverlay: TImage
          Left = 65
          Top = 41
          Width = 32
          Height = 32
        end
        object ImageSmallOverlay: TImage
          Left = 105
          Top = 57
          Width = 16
          Height = 16
        end
      end
    end
    object TabSheetColumnDetails: TTabSheet
      Caption = 'Column Details'
      ImageIndex = 2
      DesignSize = (
        549
        509)
      object Label16: TLabel
        Left = 0
        Top = 0
        Width = 549
        Height = 13
        Align = alTop
        Caption = ' '
      end
      object Label15: TLabel
        Left = 16
        Top = 8
        Width = 74
        Height = 13
        Caption = 'Extracted with:'
      end
      object ListViewDetails: TListView
        Left = 8
        Top = 64
        Width = 529
        Height = 432
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object CheckBoxIShellDetailsGetDetailsOf: TCheckBox
        Left = 104
        Top = 24
        Width = 153
        Height = 17
        Caption = 'IShellDetails.GetDetailsOf'
        TabOrder = 1
      end
      object CheckBoxIShellFolder2GetDetailsOf: TCheckBox
        Left = 104
        Top = 8
        Width = 161
        Height = 17
        Caption = 'IShellFolder2.GetDetailsOf'
        TabOrder = 2
      end
      object CheckBoxDefaultGetDetailsOf: TCheckBox
        Left = 104
        Top = 40
        Width = 217
        Height = 17
        Caption = '"Default" Details through other means'
        TabOrder = 3
      end
    end
    object TabSheetExtractImage: TTabSheet
      Caption = 'Images'
      ImageIndex = 3
      object ImageExtractImage: TImage
        Left = 16
        Top = 32
        Width = 250
        Height = 250
      end
      object Label18: TLabel
        Left = 8
        Top = 296
        Width = 90
        Height = 13
        Caption = 'ExtractImage Path'
      end
      object LabelExtractImagePath: TLabel
        Left = 32
        Top = 312
        Width = 112
        Height = 13
        Caption = 'LabelExtractImagePath'
      end
      object CheckBoxExtractImageEnable: TCheckBox
        Left = 296
        Top = 32
        Width = 73
        Height = 17
        Caption = 'Enabled'
        TabOrder = 0
      end
    end
    object TabSheetQueryInfo: TTabSheet
      Caption = 'QueryInfo'
      ImageIndex = 4
      object GroupBoxQueryInfo: TGroupBox
        Left = 0
        Top = 0
        Width = 549
        Height = 113
        Align = alTop
        Caption = 'Query Info'
        TabOrder = 0
        object LabelQueryInfo: TLabel
          Left = 8
          Top = 24
          Width = 75
          Height = 13
          Caption = 'LabelQueryInfo'
        end
      end
    end
    object TabSheetCatagories: TTabSheet
      Caption = 'Catagories'
      ImageIndex = 5
      object Splitter2: TSplitter
        Left = 0
        Top = 273
        Width = 549
        Height = 6
        Cursor = crVSplit
        Align = alTop
        AutoSnap = False
        ResizeStyle = rsUpdate
      end
      object Splitter3: TSplitter
        Left = 0
        Top = 410
        Width = 549
        Height = 6
        Cursor = crVSplit
        Align = alTop
        AutoSnap = False
        ResizeStyle = rsUpdate
      end
      object Splitter4: TSplitter
        Left = 0
        Top = 81
        Width = 549
        Height = 6
        Cursor = crVSplit
        Align = alTop
        ResizeStyle = rsUpdate
      end
      object Panel1: TPanel
        Left = 0
        Top = 87
        Width = 549
        Height = 186
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          549
          186)
        object Label20: TLabel
          Left = 8
          Top = 6
          Width = 135
          Height = 13
          Caption = 'Category Info by Column ID'
        end
        object ListViewCategoriesByColumnID: TListView
          Left = 7
          Top = 24
          Width = 529
          Height = 154
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = 'Column'
            end
            item
              Caption = 'MapColumnToSCID - fmtid'
              Width = 250
            end
            item
              Caption = 'MapColumnToSCID - pid'
              Width = 150
            end
            item
              Caption = 'CanCategorizeOnSCID'
              Width = 100
            end
            item
              Caption = 'CategoryForSCID'
              Width = 250
            end
            item
              Caption = 'GetCategoryName'
              Width = 200
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 279
        Width = 549
        Height = 131
        Align = alTop
        TabOrder = 1
        DesignSize = (
          549
          131)
        object Label21: TLabel
          Left = 8
          Top = 4
          Width = 115
          Height = 13
          Caption = 'Standard Category Info'
        end
        object ListViewStandardCategories: TListView
          Left = 8
          Top = 22
          Width = 529
          Height = 97
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = 'Standard Category'
              Width = 110
            end
            item
              Caption = 'Category GUID'
              Width = 250
            end
            item
              Caption = 'GetCategoryName'
              Width = 160
            end
            item
              Caption = 'Categorizer.GetDescription'
              Width = 250
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 416
        Width = 549
        Height = 93
        Align = alClient
        TabOrder = 2
        DesignSize = (
          549
          93)
        object Label19: TLabel
          Left = 8
          Top = 4
          Width = 146
          Height = 13
          Caption = 'Category Info by Enumeration'
        end
        object ListViewCategoryByEnum: TListView
          Left = 8
          Top = 20
          Width = 529
          Height = 61
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = 'Category GUID'
              Width = 250
            end
            item
              Caption = 'GetCategoryName'
              Width = 250
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 549
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        DesignSize = (
          549
          81)
        object Label22: TLabel
          Left = 8
          Top = 0
          Width = 83
          Height = 13
          Caption = 'Default Category'
        end
        object ListviewDefaultCategory: TListView
          Left = 7
          Top = 16
          Width = 529
          Height = 65
          Anchors = [akLeft, akTop, akRight, akBottom]
          Columns = <
            item
              Caption = 'MapColumnToSCID - fmtid'
              Width = 250
            end
            item
              Caption = 'MapColumnToSCID - pid'
              Width = 150
            end
            item
              Caption = 'CanCategorizeOnSCID'
              Width = 100
            end
            item
              Caption = 'CategoryForSCID'
              Width = 250
            end
            item
              Caption = 'GetCategoryName'
              Width = 200
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 25
    Align = alTop
    TabOrder = 2
    object CheckBoxThreadedImages: TCheckBox
      Left = 8
      Top = 4
      Width = 113
      Height = 17
      Caption = 'Threaded Images'
      TabOrder = 0
      OnClick = CheckBoxThreadedImagesClick
    end
  end
  object XPManifest1: TXPManifest
    Left = 184
    Top = 8
  end
end
