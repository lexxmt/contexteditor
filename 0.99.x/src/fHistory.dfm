object fmHistory: TfmHistory
  Left = 313
  Top = 212
  Align = alClient
  BorderStyle = bsNone
  Caption = 'fmHistory'
  ClientHeight = 335
  ClientWidth = 200
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
  object lv: TListView
    Left = 0
    Top = 26
    Width = 200
    Height = 309
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
    OnStartDrag = lvStartDrag
  end
  object TBXDock1: TSpTBXDock
    Left = 0
    Top = 0
    Width = 200
    Height = 26
    AllowDrag = False
    object TBXToolbar1: TSpTBXToolbar
      Left = 0
      Top = 0
      FullSize = True
      Images = fmMain.ilToolbar
      LinkSubitems = TBXSubmenuItem1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Caption = 'TBXToolbar1'
    end
  end
  object acHistory: TActionList
    Images = fmMain.ilToolbar
    OnUpdate = acHistoryUpdate
    Left = 112
    Top = 50
    object acOpen: TAction
      Caption = 'acOpen'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = acOpenExecute
    end
    object acRemove: TAction
      Caption = 'acRemove'
      ImageIndex = 26
      ShortCut = 46
      OnExecute = acRemoveExecute
    end
    object acRemoveAll: TAction
      ImageIndex = 35
      OnExecute = acRemoveAllExecute
    end
    object acShowPath: TAction
      Caption = 'acShowPath'
      ImageIndex = 29
      OnExecute = acShowPathExecute
    end
  end
  object TBItemContainer1: TTBItemContainer
    Left = 112
    Top = 88
    object TBXSubmenuItem1: TSpTBXSubmenuItem
      object TBXItem3: TSpTBXItem
        Action = acOpen
      end
      object TBXItem2: TSpTBXItem
        Action = acRemove
      end
      object TBXItem1: TSpTBXItem
        Action = acRemoveAll
      end
      object TBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object TBXItem4: TSpTBXItem
        Action = acShowPath
      end
    end
  end
  object TBXPopupMenu1: TSpTBXPopupMenu
    Images = fmMain.ilToolbar
    LinkSubitems = TBXSubmenuItem1
    Left = 72
    Top = 88
  end
end
