object Form1: TForm1
  Left = 267
  Top = 198
  Width = 710
  Height = 464
  ActiveControl = Button3
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object VET: TVirtualExplorerTreeview
    Left = 0
    Top = 0
    Width = 313
    Height = 281
    Active = False
    Align = alLeft
    ColumnDetails = cdUser
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
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    HintAnimation = hatNone
    HintMode = hmHint
    ParentColor = False
    RootFolder = rfDesktop
    TabOrder = 0
    TabStop = True
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoTristateTracking]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toEditable, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETShellOptions = [toContextMenus, toDragDrop, toShellColumnMenu]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread, toPersistentColumns]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages]
    OnEnumFolder = VETEnumFolder
    OnInitNode = VETInitNode
    Columns = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 281
    Width = 702
    Height = 149
    Align = alBottom
    TabOrder = 1
    object Panel2: TPanel
      Left = 193
      Top = 1
      Width = 508
      Height = 147
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 5
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 115
        Width = 496
        Height = 26
        Align = alBottom
        Caption = 
          'To convert the check marks to folder paths press Get Paths.  Typ' +
          'e in some valid paths to folders on your system then press Set p' +
          'aths to check the appropriate nodes.'
        WordWrap = True
      end
      object Memo1: TMemo
        Left = 6
        Top = 6
        Width = 496
        Height = 75
        Align = alTop
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Button1: TButton
        Left = 304
        Top = 88
        Width = 203
        Height = 25
        Caption = 'Set Paths'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 32
        Top = 88
        Width = 121
        Height = 25
        Caption = 'Get All Checked Paths'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button6: TButton
        Left = 168
        Top = 88
        Width = 123
        Height = 25
        Caption = 'Get Resolved Paths'
        TabOrder = 3
        OnClick = Button6Click
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 192
      Height = 147
      Align = alLeft
      BevelOuter = bvLowered
      BorderWidth = 5
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 76
        Width = 180
        Height = 65
        Align = alBottom
        Caption = 
          'Check some nodes and press Write To File, the current state of t' +
          'he checks will be written to disk.  Close the application, reope' +
          'n and press Read From File to restore the checks.'
        WordWrap = True
      end
      object Button4: TButton
        Left = 8
        Top = 8
        Width = 177
        Height = 25
        Caption = 'Write States To File'
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 8
        Top = 40
        Width = 177
        Height = 25
        Caption = 'Read State From File'
        TabOrder = 1
        OnClick = Button5Click
      end
    end
  end
  object VET1: TVirtualExplorerTree
    Left = 409
    Top = 0
    Width = 293
    Height = 281
    Active = False
    Align = alClient
    ColumnDetails = cdUser
    ColumnMenuItemCount = 8
    DefaultNodeHeight = 17
    DragHeight = 250
    DragWidth = 150
    FileSizeFormat = fsfExplorer
    FileSort = fsFileType
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = [hoColumnResize, hoDrag]
    HintAnimation = hatNone
    HintMode = hmHint
    ParentColor = False
    RootFolder = rfDesktop
    TabOrder = 2
    TabStop = True
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages]
    TreeOptions.VETShellOptions = [toContextMenus]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toExecuteOnDblClk]
    TreeOptions.VETImageOptions = [toImages]
    OnInitNode = VET1InitNode
    Columns = <>
  end
  object Panel4: TPanel
    Left = 313
    Top = 0
    Width = 96
    Height = 281
    Align = alLeft
    TabOrder = 3
    object Button3: TButton
      Left = 12
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Copy State ->'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button7: TButton
      Left = 8
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Button7'
      TabOrder = 1
    end
  end
end
