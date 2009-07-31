object fmExport: TfmExport
  Left = 339
  Top = 259
  BorderStyle = bsDialog
  Caption = 'Export File'
  ClientHeight = 228
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labTitle: TLabel
    Left = 12
    Top = 16
    Width = 23
    Height = 13
    Caption = '&Title:'
    FocusControl = eTitle
  end
  object btnExport: TButton
    Left = 236
    Top = 196
    Width = 75
    Height = 23
    Caption = 'Export'
    Default = True
    TabOrder = 3
    OnClick = btnExportClick
  end
  object btnCancel: TButton
    Left = 316
    Top = 196
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object eTitle: TEdit
    Left = 68
    Top = 12
    Width = 325
    Height = 21
    TabOrder = 0
  end
  object gbOptions: TGroupBox
    Left = 68
    Top = 40
    Width = 325
    Height = 61
    Caption = 'Options'
    TabOrder = 1
    object cbSelectedOnly: TCheckBox
      Left = 12
      Top = 15
      Width = 157
      Height = 17
      Caption = '&Selected only'
      TabOrder = 0
    end
    object cbCreateFragment: TCheckBox
      Left = 176
      Top = 14
      Width = 141
      Height = 17
      Caption = '&Create fragment'
      TabOrder = 2
    end
    object cbExportToClipboard: TCheckBox
      Left = 12
      Top = 35
      Width = 141
      Height = 17
      Caption = '&Export to clipboard'
      TabOrder = 1
    end
  end
  object gbTextSettings: TGroupBox
    Left = 68
    Top = 108
    Width = 325
    Height = 81
    Caption = 'Text Settings'
    TabOrder = 2
    object labBackground: TLabel
      Left = 12
      Top = 52
      Width = 87
      Height = 13
      Caption = '&Background color:'
    end
    object labFont: TLabel
      Left = 12
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Plain text &font:'
      FocusControl = btnSetFont
    end
    object labFontName: TLabel
      Left = 108
      Top = 24
      Width = 129
      Height = 13
      AutoSize = False
      Caption = 'labFontName'
    end
    object cbBgColor: TColorBtn
      Left = 242
      Top = 47
      Width = 37
      Height = 22
      ActiveColor = clWindow
      TargetColor = clWindow
      Flat = False
      DropDownFlat = True
      AutomaticColor = clBlack
      IsAutomatic = True
      GlyphType = gtCustom
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000808080008080800000000000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C00000000000C0C0C000C0C0C000808080008080800000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000808080008080800000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000FFFF
        FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C00080808000808080000000
        0000808080008080800080808000C0C0C000C0C0C000C0C0C00000000000C0C0
        C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000808080008080
        80000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
        0000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C0008080
        800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C00000000000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C0000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C000FFFFFF00808080008080800000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C0000000000000000000C0C0C0008080800000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
      AutoBtnCaption = '&Default color'
      OtherBtnCaption = '&Custom color'
      RegKey = 'Palette0'
    end
    object btnSetFont: TButton
      Left = 242
      Top = 18
      Width = 75
      Height = 23
      Caption = '&Set'
      TabOrder = 0
      OnClick = btnSetFontClick
    end
  end
  object dlgSave: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 132
    Top = 192
  end
  object expHTML: TSynExporterHTML
    Color = clWindow
    DefaultFilter = 'HTML Document (*.htm,*.html)|*.htm;*.html'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 100
    Top = 192
  end
  object expRTF: TSynExporterRTF
    Color = clWindow
    DefaultFilter = 'Rich Text Format (*.rtf)|*.rtf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 68
    Top = 192
  end
  object dlgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Device = fdBoth
    Options = [fdWysiwyg]
    Left = 164
    Top = 192
  end
end
