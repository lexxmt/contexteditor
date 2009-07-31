object fmFileTree: TfmFileTree
  Left = 302
  Top = 192
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'fmFileTree'
  ClientHeight = 327
  ClientWidth = 290
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 17
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWindow
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      288
      15)
    object btnClose: TSpeedButton
      Left = 275
      Top = 1
      Width = 12
      Height = 12
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        5A000000424D5A000000000000003E0000002800000008000000070000000100
        0100000000001C0000000000000000000000020000000200000000000000FFFF
        FF00FF00000099000000C3000000E7000000C300000099000000FF000000}
      OnClick = FormDeactivate
    end
  end
  object tree: TVirtualExplorerTreeview
    Left = 0
    Top = 17
    Width = 290
    Height = 310
    Active = True
    Align = alClient
    ColumnDetails = cdUser
    Ctl3D = False
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
    ParentCtl3D = False
    RootFolder = rfDesktop
    TabOrder = 1
    TabStop = True
    TreeOptions.AutoOptions = [toAutoScroll]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toEditable, toToggleOnDblClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowTreeLines, toUseBlendedImages, toGhostedIfUnfocused]
    TreeOptions.SelectionOptions = [toMultiSelect, toSiblingSelectConstraint]
    TreeOptions.VETShellOptions = [toContextMenus]
    TreeOptions.VETSyncOptions = [toCollapseTargetFirst, toExpandTarget, toSelectTarget]
    TreeOptions.VETMiscOptions = [toBrowseExecuteFolder, toBrowseExecuteFolderShortcut, toBrowseExecuteZipFolder, toRemoveContextMenuShortCut]
    TreeOptions.VETImageOptions = [toImages, toThreadedImages, toMarkCutAndCopy]
    Columns = <>
  end
end
