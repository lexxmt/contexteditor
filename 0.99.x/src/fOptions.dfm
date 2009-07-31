object fmOptions: TfmOptions
  Left = 364
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Environment Options'
  ClientHeight = 536
  ClientWidth = 448
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcOptions: TPageControl
    Left = 4
    Top = 8
    Width = 437
    Height = 493
    ActivePage = pgColors
    TabOrder = 0
    OnChange = pcOptionsChange
    object pgGeneral: TTabSheet
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object labLanguage: TLabel
        Left = 8
        Top = 392
        Width = 51
        Height = 13
        Caption = '&Language:'
        FocusControl = cbLanguage
      end
      object labWhenStarted: TLabel
        Left = 8
        Top = 368
        Width = 67
        Height = 13
        Caption = '&When started:'
        FocusControl = cbWhenStarted
      end
      object cbBackupFile: TCheckBox
        Left = 8
        Top = 12
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = '&Backup file on save'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbSaveFilePositions: TCheckBox
        Left = 8
        Top = 92
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = '&Remember editing positions'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object cbDetectFileChanges: TCheckBox
        Left = 8
        Top = 152
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = '&Detect file changes by other application'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object cbShowFindReplaceInfoDlg: TCheckBox
        Left = 8
        Top = 192
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = '&Show find/replace information dialog'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object cbAutoUpdateChangedFiles: TCheckBox
        Left = 8
        Top = 172
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = 'A&utomatically update changed files'
        TabOrder = 10
      end
      object cbLanguage: TComboBox
        Left = 124
        Top = 388
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 20
      end
      object cbMinimizeIfNoFiles: TCheckBox
        Left = 8
        Top = 232
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = '&Minimize ConTEXT if no files open'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object eBackupDir: TEdit
        Left = 176
        Top = 49
        Width = 217
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object btnBackupDirBrowse: TButton
        Left = 396
        Top = 49
        Width = 23
        Height = 21
        Caption = '...'
        TabOrder = 4
        OnClick = btnBackupDirBrowseClick
      end
      object rbBackupDirCurrent: TRadioButton
        Left = 24
        Top = 32
        Width = 253
        Height = 17
        Caption = '&Use current directory'
        TabOrder = 1
        OnClick = rbBackupDirCurrentClick
      end
      object rbBackupDirSelect: TRadioButton
        Left = 24
        Top = 51
        Width = 149
        Height = 17
        Caption = 'Bac&kup directory:'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = rbBackupDirCurrentClick
      end
      object cbShowExecInfoDlg: TCheckBox
        Left = 8
        Top = 212
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = 'S&how user exec completion dialog'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object cbRememberLastDir: TCheckBox
        Left = 8
        Top = 112
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = 'R&emember last directory used'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object cbAllowMultipleInstances: TCheckBox
        Left = 8
        Top = 272
        Width = 377
        Height = 17
        HelpContext = 182
        Caption = 'A&llow multiple instances'
        Checked = True
        State = cbChecked
        TabOrder = 15
      end
      object cbMinimizeToTray: TCheckBox
        Left = 8
        Top = 252
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = 'M&inimize to system tray'
        Checked = True
        State = cbChecked
        TabOrder = 14
      end
      object cbVisibleFileTabsIcons: TCheckBox
        Left = 8
        Top = 292
        Width = 377
        Height = 17
        HelpContext = 182
        Caption = '&Visible file tabs icons'
        Checked = True
        State = cbChecked
        TabOrder = 16
      end
      object cbRememberFindOptions: TCheckBox
        Left = 8
        Top = 132
        Width = 373
        Height = 17
        HelpContext = 182
        Caption = 'Remember &Find/Replace dialog options'
        TabOrder = 8
      end
      object cbMultiLineTabs: TCheckBox
        Left = 8
        Top = 312
        Width = 357
        Height = 17
        HelpContext = 182
        Caption = 'Mul&tiline file tabs'
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
      object cbDosBackupFilename: TCheckBox
        Left = 24
        Top = 72
        Width = 317
        Height = 17
        HelpContext = 182
        Caption = 'Replace &original extension with .BAK'
        TabOrder = 5
      end
      object cbWhenStarted: TComboBox
        Left = 124
        Top = 364
        Width = 217
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 19
      end
      object cbShiftClickClosesFileTab: TCheckBox
        Left = 8
        Top = 332
        Width = 357
        Height = 17
        HelpContext = 182
        Caption = 'Shift+click on file tab closes file'
        Checked = True
        State = cbChecked
        TabOrder = 18
      end
    end
    object pgEditor: TTabSheet
      Caption = 'Editor'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object labTabWidth: TLabel
        Left = 216
        Top = 192
        Width = 50
        Height = 13
        Caption = 'Tab &width:'
        FocusControl = eTabWidth
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object labInsertCaret: TLabel
        Left = 216
        Top = 96
        Width = 56
        Height = 13
        Caption = '&Insert caret:'
        FocusControl = cbInsertCaretShape
      end
      object labFont: TLabel
        Left = 8
        Top = 12
        Width = 24
        Height = 13
        Caption = '&Font:'
        FocusControl = cbEditorFont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object labFontSize: TLabel
        Left = 288
        Top = 12
        Width = 23
        Height = 13
        Caption = '&Size:'
        FocusControl = eFontSize
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object labOverwriteCaret: TLabel
        Left = 216
        Top = 120
        Width = 75
        Height = 13
        Caption = '&Overwrite caret:'
        FocusControl = cbOverwriteCaretShape
      end
      object labLineSpacing: TLabel
        Left = 216
        Top = 72
        Width = 86
        Height = 13
        Caption = '&Extra line spacing:'
        FocusControl = eExtraLineSpacing
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object labRightMargin: TLabel
        Left = 216
        Top = 144
        Width = 62
        Height = 13
        Caption = '&Right margin:'
        FocusControl = eRightEdge
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object labBlockIndent: TLabel
        Left = 216
        Top = 240
        Width = 62
        Height = 13
        Caption = 'Bloc&k indent:'
        FocusControl = eBlockIndent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object labTabsMode: TLabel
        Left = 216
        Top = 168
        Width = 56
        Height = 13
        Caption = 'Ta&bs mode:'
        FocusControl = cbTabsMode
      end
      object labCJavaBlockIndent: TLabel
        Left = 216
        Top = 264
        Width = 99
        Height = 13
        Caption = 'C/&Java block indent:'
        FocusControl = eCJavaBlockIndent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cbAutoIndent: TCheckBox
        Left = 8
        Top = 68
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = 'Au&to indent'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cbFindTextAtCursor: TCheckBox
        Left = 8
        Top = 148
        Width = 185
        Height = 17
        HelpContext = 187
        Caption = 'Fi&nd text at cursor'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object eTabWidth: THexEdit
        Left = 377
        Top = 188
        Width = 31
        Height = 21
        HelpContext = 181
        NumBase = ebDec
        MaxValue = 32
        MinValue = 1
        TabOrder = 23
        Validate = True
        Value = 8
      end
      object spinTabWidth: TUpDown
        Left = 408
        Top = 188
        Width = 13
        Height = 21
        HelpContext = 181
        Associate = eTabWidth
        Min = 1
        Max = 32
        Position = 8
        TabOrder = 24
      end
      object cbInsertCaretShape: TComboBox
        Left = 324
        Top = 92
        Width = 99
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 18
      end
      object cbEditorFont: TFontComboBox
        Left = 58
        Top = 8
        Width = 167
        Height = 19
        HelpContext = 180
        FilterOptions = [ShowTrueType, ShowPostScript, ShowRaster, ShowFixedOnly]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        Items.Strings = (
          '@MS Mincho'
          'Consolas'
          'Courier'
          'Courier New'
          'Courier New Baltic'
          'Courier New CE'
          'Courier New CYR'
          'Courier New Greek'
          'Courier New TUR'
          'DejaVu Sans Mono'
          'Fixedsys'
          'Letter Gothic Std'
          'Lucida Console'
          'Lucida Sans Typewriter'
          'MS Mincho'
          'OCR A Std'
          'Orator Std'
          'Prestige Elite Std'
          'Terminal'
          'WST_Czec'
          'WST_Engl'
          'WST_Fren'
          'WST_Germ'
          'WST_Ital'
          'WST_Span'
          'WST_Swed')
        ParentFont = False
        TabOrder = 0
        Text = '@MS Mincho'
        OnChange = cbEditorFontChange
      end
      object eFontSize: THexEdit
        Left = 340
        Top = 8
        Width = 31
        Height = 21
        HelpContext = 181
        NumBase = ebDec
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Validate = False
        Value = 6
        OnChange = eFontSizeChange
      end
      object spinFontSize: TUpDown
        Left = 371
        Top = 8
        Width = 13
        Height = 21
        HelpContext = 181
        Associate = eFontSize
        Min = 6
        Max = 128
        Position = 6
        TabOrder = 2
      end
      object pnFontSample: TPanel
        Left = 8
        Top = 32
        Width = 413
        Height = 33
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'AaBbXxYyZz12345'
        Ctl3D = False
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 30
      end
      object cbDragDropEditing: TCheckBox
        Left = 8
        Top = 88
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = '&Drag-drop editing'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object cbOverwriteCaretShape: TComboBox
        Left = 324
        Top = 116
        Width = 99
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 19
      end
      object spinExtraLineSpacing: TUpDown
        Left = 408
        Top = 68
        Width = 13
        Height = 21
        HelpContext = 181
        Associate = eExtraLineSpacing
        Max = 32
        TabOrder = 17
      end
      object eExtraLineSpacing: THexEdit
        Left = 377
        Top = 68
        Width = 31
        Height = 21
        HelpContext = 181
        NumBase = ebDec
        MaxValue = 32
        MinValue = 0
        TabOrder = 16
        Validate = True
        Value = 0
      end
      object eRightEdge: THexEdit
        Left = 377
        Top = 140
        Width = 31
        Height = 21
        HelpContext = 181
        NumBase = ebDec
        MaxValue = 9999
        MinValue = 1
        TabOrder = 20
        Validate = True
        Value = 8
      end
      object spinRightEdge: TUpDown
        Left = 408
        Top = 140
        Width = 13
        Height = 21
        HelpContext = 181
        Associate = eRightEdge
        Min = 1
        Max = 9999
        Position = 8
        TabOrder = 21
      end
      object eBlockIndent: THexEdit
        Left = 377
        Top = 236
        Width = 31
        Height = 21
        HelpContext = 181
        NumBase = ebDec
        MaxValue = 32
        MinValue = 1
        TabOrder = 26
        Validate = True
        Value = 2
      end
      object spinBlockIndent: TUpDown
        Left = 408
        Top = 236
        Width = 13
        Height = 21
        HelpContext = 181
        Associate = eBlockIndent
        Min = 1
        Max = 32
        Position = 2
        TabOrder = 27
      end
      object cbLineNumbers: TCheckBox
        Left = 8
        Top = 188
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = '&Line numbers'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object cbUndoAfterSave: TCheckBox
        Left = 8
        Top = 228
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = 'Undo after sa&ve'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object cbCursorAfterEOL: TCheckBox
        Left = 8
        Top = 108
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = 'Allow &cursor after end of line'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object cbEnhanceHomeKey: TCheckBox
        Left = 8
        Top = 128
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = 'Enhance HomeKey &positioning'
        TabOrder = 6
      end
      object cbTabsMode: TComboBox
        Left = 324
        Top = 164
        Width = 99
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 22
        OnChange = SetEnables
      end
      object cbHideMouseWhenTyping: TCheckBox
        Left = 8
        Top = 248
        Width = 209
        Height = 17
        Caption = 'Hide mouse cursor when t&yping'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object spinCJavaBlockIndent: TUpDown
        Left = 408
        Top = 260
        Width = 13
        Height = 21
        HelpContext = 181
        Associate = eCJavaBlockIndent
        Max = 32
        TabOrder = 29
      end
      object eCJavaBlockIndent: THexEdit
        Left = 377
        Top = 260
        Width = 31
        Height = 21
        HelpContext = 181
        NumBase = ebDec
        MaxValue = 32
        MinValue = 0
        TabOrder = 28
        Validate = True
        Value = 0
      end
      object gbNewDocSettings: TGroupBox
        Left = 8
        Top = 408
        Width = 413
        Height = 53
        Caption = 'Default settings for a new document'
        TabOrder = 32
        object labNewDocHighlighter: TLabel
          Left = 12
          Top = 26
          Width = 53
          Height = 13
          Caption = '&Highlighter:'
        end
        object labNewDocFileFormat: TLabel
          Left = 248
          Top = 26
          Width = 51
          Height = 13
          Caption = 'File format:'
        end
        object cbNewDocHighlighter: TComboBox
          Left = 84
          Top = 22
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          Sorted = True
          TabOrder = 0
        end
        object cbNewDocFormat: TComboBox
          Left = 328
          Top = 22
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'DOS'
            'Unix'
            'Mac'
            'Unicode')
        end
      end
      object cbTrimTrailingSpaces: TCheckBox
        Left = 8
        Top = 268
        Width = 209
        Height = 17
        Caption = 'Trim trailing spaces'
        Checked = True
        State = cbChecked
        TabOrder = 14
      end
      object gbGutter: TGroupBox
        Left = 8
        Top = 336
        Width = 413
        Height = 65
        Caption = 'Gutter'
        TabOrder = 31
        object labGutterWidth: TLabel
          Left = 256
          Top = 16
          Width = 60
          Height = 13
          Caption = 'G&utter width:'
          FocusControl = eGutterWidth
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object labFont2: TLabel
          Left = 8
          Top = 40
          Width = 24
          Height = 13
          Caption = '&Font:'
          FocusControl = cbGutterFont
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object labFontSize2: TLabel
          Left = 256
          Top = 40
          Width = 23
          Height = 13
          Caption = '&Size:'
          FocusControl = eGutterFontSize
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object eGutterWidth: THexEdit
          Left = 360
          Top = 12
          Width = 31
          Height = 21
          HelpContext = 181
          NumBase = ebDec
          MaxValue = 9999
          MinValue = 1
          TabOrder = 1
          Validate = True
          Value = 8
        end
        object spinGutterWidth: TUpDown
          Left = 391
          Top = 12
          Width = 13
          Height = 21
          HelpContext = 181
          Associate = eGutterWidth
          Min = 1
          Max = 9999
          Position = 8
          TabOrder = 2
        end
        object cbGutterVisible: TCheckBox
          Left = 60
          Top = 16
          Width = 145
          Height = 17
          HelpContext = 182
          Caption = '&Gutter visible'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbGutterFont: TFontComboBox
          Left = 58
          Top = 36
          Width = 167
          Height = 19
          HelpContext = 180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            '@Adobe Fangsong Std R'
            '@Adobe Heiti Std R'
            '@Adobe Kaiti Std R'
            '@Adobe Ming Std L'
            '@Adobe Myungjo Std M'
            '@Adobe Song Std L'
            '@Arial Unicode MS'
            '@Kozuka Gothic Pro B'
            '@Kozuka Gothic Pro EL'
            '@Kozuka Gothic Pro H'
            '@Kozuka Gothic Pro L'
            '@Kozuka Gothic Pro M'
            '@Kozuka Gothic Pro R'
            '@Kozuka Mincho Pro B'
            '@Kozuka Mincho Pro EL'
            '@Kozuka Mincho Pro H'
            '@Kozuka Mincho Pro L'
            '@Kozuka Mincho Pro M'
            '@Kozuka Mincho Pro R'
            '@MS Mincho'
            'Adobe Caslon Pro'
            'Adobe Caslon Pro Bold'
            'Adobe Fangsong Std R'
            'Adobe Garamond Pro'
            'Adobe Garamond Pro Bold'
            'Adobe Heiti Std R'
            'Adobe Kaiti Std R'
            'Adobe Ming Std L'
            'Adobe Myungjo Std M'
            'Adobe Song Std L'
            'Agency FB'
            'Algerian'
            'Arial'
            'Arial Baltic'
            'Arial Black'
            'Arial CE'
            'Arial CYR'
            'Arial Greek'
            'Arial Narrow'
            'Arial Rounded MT Bold'
            'Arial TUR'
            'Arial Unicode MS'
            'Baskerville Old Face'
            'Bauhaus 93'
            'Bell Gothic Std Black'
            'Bell Gothic Std Light'
            'Bell MT'
            'Berlin Sans FB'
            'Berlin Sans FB Demi'
            'Bernard MT Condensed'
            'Birch Std'
            'Blackadder ITC'
            'Blackoak Std'
            'Bodoni MT'
            'Bodoni MT Black'
            'Bodoni MT Condensed'
            'Bodoni MT Poster Compressed'
            'Book Antiqua'
            'Bookman Old Style'
            'Bookshelf Symbol 7'
            'Bradley Hand ITC'
            'Britannic Bold'
            'Broadway'
            'Brush Script MT'
            'Brush Script Std'
            'Calibri'
            'Californian FB'
            'Calisto MT'
            'Cambria'
            'Cambria Math'
            'Candara'
            'Castellar'
            'Centaur'
            'Century'
            'Century Gothic'
            'Century Schoolbook'
            'Chaparral Pro'
            'Charlemagne Std'
            'Chiller'
            'Colonna MT'
            'Comic Sans MS'
            'Consolas'
            'Constantia'
            'Cooper Black'
            'Cooper Std Black'
            'Copperplate Gothic Bold'
            'Copperplate Gothic Light'
            'Corbel'
            'Courier'
            'Courier New'
            'Courier New Baltic'
            'Courier New CE'
            'Courier New CYR'
            'Courier New Greek'
            'Courier New TUR'
            'Curlz MT'
            'DejaVu Sans'
            'DejaVu Sans Condensed'
            'DejaVu Sans Light'
            'DejaVu Sans Mono'
            'DejaVu Serif'
            'DejaVu Serif Condensed'
            'Eccentric Std'
            'Edwardian Script ITC'
            'Elephant'
            'Engravers MT'
            'Eras Bold ITC'
            'Eras Demi ITC'
            'Eras Light ITC'
            'Eras Medium ITC'
            'Estrangelo Edessa'
            'Euro Sign'
            'Felix Titling'
            'Fixedsys'
            'Footlight MT Light'
            'Forte'
            'Franklin Gothic Book'
            'Franklin Gothic Demi'
            'Franklin Gothic Demi Cond'
            'Franklin Gothic Heavy'
            'Franklin Gothic Medium'
            'Franklin Gothic Medium Cond'
            'Freestyle Script'
            'French Script MT'
            'Garamond'
            'Gautami'
            'Georgia'
            'Giddyup Std'
            'Gigi'
            'Gill Sans MT'
            'Gill Sans MT Condensed'
            'Gill Sans MT Ext Condensed Bold'
            'Gill Sans Ultra Bold'
            'Gill Sans Ultra Bold Condensed'
            'Gloucester MT Extra Condensed'
            'Goudy Old Style'
            'Goudy Stout'
            'Haettenschweiler'
            'Harlow Solid Italic'
            'Harrington'
            'High Tower Text'
            'Hobo Std'
            'Impact'
            'Imprint MT Shadow'
            'Informal Roman'
            'Jokerman'
            'Juice ITC'
            'Kartika'
            'Kozuka Gothic Pro B'
            'Kozuka Gothic Pro EL'
            'Kozuka Gothic Pro H'
            'Kozuka Gothic Pro L'
            'Kozuka Gothic Pro M'
            'Kozuka Gothic Pro R'
            'Kozuka Mincho Pro B'
            'Kozuka Mincho Pro EL'
            'Kozuka Mincho Pro H'
            'Kozuka Mincho Pro L'
            'Kozuka Mincho Pro M'
            'Kozuka Mincho Pro R'
            'Kristen ITC'
            'Kunstler Script'
            'Latha'
            'Letter Gothic Std'
            'Lithos Pro Regular'
            'Lucida Bright'
            'Lucida Calligraphy'
            'Lucida Console'
            'Lucida Fax'
            'Lucida Handwriting'
            'Lucida Sans'
            'Lucida Sans Typewriter'
            'Lucida Sans Unicode'
            'Magneto'
            'Maiandra GD'
            'Mangal'
            'Marlett'
            'Matura MT Script Capitals'
            'Mesquite Std'
            'Microsoft Sans Serif'
            'Minion Pro'
            'Minion Pro Cond'
            'Minion Pro Med'
            'Minion Pro SmBd'
            'Mistral'
            'Modern'
            'Modern No. 20'
            'Monotype Corsiva'
            'MS Mincho'
            'MS Outlook'
            'MS Reference Sans Serif'
            'MS Reference Specialty'
            'MS Sans Serif'
            'MS Serif'
            'MT Extra'
            'MV Boli'
            'Myriad Pro'
            'Myriad Pro Cond'
            'Myriad Pro Light'
            'Niagara Engraved'
            'Niagara Solid'
            'Nueva Std Cond'
            'OCR A Extended'
            'OCR A Std'
            'Old English Text MT'
            'Onyx'
            'OpenSymbol'
            'Orator Std'
            'Palace Script MT'
            'Palatino Linotype'
            'Papyrus'
            'Parchment'
            'Perpetua'
            'Perpetua Titling MT'
            'Playbill'
            'Poor Richard'
            'Poplar Std'
            'Prestige Elite Std'
            'Pristina'
            'Raavi'
            'Rage Italic'
            'Ravie'
            'Rockwell'
            'Rockwell Condensed'
            'Rockwell Extra Bold'
            'Roman'
            'Rosewood Std Regular'
            'Script'
            'Script MT Bold'
            'Segoe UI'
            'Showcard Gothic'
            'Shruti'
            'Small Fonts'
            'Snap ITC'
            'Stencil'
            'Stencil Std'
            'Sylfaen'
            'Symbol'
            'System'
            'Tahoma'
            'Tekton Pro'
            'Tekton Pro Cond'
            'Tekton Pro Ext'
            'Tempus Sans ITC'
            'Terminal'
            'Times New Roman'
            'Times New Roman Baltic'
            'Times New Roman CE'
            'Times New Roman CYR'
            'Times New Roman Greek'
            'Times New Roman TUR'
            'Trajan Pro'
            'Trebuchet MS'
            'Tunga'
            'Tw Cen MT'
            'Tw Cen MT Condensed'
            'Tw Cen MT Condensed Extra Bold'
            'Verdana'
            'Viner Hand ITC'
            'Vivaldi'
            'Vladimir Script'
            'Vrinda'
            'Webdings'
            'Wide Latin'
            'Wingdings'
            'Wingdings 2'
            'Wingdings 3'
            'WST_Czec'
            'WST_Engl'
            'WST_Fren'
            'WST_Germ'
            'WST_Ital'
            'WST_Span'
            'WST_Swed'
            'ZWAdobeF')
          ParentFont = False
          TabOrder = 3
          Text = '@Adobe Fangsong Std R'
          OnChange = cbEditorFontChange
        end
        object eGutterFontSize: THexEdit
          Left = 360
          Top = 36
          Width = 31
          Height = 21
          HelpContext = 181
          NumBase = ebDec
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Validate = False
          Value = 6
          OnChange = eFontSizeChange
        end
        object spinGutterFontSize: TUpDown
          Left = 391
          Top = 36
          Width = 13
          Height = 21
          HelpContext = 181
          Associate = eGutterFontSize
          Min = 6
          Max = 128
          Position = 6
          TabOrder = 5
        end
      end
      object cbGroupUndo: TCheckBox
        Left = 8
        Top = 208
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = 'Group undo'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object cbSmartTabs: TCheckBox
        Left = 8
        Top = 168
        Width = 185
        Height = 17
        HelpContext = 182
        Caption = 'S&mart tabs'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object cbTabIndent: TCheckBox
        Left = 216
        Top = 216
        Width = 205
        Height = 17
        HelpContext = 182
        Caption = 'Tab Indent'
        TabOrder = 25
        OnClick = SetEnables
      end
      object cbWordwrapByDefault: TCheckBox
        Left = 8
        Top = 308
        Width = 357
        Height = 17
        HelpContext = 182
        Caption = 'Wordwrap by default'
        Checked = True
        State = cbChecked
        TabOrder = 15
      end
      object cbShowWordwrapGlyph: TCheckBox
        Left = 8
        Top = 288
        Width = 357
        Height = 17
        HelpContext = 182
        Caption = 'Show wordwrap glyph'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
    end
    object pgColors: TTabSheet
      Caption = 'Colors'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object labHighlighter: TLabel
        Left = 12
        Top = 12
        Width = 53
        Height = 13
        Caption = '&Highlighter:'
        FocusControl = cbHL
      end
      object labFg: TLabel
        Left = 224
        Top = 84
        Width = 57
        Height = 13
        Caption = '&Foreground:'
        FocusControl = cbFgColor
      end
      object labBg: TLabel
        Left = 224
        Top = 112
        Width = 61
        Height = 13
        Caption = 'Ba&ckground:'
        FocusControl = cbBgColor
      end
      object imgExternalHL: TImage
        Left = 388
        Top = 12
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          07544269746D6170F6000000424DF60000000000000076000000280000001000
          0000100000000100040000000000800000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00EEEEEEEEE70EEEEEEEEEE70EE70EE78EEE0077077700778EE3BB7F870FB0
          78F0E3BB77F8BFBB8F07E3BB707BB77BB877E3BB0BBB7887BBF7E3BBB7877B87
          7B7EE3BBB7F87B878F7EE3BBB00B7B87B88EE3BBBBBB7FF7B30EE33BBBBBB773
          33EEEE3FFBBB3EEEEEEEEEE33333EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEE}
        Transparent = True
        Visible = False
      end
      object imgInternalHL: TImage
        Left = 408
        Top = 12
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          07544269746D6170F6000000424DF60000000000000076000000280000001000
          0000100000000100040000000000800000000000000000000000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00EEEEEEEEE70EEEEEEEEEE70EE70EE78EEEEE77077700778EEEEE7F870FB0
          78F0EEEE77F8BFBB8F07EEEE707BB77BB877EEEE0BBB7887BBF7EEEEE7877B87
          7B7EEEEEE7F87B878F7EEEEEE00E7B87B88EEEEEEEEE7FF7BEEEEEEEEEEEE77E
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEE}
        Transparent = True
        Visible = False
      end
      object labHLBlockBegin: TLabel
        Left = 12
        Top = 364
        Width = 59
        Height = 13
        Caption = 'Bloc&k begin:'
        FocusControl = eHLBlockBegin
      end
      object labHLBlockEnd: TLabel
        Left = 12
        Top = 388
        Width = 51
        Height = 13
        Caption = 'Block &end:'
        FocusControl = eHLBlockEnd
      end
      object labHighlighterDescription: TLabel
        Left = 12
        Top = 36
        Width = 56
        Height = 13
        Caption = 'Description:'
        FocusControl = cbHL
      end
      object lbHLItems: TListBox
        Left = 12
        Top = 80
        Width = 201
        Height = 245
        HelpContext = 189
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        OnClick = lbHLItemsClick
      end
      object cbHL: TComboBox
        Left = 120
        Top = 8
        Width = 265
        Height = 22
        HelpContext = 188
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        OnChange = cbHLChange
        OnDrawItem = cbHLDrawItem
      end
      object pnSampleColor: TPanel
        Left = 232
        Top = 204
        Width = 157
        Height = 33
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'Sample text'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object cbUnderline: TCheckBox
        Left = 224
        Top = 172
        Width = 110
        Height = 17
        Caption = '&Underline'
        TabOrder = 5
        OnClick = cbFontStyleChange
      end
      object cbItalic: TCheckBox
        Left = 224
        Top = 152
        Width = 110
        Height = 17
        Caption = '&Italic'
        TabOrder = 4
        OnClick = cbFontStyleChange
      end
      object cbBold: TCheckBox
        Left = 224
        Top = 132
        Width = 110
        Height = 17
        Caption = '&Bold'
        TabOrder = 3
        OnClick = cbFontStyleChange
      end
      object cbHighlightCurrentLine: TCheckBox
        Left = 224
        Top = 284
        Width = 201
        Height = 17
        Caption = 'High&light current line'
        TabOrder = 9
        OnClick = cbHighlightCurrentLineClick
      end
      object cbFgColor: TColorBtn
        Left = 348
        Top = 80
        Width = 37
        Height = 22
        ActiveColor = clBlack
        TargetColor = clBlack
        Flat = False
        DropDownFlat = True
        AutomaticColor = clBlack
        IsAutomatic = True
        BeforeDropDown = cbFgColorDefaultSelect
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
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000808080000000000000000000000000000000000080808000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C0008080
          8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000C0C0
          C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C0000000
          0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
        AutoBtnCaption = '&Default color'
        OtherBtnCaption = '&Custom color'
        RegKey = 'Palette0'
      end
      object cbBgColor: TColorBtn
        Left = 348
        Top = 108
        Width = 37
        Height = 22
        ActiveColor = clBlack
        TargetColor = clBlack
        Flat = False
        DropDownFlat = True
        AutomaticColor = clBlack
        IsAutomatic = True
        BeforeDropDown = cbBgColorDefaultSelect
        GlyphType = gtBackground
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
      object cbOverrideTxtFgColor: TCheckBox
        Left = 224
        Top = 304
        Width = 201
        Height = 17
        Caption = '&Override foreground text colors'
        TabOrder = 10
        OnClick = cbOverrideTxtFgColorClick
      end
      object eHLBlockBegin: TEdit
        Left = 104
        Top = 360
        Width = 69
        Height = 21
        TabOrder = 12
        OnChange = eHLBlockBeginChange
      end
      object eHLBlockEnd: TEdit
        Left = 104
        Top = 384
        Width = 69
        Height = 21
        TabOrder = 13
        OnChange = eHLBlockEndChange
      end
      object cbHLBlockAutoindent: TCheckBox
        Left = 12
        Top = 340
        Width = 201
        Height = 17
        Caption = 'Block au&toindent'
        TabOrder = 11
        OnClick = cbHLBlockAutoindentClick
      end
      object memoHighlighterDescription: TMemo
        Left = 120
        Top = 32
        Width = 265
        Height = 45
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
      end
    end
    object pgExecKeys: TTabSheet
      Caption = 'Execute Keys'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Bevel1: TBevel
        Left = 8
        Top = 336
        Width = 413
        Height = 4
        Shape = bsTopLine
      end
      object labExecOptParameters: TLabel
        Left = 12
        Top = 340
        Width = 97
        Height = 13
        Caption = 'Optional parameters:'
      end
      object Label16: TLabel
        Left = 12
        Top = 356
        Width = 14
        Height = 13
        Caption = '%n'
      end
      object Label17: TLabel
        Left = 12
        Top = 372
        Width = 11
        Height = 13
        Caption = '%f'
      end
      object Label18: TLabel
        Left = 12
        Top = 388
        Width = 14
        Height = 13
        Caption = '%F'
      end
      object labExecParam_ff: TLabel
        Left = 32
        Top = 388
        Width = 105
        Height = 13
        Caption = '- file name without ext.'
      end
      object labExecParam_f: TLabel
        Left = 32
        Top = 372
        Width = 70
        Height = 13
        Caption = '- file name only'
      end
      object labExecParam_n: TLabel
        Left = 32
        Top = 356
        Width = 94
        Height = 13
        Caption = '- file name with path'
      end
      object labExecParam_opt1: TLabel
        Left = 196
        Top = 436
        Width = 161
        Height = 13
        Caption = '- executes parameters input dialog'
      end
      object Label27: TLabel
        Left = 176
        Top = 436
        Width = 14
        Height = 13
        Caption = '%?'
      end
      object labExecParam_p: TLabel
        Left = 32
        Top = 404
        Width = 65
        Height = 13
        Caption = '- file path only'
      end
      object Label31: TLabel
        Left = 12
        Top = 404
        Width = 14
        Height = 13
        Caption = '%p'
      end
      object labExecParam_percent: TLabel
        Left = 196
        Top = 420
        Width = 64
        Height = 13
        Caption = '- percent sign'
      end
      object Label24: TLabel
        Left = 176
        Top = 420
        Width = 16
        Height = 13
        Caption = '%%'
      end
      object Label1: TLabel
        Left = 12
        Top = 436
        Width = 13
        Height = 13
        Caption = '%s'
      end
      object labExecParam_s: TLabel
        Left = 32
        Top = 436
        Width = 86
        Height = 13
        Caption = '- '#39'Start in'#39' directory'
      end
      object Label3: TLabel
        Left = 12
        Top = 420
        Width = 14
        Height = 13
        Caption = '%e'
      end
      object labExecParam_e: TLabel
        Left = 32
        Top = 420
        Width = 67
        Height = 13
        Caption = '- file extension'
      end
      object Label4: TLabel
        Left = 176
        Top = 388
        Width = 14
        Height = 13
        Caption = '%c'
      end
      object labExecParam_c: TLabel
        Left = 196
        Top = 388
        Width = 114
        Height = 13
        Caption = '- current column number'
      end
      object Label6: TLabel
        Left = 176
        Top = 372
        Width = 10
        Height = 13
        Caption = '%l'
      end
      object labExecParam_l: TLabel
        Left = 196
        Top = 372
        Width = 96
        Height = 13
        Caption = '- current line number'
      end
      object Label8: TLabel
        Left = 176
        Top = 404
        Width = 16
        Height = 13
        Caption = '%w'
      end
      object labExecParam_w: TLabel
        Left = 196
        Top = 404
        Width = 91
        Height = 13
        Caption = '- word under cursor'
      end
      object Label5: TLabel
        Left = 176
        Top = 356
        Width = 15
        Height = 13
        Caption = '%P'
      end
      object labExecParam_pp: TLabel
        Left = 196
        Top = 356
        Width = 113
        Height = 13
        Caption = '- file specific parameters'
      end
      object btnExecExtAdd: TButton
        Left = 9
        Top = 308
        Width = 56
        Height = 21
        Caption = 'A&dd'
        TabOrder = 1
        OnClick = btnExecExtAddClick
      end
      object btnExecExtDelete: TButton
        Left = 123
        Top = 308
        Width = 56
        Height = 21
        Caption = 'De&lete'
        TabOrder = 3
        OnClick = btnExecExtDeleteClick
      end
      object btnExecExtEdit: TButton
        Left = 66
        Top = 308
        Width = 56
        Height = 21
        Caption = 'Ed&it'
        TabOrder = 2
        OnClick = btnExecExtEditClick
      end
      object treeExec: TTreeView
        Left = 8
        Top = 12
        Width = 173
        Height = 289
        HideSelection = False
        Indent = 19
        ReadOnly = True
        ShowRoot = False
        TabOrder = 0
        OnChange = treeExecChange
        OnClick = treeExecClick
      end
      object pnExecEditControls: TPanel
        Left = 184
        Top = 8
        Width = 245
        Height = 281
        BevelOuter = bvNone
        TabOrder = 4
        object labExecute: TLabel
          Left = 4
          Top = 4
          Width = 42
          Height = 13
          Caption = 'E&xecute:'
          FocusControl = eExecCommand
        end
        object labExecParameters: TLabel
          Left = 4
          Top = 88
          Width = 56
          Height = 13
          Caption = '&Parameters:'
          FocusControl = eExecParams
        end
        object labExecHint: TLabel
          Left = 4
          Top = 136
          Width = 22
          Height = 13
          Caption = '&Hint:'
          FocusControl = eExecHint
        end
        object labExecWindow: TLabel
          Left = 4
          Top = 112
          Width = 42
          Height = 13
          Caption = '&Window:'
          FocusControl = cbExecWindow
        end
        object labExecStartDir: TLabel
          Left = 4
          Top = 44
          Width = 36
          Height = 13
          Caption = 'S&tart in:'
          FocusControl = eExecStartDir
        end
        object labExecParserRule: TLabel
          Left = 22
          Top = 220
          Width = 128
          Height = 13
          Caption = 'C&ompiler output parser rule:'
          FocusControl = eCompilerParserRule
        end
        object btnCompilerParserRuleHelp: TSpeedButton
          Left = 216
          Top = 236
          Width = 21
          Height = 21
          Flat = True
          Glyph.Data = {
            9A000000424D9A00000000000000760000002800000006000000090000000100
            0400000000002400000000000000000000001000000010000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000001100000011
            000000000000001100000011000000011000110011001100110001111000}
          Layout = blGlyphRight
          OnClick = btnCompilerParserRuleHelpClick
        end
        object labExecSave: TLabel
          Left = 4
          Top = 160
          Width = 28
          Height = 13
          Caption = '&Save:'
          FocusControl = cbExecSaveMode
        end
        object btnExecBrowse: TButton
          Left = 216
          Top = 20
          Width = 21
          Height = 21
          Caption = '...'
          TabOrder = 1
          OnClick = btnExecBrowseClick
        end
        object eExecParams: TEdit
          Left = 76
          Top = 84
          Width = 161
          Height = 21
          MaxLength = 254
          TabOrder = 3
          OnChange = eExecParamsChange
        end
        object eExecHint: TEdit
          Left = 76
          Top = 132
          Width = 161
          Height = 21
          MaxLength = 63
          TabOrder = 5
          OnChange = eExecHintChange
        end
        object cbExecWindow: TComboBox
          Left = 76
          Top = 108
          Width = 109
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          OnChange = cbExecWindowChange
          Items.Strings = (
            'Normal'
            'Minimized'
            'Maximized')
        end
        object eExecStartDir: TEdit
          Left = 4
          Top = 60
          Width = 233
          Height = 21
          MaxLength = 254
          TabOrder = 2
          OnChange = eExecStartDirChange
        end
        object cbExecCaptureOutput: TCheckBox
          Left = 4
          Top = 200
          Width = 225
          Height = 17
          HelpContext = 182
          Caption = '&Capture console output'
          TabOrder = 8
          OnClick = cbExecCaptureOutputClick
        end
        object cbExecUseShortNames: TCheckBox
          Left = 4
          Top = 180
          Width = 225
          Height = 17
          HelpContext = 182
          Caption = '&Use short DOS names'
          TabOrder = 7
          OnClick = cbExecUseShortNamesClick
        end
        object eExecCommand: TEdit
          Left = 4
          Top = 20
          Width = 209
          Height = 21
          MaxLength = 254
          TabOrder = 0
          OnChange = eExecCommandChange
        end
        object eCompilerParserRule: TEdit
          Left = 22
          Top = 236
          Width = 191
          Height = 21
          TabOrder = 9
          OnChange = eCompilerParserRuleChange
        end
        object cbExecSaveMode: TComboBox
          Left = 76
          Top = 156
          Width = 161
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 6
          OnChange = cbExecSaveModeChange
        end
        object cbExecScrollConsole: TCheckBox
          Left = 4
          Top = 264
          Width = 241
          Height = 17
          Caption = 'Sc&roll console to the last line'
          TabOrder = 10
          OnClick = cbExecScrollConsoleClick
        end
      end
      object cbExecPauseAfter: TCheckBox
        Left = 188
        Top = 292
        Width = 241
        Height = 17
        Caption = 'Paus&e after execution'
        TabOrder = 5
        OnClick = cbExecPauseAfterClick
      end
      object cbExecIdlePriority: TCheckBox
        Left = 188
        Top = 312
        Width = 241
        Height = 17
        Caption = 'Idle p&riority'
        TabOrder = 6
        OnClick = cbExecIdlePriorityClick
      end
    end
    object pgAssociations: TTabSheet
      Caption = 'Associations'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gbFileAssociations: TGroupBox
        Left = 8
        Top = 16
        Width = 413
        Height = 213
        Caption = ' File associations: '
        TabOrder = 0
        object labFileAssociationsHelp: TLabel
          Left = 8
          Top = 168
          Width = 397
          Height = 33
          AutoSize = False
          Caption = 
            'Specify the file types/extensions that you wish to be opened aut' +
            'omatically by ConTEXT when double clicked in the Explorer.'
          WordWrap = True
        end
        object lbAssoc: TListBox
          Left = 8
          Top = 28
          Width = 173
          Height = 133
          ItemHeight = 13
          TabOrder = 0
        end
        object btnExtAdd: TButton
          Left = 192
          Top = 28
          Width = 75
          Height = 23
          Caption = 'A&dd'
          TabOrder = 1
          OnClick = btnExtAddClick
        end
        object btnExtRemove: TButton
          Left = 192
          Top = 56
          Width = 75
          Height = 23
          Caption = '&Remove'
          TabOrder = 2
          OnClick = btnExtRemoveClick
        end
      end
      object pnAssocWait: TPanel
        Left = 36
        Top = 124
        Width = 357
        Height = 37
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'Please wait while registry is being scanned...'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object pgMisc: TTabSheet
      Caption = 'Miscellaneous'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object labDefaultSQLDialect: TLabel
        Left = 12
        Top = 12
        Width = 95
        Height = 13
        Caption = '&Default SQL dialect:'
        FocusControl = cbSQLDialect
      end
      object cbSQLDialect: TComboBox
        Left = 172
        Top = 8
        Width = 185
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Standard'
          'Interbase6'
          'MSSQL7'
          'MySQL'
          'Oracle'
          'Sybase'
          'Ingres'
          'MSSQL2K')
      end
      object gbHelpFiles: TGroupBox
        Left = 8
        Top = 44
        Width = 413
        Height = 401
        Caption = 'Help files'
        TabOrder = 1
        object lvHelpFiles: TListView
          Left = 8
          Top = 24
          Width = 397
          Height = 337
          Columns = <
            item
              Caption = 'File type'
              Width = 130
            end
            item
              Caption = 'Help file'
              Width = 245
            end>
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = btnHelpFileEditClick
        end
        object btnHelpFileEdit: TButton
          Left = 250
          Top = 368
          Width = 75
          Height = 23
          Caption = '&Edit'
          TabOrder = 1
          OnClick = btnHelpFileEditClick
        end
        object btnHelpFileClear: TButton
          Left = 330
          Top = 368
          Width = 75
          Height = 23
          Caption = '&Clear'
          TabOrder = 2
          OnClick = btnHelpFileClearClick
        end
      end
    end
  end
  object btnOK: TButton
    Left = 204
    Top = 508
    Width = 75
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnApply: TButton
    Left = 284
    Top = 508
    Width = 75
    Height = 23
    Caption = '&Apply'
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 364
    Top = 508
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object assExt: TMILAssociate
    ShellCmd = 'Open'
    Left = 8
    Top = 504
  end
end
