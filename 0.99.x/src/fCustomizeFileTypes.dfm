object fmCustomizeType: TfmCustomizeType
  Left = 338
  Top = 224
  BorderStyle = bsDialog
  Caption = 'Customize File Types'
  ClientHeight = 274
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labHighlighters: TLabel
    Left = 8
    Top = 12
    Width = 170
    Height = 13
    Caption = '&Highlighters and defined extensions:'
  end
  object lbHL: TListBox
    Left = 8
    Top = 28
    Width = 365
    Height = 209
    Style = lbOwnerDrawFixed
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnDblClick = btnEditClick
    OnDrawItem = lbHLDrawItem
  end
  object btnOK: TButton
    Left = 216
    Top = 244
    Width = 75
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 296
    Top = 244
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnEdit: TButton
    Left = 136
    Top = 244
    Width = 75
    Height = 23
    Caption = '&Edit'
    TabOrder = 1
    OnClick = btnEditClick
  end
end
