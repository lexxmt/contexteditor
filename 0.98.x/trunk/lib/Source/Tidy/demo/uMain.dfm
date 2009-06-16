object fMain: TfMain
  Left = 196
  Top = 108
  Width = 640
  Height = 480
  Caption = 'TLibTidy Demo Application [http://www.elsdoerfer.net/delphi]'
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    632
    450)
  PixelsPerInch = 96
  TextHeight = 13
  object mOutput: TMemo
    Left = 308
    Top = 8
    Width = 313
    Height = 265
    Anchors = [akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object mInput: TMemo
    Left = 8
    Top = 8
    Width = 293
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 '
      'Frameset//EN">'
      '<html>'
      '  <head>'
      '    <title></title>'
      '    <meta name="generator" content="OpenWebBuilder; '
      'http://www.openwebbuilder.org">'
      '  </head>'
      ''
      '  <body>'
      ''
      '  </body>'
      '</html>')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 416
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Load File'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 541
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Tidy!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object mMessages: TMemo
    Left = 308
    Top = 280
    Width = 313
    Height = 129
    Anchors = [akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object OpenDialog: TOpenDialog
    Filter = 'All files(*.*)|*.*'
    Left = 120
    Top = 416
  end
end
