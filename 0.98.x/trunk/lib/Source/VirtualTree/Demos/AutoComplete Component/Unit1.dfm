object Form1: TForm1
  Left = 243
  Top = 192
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
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 272
    Top = 16
    Width = 353
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'Select a folder from the VirtualExplorerTree'
    OnDropDown = ComboBox1DropDown
  end
  object CheckBox1: TCheckBox
    Left = 272
    Top = 56
    Width = 201
    Height = 17
    Caption = 'Include Current Directory'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 272
    Top = 72
    Width = 201
    Height = 17
    Caption = 'Include My Computer'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = CheckBox2Click
  end
  object CheckBox3: TCheckBox
    Left = 272
    Top = 88
    Width = 201
    Height = 17
    Caption = 'Include Desktop'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = CheckBox3Click
  end
  object VirtualExplorerTreeview1: TVirtualExplorerTreeview
    Left = 0
    Top = 0
    Width = 257
    Height = 446
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
    RootFolder = rfDesktop
    TabOrder = 4
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toMultiSelect, toRightClickSelect, toSiblingSelectConstraint]
    TreeOptions.VETShellOptions = [toContextMenus]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toChangeNotifierThread]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages]
    Columns = <>
  end
  object CheckBox4: TCheckBox
    Left = 272
    Top = 104
    Width = 201
    Height = 17
    Caption = 'Include Favorites'
    TabOrder = 5
    OnClick = CheckBox4Click
  end
  object CheckBox5: TCheckBox
    Left = 272
    Top = 120
    Width = 201
    Height = 17
    Caption = 'Include Only File System Objects'
    TabOrder = 6
    OnClick = CheckBox5Click
  end
  object CheckBox6: TCheckBox
    Left = 272
    Top = 136
    Width = 201
    Height = 17
    Caption = 'Include File Folders'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = CheckBox6Click
  end
  object CheckBox7: TCheckBox
    Left = 272
    Top = 152
    Width = 201
    Height = 17
    Caption = 'Include Files'
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnClick = CheckBox7Click
  end
  object CheckBox8: TCheckBox
    Left = 272
    Top = 168
    Width = 201
    Height = 17
    Caption = 'Include Hidden Objects'
    TabOrder = 9
    OnClick = CheckBox8Click
  end
  object CheckBox9: TCheckBox
    Left = 272
    Top = 184
    Width = 201
    Height = 17
    Caption = 'Recurse into Sub-Folders'
    TabOrder = 10
    OnClick = CheckBox9Click
  end
  object CheckBox10: TCheckBox
    Left = 272
    Top = 200
    Width = 201
    Height = 17
    Caption = 'Sort List'
    TabOrder = 11
    OnClick = CheckBox10Click
  end
  object VirtualShellAutoComplete1: TVirtualShellAutoComplete
    CurrentDir = ''
    Left = 536
    Top = 56
  end
end
