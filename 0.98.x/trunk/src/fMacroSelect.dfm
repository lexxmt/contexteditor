object fmMacroSelect: TfmMacroSelect
  Left = 305
  Top = 212
  ActiveControl = lvMacros
  BorderStyle = bsDialog
  Caption = 'Macro Select'
  ClientHeight = 339
  ClientWidth = 398
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
  object labMessage: TLabel
    Left = 8
    Top = 20
    Width = 99
    Height = 13
    Caption = '&Select macro to play:'
    FocusControl = lvMacros
  end
  object lvMacros: TListView
    Left = 4
    Top = 40
    Width = 389
    Height = 265
    Columns = <
      item
        Caption = 'Name'
        Width = 250
      end
      item
        Caption = 'Shortcut'
        Width = 100
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvMacrosDblClick
  end
  object btnCancel: TButton
    Left = 316
    Top = 312
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnPlay: TButton
    Left = 232
    Top = 312
    Width = 75
    Height = 23
    Caption = 'Play'
    Default = True
    TabOrder = 1
    OnClick = btnPlayClick
  end
end
