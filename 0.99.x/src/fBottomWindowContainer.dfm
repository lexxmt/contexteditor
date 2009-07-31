object fmBottomWindowContainer: TfmBottomWindowContainer
  Left = 272
  Top = 254
  Align = alClient
  BorderStyle = bsNone
  Caption = 'fmBottomWindowContainer'
  ClientHeight = 131
  ClientWidth = 472
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
  object TabSet: TrmTabSet
    Left = 0
    Top = 110
    Width = 472
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabType = ttWin2k
    OnChange = TabSetChange
  end
end
