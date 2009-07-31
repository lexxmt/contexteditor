object fmTextStats: TfmTextStats
  Left = 387
  Top = 260
  BorderStyle = bsDialog
  Caption = 'Statistics'
  ClientHeight = 256
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lvStats: TListView
    Left = 8
    Top = 8
    Width = 517
    Height = 213
    Columns = <
      item
        Width = 300
      end
      item
        Alignment = taRightJustify
        Width = 200
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object btnClose: TButton
    Left = 450
    Top = 226
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCopy: TButton
    Left = 8
    Top = 226
    Width = 121
    Height = 25
    Caption = 'Copy to clipboard'
    TabOrder = 1
    OnClick = btnCopyClick
  end
end
