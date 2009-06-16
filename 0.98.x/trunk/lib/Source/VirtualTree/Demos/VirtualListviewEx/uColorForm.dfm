object ColorForm: TColorForm
  Left = 370
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Thumbnails highlight colors'
  ClientHeight = 272
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 232
    Width = 297
    Height = 9
    Shape = bsTopLine
  end
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 297
    Height = 217
    Columns = <
      item
        Caption = 'File extension'
        Width = 80
      end>
    ColumnClick = False
    MultiSelect = True
    ReadOnly = True
    TabOrder = 0
    ViewStyle = vsList
    OnAdvancedCustomDrawItem = ListView1AdvancedCustomDrawItem
  end
  object Button1: TButton
    Left = 232
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 152
    Top = 240
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 240
    Width = 78
    Height = 25
    Caption = 'C&hange Color'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
    Left = 264
    Top = 176
  end
end
