object fmMacroStartRecording: TfmMacroStartRecording
  Left = 333
  Top = 241
  BorderStyle = bsDialog
  Caption = 'Start Macro Recording'
  ClientHeight = 99
  ClientWidth = 312
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labName: TLabel
    Left = 8
    Top = 12
    Width = 31
    Height = 13
    Caption = '&Name:'
    FocusControl = eName
  end
  object labHotkey: TLabel
    Left = 8
    Top = 40
    Width = 37
    Height = 13
    Caption = '&Hotkey:'
    FocusControl = hkMacro
  end
  object Bevel1: TBevel
    Left = 8
    Top = 63
    Width = 297
    Height = 8
    Shape = bsTopLine
  end
  object eName: TEdit
    Left = 52
    Top = 8
    Width = 253
    Height = 21
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 151
    Top = 71
    Width = 75
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 231
    Top = 71
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object hkMacro: THotKey
    Left = 52
    Top = 36
    Width = 121
    Height = 19
    HotKey = 0
    Modifiers = []
    TabOrder = 1
  end
  object cbEnabled: TCheckBox
    Left = 184
    Top = 37
    Width = 121
    Height = 17
    Caption = '&Enabled'
    TabOrder = 2
  end
end
