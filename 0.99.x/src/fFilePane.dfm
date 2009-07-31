object fmFilePanel: TfmFilePanel
  Left = 332
  Top = 153
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 464
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object tabsFilePane: TrmTabSet
    Left = 0
    Top = 2
    Width = 338
    Height = 21
    Align = alTop
    EdgeWidth = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    StartMargin = 0
    TabType = ttWin2k
    OnChange = tabsFilePaneChange
    OnDragOver = tabsFilePaneDragOver
  end
end
