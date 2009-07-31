object frameFileCompareFileChoice: TframeFileCompareFileChoice
  Left = 0
  Top = 0
  Width = 528
  Height = 105
  TabOrder = 0
  object gbFile: TGroupBox
    Left = 4
    Top = 4
    Width = 521
    Height = 97
    Caption = 'File'
    TabOrder = 0
    object rbEditingFile: TRadioButton
      Left = 16
      Top = 44
      Width = 137
      Height = 17
      Caption = 'Editing file'
      TabOrder = 1
    end
    object rbFileFromDisk: TRadioButton
      Left = 16
      Top = 68
      Width = 137
      Height = 17
      Caption = 'File from disk'
      TabOrder = 3
    end
    object cbFileList: TComboBox
      Left = 156
      Top = 40
      Width = 357
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object eFileName: TEdit
      Left = 156
      Top = 64
      Width = 333
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object btnBrowse: TButton
      Left = 492
      Top = 64
      Width = 21
      Height = 21
      Action = acBrowse
      TabOrder = 5
    end
    object rbCurrentFile: TRadioButton
      Left = 16
      Top = 20
      Width = 137
      Height = 17
      Caption = 'Current file'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
  object alFileCompareChoice: TActionList
    OnUpdate = alFileCompareChoiceUpdate
    Left = 396
    Top = 12
    object acBrowse: TAction
      Caption = '...'
      OnExecute = acBrowseExecute
    end
  end
end
