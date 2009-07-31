object frmProjectFiles: TfrmProjectFiles
  Left = 379
  Top = 284
  Align = alClient
  BorderStyle = bsNone
  Caption = 'frmProjectFiles'
  ClientHeight = 316
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnRelativePath: TPanel
    Left = 0
    Top = 279
    Width = 267
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 54
      Height = 13
      Caption = 'Relative to:'
    end
    object labDir: TDirLabel
      Left = 0
      Top = 20
      Width = 267
      Height = 17
      DirName = 'labDir'
      Align = alBottom
      ShowAccelChar = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 267
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
    object labProjectName: TDirLabel
      Left = 0
      Top = 0
      Width = 267
      Height = 13
      Align = alTop
      ParentShowHint = False
      ShowHint = True
    end
  end
  object lv: TListView
    Left = 0
    Top = 43
    Width = 267
    Height = 236
    Align = alClient
    AllocBy = 10
    Columns = <
      item
        Width = 800
      end>
    DragMode = dmAutomatic
    HideSelection = False
    IconOptions.AutoArrange = True
    MultiSelect = True
    ReadOnly = True
    PopupMenu = TBXPopupMenu1
    ShowColumnHeaders = False
    TabOrder = 2
    ViewStyle = vsReport
    OnCustomDrawItem = lvCustomDrawItem
    OnDblClick = acOpenExecute
    OnDragDrop = lvDragDrop
    OnDragOver = lvDragOver
    OnStartDrag = lvStartDrag
    ExplicitTop = 41
  end
  object TBXDock1: TSpTBXDock
    Left = 0
    Top = 17
    Width = 267
    Height = 26
    AllowDrag = False
    object TBXToolbar1: TSpTBXToolbar
      Left = 0
      Top = 0
      Caption = 'TBXToolbar1'
      FullSize = True
      Images = fmMain.ilToolbar
      LinkSubitems = TBXSubmenuItem1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object acFileExpl: TActionList
    Images = fmMain.ilToolbar
    OnUpdate = acFileExplUpdate
    Left = 176
    Top = 118
    object acOpen: TAction
      ImageIndex = 1
      ShortCut = 13
      OnExecute = acOpenExecute
    end
    object acClose: TAction
      ImageIndex = 4
      OnExecute = acCloseExecute
    end
    object acSetMakeFile: TAction
      ImageIndex = 52
      OnExecute = acSetMakeFileExecute
    end
    object acAdd: TAction
      ImageIndex = 27
      ShortCut = 45
      OnExecute = acAddExecute
    end
    object acAddCurrent: TAction
      ImageIndex = 28
      OnExecute = acAddCurrentExecute
    end
    object acAddAllFiles: TAction
      ImageIndex = 34
      OnExecute = acAddAllFilesExecute
    end
    object acRemove: TAction
      ImageIndex = 26
      ShortCut = 46
      OnExecute = acRemoveExecute
    end
    object acMoveUp: TAction
      ImageIndex = 30
      ShortCut = 16422
      OnExecute = acMoveUpExecute
    end
    object acMoveDown: TAction
      ImageIndex = 33
      ShortCut = 16424
      OnExecute = acMoveDownExecute
    end
    object acShowRelative: TAction
      ImageIndex = 29
      OnExecute = acShowRelativeExecute
    end
  end
  object TBItemContainer1: TTBItemContainer
    Left = 72
    Top = 112
    object TBXSubmenuItem1: TSpTBXSubmenuItem
      object TBXItem3: TSpTBXItem
        Action = acOpen
      end
      object TBXItem2: TSpTBXItem
        Action = acClose
      end
      object TBXItem1: TSpTBXItem
        Action = acSetMakeFile
      end
      object TBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object TBXItem7: TSpTBXItem
        Action = acAdd
      end
      object TBXItem6: TSpTBXItem
        Action = acAddCurrent
      end
      object TBXItem5: TSpTBXItem
        Action = acAddAllFiles
      end
      object TBXItem4: TSpTBXItem
        Action = acRemove
      end
      object TBXSeparatorItem2: TSpTBXSeparatorItem
      end
      object TBXItem9: TSpTBXItem
        Action = acMoveUp
      end
      object TBXItem8: TSpTBXItem
        Action = acMoveDown
      end
      object TBXSeparatorItem3: TSpTBXSeparatorItem
      end
      object TBXItem10: TSpTBXItem
        Action = acShowRelative
      end
    end
  end
  object TBXPopupMenu1: TSpTBXPopupMenu
    Images = fmMain.ilToolbar
    LinkSubitems = TBXSubmenuItem1
    Left = 100
    Top = 156
  end
end
