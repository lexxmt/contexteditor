object Form1: TForm1
  Left = 255
  Top = 135
  Width = 696
  Height = 519
  Caption = 'VELVEx ClientDataset demo'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 490
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Tree'
      object Splitter1: TSplitter
        Left = 200
        Top = 33
        Height = 340
      end
      object VET: TVirtualExplorerTreeview
        Left = 0
        Top = 33
        Width = 200
        Height = 340
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
        TabOrder = 0
        TabStop = True
        TreeOptions.AutoOptions = [toAutoScroll]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
        TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages, toGhostedIfUnfocused]
        TreeOptions.SelectionOptions = [toMultiSelect, toSiblingSelectConstraint]
        TreeOptions.VETShellOptions = [toContextMenus]
        TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
        TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toBrowseExecuteZipFolder, toChangeNotifierThread, toRemoveContextMenuShortCut]
        TreeOptions.VETImageOptions = [toImages, toThreadedImages, toMarkCutAndCopy]
        VirtualExplorerListview = LVEx
        Columns = <>
      end
      object LVEx: TVirtualExplorerListviewEx
        Left = 203
        Top = 33
        Width = 477
        Height = 340
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
        TabOrder = 1
        TabStop = True
        TreeOptions.AutoOptions = [toAutoScroll]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toReportMode, toToggleOnDblClick]
        TreeOptions.PaintOptions = [toShowTreeLines, toUseBlendedImages, toGhostedIfUnfocused]
        TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
        TreeOptions.VETFolderOptions = [toHideRootFolder]
        TreeOptions.VETShellOptions = [toRightAlignSizeColumn, toContextMenus, toShellColumnMenu]
        TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
        TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toBrowseExecuteZipFolder, toChangeNotifierThread, toExecuteOnDblClk]
        TreeOptions.VETImageOptions = [toImages, toThreadedImages, toMarkCutAndCopy]
        ColumnMenuItemCount = 8
        VirtualExplorerTreeview = VET
        ViewStyle = vsxReport
        ThumbsOptions.CacheOptions.DefaultFilename = 'Thumbnails.Cache'
        ThumbsOptions.CacheOptions.StorageType = tcsPerFolder
        OnThumbsCacheItemAdd = LVExThumbsCacheItemAdd
        OnThumbsCacheLoad = LVExThumbsCacheLoad
        OnThumbsCacheSave = LVExThumbsCacheSave
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object ComboBox1: TComboBox
          Left = 8
          Top = 5
          Width = 145
          Height = 21
          Style = csDropDownList
          BiDiMode = bdLeftToRight
          ItemHeight = 13
          ItemIndex = 3
          ParentBiDiMode = False
          TabOrder = 0
          Text = 'vsxReport'
          OnClick = ComboBox1Click
          Items.Strings = (
            'vsxIcon'
            'vsxSmallIcon'
            'vsxList'
            'vsxReport'
            'vsxThumbs')
        end
      end
      object Memo1: TMemo
        Left = 0
        Top = 373
        Width = 680
        Height = 89
        Align = alBottom
        Color = clInfoBk
        Lines.Strings = (
          
            'This demo shows how to use an external database to store the thu' +
            'mbnails and file items data.'
          
            'In this case the database is an UTF8 XML ClientDataset that has ' +
            'all the required fields: Filename, Thumbnail, etc.'
          
            'The database is filled in the OnCacheItemAdd event every time a ' +
            'thumbnail is created by the internal cache.'
          
            'When the browsing directory is changed in the VELVEx control the' +
            ' internal cache system is filled with the database items, this i' +
            's done '
          'in the OnCacheLoad event.'
          
            'OnCacheSave event is used to stop the internal cache from saving' +
            ' itself.')
        ScrollBars = ssVertical
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Database'
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 253
        Width = 680
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel3: TPanel
        Left = 0
        Top = 256
        Width = 680
        Height = 206
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          680
          206)
        object Label1: TLabel
          Left = 336
          Top = 104
          Width = 18
          Height = 13
          Caption = 'Exif'
        end
        object Label2: TLabel
          Left = 152
          Top = 104
          Width = 50
          Height = 13
          Caption = 'Comments'
        end
        object Label3: TLabel
          Left = 336
          Top = 83
          Width = 52
          Height = 13
          Caption = 'Image Size'
        end
        object Label4: TLabel
          Left = 463
          Top = 83
          Width = 6
          Height = 13
          Caption = 'X'
        end
        object Label5: TLabel
          Left = 152
          Top = 58
          Width = 42
          Height = 13
          Caption = 'Filename'
        end
        object Label6: TLabel
          Left = 152
          Top = 82
          Width = 45
          Height = 13
          Caption = 'DateTime'
        end
        object Label7: TLabel
          Left = 8
          Top = 40
          Width = 48
          Height = 13
          Caption = 'Thumbnail'
        end
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 230
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBMemo1: TDBMemo
          Left = 336
          Top = 120
          Width = 337
          Height = 81
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Exif'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBMemo2: TDBMemo
          Left = 152
          Top = 120
          Width = 177
          Height = 81
          DataField = 'Comments'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit1: TDBEdit
          Left = 208
          Top = 56
          Width = 465
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Filename'
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit2: TDBEdit
          Left = 208
          Top = 80
          Width = 121
          Height = 21
          DataField = 'DateTime'
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 392
          Top = 80
          Width = 65
          Height = 21
          DataField = 'ImageWidth'
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit4: TDBEdit
          Left = 475
          Top = 80
          Width = 65
          Height = 21
          DataField = 'ImageHeight'
          DataSource = DataSource1
          TabOrder = 6
        end
        object Button1: TButton
          Left = 248
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 7
          OnClick = Button1Click
        end
        object Panel2: TPanel
          Left = 8
          Top = 56
          Width = 137
          Height = 145
          TabOrder = 8
          object Image1: TImage
            Left = 1
            Top = 1
            Width = 135
            Height = 143
            Align = alClient
            Center = True
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 253
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Shell Dlg 2'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Filename'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateTime'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Thumbnail'
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 184
    Top = 24
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Filename'
        DataType = ftWideString
        Size = 500
      end
      item
        Name = 'Thumbnail'
        DataType = ftGraphic
      end
      item
        Name = 'DateTime'
        DataType = ftDateTime
      end
      item
        Name = 'ImageWidth'
        DataType = ftInteger
      end
      item
        Name = 'ImageHeight'
        DataType = ftInteger
      end
      item
        Name = 'Comments'
        DataType = ftWideString
        Size = 300
      end
      item
        Name = 'Exif'
        DataType = ftWideString
        Size = 300
      end>
    IndexDefs = <
      item
        Name = 'ClientDataSet1Index1'
        Fields = 'Filename'
        Options = [ixPrimary, ixUnique, ixCaseInsensitive]
      end>
    IndexName = 'ClientDataSet1Index1'
    Params = <>
    StoreDefs = True
    AfterScroll = ClientDataSet1AfterScroll
    Left = 224
    Top = 24
    object ClientDataSet1Filename: TWideStringField
      DisplayWidth = 100
      FieldName = 'Filename'
      Size = 500
    end
    object ClientDataSet1DateTime: TDateTimeField
      FieldName = 'DateTime'
    end
    object ClientDataSet1ImageWidth: TIntegerField
      FieldName = 'ImageWidth'
    end
    object ClientDataSet1ImageHeight: TIntegerField
      FieldName = 'ImageHeight'
    end
    object ClientDataSet1Thumbnail: TGraphicField
      FieldName = 'Thumbnail'
      BlobType = ftGraphic
    end
    object ClientDataSet1Comments: TWideStringField
      DisplayWidth = 100
      FieldName = 'Comments'
      Size = 250
    end
    object ClientDataSet1Exif: TWideStringField
      DisplayWidth = 100
      FieldName = 'Exif'
      Size = 300
    end
  end
end
