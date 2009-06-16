inherited fmBottomWindowSearchResults: TfmBottomWindowSearchResults
  Caption = 'fmBottomWindowSearchResults'
  ClientHeight = 135
  ClientWidth = 525
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object bmpMarker: TImage [0]
    Left = 36
    Top = 52
    Width = 7
    Height = 11
    AutoSize = True
    Picture.Data = {
      07544269746D61706A000000424D6A000000000000003E000000280000000700
      00000B00000001000100000000002C0000000000000000000000020000000000
      000000000000FFFFFF00BE0000009E0000008E00000086000000820000008000
      000082000000860000008E0000009E000000BE000000}
    Transparent = True
    Visible = False
  end
  object lbResults: THScrollListBox [1]
    Left = 0
    Top = 0
    Width = 525
    Height = 90
    Style = lbOwnerDrawFixed
    Align = alClient
    ItemHeight = 16
    PopupMenu = popDefault
    TabOrder = 0
    OnDblClick = acJumpToLineExecute
    OnDrawItem = lbResultsDrawItem
    OnMouseDown = lbResultsMouseDown
  end
  object pnProgress: TPanel [2]
    Left = 0
    Top = 90
    Width = 525
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    OnResize = pnProgressResize
    object labSearchingFile: TDirLabel
      Left = 4
      Top = 16
      Width = 441
      Height = 17
    end
    object labMessage: TLabel
      Left = 4
      Top = 2
      Width = 57
      Height = 13
      Caption = 'labMessage'
    end
    object ProgressBar: TProgressBar
      Left = 0
      Top = 33
      Width = 525
      Height = 12
      Align = alBottom
      TabOrder = 0
    end
    object btnStop: TButton
      Left = 452
      Top = 8
      Width = 71
      Height = 23
      Caption = 'Stop'
      TabOrder = 1
      OnClick = btnStopClick
    end
  end
  inherited alDefault: TActionList
    Left = 408
    Top = 28
  end
  inherited popDefault: TTBXPopupMenu
    Left = 372
    Top = 24
  end
end
