object fmFileList: TfmFileList
  Left = 453
  Top = 213
  ActiveControl = eName
  BorderStyle = bsDialog
  Caption = 'File List'
  ClientHeight = 285
  ClientWidth = 306
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
  object lb: TListBox
    Left = 8
    Top = 36
    Width = 213
    Height = 245
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnClick = lbClick
    OnDblClick = btnOKClick
  end
  object btnOK: TButton
    Left = 228
    Top = 12
    Width = 75
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 228
    Top = 40
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object eName: TEdit
    Left = 8
    Top = 12
    Width = 213
    Height = 21
    TabOrder = 0
    OnChange = eNameChange
    OnKeyDown = eNameKeyDown
  end
end
