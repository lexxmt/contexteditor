object fmFileCompare: TfmFileCompare
  Left = 340
  Top = 226
  BorderStyle = bsDialog
  Caption = 'File Compare'
  ClientHeight = 245
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 216
    Width = 75
    Height = 23
    Action = acSettings
    TabOrder = 4
  end
  object Button2: TButton
    Left = 374
    Top = 216
    Width = 75
    Height = 23
    Action = acCompare
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button3: TButton
    Left = 454
    Top = 216
    Width = 75
    Height = 23
    Action = acCancel
    Cancel = True
    ModalResult = 2
    TabOrder = 1
  end
  inline frameFile1: TframeFileCompareFileChoice
    Left = 5
    Top = 4
    Width = 528
    Height = 105
    TabOrder = 2
  end
  inline frameFile2: TframeFileCompareFileChoice
    Left = 5
    Top = 108
    Width = 528
    Height = 105
    TabOrder = 3
  end
  object alFileCompare: TActionList
    Left = 92
    Top = 212
    object acCompare: TAction
      Caption = 'Compare'
      OnExecute = acCompareExecute
    end
    object acSettings: TAction
      Caption = '&Settings'
      OnExecute = acSettingsExecute
    end
    object acCancel: TAction
      Caption = 'Cancel'
      OnExecute = acCancelExecute
    end
  end
end
