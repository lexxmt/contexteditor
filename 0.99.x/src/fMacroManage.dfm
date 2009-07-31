object fmMacroManage: TfmMacroManage
  Left = 304
  Top = 249
  ActiveControl = lvMacros
  BorderStyle = bsDialog
  Caption = 'Manage Macros'
  ClientHeight = 314
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
  object lvMacros: TListView
    Left = 4
    Top = 12
    Width = 389
    Height = 265
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end
      item
        Caption = 'Shortcut'
        Width = 100
      end
      item
        Caption = 'Enabled'
        Width = 70
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = btnEditClick
    OnKeyDown = lvMacrosKeyDown
  end
  object btnCancel: TButton
    Left = 316
    Top = 284
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 236
    Top = 284
    Width = 75
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnDelete: TButton
    Left = 156
    Top = 284
    Width = 75
    Height = 23
    Caption = '&Delete'
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object btnEdit: TButton
    Left = 76
    Top = 284
    Width = 75
    Height = 23
    Caption = '&Edit'
    TabOrder = 1
    OnClick = btnEditClick
  end
end
