object fmCTInsert: TfmCTInsert
  Left = 364
  Top = 242
  BorderStyle = bsNone
  Caption = 'fmCTInsert'
  ClientHeight = 87
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultSizeOnly
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbCT: TListBox
    Left = 0
    Top = 0
    Width = 277
    Height = 87
    Style = lbOwnerDrawFixed
    Align = alClient
    Ctl3D = False
    ItemHeight = 16
    ParentCtl3D = False
    TabOrder = 0
    OnDblClick = lbCTDblClick
    OnDrawItem = lbCTDrawItem
    OnKeyDown = lbCTKeyDown
  end
end
