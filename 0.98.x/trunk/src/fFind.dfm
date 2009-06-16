object fmFind: TfmFind
  Left = 333
  Top = 219
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Find Text'
  ClientHeight = 226
  ClientWidth = 418
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labReplace: TLabel
    Left = 12
    Top = 48
    Width = 65
    Height = 13
    Caption = 'Replace &with:'
    FocusControl = cbReplace
  end
  object labFind: TLabel
    Left = 12
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Fi&nd what:'
    FocusControl = cbFind
  end
  object gbOptions: TGroupBox
    Left = 172
    Top = 72
    Width = 151
    Height = 145
    Caption = 'Options'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object cbCase: TCheckBox
      Left = 12
      Top = 20
      Width = 133
      Height = 17
      HelpContext = 18
      Caption = 'Ca&se sensitive'
      TabOrder = 0
    end
    object cbWholeWords: TCheckBox
      Left = 12
      Top = 40
      Width = 133
      Height = 17
      HelpContext = 19
      Caption = 'W&hole words only'
      TabOrder = 1
    end
    object cbBackward: TCheckBox
      Left = 12
      Top = 60
      Width = 133
      Height = 17
      HelpContext = 22
      Caption = '&Backward'
      TabOrder = 2
    end
    object cbRegExp: TCheckBox
      Left = 12
      Top = 80
      Width = 133
      Height = 17
      HelpContext = 22
      Caption = 'R&egular expressions'
      TabOrder = 3
    end
  end
  object btnClose: TButton
    Left = 332
    Top = 96
    Width = 77
    Height = 22
    HelpContext = 26
    Cancel = True
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnCloseClick
  end
  object btnFindNext: TButton
    Left = 332
    Top = 12
    Width = 77
    Height = 22
    HelpContext = 23
    Caption = '&Find'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnFindNextClick
  end
  object btnReplace: TButton
    Left = 332
    Top = 40
    Width = 77
    Height = 22
    HelpContext = 24
    Caption = '&Replace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnReplaceClick
  end
  object cbReplace: TComboBox
    Left = 92
    Top = 44
    Width = 231
    Height = 21
    HelpContext = 17
    AutoComplete = False
    ItemHeight = 13
    TabOrder = 1
  end
  object cbFind: TComboBox
    Left = 92
    Top = 12
    Width = 231
    Height = 21
    HelpContext = 16
    AutoComplete = False
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbFindChange
  end
  object btnReplaceAll: TButton
    Left = 332
    Top = 68
    Width = 77
    Height = 22
    HelpContext = 25
    Caption = 'Replace &All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnReplaceAllClick
  end
  object gbOrigin: TGroupBox
    Left = 12
    Top = 72
    Width = 153
    Height = 65
    Caption = 'Origin'
    TabOrder = 2
    object rbOriginFromCursor: TRadioButton
      Left = 12
      Top = 20
      Width = 133
      Height = 17
      Caption = 'From &cursor'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbOriginFromBeginning: TRadioButton
      Left = 12
      Top = 40
      Width = 133
      Height = 17
      Caption = 'From the &top'
      TabOrder = 1
      OnClick = rbOriginFromBeginningClick
    end
  end
  object gbScope: TGroupBox
    Left = 12
    Top = 140
    Width = 153
    Height = 77
    Caption = 'Scope'
    TabOrder = 3
    object rbScopeFile: TRadioButton
      Left = 12
      Top = 36
      Width = 133
      Height = 17
      Caption = 'C&urrent file'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbScopeAllFiles: TRadioButton
      Left = 12
      Top = 56
      Width = 133
      Height = 17
      Caption = 'A&ll files'
      TabOrder = 2
    end
    object rbScopeSelection: TRadioButton
      Left = 12
      Top = 16
      Width = 133
      Height = 17
      Caption = '&Selection only'
      TabOrder = 0
    end
  end
  object SearchEngine: TSynEditSearch
    Left = 360
    Top = 124
  end
  object RegExpSearchEngine: TSynEditRegexSearch
    Left = 360
    Top = 156
  end
end
