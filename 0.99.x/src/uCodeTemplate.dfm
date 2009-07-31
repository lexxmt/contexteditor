object fmCodeTemplate: TfmCodeTemplate
  Left = 327
  Top = 238
  BorderStyle = bsDialog
  Caption = 'Code Template'
  ClientHeight = 387
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labHighlighter: TLabel
    Left = 12
    Top = 12
    Width = 53
    Height = 13
    Caption = '&Highlighter:'
    FocusControl = cbHL
  end
  object labTemplate: TLabel
    Left = 12
    Top = 40
    Width = 47
    Height = 13
    Caption = '&Template:'
    FocusControl = lvSh
  end
  object labCode: TLabel
    Left = 12
    Top = 184
    Width = 28
    Height = 13
    Caption = '&Code:'
    FocusControl = memo
  end
  object memo: TConTEXTSynEdit
    Left = 12
    Top = 200
    Width = 457
    Height = 149
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 5
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Terminal'
    Gutter.Font.Style = []
    Gutter.Visible = False
    RightEdge = 9999
    WantTabs = True
    OnChange = memoChange
    BlockIndent = 0
    RemovedKeystrokes = <
      item
        Command = ecLineBreak
        ShortCut = 8205
      end
      item
        Command = ecContextHelp
        ShortCut = 112
      end>
    AddedKeystrokes = <>
  end
  object cbHL: TComboBox
    Left = 120
    Top = 8
    Width = 265
    Height = 21
    HelpContext = 188
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbHLChange
  end
  object lvSh: TListView
    Left = 12
    Top = 56
    Width = 373
    Height = 121
    Columns = <
      item
        Caption = 'Shortcut'
        Width = 100
      end
      item
        Caption = 'Description'
        Width = 250
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = btnEditClick
    OnSelectItem = lvShSelectItem
  end
  object btnAdd: TButton
    Left = 394
    Top = 56
    Width = 75
    Height = 23
    Caption = '&Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnEdit: TButton
    Left = 394
    Top = 84
    Width = 75
    Height = 23
    Caption = '&Edit'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object btnDelete: TButton
    Left = 394
    Top = 112
    Width = 75
    Height = 23
    Caption = '&Delete'
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object btnOK: TButton
    Left = 314
    Top = 356
    Width = 75
    Height = 23
    Caption = '&OK'
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 394
    Top = 356
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
  end
end
