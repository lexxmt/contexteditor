object fmHTMLTidyProfile: TfmHTMLTidyProfile
  Left = 364
  Top = 227
  ActiveControl = eProfileName
  BorderStyle = bsDialog
  Caption = 'fmHTMLTidyProfile'
  ClientHeight = 404
  ClientWidth = 696
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
  object labProfileName: TLabel
    Left = 12
    Top = 20
    Width = 63
    Height = 13
    Caption = 'Profile name:'
  end
  object pcProfile: TPageControl
    Left = 8
    Top = 48
    Width = 681
    Height = 317
    ActivePage = pgMarkup
    TabOrder = 1
    object pgMarkup: TTabSheet
      Caption = 'Markup'
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Alt text:'
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 44
        Height = 13
        Caption = 'Doctype:'
      end
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 52
        Height = 13
        Caption = 'Block tags:'
      end
      object Label4: TLabel
        Left = 348
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Empty tags:'
      end
      object Label5: TLabel
        Left = 348
        Top = 40
        Width = 54
        Height = 13
        Caption = 'Inline tags:'
      end
      object Label6: TLabel
        Left = 348
        Top = 64
        Width = 44
        Height = 13
        Caption = 'Pre tags:'
      end
      object Label7: TLabel
        Left = 8
        Top = 88
        Width = 74
        Height = 13
        Caption = 'Duplicate attrs:'
      end
      object eAltText: TEdit
        Left = 112
        Top = 12
        Width = 150
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
      end
      object eDoctype: TEdit
        Left = 112
        Top = 36
        Width = 150
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
      end
      object eBlockTags: TEdit
        Left = 112
        Top = 60
        Width = 150
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
      end
      object eEmptyTags: TEdit
        Left = 452
        Top = 12
        Width = 150
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
      object eInlineTags: TEdit
        Left = 452
        Top = 36
        Width = 150
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
      end
      object ePreTags: TEdit
        Left = 452
        Top = 60
        Width = 150
        Height = 21
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
      end
      object cbBreakBeforeBR: TCheckBox
        Left = 8
        Top = 120
        Width = 130
        Height = 17
        Caption = 'Break before BR'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
      end
      object cbDropEmptyParas: TCheckBox
        Left = 8
        Top = 140
        Width = 130
        Height = 17
        Caption = 'Drop empty params'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
      end
      object cbDropFontTags: TCheckBox
        Left = 8
        Top = 160
        Width = 130
        Height = 17
        Caption = 'Drop font tags'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
      end
      object cbDropPropAttrs: TCheckBox
        Left = 8
        Top = 180
        Width = 130
        Height = 17
        Caption = 'Drop prop attributes'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 10
      end
      object cbEncloseBlockText: TCheckBox
        Left = 8
        Top = 200
        Width = 130
        Height = 17
        Caption = 'Enclose block text'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 11
      end
      object cbEncloseBodyText: TCheckBox
        Left = 8
        Top = 220
        Width = 130
        Height = 17
        Caption = 'Enclose body text'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 12
      end
      object cbFixComments: TCheckBox
        Left = 8
        Top = 240
        Width = 130
        Height = 17
        Caption = 'Fix comments'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
      end
      object cbFixUri: TCheckBox
        Left = 8
        Top = 260
        Width = 130
        Height = 17
        Caption = 'Fix URI'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 14
      end
      object cbHideComments: TCheckBox
        Left = 184
        Top = 120
        Width = 130
        Height = 17
        Caption = 'Hide comments'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 15
      end
      object cbHideEndTags: TCheckBox
        Left = 184
        Top = 140
        Width = 130
        Height = 17
        Caption = 'Hide end tags'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 16
      end
      object cbJoinClasses: TCheckBox
        Left = 184
        Top = 160
        Width = 130
        Height = 17
        Caption = 'Join classes'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 17
      end
      object cbJoinStyles: TCheckBox
        Left = 184
        Top = 180
        Width = 130
        Height = 17
        Caption = 'Join styles'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 18
      end
      object cbLogicalEmphasis: TCheckBox
        Left = 184
        Top = 200
        Width = 130
        Height = 17
        Caption = 'Logical emphasis'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 19
      end
      object cbLowerLiterals: TCheckBox
        Left = 184
        Top = 220
        Width = 130
        Height = 17
        Caption = 'Lower literals'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 20
      end
      object cbMakeBare: TCheckBox
        Left = 184
        Top = 240
        Width = 130
        Height = 17
        Caption = 'Make bare'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 21
      end
      object cbMakeClean: TCheckBox
        Left = 184
        Top = 260
        Width = 130
        Height = 17
        Caption = 'Make clean'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 22
      end
      object cbNcr: TCheckBox
        Left = 360
        Top = 120
        Width = 130
        Height = 17
        Caption = 'Numeric character ref'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 23
      end
      object cbNumEntities: TCheckBox
        Left = 360
        Top = 140
        Width = 130
        Height = 17
        Caption = 'Num entities'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 24
      end
      object cbQuoteAmpersand: TCheckBox
        Left = 360
        Top = 160
        Width = 130
        Height = 17
        Caption = 'Quoteampersand'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 25
      end
      object cbQuoteMarks: TCheckBox
        Left = 360
        Top = 180
        Width = 130
        Height = 17
        Caption = 'Quote marks'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 26
      end
      object cbQuoteNbsp: TCheckBox
        Left = 360
        Top = 200
        Width = 130
        Height = 17
        Caption = 'Quote nbsp'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 27
      end
      object cbReplaceColor: TCheckBox
        Left = 360
        Top = 220
        Width = 130
        Height = 17
        Caption = 'Replace color'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 28
      end
      object cbBodyOnly: TCheckBox
        Left = 360
        Top = 240
        Width = 130
        Height = 17
        Caption = 'Body only'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 29
      end
      object cbUpperCaseAttrs: TCheckBox
        Left = 360
        Top = 260
        Width = 130
        Height = 17
        Caption = 'Uppercase attributes'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 30
      end
      object cbUpperCaseTags: TCheckBox
        Left = 536
        Top = 120
        Width = 130
        Height = 17
        Caption = 'Uppercase tags'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 31
      end
      object cbWord2000: TCheckBox
        Left = 536
        Top = 140
        Width = 130
        Height = 17
        Caption = 'Word 2000'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 32
      end
      object cbDuplicateAttrs: TComboBox
        Left = 112
        Top = 84
        Width = 149
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
      end
    end
    object pgXMLMarkup: TTabSheet
      Caption = 'XML Markup'
      ImageIndex = 4
      object cbXmlDecl: TCheckBox
        Left = 8
        Top = 16
        Width = 130
        Height = 17
        Caption = 'XML declaration'
        TabOrder = 0
      end
      object cbXmlPIs: TCheckBox
        Left = 8
        Top = 36
        Width = 130
        Height = 17
        Caption = 'Preprocessing instr'
        TabOrder = 1
      end
      object cbXmlSpace: TCheckBox
        Left = 8
        Top = 56
        Width = 130
        Height = 17
        Caption = 'XML space'
        TabOrder = 2
      end
      object cbXmlTags: TCheckBox
        Left = 8
        Top = 76
        Width = 130
        Height = 17
        Caption = 'XML tags'
        TabOrder = 3
      end
      object cbEscapeCdata: TCheckBox
        Left = 8
        Top = 96
        Width = 130
        Height = 17
        Caption = 'Escape Cdata'
        TabOrder = 4
      end
      object cbIndentCdata: TCheckBox
        Left = 8
        Top = 116
        Width = 130
        Height = 17
        Caption = 'Indent Cdata'
        TabOrder = 5
      end
    end
    object pgPrettyPrint: TTabSheet
      Caption = 'Pretty Print'
      ImageIndex = 1
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 76
        Height = 13
        Caption = 'Indent content:'
      end
      object Label9: TLabel
        Left = 8
        Top = 40
        Width = 72
        Height = 13
        Caption = 'Indent spaces:'
      end
      object Label10: TLabel
        Left = 8
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Tab size:'
      end
      object Label11: TLabel
        Left = 8
        Top = 88
        Width = 63
        Height = 13
        Caption = 'Wrap length:'
      end
      object eIndentSpaces: TEdit
        Left = 112
        Top = 36
        Width = 150
        Height = 21
        TabOrder = 0
      end
      object eTabSize: TEdit
        Left = 112
        Top = 60
        Width = 150
        Height = 21
        TabOrder = 1
      end
      object eWrapLen: TEdit
        Left = 112
        Top = 84
        Width = 150
        Height = 21
        TabOrder = 2
      end
      object cbIndentContent: TComboBox
        Left = 112
        Top = 12
        Width = 150
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
      object cbIndentAttributes: TCheckBox
        Left = 8
        Top = 120
        Width = 130
        Height = 17
        Caption = 'Indent attributes'
        TabOrder = 4
      end
      object cbLiteralAttribs: TCheckBox
        Left = 8
        Top = 140
        Width = 130
        Height = 17
        Caption = 'Literal attributes'
        TabOrder = 5
      end
      object cbShowMarkup: TCheckBox
        Left = 8
        Top = 160
        Width = 130
        Height = 17
        Caption = 'Show markup'
        TabOrder = 6
      end
      object cbWrapAsp: TCheckBox
        Left = 8
        Top = 180
        Width = 130
        Height = 17
        Caption = 'Wrap ASP'
        TabOrder = 7
      end
      object cbWrapAttVals: TCheckBox
        Left = 8
        Top = 200
        Width = 130
        Height = 17
        Caption = 'Wrap attribute values'
        TabOrder = 8
      end
      object cbWrapJste: TCheckBox
        Left = 184
        Top = 120
        Width = 130
        Height = 17
        Caption = 'Wrap JSTE'
        TabOrder = 9
      end
      object cbWrapPhp: TCheckBox
        Left = 184
        Top = 140
        Width = 130
        Height = 17
        Caption = 'Wrap PHP'
        TabOrder = 10
      end
      object cbWrapScriptlets: TCheckBox
        Left = 184
        Top = 160
        Width = 130
        Height = 17
        Caption = 'Wrap scriptlets'
        TabOrder = 11
      end
      object cbWrapSection: TCheckBox
        Left = 184
        Top = 180
        Width = 130
        Height = 17
        Caption = 'Wrap section'
        TabOrder = 12
      end
      object cbFixBackslash: TCheckBox
        Left = 184
        Top = 200
        Width = 130
        Height = 17
        Caption = 'Fix backslash'
        TabOrder = 13
      end
    end
    object pgDiagnostics: TTabSheet
      Caption = 'Diagnostics'
      ImageIndex = 2
    end
    object pgEncoding: TTabSheet
      Caption = 'Encoding'
      ImageIndex = 3
      object Label12: TLabel
        Left = 8
        Top = 40
        Width = 73
        Height = 13
        Caption = 'Char encoding:'
      end
      object Label13: TLabel
        Left = 8
        Top = 64
        Width = 84
        Height = 13
        Caption = 'In char encoding:'
      end
      object Label14: TLabel
        Left = 8
        Top = 88
        Width = 92
        Height = 13
        Caption = 'Out char encoding:'
      end
      object cbAsciiChars: TCheckBox
        Left = 8
        Top = 16
        Width = 130
        Height = 17
        Caption = 'Ascii chars'
        TabOrder = 0
      end
      object cbCharEncoding: TComboBox
        Left = 112
        Top = 36
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object cbInCharEncoding: TComboBox
        Left = 112
        Top = 60
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
      object cbOutCharEncoding: TComboBox
        Left = 112
        Top = 84
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
    end
  end
  object btnOK: TButton
    Left = 534
    Top = 372
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 614
    Top = 372
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object eProfileName: TEdit
    Left = 104
    Top = 16
    Width = 357
    Height = 21
    TabOrder = 0
  end
end
