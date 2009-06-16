object ArchivePropertiesForm: TArchivePropertiesForm
  Left = 324
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Properties'
  ClientHeight = 271
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 63
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Label2: TLabel
    Left = 66
    Top = 64
    Width = 28
    Height = 13
    Caption = 'Type:'
  end
  object Label3: TLabel
    Left = 33
    Top = 96
    Width = 61
    Height = 13
    Caption = 'Original size:'
  end
  object Label4: TLabel
    Left = 35
    Top = 120
    Width = 59
    Height = 13
    Caption = 'Packed size:'
  end
  object Label5: TLabel
    Left = 60
    Top = 144
    Width = 34
    Height = 13
    Caption = 'Result:'
  end
  object Label6: TLabel
    Left = 50
    Top = 184
    Width = 44
    Height = 13
    Caption = 'Modified:'
  end
  object fpName: TLabel
    Left = 112
    Top = 16
    Width = 37
    Height = 13
    Caption = 'fpName'
  end
  object fpType: TLabel
    Left = 112
    Top = 64
    Width = 34
    Height = 13
    Caption = 'fpType'
  end
  object fpSize: TLabel
    Left = 112
    Top = 96
    Width = 29
    Height = 13
    Caption = 'fpSize'
  end
  object fpPackedSize: TLabel
    Left = 112
    Top = 120
    Width = 63
    Height = 13
    Caption = 'fpPackedSize'
  end
  object fpRatio: TLabel
    Left = 112
    Top = 144
    Width = 35
    Height = 13
    Caption = 'fpRatio'
  end
  object fpModified: TLabel
    Left = 112
    Top = 184
    Width = 50
    Height = 13
    Caption = 'fpModified'
  end
  object Label7: TLabel
    Left = 69
    Top = 208
    Width = 25
    Height = 13
    Caption = 'CRC:'
  end
  object fpCRC: TLabel
    Left = 112
    Top = 208
    Width = 31
    Height = 13
    Caption = 'fpCRC'
  end
  object Label8: TLabel
    Left = 68
    Top = 40
    Width = 26
    Height = 13
    Caption = 'Path:'
  end
  object fpPath: TLabel
    Left = 112
    Top = 40
    Width = 32
    Height = 13
    Caption = 'fpPath'
  end
  object gauge: TGauge
    Left = 320
    Top = 96
    Width = 25
    Height = 65
    ForeColor = clPurple
    Kind = gkVerticalBar
    Progress = 53
    ShowText = False
  end
  object imIcon: TImage
    Left = 16
    Top = 16
    Width = 33
    Height = 33
    AutoSize = True
  end
  object Bevel1: TBevel
    Left = 8
    Top = 88
    Width = 345
    Height = 2
  end
  object Bevel2: TBevel
    Left = 8
    Top = 168
    Width = 345
    Height = 2
  end
  object Button1: TButton
    Left = 136
    Top = 240
    Width = 81
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
end
