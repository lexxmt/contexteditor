object fmCodeTemplateEdit: TfmCodeTemplateEdit
  Left = 356
  Top = 274
  BorderStyle = bsDialog
  Caption = 'Template Shortcut Edit'
  ClientHeight = 110
  ClientWidth = 348
  Color = clBtnFace
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
  object labShortcut: TLabel
    Left = 12
    Top = 20
    Width = 43
    Height = 13
    Caption = '&Shortcut:'
    FocusControl = eShortcut
  end
  object labDescription: TLabel
    Left = 12
    Top = 44
    Width = 56
    Height = 13
    Caption = '&Description:'
    FocusControl = eDescr
  end
  object eShortcut: TEdit
    Left = 100
    Top = 16
    Width = 237
    Height = 21
    TabOrder = 0
    OnChange = eShortcutChange
  end
  object eDescr: TEdit
    Left = 100
    Top = 40
    Width = 237
    Height = 21
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 96
    Top = 76
    Width = 75
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 176
    Top = 76
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
