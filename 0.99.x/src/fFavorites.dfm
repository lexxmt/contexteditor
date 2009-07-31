object fmFavorites: TfmFavorites
  Left = 306
  Top = 283
  Align = alClient
  BorderStyle = bsNone
  Caption = 'fmFavorites'
  ClientHeight = 365
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lv: TListView
    Left = 0
    Top = 26
    Width = 225
    Height = 339
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
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = acOpenExecute
    OnDragDrop = lvDragDrop
    OnDragOver = lvDragOver
    OnStartDrag = lvStartDrag
  end
  object TBXDock1: TSpTBXDock
    Left = 0
    Top = 0
    Width = 225
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
    Left = 112
    Top = 50
    object acOpen: TAction
      ImageIndex = 1
      ShortCut = 13
      OnExecute = acOpenExecute
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
    object acAddAll: TAction
      Caption = 'acAddAll'
      ImageIndex = 34
      OnExecute = acAddAllExecute
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
    object acShowPath: TAction
      ImageIndex = 29
      OnExecute = acShowPathExecute
    end
  end
  object TBXPopupMenu1: TSpTBXPopupMenu
    Images = fmMain.ilToolbar
    LinkSubitems = TBXSubmenuItem1
    Left = 48
    Top = 120
  end
  object TBItemContainer1: TTBItemContainer
    Left = 112
    Top = 120
    object TBXSubmenuItem1: TSpTBXSubmenuItem
      object TBXItem5: TSpTBXItem
        Action = acOpen
      end
      object TBXItem4: TSpTBXItem
        Action = acAdd
      end
      object TBXItem2: TSpTBXItem
        Action = acAddCurrent
      end
      object TBXItem3: TSpTBXItem
        Action = acAddAll
      end
      object TBXItem1: TSpTBXItem
        Action = acRemove
      end
      object TBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object TBXItem7: TSpTBXItem
        Action = acMoveUp
      end
      object TBXItem6: TSpTBXItem
        Action = acMoveDown
      end
      object TBXSeparatorItem2: TSpTBXSeparatorItem
      end
      object TBXItem8: TSpTBXItem
        Action = acShowPath
      end
    end
  end
end
