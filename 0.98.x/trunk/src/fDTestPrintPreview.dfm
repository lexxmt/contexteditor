object fmPrnPreview: TfmPrnPreview
  Left = 471
  Top = 152
  Width = 764
  Height = 459
  Caption = 'Print Preview'
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 411
    Width = 756
    Height = 19
    Panels = <
      item
        Width = 400
      end>
  end
  object SynEditPrintPreview: TSynEditPrintPreview
    Left = 0
    Top = 26
    Width = 756
    Height = 385
    ScaleMode = pscWholePage
    OnMouseDown = SynEditPrintPreviewMouseDown
    OnPreviewPage = SynEditPrintPreviewPreviewPage
  end
  object TBXDock1: TTBXDock
    Left = 0
    Top = 0
    Width = 756
    Height = 26
    AllowDrag = False
    object TBXToolbar1: TTBXToolbar
      Left = 0
      Top = 0
      Caption = 'TBXToolbar1'
      FullSize = True
      Images = fmMain.ilToolbar
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TBXItem4: TTBXItem
        Action = acFirst
      end
      object TBXItem3: TTBXItem
        Action = acPrev
      end
      object TBXItem2: TTBXItem
        Action = acNext
      end
      object TBXItem1: TTBXItem
        Action = acLast
      end
      object TBXSeparatorItem1: TTBXSeparatorItem
      end
      object TBXSubmenuItem1: TTBXSubmenuItem
        Action = acZoom
        DropdownCombo = True
        LinkSubitems = TBXSubmenuItem2
        Options = [tboDropdownArrow]
      end
      object TBXSeparatorItem2: TTBXSeparatorItem
      end
      object TBXItem5: TTBXItem
        Action = acPrint
      end
      object TBXSeparatorItem3: TTBXSeparatorItem
      end
      object TBXItem6: TTBXItem
        Action = acClose
      end
    end
  end
  object ActionList1: TActionList
    Images = fmMain.ilToolbar
    Left = 72
    Top = 84
    object acFirst: TAction
      Caption = 'acFirst'
      ImageIndex = 38
      ShortCut = 36
      OnExecute = FirstCmdExecute
    end
    object acPrev: TAction
      Caption = 'acPrev'
      ImageIndex = 37
      ShortCut = 33
      OnExecute = PrevCmdExecute
    end
    object acNext: TAction
      Caption = 'acNext'
      ImageIndex = 40
      ShortCut = 34
      OnExecute = NextCmdExecute
    end
    object acLast: TAction
      Caption = 'acLast'
      ImageIndex = 39
      ShortCut = 35
      OnExecute = LastCmdExecute
    end
    object acZoom: TAction
      Caption = 'acZoom'
      ImageIndex = 42
      OnExecute = ZoomCmdExecute
    end
    object acPrint: TAction
      Caption = 'acPrint'
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = PrintCmdExecute
    end
    object acClose: TAction
      Caption = 'Close'
      ImageIndex = 4
      ShortCut = 27
      OnExecute = CloseCmdExecute
    end
    object acWholePage: TAction
      Caption = 'Whole Page'
      OnExecute = acWholePageExecute
    end
    object acPageWidth: TAction
      Caption = 'Page Width'
      OnExecute = acPageWidthExecute
    end
    object acZoom25: TAction
      Caption = '25%'
      OnExecute = acZoom25Execute
    end
    object acZoom50: TAction
      Caption = '50%'
      OnExecute = acZoom50Execute
    end
    object acZoom100: TAction
      Caption = '100%'
      OnExecute = acZoom100Execute
    end
    object acZoom200: TAction
      Caption = '200%'
      OnExecute = acZoom200Execute
    end
    object acZoom400: TAction
      Caption = '400%'
      OnExecute = acZoom400Execute
    end
  end
  object TBItemContainer1: TTBItemContainer
    Left = 104
    Top = 84
    object TBXSubmenuItem2: TTBXSubmenuItem
      object TBXItem8: TTBXItem
        Action = acWholePage
      end
      object TBXItem7: TTBXItem
        Action = acPageWidth
      end
      object TBXSeparatorItem4: TTBXSeparatorItem
      end
      object TBXItem13: TTBXItem
        Action = acZoom25
      end
      object TBXItem12: TTBXItem
        Action = acZoom50
      end
      object TBXItem11: TTBXItem
        Action = acZoom100
      end
      object TBXItem10: TTBXItem
        Action = acZoom200
      end
      object TBXItem9: TTBXItem
        Action = acZoom400
      end
    end
  end
end
