inherited fmBottomWindowOutputConsole: TfmBottomWindowOutputConsole
  Left = 379
  Top = 175
  Caption = 'Output Console'
  OldCreateOrder = True
  ExplicitWidth = 497
  ExplicitHeight = 102
  PixelsPerInch = 96
  TextHeight = 13
  object lb: THScrollListBox [0]
    Left = 0
    Top = 0
    Width = 497
    Height = 102
    Align = alClient
    ItemHeight = 13
    PopupMenu = popDefault
    TabOrder = 1
    OnDblClick = acJumpToLineExecute
    OnMouseDown = OnMouseDownEvent
  end
  object btnTerminate: TButton [1]
    Left = 400
    Top = 4
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Terminate'
    TabOrder = 0
    Visible = False
    OnClick = btnTerminateClick
  end
  inherited alDefault: TActionList
    inherited acJumpToLine: TAction
      ShortCut = 13
    end
    inherited acCopyToClipboard: TAction
      ShortCut = 16451
    end
    inherited acClose: TAction
      ShortCut = 27
    end
    object acSetFont: TAction
      Caption = 'Se&t Font'
      OnExecute = acSetFontExecute
    end
  end
  inherited popDefault: TTBXPopupMenu
    object TBXSeparatorItem3: TTBXSeparatorItem [5]
    end
    object TBXItem6: TTBXItem [6]
      Action = acSetFont
    end
  end
end
