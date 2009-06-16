object fmBottomWindowPage: TfmBottomWindowPage
  Left = 309
  Top = 245
  Align = alClient
  BorderStyle = bsNone
  Caption = 'fmBottomWindowPage'
  ClientHeight = 102
  ClientWidth = 497
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
  object alDefault: TActionList
    Images = fmMain.ilToolbar
    OnUpdate = alDefaultUpdate
    Left = 376
    Top = 56
    object acJumpToLine: TAction
      Caption = '&Jump To Line'
      ShortCut = 13
      OnExecute = acJumpToLineExecute
    end
    object acCopyToClipboard: TAction
      Caption = 'C&opy Contents To Clipboard'
      ImageIndex = 8
      ShortCut = 16451
      OnExecute = acCopyToClipboardExecute
    end
    object acCopyLineToClipboard: TAction
      Caption = 'Copy &Selected Line To Clipboard'
      OnExecute = acCopyLineToClipboardExecute
    end
    object acClear: TAction
      Caption = 'C&lear'
      ImageIndex = 26
      OnExecute = acClearExecute
    end
    object acClose: TAction
      Caption = '&Close'
      ImageIndex = 4
      ShortCut = 27
      OnExecute = acCloseExecute
    end
  end
  object popDefault: TTBXPopupMenu
    Images = fmMain.ilToolbar
    Left = 240
    Top = 48
    object TBXItem5: TTBXItem
      Action = acJumpToLine
    end
    object TBXSeparatorItem1: TTBXSeparatorItem
    end
    object TBXItem4: TTBXItem
      Action = acCopyLineToClipboard
    end
    object TBXItem3: TTBXItem
      Action = acCopyToClipboard
    end
    object TBXItem2: TTBXItem
      Action = acClear
    end
    object TBXSeparatorItem2: TTBXSeparatorItem
    end
    object TBXItem1: TTBXItem
      Action = acClose
    end
  end
end
