object fmHTMLTidyManageProfiles: TfmHTMLTidyManageProfiles
  Left = 344
  Top = 291
  BorderStyle = bsDialog
  Caption = 'Manage Tidy Profiles'
  ClientHeight = 318
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lvProfiles: TListView
    Left = 8
    Top = 32
    Width = 601
    Height = 245
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end
      item
        Caption = 'Filename'
        Width = 200
      end
      item
        Caption = 'Description'
        Width = 220
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = acEditExecute
  end
  object Button1: TButton
    Left = 534
    Top = 284
    Width = 75
    Height = 25
    Action = acClose
    Cancel = True
    Default = True
    TabOrder = 1
  end
  object TBXToolbar1: TTBXToolbar
    Left = 8
    Top = 8
    Width = 151
    Height = 22
    Caption = 'TBXToolbar1'
    Images = fmMain.ilToolbar
    TabOrder = 2
    object TBXItem3: TTBXItem
      Action = acNew
      DisplayMode = nbdmImageAndText
    end
    object TBXItem2: TTBXItem
      Action = acEdit
      DisplayMode = nbdmImageAndText
    end
    object TBXItem1: TTBXItem
      Action = acDelete
      DisplayMode = nbdmImageAndText
    end
  end
  object alTidyProfiles: TActionList
    Images = fmMain.ilToolbar
    OnUpdate = alTidyProfilesUpdate
    Left = 16
    Top = 240
    object acNew: TAction
      Caption = 'New'
      ImageIndex = 0
      OnExecute = acNewExecute
    end
    object acEdit: TAction
      Caption = 'Edit'
      ImageIndex = 58
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = 'Delete'
      ImageIndex = 26
      OnExecute = acDeleteExecute
    end
    object acClose: TAction
      Caption = 'Close'
      OnExecute = acCloseExecute
    end
  end
end
