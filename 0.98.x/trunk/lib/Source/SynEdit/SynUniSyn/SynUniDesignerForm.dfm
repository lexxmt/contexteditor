object fmDesigner: TfmDesigner
  Left = 250
  Top = 265
  Width = 640
  Height = 453
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'TSynUniDesigner'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000018001800680300001600000028000000100000002000
    0000010018000000000040030000000000000000000000000001000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000393032393032393032393032393032393032
    3930323930323930323930323930323930323930323930323930323930323930
    320AD5F00AD5F00AD5F03930320AD5F00AD5F00AD5F08D67673930328D676739
    30328D67678D67678D67673930323930320AD5F00AD5F00AD5F03930320AD5F0
    0AD5F08D6767000000CFA7A80000008D67673930328D67678D67673930323930
    320AD5F00AD5F00AD5F03930320AD5F08D6767CDA2A4CDA2A4C99C9ECDA2A4CF
    A7A83333338D67678D67673930323930323930323930323930323930328A6566
    8D6767D6BEBF8D67670000008D6767CDA2A43930323333338D67673930323930
    321518EC1518EC1518EC3930328D6767E3D8D8E3D8D8000000F3C9CB000000C9
    9C9ECFA7A83333338D67673930323930321518EC1518EC1518EC3930328D6767
    8D6767F5F0F08D67670000008D6767CDA2A43930323333338D67673930323930
    321518EC1518EC1518EC393032FF99FF8D6767FFFFFFF5F0F0E3D8D8D6BEBFCD
    A2A43333338D67678D6767393032393032393032393032393032393032393032
    8D67678D6767000000E3D8D80000003333333333338D67678D67673930323930
    32FF100AFF100AFF100A393032FFC333FFC333FFC3338D67678D67673333338D
    67678D67678D67678D6767393032393032FF100AFF100AFF100A393032FFC333
    FFC333FFC3333930320CE3170CE3170CE3173930328D67678D67673930323930
    3239303239303239303239303239303239303239303239303239303239303239
    30323930323930323930323930323930328D67678D67678D67678D67678D6767
    8D67678D67678D67678D67678D67678D67678D67678D67678D67673930323930
    328D67678D67678D67678D67678D67678D67678D67678D67678D67678D67678D
    6767FFFFFF8D6767FFFFFF393032393032393032393032393032393032393032
    3930323930323930323930323930323930323930323930323930323930320000
    3239000032390000323900003239000032390000323900003239000032390000
    323900003239000032390000323900003239000032390000323900003239}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterBottom: TSplitter
    Left = 0
    Top = 210
    Width = 632
    Height = 3
    Cursor = crVSplit
    Align = alTop
    MinSize = 17
    ResizeStyle = rsUpdate
    OnCanResize = SplitterBottomCanResize
  end
  object SplitterButtons: TSplitter
    Left = 0
    Top = 369
    Width = 632
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    MinSize = 35
    ResizeStyle = rsUpdate
    OnCanResize = SplitterCannotResize
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 407
    Width = 632
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object pTop: TPanel
    Tag = -1
    Left = 0
    Top = 0
    Width = 632
    Height = 210
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object SplitterLeft: TSplitter
      Left = 185
      Top = 1
      Height = 208
      MinSize = 122
    end
    object SplitterRight: TSplitter
      Left = 528
      Top = 1
      Height = 208
      Align = alRight
      ResizeStyle = rsUpdate
      OnCanResize = SplitterCannotResize
    end
    object pLeft: TPanel
      Left = 1
      Top = 1
      Width = 184
      Height = 208
      Align = alLeft
      BevelInner = bvLowered
      BevelOuter = bvNone
      Constraints.MinWidth = 122
      TabOrder = 0
      DesignSize = (
        184
        208)
      object Bevel1: TBevel
        Left = 1
        Top = 16
        Width = 182
        Height = 1
        Align = alTop
        Style = bsRaised
      end
      object pLeftParentCapt: TPanel
        Left = 1
        Top = 1
        Width = 182
        Height = 15
        Align = alTop
        BevelOuter = bvNone
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCaptionText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = popPanels
        TabOrder = 0
        object lbRootMenu: TLabel
          Left = 0
          Top = 0
          Width = 16
          Height = 15
          Hint = 'Tree Menu'
          Align = alLeft
          Caption = 'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -15
          Font.Name = 'Marlett'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = lbRootMenuClick
          OnContextPopup = LabelContextPopup
        end
        object pLeftCapt: TPanel
          Left = 16
          Top = 0
          Width = 166
          Height = 15
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Rules'#39' Tree'
          Color = clActiveCaption
          TabOrder = 0
        end
      end
      object pTree: TPanel
        Left = 4
        Top = 20
        Width = 176
        Height = 184
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 1
        object Tree: TTreeView
          Left = 0
          Top = 0
          Width = 176
          Height = 184
          Align = alClient
          ChangeDelay = 1
          HideSelection = False
          Images = listRules
          Indent = 19
          RowSelect = True
          TabOrder = 0
          OnChange = TreeChange
          OnClick = TreeClick
          OnEdited = TreeEdited
          OnKeyDown = TreeKeyDown
          OnMouseDown = TreeMouseDown
          OnMouseUp = TreeMouseUp
        end
      end
    end
    object pRight: TPanel
      Left = 531
      Top = 1
      Width = 100
      Height = 208
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 2
      object Bevel2: TBevel
        Left = 1
        Top = 16
        Width = 98
        Height = 1
        Align = alTop
        Style = bsRaised
      end
      object pRightCapt: TPanel
        Left = 1
        Top = 1
        Width = 98
        Height = 15
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Attributes'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCaptionText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = popPanels
        TabOrder = 0
      end
      object pAttri: TPanel
        Left = 1
        Top = 17
        Width = 98
        Height = 190
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 98
          Height = 190
          ActivePage = TabSheet1
          Align = alClient
          MultiLine = True
          Style = tsFlatButtons
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Style'
            TabVisible = False
            object Bevel6: TBevel
              Tag = 118
              Left = 0
              Top = 43
              Width = 90
              Height = 2
            end
            object Label2: TLabel
              Left = 2
              Top = 0
              Width = 63
              Height = 13
              Caption = 'Choose style:'
              Enabled = False
            end
            object Label4: TLabel
              Left = 2
              Top = 48
              Width = 64
              Height = 13
              Caption = 'Change style:'
            end
            object chStrikeOut: TCheckBox
              Left = 3
              Top = 157
              Width = 86
              Height = 17
              Caption = 'Strike&Out'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsStrikeOut]
              ParentFont = False
              TabOrder = 8
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object chUnderline: TCheckBox
              Left = 3
              Top = 141
              Width = 86
              Height = 17
              Caption = '&Underline'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              TabOrder = 7
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object chItalic: TCheckBox
              Left = 3
              Top = 125
              Width = 86
              Height = 17
              Caption = '&Italic'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 6
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object chBold: TCheckBox
              Left = 3
              Top = 109
              Width = 86
              Height = 17
              Caption = '&Bold'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object pForeColorBox: TPanel
              Left = 2
              Top = 82
              Width = 41
              Height = 23
              TabOrder = 2
              object pForeColor: TPanel
                Left = 2
                Top = 2
                Width = 28
                Height = 18
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 0
                OnClick = PanelColorChange
                OnMouseUp = pColorMouseUp
              end
              object pForeColorArrow: TPanel
                Left = 31
                Top = 2
                Width = 8
                Height = 18
                BevelOuter = bvNone
                Caption = 'u'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Marlett'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnMouseUp = pColorArrowMouseUp
              end
            end
            object pBackColorBox: TPanel
              Left = 48
              Top = 82
              Width = 41
              Height = 22
              TabOrder = 4
              object pBackColor: TPanel
                Left = 2
                Top = 2
                Width = 28
                Height = 18
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 0
                OnClick = PanelColorChange
                OnMouseUp = pColorMouseUp
              end
              object pBackColorArrow: TPanel
                Left = 31
                Top = 2
                Width = 8
                Height = 18
                BevelOuter = bvNone
                Caption = 'u'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Marlett'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnMouseUp = pColorArrowMouseUp
              end
            end
            object chForeground: TCheckBox
              Left = 2
              Top = 64
              Width = 41
              Height = 17
              Caption = 'D&FG'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object chBackground: TCheckBox
              Left = 48
              Top = 64
              Width = 41
              Height = 17
              Caption = 'DB&G'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object cbStyle: TComboBox
              Left = 0
              Top = 16
              Width = 90
              Height = 21
              Style = csDropDownList
              Color = clBtnFace
              DropDownCount = 16
              Enabled = False
              ItemHeight = 13
              TabOrder = 0
              OnChange = AttributesChanged
              Items.Strings = (
                'Root'
                'Comments'
                'Strings'
                'Reserved words'
                'Statements'
                'Numbers'
                'Symbols'
                'Directives'
                'Types'
                'Variables'
                'Functions'
                ''
                'New style...')
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Default'
            ImageIndex = 1
            TabVisible = False
            object CheckBox1: TCheckBox
              Left = 3
              Top = 93
              Width = 86
              Height = 17
              Caption = 'Strike&Out'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsStrikeOut]
              ParentFont = False
              TabOrder = 0
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object CheckBox2: TCheckBox
              Left = 3
              Top = 77
              Width = 86
              Height = 17
              Caption = '&Underline'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              TabOrder = 1
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object CheckBox3: TCheckBox
              Left = 3
              Top = 61
              Width = 86
              Height = 17
              Caption = '&Italic'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 2
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object CheckBox4: TCheckBox
              Left = 3
              Top = 45
              Width = 86
              Height = 17
              Caption = '&Bold'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object Panel2: TPanel
              Left = 2
              Top = 18
              Width = 41
              Height = 23
              TabOrder = 4
              object Panel3: TPanel
                Left = 2
                Top = 2
                Width = 28
                Height = 18
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 0
                OnClick = PanelColorChange
                OnMouseUp = pColorMouseUp
              end
              object Panel4: TPanel
                Left = 31
                Top = 2
                Width = 8
                Height = 18
                BevelOuter = bvNone
                Caption = 'u'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Marlett'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnMouseUp = pColorArrowMouseUp
              end
            end
            object Panel5: TPanel
              Left = 48
              Top = 18
              Width = 41
              Height = 22
              TabOrder = 5
              object Panel6: TPanel
                Left = 2
                Top = 2
                Width = 28
                Height = 18
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 0
                OnClick = PanelColorChange
                OnMouseUp = pColorMouseUp
              end
              object Panel7: TPanel
                Left = 31
                Top = 2
                Width = 8
                Height = 18
                BevelOuter = bvNone
                Caption = 'u'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Marlett'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnMouseUp = pColorArrowMouseUp
              end
            end
            object CheckBox5: TCheckBox
              Left = 2
              Top = 0
              Width = 41
              Height = 17
              Caption = 'D&FG'
              Checked = True
              State = cbChecked
              TabOrder = 6
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object CheckBox6: TCheckBox
              Left = 48
              Top = 0
              Width = 41
              Height = 17
              Caption = 'DB&G'
              Checked = True
              State = cbChecked
              TabOrder = 7
              OnClick = AttributesChanged
              OnMouseDown = CheckBoxMouseDown
            end
            object CheckBox7: TCheckBox
              Left = 0
              Top = 152
              Width = 90
              Height = 17
              Caption = 'Save defaults'
              TabOrder = 8
            end
            object Button1: TButton
              Left = 0
              Top = 171
              Width = 90
              Height = 21
              Caption = 'Get from Style'
              TabOrder = 9
            end
          end
        end
      end
    end
    object pMiddle: TPanel
      Left = 188
      Top = 1
      Width = 340
      Height = 208
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      OnResize = pMiddleResize
      object Bevel4: TBevel
        Left = 1
        Top = 16
        Width = 338
        Height = 1
        Align = alTop
        Style = bsRaised
      end
      object pMiddleParentCapt: TPanel
        Left = 1
        Top = 1
        Width = 338
        Height = 15
        Align = alTop
        BevelOuter = bvNone
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCaptionText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = popPanels
        TabOrder = 0
        object lbPropBack: TLabel
          Left = 0
          Top = 0
          Width = 16
          Height = 15
          Hint = 'Back'
          Align = alLeft
          Caption = '3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -15
          Font.Name = 'Marlett'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = lbPropBackClick
          OnContextPopup = LabelContextPopup
        end
        object lbRuleMenu: TLabel
          Left = 322
          Top = 0
          Width = 16
          Height = 15
          Hint = 'Rule Menu'
          Align = alRight
          Caption = 'u'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -15
          Font.Name = 'Marlett'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = lbRuleMenuClick
          OnContextPopup = LabelContextPopup
        end
        object pMiddleCapt: TPanel
          Left = 16
          Top = 0
          Width = 306
          Height = 15
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Properties'
          Color = clActiveCaption
          TabOrder = 0
        end
      end
      object PageControl: TPageControl
        Left = 1
        Top = 17
        Width = 338
        Height = 190
        ActivePage = tabRoot
        Align = alClient
        Constraints.MinWidth = 118
        Style = tsFlatButtons
        TabOrder = 1
        TabStop = False
        object tabRoot: TTabSheet
          Caption = 'tabRoot'
          PopupMenu = popRootMenu
          TabVisible = False
          OnShow = tabRootShow
          DesignSize = (
            330
            180)
          object lbDelimitersRoot: TLabel
            Left = 0
            Top = 134
            Width = 45
            Height = 13
            Caption = '&Delimiters'
            FocusControl = edDelimitersRoot
          end
          object Label3: TLabel
            Left = 0
            Top = 80
            Width = 70
            Height = 13
            Caption = 'File with styles:'
            Enabled = False
            Visible = False
          end
          object Label5: TLabel
            Left = 0
            Top = 104
            Width = 67
            Height = 13
            Caption = 'Color scheme:'
            Enabled = False
            Visible = False
          end
          object chCaseRoot: TCheckBox
            Left = 0
            Top = 0
            Width = 200
            Height = 17
            Caption = '&Case Sensitive'
            TabOrder = 0
            OnClick = RootChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chEnabledRoot: TCheckBox
            Left = 268
            Top = 0
            Width = 60
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = '&Enabled'
            TabOrder = 1
            OnClick = RootChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object edDelimitersRoot: TEdit
            Left = 70
            Top = 131
            Width = 259
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            PopupMenu = popStandard
            TabOrder = 2
            OnChange = RootChange
            OnContextPopup = EditContextPopup
            OnKeyDown = EditKeyDown
          end
          object pRootButtons: TPanel
            Left = 0
            Top = 156
            Width = 329
            Height = 24
            BevelOuter = bvNone
            TabOrder = 3
            object btAddRangeRoot: TButton
              Left = 0
              Top = 0
              Width = 108
              Height = 24
              Caption = 'Add &Range'
              TabOrder = 0
              OnClick = DoAddRangeToRoot
            end
            object btAddKeywordsRoot: TButton
              Left = 110
              Top = 0
              Width = 109
              Height = 24
              Caption = 'Add &Keywords'
              TabOrder = 1
              OnClick = DoAddKeywordToRoot
            end
            object btAddSetRoot: TButton
              Left = 221
              Top = 0
              Width = 108
              Height = 24
              Caption = 'Add &Set'
              TabOrder = 2
              OnClick = DoAddSetToRoot
            end
          end
          object edStylesFile: TEdit
            Left = 70
            Top = 76
            Width = 236
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            Enabled = False
            PopupMenu = popStandard
            TabOrder = 4
            Text = 'Standart.clr'
            Visible = False
            OnChange = RootChange
          end
          object btStylesFile: TButton
            Left = 310
            Top = 76
            Width = 20
            Height = 20
            Anchors = [akTop, akRight]
            Caption = '...'
            Enabled = False
            TabOrder = 5
            TabStop = False
            Visible = False
            OnClick = btStylesFileClick
          end
          object ComboBox2: TComboBox
            Left = 70
            Top = 100
            Width = 262
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            Enabled = False
            ItemHeight = 13
            TabOrder = 6
            Visible = False
            Items.Strings = (
              'Standard'
              'Twinight'
              'FAR'
              'Visual Studio')
          end
          object Button4: TButton
            Left = 232
            Top = 48
            Width = 97
            Height = 25
            Caption = 'Add link to range'
            TabOrder = 7
            Visible = False
            OnClick = DoAddRangeLink
          end
          object GroupBox1: TGroupBox
            Left = 1
            Top = 24
            Width = 329
            Height = 97
            Caption = ' Some Information '
            TabOrder = 8
            object Label12: TLabel
              Left = 8
              Top = 24
              Width = 31
              Height = 13
              Caption = 'Name:'
            end
            object Label13: TLabel
              Left = 8
              Top = 48
              Width = 54
              Height = 13
              Caption = 'Extensions:'
            end
            object Label14: TLabel
              Left = 8
              Top = 72
              Width = 34
              Height = 13
              Caption = 'Author:'
            end
            object edName: TEdit
              Left = 72
              Top = 20
              Width = 249
              Height = 21
              PopupMenu = popStandard
              TabOrder = 0
              OnChange = RootChange
              OnContextPopup = EditContextPopup
              OnKeyDown = EditKeyDown
            end
            object edExtensions: TEdit
              Left = 72
              Top = 44
              Width = 249
              Height = 21
              PopupMenu = popStandard
              TabOrder = 1
              OnChange = RootChange
              OnContextPopup = EditContextPopup
              OnKeyDown = EditKeyDown
            end
            object edAuthor: TEdit
              Left = 72
              Top = 68
              Width = 249
              Height = 21
              PopupMenu = popStandard
              TabOrder = 2
              OnChange = RootChange
              OnContextPopup = EditContextPopup
              OnKeyDown = EditKeyDown
            end
          end
        end
        object tabRange: TTabSheet
          Caption = 'tabRange'
          ImageIndex = 1
          PopupMenu = popRangeMenu
          TabVisible = False
          OnShow = tabRangeShow
          DesignSize = (
            330
            180)
          object lbDelimitersRange: TLabel
            Left = 0
            Top = 134
            Width = 45
            Height = 13
            Caption = '&Delimiters'
            FocusControl = edDelimitersRange
          end
          object lbRangeFrom: TLabel
            Left = 0
            Top = 20
            Width = 26
            Height = 13
            Caption = '&From:'
          end
          object lbRangeTo: TLabel
            Left = 0
            Top = 42
            Width = 16
            Height = 13
            Caption = '&To:'
          end
          object edDelimitersRange: TEdit
            Left = 70
            Top = 131
            Width = 259
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            PopupMenu = popStandard
            TabOrder = 12
            OnChange = RangeChange
            OnContextPopup = EditContextPopup
            OnKeyDown = EditKeyDown
          end
          object chEnabledRange: TCheckBox
            Left = 268
            Top = 0
            Width = 60
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = '&Enabled'
            TabOrder = 2
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chCaseRange: TCheckBox
            Left = 30
            Top = 0
            Width = 200
            Height = 17
            Caption = '&Case Sensitive'
            TabOrder = 1
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object pRangeButtons: TPanel
            Left = 0
            Top = 156
            Width = 329
            Height = 24
            BevelOuter = bvNone
            TabOrder = 13
            object btAddRange: TButton
              Left = 0
              Top = 0
              Width = 108
              Height = 24
              Caption = 'Add &Range'
              TabOrder = 0
              OnClick = DoAddRange
            end
            object btAddKeywords: TButton
              Left = 110
              Top = 0
              Width = 109
              Height = 24
              Caption = 'Add &Keywords'
              TabOrder = 1
              OnClick = DoAddKeyword
            end
            object btAddSet: TButton
              Left = 221
              Top = 0
              Width = 108
              Height = 24
              Caption = 'Add &Set'
              TabOrder = 2
              OnClick = DoAddSet
            end
          end
          object btMultiTags: TButton
            Left = 0
            Top = 0
            Width = 27
            Height = 16
            Caption = '7'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Marlett'
            Font.Style = []
            ParentFont = False
            PopupMenu = popMultiTags
            TabOrder = 0
            OnClick = btTagMenuClick
          end
          object edFrom: TEdit
            Left = 30
            Top = 18
            Width = 243
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            PopupMenu = popStandard
            TabOrder = 3
            OnChange = RangeChange
            OnContextPopup = EditContextPopup
            OnKeyDown = EditKeyDown
          end
          object edTo: TEdit
            Left = 30
            Top = 40
            Width = 243
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            PopupMenu = popStandard
            TabOrder = 6
            OnChange = RangeChange
            OnContextPopup = EditContextPopup
            OnKeyDown = EditKeyDown
          end
          object chFromEOL: TCheckBox
            Left = 303
            Top = 19
            Width = 25
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = #182
            TabOrder = 5
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object btToMenu: TButton
            Left = 281
            Top = 40
            Width = 19
            Height = 19
            Anchors = [akTop, akRight]
            Caption = 'u'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Marlett'
            Font.Style = []
            ParentFont = False
            PopupMenu = popCloseTagMenu
            TabOrder = 7
            OnClick = btTagMenuClick
          end
          object btFromMenu: TButton
            Left = 281
            Top = 18
            Width = 19
            Height = 19
            Anchors = [akTop, akRight]
            Caption = 'u'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Marlett'
            Font.Style = []
            ParentFont = False
            PopupMenu = popOpenTagMenu
            TabOrder = 4
            OnClick = btTagMenuClick
          end
          object chToEOL: TCheckBox
            Left = 303
            Top = 41
            Width = 25
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = #182
            TabOrder = 8
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chCloseOnWord: TCheckBox
            Left = 0
            Top = 61
            Width = 225
            Height = 17
            Caption = 'Close on &delimiter'
            TabOrder = 9
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chCloseOnEOL: TCheckBox
            Left = 0
            Top = 77
            Width = 225
            Height = 17
            Caption = 'Close on end of &line'
            TabOrder = 10
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chCloseParent: TCheckBox
            Left = 0
            Top = 93
            Width = 225
            Height = 17
            Caption = 'Close &parent if same close tag'
            TabOrder = 11
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object CheckBox8: TCheckBox
            Left = 0
            Top = 109
            Width = 225
            Height = 17
            Caption = 'Close &parent if same close tag'
            TabOrder = 14
            Visible = False
            OnClick = RangeChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object Button3: TButton
            Left = 232
            Top = 64
            Width = 97
            Height = 25
            Caption = 'Add link to range'
            TabOrder = 15
            Visible = False
            OnClick = DoAddRangeLink
          end
        end
        object tabKeywords: TTabSheet
          Caption = 'tabKeywords'
          ImageIndex = 2
          PopupMenu = popKeywordsMenu
          TabVisible = False
          OnShow = tabKeywordsShow
          object pProp: TPanel
            Left = 256
            Top = 0
            Width = 74
            Height = 180
            Align = alRight
            BevelOuter = bvNone
            Constraints.MinWidth = 70
            TabOrder = 1
            DesignSize = (
              74
              180)
            object lbKeywordCount: TLabel
              Left = 3
              Top = 166
              Width = 37
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Lines: 0'
            end
            object btSort: TSpeedButton
              Left = 3
              Top = 24
              Width = 23
              Height = 22
              Hint = 'Sort strings'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                04000000000080000000C40E0000C40E00001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDCCCCDDDD0DDDDDDDCDDDDDD707DDDDDDDCCDDDD000DDDDDDDDDCDD7000
                7DDDDDCDDCDD00000DDDDDDCCDDDDD0DDDDDDDDDDDDDDD0DDDDDDDDD9DDDDD0D
                DDDDDDDD9DDDDD0DDDDDDDDD9DDDDD0DDDDDDD9D9DDDDD0DDDDDDDD99DDDDD0D
                DDDDDDDD9DDDDD0DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btSort_oldClick
            end
            object btLowerCase: TSpeedButton
              Left = 27
              Top = 24
              Width = 23
              Height = 22
              Hint = 'Lower case'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
                DDDD0DDDDD0DDD0DDD0D0DDDDD00DD0DDD0DD00000D00DD000DDD0DDD0D000D0
                D0DDDD0D0DD00DDD0DDDDD0D0DD0DDDD0DDDDDD0DDDDDDDDDDDDDDD0DDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btLowerCase_oldClick
            end
            object btSpacesToEol: TSpeedButton
              Left = 51
              Top = 24
              Width = 23
              Height = 22
              Hint = 'Spaces to EOL'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDD0DD0DDDDDDDDDDDD0DD0DDDDDDDDDDDD0DD0DD
                DDDDDDDDDD0DD0DDDDDDDDDDDD0DD0DDDDDDDDDD000DD0DDDDDDDDD0000DD0DD
                DDDDDD00000DD0DDDDDDDD00000DD0DDDDDDDD00000DD0DDDDDDDDD0000DD0DD
                DDDDDDDD00000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              ParentShowHint = False
              ShowHint = True
              OnClick = btSpacesToEol_oldClick
            end
            object chEnabledKeyList: TCheckBox
              Left = 12
              Top = 0
              Width = 60
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = '&Enabled'
              TabOrder = 0
              OnClick = KeywordsChange
              OnContextPopup = DontNeedContextPopup
              OnMouseDown = CheckBoxMouseDown
            end
            object btSort_old: TButton
              Left = 3
              Top = 84
              Width = 67
              Height = 23
              Caption = '&Sort'
              TabOrder = 1
              Visible = False
              OnClick = btSort_oldClick
            end
            object btLowerCase_old: TButton
              Left = 3
              Top = 108
              Width = 67
              Height = 23
              Caption = '&Lower Case'
              TabOrder = 2
              Visible = False
              OnClick = btLowerCase_oldClick
            end
            object btSpacesToEol_old: TButton
              Left = 3
              Top = 132
              Width = 67
              Height = 23
              Caption = 'S&paces -> '#182
              TabOrder = 3
              Visible = False
              OnClick = btSpacesToEol_oldClick
            end
          end
          object Memo: TMemo
            Left = 0
            Top = 0
            Width = 256
            Height = 180
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            PopupMenu = popStandard
            ScrollBars = ssBoth
            TabOrder = 0
            OnChange = KeywordsChange
            OnContextPopup = EditContextPopup
            OnKeyDown = EditKeyDown
          end
        end
        object tabSet: TTabSheet
          Caption = 'tabSet'
          ImageIndex = 3
          PopupMenu = popSetMenu
          TabVisible = False
          OnShow = tabSetShow
          DesignSize = (
            330
            180)
          object lbSymbSet: TLabel
            Left = 0
            Top = 22
            Width = 71
            Height = 13
            Caption = '&Set of symbols:'
            FocusControl = edSymbSet
          end
          object Label15: TLabel
            Left = 0
            Top = 48
            Width = 84
            Height = 13
            Caption = '&Symbols'#39' quantity:'
            FocusControl = edSymbSet
          end
          object Label16: TLabel
            Left = 160
            Top = 48
            Width = 127
            Height = 13
            Caption = '0 - for ignoring this property'
          end
          object chEnabledSet: TCheckBox
            Left = 268
            Top = 0
            Width = 60
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = '&Enabled'
            TabOrder = 1
            OnClick = SetChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object edSymbSet: TEdit
            Left = 88
            Top = 19
            Width = 241
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            PopupMenu = popStandard
            TabOrder = 2
            OnChange = SetChange
            OnContextPopup = EditContextPopup
            OnKeyDown = EditKeyDown
          end
          object chAnyStart: TCheckBox
            Left = 0
            Top = 0
            Width = 200
            Height = 17
            TabStop = False
            Caption = 'AnyStart'
            Enabled = False
            TabOrder = 0
            OnClick = SetChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object RadioButton1: TRadioButton
            Left = 8
            Top = 72
            Width = 241
            Height = 17
            Caption = 'Symbol set can be part of term'
            TabOrder = 3
            Visible = False
          end
          object RadioButton2: TRadioButton
            Left = 8
            Top = 88
            Width = 241
            Height = 17
            Caption = 'Symbol set can be part of term (only right side)'
            TabOrder = 4
            Visible = False
          end
          object RadioButton3: TRadioButton
            Left = 8
            Top = 104
            Width = 241
            Height = 17
            Caption = 'Symbol set can be part of term (only left side)'
            TabOrder = 5
            Visible = False
          end
          object RadioButton4: TRadioButton
            Left = 8
            Top = 120
            Width = 241
            Height = 17
            Caption = 'Symbol set cannot be part of term'
            TabOrder = 6
            Visible = False
          end
          object Edit1: TEdit
            Left = 88
            Top = 44
            Width = 49
            Height = 21
            TabOrder = 7
            Text = '0'
          end
          object udQuantity: TUpDown
            Left = 137
            Top = 44
            Width = 15
            Height = 21
            Associate = Edit1
            TabOrder = 8
            OnClick = udQuantityClick
          end
        end
        object tabSeveralRules: TTabSheet
          Caption = 'tabSeveralRules'
          ImageIndex = 4
          TabVisible = False
          DesignSize = (
            330
            180)
          object Label1: TLabel
            Left = 4
            Top = 2
            Width = 321
            Height = 15
            Alignment = taCenter
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'You have selected several rules...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object tabFoldRoot: TTabSheet
          Caption = 'tabFoldRoot'
          ImageIndex = 5
          TabVisible = False
          OnShow = tabFoldRootShow
          object Label7: TLabel
            Left = 8
            Top = 56
            Width = 247
            Height = 13
            Alignment = taCenter
            Caption = 'You can select folding rules below to view properties'
          end
          object Label11: TLabel
            Left = 8
            Top = 88
            Width = 230
            Height = 13
            Alignment = taCenter
            Caption = 'Also you can add new folding rules to highlighter:'
          end
          object Button2: TButton
            Left = 12
            Top = 108
            Width = 109
            Height = 25
            Caption = 'Add &Fold Region'
            TabOrder = 0
            OnClick = DoAddFoldRegion
          end
        end
        object tabFoldRegion: TTabSheet
          Caption = 'tabFoldRegion'
          ImageIndex = 6
          TabVisible = False
          OnShow = tabFoldRegionShow
          DesignSize = (
            330
            180)
          object Label8: TLabel
            Left = 3
            Top = 8
            Width = 27
            Height = 13
            Caption = 'Type:'
          end
          object Label9: TLabel
            Left = 3
            Top = 44
            Width = 29
            Height = 13
            Caption = 'Open:'
          end
          object Label10: TLabel
            Left = 3
            Top = 68
            Width = 29
            Height = 13
            Caption = 'Close:'
          end
          object rbChar: TRadioButton
            Left = 40
            Top = 0
            Width = 265
            Height = 17
            Caption = 'Character'
            TabOrder = 0
            OnClick = FoldRegionChange
          end
          object rbKeyword: TRadioButton
            Left = 40
            Top = 16
            Width = 265
            Height = 17
            Caption = 'Keyword'
            TabOrder = 1
            OnClick = FoldRegionChange
          end
          object edOpen: TEdit
            Left = 40
            Top = 40
            Width = 113
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = FoldRegionChange
          end
          object edClose: TEdit
            Left = 40
            Top = 64
            Width = 113
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = FoldRegionChange
          end
          object chAddKeyword: TCheckBox
            Left = 3
            Top = 92
            Width = 313
            Height = 17
            Caption = 'Add close keyword when collapsing'
            TabOrder = 4
            OnClick = FoldRegionChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chNoSubFolds: TCheckBox
            Left = 3
            Top = 108
            Width = 313
            Height = 17
            Caption = 'Allow no sub folds'
            TabOrder = 5
            OnClick = FoldRegionChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chWholeWords: TCheckBox
            Left = 3
            Top = 124
            Width = 313
            Height = 17
            Caption = 'Keywords must be whole words'
            TabOrder = 6
            OnClick = FoldRegionChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object edOpenRegExpr: TEdit
            Left = 160
            Top = 40
            Width = 109
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnChange = FoldRegionChange
          end
          object edCloseRegExpr: TEdit
            Left = 160
            Top = 64
            Width = 109
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnChange = FoldRegionChange
          end
          object chUseOpenRegExpr: TCheckBox
            Left = 275
            Top = 42
            Width = 53
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'RegEx'
            TabOrder = 9
            OnClick = FoldRegionChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
          object chUseCloseRegExpr: TCheckBox
            Left = 275
            Top = 66
            Width = 53
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'RegEx'
            TabOrder = 10
            OnClick = FoldRegionChange
            OnContextPopup = DontNeedContextPopup
            OnMouseDown = CheckBoxMouseDown
          end
        end
      end
    end
  end
  object pBottom: TPanel
    Left = 0
    Top = 213
    Width = 632
    Height = 156
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Constraints.MinHeight = 17
    TabOrder = 2
    object Bevel5: TBevel
      Left = 2
      Top = 17
      Width = 628
      Height = 1
      Align = alTop
      Style = bsRaised
    end
    object pBottomParentCapt: TPanel
      Left = 2
      Top = 2
      Width = 628
      Height = 15
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCaptionText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = popPanels
      TabOrder = 0
      object lbSampMin: TLabel
        Left = 596
        Top = 0
        Width = 16
        Height = 15
        Hint = 'Minimize'
        Align = alRight
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -15
        Font.Name = 'Marlett'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = lbSampMinClick
        OnContextPopup = LabelContextPopup
      end
      object lbSampMax: TLabel
        Left = 612
        Top = 0
        Width = 16
        Height = 15
        Hint = 'Maximize'
        Align = alRight
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -15
        Font.Name = 'Marlett'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = lbSampMaxClick
        OnContextPopup = LabelContextPopup
      end
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 13
        Height = 15
        Hint = 'Minimize'
        Align = alLeft
        Caption = '<'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = lbSampMinClick
        OnContextPopup = LabelContextPopup
      end
      object pBottomCapt: TPanel
        Left = 13
        Top = 0
        Width = 583
        Height = 15
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Sample text (will not save)'
        Color = clActiveCaption
        TabOrder = 0
        OnDblClick = PanelDblClick
      end
    end
    object SampleMemo: TSynEdit
      Left = 2
      Top = 18
      Width = 628
      Height = 136
      Align = alClient
      Ctl3D = True
      ParentCtl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PopupMenu = popSampleMemoMenu
      TabOrder = 1
      OnKeyDown = SampleMemoKeyDown
      OnMouseDown = SampleMemoMouseDown
      BorderStyle = bsNone
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.RightOffset = 21
      Highlighter = SynUniSyn
      Lines.Strings = (
        'SampleMemo')
      OnChange = SampleMemoChange
    end
  end
  object pButtons: TPanel
    Left = 0
    Top = 372
    Width = 632
    Height = 35
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Constraints.MinHeight = 35
    TabOrder = 3
    DesignSize = (
      632
      35)
    object Label17: TLabel
      Left = 8
      Top = 8
      Width = 101
      Height = 13
      Caption = 'Version of file format: '
    end
    object lbFormatVersion: TLabel
      Left = 112
      Top = 8
      Width = 15
      Height = 13
      Cursor = crHandPoint
      Caption = '2.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lbFormatVersionClick
    end
    object btOk: TButton
      Left = 392
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TButton
      Left = 472
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btCancelClick
    end
    object btApply: TButton
      Left = 552
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Apply'
      Enabled = False
      TabOrder = 2
      OnClick = btApplyClick
    end
  end
  object popStandard: TPopupMenu
    Images = listImages
    Left = 8
    Top = 32
    object popUndo: TMenuItem
      Caption = '&Undo'
      ImageIndex = 7
      ShortCut = 16474
      OnClick = popUndoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object popCut: TMenuItem
      Caption = 'Cu&t'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = popCutClick
    end
    object popCopy: TMenuItem
      Caption = '&Copy'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = popCopyClick
    end
    object popPaste: TMenuItem
      Caption = '&Paste'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = popPasteClick
    end
    object popDelete: TMenuItem
      Caption = '&Delete'
      ImageIndex = 8
      ShortCut = 46
      OnClick = popDeleteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object popSelectAll: TMenuItem
      Caption = 'Select &All'
      ShortCut = 16449
      OnClick = popSelectAllClick
    end
  end
  object popOpenTagMenu: TPopupMenu
    Left = 40
    Top = 32
    object Closemenu1: TMenuItem
      Caption = 'Close menu'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miOpenTagFirstOnLine: TMenuItem
      Caption = 'Open tag is first symbols on line'
      OnClick = miOpenTagMenuClick
    end
    object miOpenTagFirstNonSpaceOnLine: TMenuItem
      Caption = 'Open tag is first non-space symbols on line'
      OnClick = miOpenTagMenuClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miOpenTagPartOfTerm1: TMenuItem
      Caption = 'Open tag is part of term'
      RadioItem = True
      OnClick = miTagMenuClick
    end
    object miOpenTagPartOfTerm2: TMenuItem
      Caption = 'Open tag is part of term (only right side)'
      RadioItem = True
      OnClick = miTagMenuClick
    end
    object miOpenTagPartOfTerm3: TMenuItem
      Caption = 'Open tag is part of term (only left side)'
      RadioItem = True
      OnClick = miTagMenuClick
    end
    object miOpenTagPartOfTerm4: TMenuItem
      Caption = 'Open tag is not part of term'
      RadioItem = True
      OnClick = miTagMenuClick
    end
  end
  object popCloseTagMenu: TPopupMenu
    Left = 72
    Top = 32
    object MenuItem1: TMenuItem
      Caption = 'Close menu'
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object miCloseTagFirstOnLine: TMenuItem
      Caption = 'Close tag is first symbols on line'
      OnClick = miCloseTagMenuClick
    end
    object miCloseTagFirstNonSpaceOnLine: TMenuItem
      Caption = 'Close tag is first non-space symbols on line'
      OnClick = miCloseTagMenuClick
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object miCloseTagPartOfTerm1: TMenuItem
      Caption = 'Close tag is part of term'
      RadioItem = True
      OnClick = miTagMenuClick
    end
    object miCloseTagPartOfTerm2: TMenuItem
      Caption = 'Close tag is part of term (only right side)'
      RadioItem = True
      OnClick = miTagMenuClick
    end
    object miCloseTagPartOfTerm3: TMenuItem
      Caption = 'Close tag is part of term (only left side)'
      RadioItem = True
      OnClick = miTagMenuClick
    end
    object miCloseTagPartOfTerm4: TMenuItem
      Caption = 'Close tag is not part of term'
      RadioItem = True
      OnClick = miTagMenuClick
    end
  end
  object popRootMenu: TPopupMenu
    Images = listImages
    Left = 8
    Top = 64
    object rootCut: TMenuItem
      Caption = 'Cu&t Root range'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = rootCutClick
    end
    object rootCopy: TMenuItem
      Caption = '&Copy Root range'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = rootCopyClick
    end
    object rootPaste: TMenuItem
      Caption = '&Paste inside Root'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = rootPasteInsideClick
    end
    object rootPasteAndReplace: TMenuItem
      Caption = 'Paste and Re&place Root'
      OnClick = rootPasteAndReplaceClick
    end
    object rootBreak1: TMenuItem
      Caption = '-'
    end
    object rootLoadFromFile: TMenuItem
      Caption = '&Load Root from File...'
      ImageIndex = 5
      OnClick = rootLoadFromFileClick
    end
    object rootSaveToFile: TMenuItem
      Caption = 'Save Highlighter to File...'
      ImageIndex = 6
      OnClick = rootSaveToFileClick
    end
    object rootBreak2: TMenuItem
      Caption = '-'
    end
    object rootAddRange: TMenuItem
      Caption = 'Add &Range to Root'
      OnClick = DoAddRangeToRoot
    end
    object rootAddKeywords: TMenuItem
      Caption = 'Add &Keywords to Root'
      OnClick = DoAddKeywordToRoot
    end
    object rootAddSetto: TMenuItem
      Caption = 'Add &Set to Root'
      OnClick = DoAddSetToRoot
    end
    object rootBreak3: TMenuItem
      Caption = '-'
    end
    object rootRename: TMenuItem
      Caption = 'Re&name Root range'
      ImageIndex = 3
      ShortCut = 113
      OnClick = DoRenameNode
    end
    object rootDeleteAll: TMenuItem
      Caption = '&Delete all rules'
      ImageIndex = 4
      ShortCut = 46
      OnClick = DoDeleteNode
    end
    object rootBreak4: TMenuItem
      Caption = '-'
    end
    object rootInfo: TMenuItem
      Caption = 'Highlighter Info...'
      ImageIndex = 11
      ShortCut = 16496
      OnClick = rootInfoClick
    end
  end
  object popRangeMenu: TPopupMenu
    Images = listImages
    Left = 40
    Top = 64
    object rangeBack: TMenuItem
      Caption = '&Up to one level'
      OnClick = lbPropBackClick
    end
    object rangeBreak1: TMenuItem
      Caption = '-'
    end
    object rangeCut: TMenuItem
      Caption = 'Cu&t Range'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = rangeCutClick
    end
    object rangeCopy: TMenuItem
      Caption = '&Copy Range'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = rangeCopyClick
    end
    object rangePaste: TMenuItem
      Caption = '&Paste inside Range'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = rangePasteInsideClick
    end
    object rangePasteAndReplace: TMenuItem
      Caption = 'Paste and Re&place'
      OnClick = rangePasteAndReplaceClick
    end
    object rangePasteNextTo: TMenuItem
      Caption = 'Paste next to'
      OnClick = rangePasteNextToClick
    end
    object rangeBreak2: TMenuItem
      Caption = '-'
    end
    object rangeLoadFromFile: TMenuItem
      Caption = '&Load from File...'
      ImageIndex = 5
      OnClick = rangeLoadFromFileClick
    end
    object rangeSaveToFile: TMenuItem
      Caption = 'Save Range to File...'
      ImageIndex = 6
      OnClick = rangeSaveToFileClick
    end
    object rangeBreak3: TMenuItem
      Caption = '-'
    end
    object rangeAddRange: TMenuItem
      Caption = 'Add &Range'
      OnClick = DoAddRange
    end
    object rangeAddKeywords: TMenuItem
      Caption = 'Add &Keywords'
      OnClick = DoAddKeyword
    end
    object rangeAddSet: TMenuItem
      Caption = 'Add &Set'
      OnClick = DoAddSet
    end
    object rangeBreak4: TMenuItem
      Caption = '-'
    end
    object rangeRename: TMenuItem
      Caption = 'Re&name Range'
      ImageIndex = 3
      ShortCut = 113
      OnClick = DoRenameNode
    end
    object rangeDelete: TMenuItem
      Caption = '&Delete Range'
      ImageIndex = 4
      ShortCut = 46
      OnClick = DoDeleteNode
    end
  end
  object popKeywordsMenu: TPopupMenu
    Images = listImages
    Left = 72
    Top = 64
    object keywordsBack: TMenuItem
      Caption = '&Up to one level'
      OnClick = lbRuleMenuClick
    end
    object keywordsBreak1: TMenuItem
      Caption = '-'
    end
    object keywordsCut: TMenuItem
      Caption = 'Cu&t Keywords'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = rangeCutClick
    end
    object keywordsCopy: TMenuItem
      Caption = '&Copy Keywords'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = rangeCopyClick
    end
    object keywordsPaste: TMenuItem
      Caption = 'Paste next to'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = rangePasteNextToClick
    end
    object keywordsPasteAndReplace: TMenuItem
      Caption = 'Paste and Re&place'
    end
    object keywordsBreak2: TMenuItem
      Caption = '-'
    end
    object keywordsLoadFromFile: TMenuItem
      Caption = '&Load from File...'
      ImageIndex = 5
      OnClick = rangeLoadFromFileClick
    end
    object keywordsSaveToFile: TMenuItem
      Caption = 'Save Keywords to File ...'
      ImageIndex = 6
      OnClick = rangeSaveToFileClick
    end
    object keywordsBreak3: TMenuItem
      Caption = '-'
    end
    object keywordsRename: TMenuItem
      Caption = 'Re&name Keywords'
      ImageIndex = 3
      ShortCut = 113
      OnClick = DoRenameNode
    end
    object keywordsDelete: TMenuItem
      Caption = '&Delete Keywords'
      ImageIndex = 4
      ShortCut = 46
      OnClick = DoDeleteNode
    end
  end
  object popSetMenu: TPopupMenu
    Images = listImages
    Left = 104
    Top = 64
    object setBack: TMenuItem
      Caption = '&Up to one level'
      OnClick = lbPropBackClick
    end
    object setBreak1: TMenuItem
      Caption = '-'
    end
    object setCut: TMenuItem
      Caption = 'Cu&t Set'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = rangeCutClick
    end
    object setCopy: TMenuItem
      Caption = '&Copy Set'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = rangeCopyClick
    end
    object setPaste: TMenuItem
      Caption = 'Paste next to'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = rangePasteNextToClick
    end
    object setPasteAndReplace: TMenuItem
      Caption = 'Paste and Re&place'
    end
    object setBreak2: TMenuItem
      Caption = '-'
    end
    object setLoadFromFile: TMenuItem
      Caption = '&Load from File...'
      ImageIndex = 5
      OnClick = rangeLoadFromFileClick
    end
    object setSaveToFile: TMenuItem
      Caption = 'Save Set to File...'
      ImageIndex = 6
      OnClick = rangeSaveToFileClick
    end
    object setBreak3: TMenuItem
      Caption = '-'
    end
    object setRename: TMenuItem
      Caption = 'Re&name set'
      ImageIndex = 3
      ShortCut = 113
      OnClick = DoRenameNode
    end
    object setDelete: TMenuItem
      Caption = '&Delete Set'
      ImageIndex = 4
      ShortCut = 46
      OnClick = DoDeleteNode
    end
  end
  object popPanels: TPopupMenu
    Left = 104
    Top = 32
    object miRulesTree: TMenuItem
      Caption = 'Panel "Rules Tree"'
      Checked = True
      OnClick = ShowHideTree
    end
    object miProperties: TMenuItem
      Caption = 'Panel "Properties"'
      Checked = True
      OnClick = ShowHideProp
    end
    object miAttributes: TMenuItem
      Caption = 'Panel "Attributes"'
      Checked = True
      OnClick = ShowHideAttr
    end
    object miSampleText: TMenuItem
      Caption = 'Panel "Sample text"'
      Checked = True
      OnClick = ShowHideSamp
    end
    object miButtons: TMenuItem
      Caption = 'Bottom Buttons'
      Checked = True
    end
  end
  object SynUniSyn: TSynUniSyn
    Left = 72
    Top = 160
  end
  object listImages: TImageList
    Left = 8
    Top = 96
    Bitmap = {
      494C010116001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000008080800000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000C0C0C0000000000000808000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000C0C0C0000000000000808000000000000000000000000000000000000000
      00000000000080808000C0C0C000FFFFFF00C0C0C00080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000C0C0C0000000000000808000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      0000C0C0C0000000000000808000000000000000000000000000000000008080
      8000C0C0C000FFFFFF00FFFFFF0080808000C0C0C000C0C0C000800080000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000000000000000000000000000000
      00000000000000000000008080000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000008080000000000000000000000000000000
      0000000000000000000000808000000000000000000080808000C0C0C000FFFF
      FF00FFFFFF0080808000808080000000000080808000C0C0C000C0C0C0008000
      80000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000008080000080
      80000080800000808000008080000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF0000000000008080000080800000808000008080000080
      8000008080000080800000808000000000008000800080808000FFFFFF008080
      8000808080000000000000000000800080000000000080808000C0C0C000C0C0
      C0008000800000000000000000000000000000000000C0C0C00000000000FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      000000000000C0C0C00000000000000000000000000080808000808080008080
      8000000000008080800000000000008080000080800000000000000000000000
      00000000000000808000008080000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF0000000000008080000080800000000000000000000000
      0000000000000080800000808000000000008000800080808000808080000000
      000000000000800080008000800080008000800080000000000080808000C0C0
      C000C0C0C00080008000000000000000000000000000C0C0C00000000000FFFF
      FF0080808000808080008080800080808000808080008080800080808000FFFF
      FF0000000000C0C0C00000000000000000000000000080808000808080000000
      00008080800000000000000000000080800000000000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000008080000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000000000000080800000000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000808000000000008000800000000000000000008000
      8000800080008000800080008000800080008000800080008000000000008080
      8000C0C0C000C0C0C000800080000000000000000000C0C0C00000000000FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      000000000000C0C0C000000000000000000000000000FFFFFF00000000008080
      80008080800080808000000000000080800000000000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00000000000080800000000000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000008000800080808000800080008000
      8000800080008000800000FFFF00008080008000800080008000800080000000
      000080808000C0C0C000000000000000000000000000C0C0C00000000000FFFF
      FF0080808000808080008080800080808000808080008080800080808000FFFF
      FF0000000000C0C0C00000000000000000000000000000FFFF00FFFFFF000000
      00008080800000000000000000000080800000000000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000C0C0C0000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00000000000080800000000000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000C0C0C000000000000000000080008000808080008000
      8000800080008000800080008000C0C0C00000FFFF0000FFFF00800080008000
      80000000000080808000000000000000000000000000C0C0C00000000000FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      000000000000C0C0C000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800080008080
      8000800080008000800000808000008080008000800000FFFF0000FFFF008000
      80008000800000000000000000000000000000000000C0C0C00000000000FFFF
      FF00808080008080800080808000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF0000000000C0C0C00000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000FFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000000000000000000000000000000000008000
      800080808000800080008000800000FFFF0000FFFF0000FFFF00008080008000
      80008000800080008000000000000000000000000000C0C0C00000000000FFFF
      0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF
      000000000000C0C0C000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF0000FFFF00FFFFFF0080808000000000008080800000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000FFFFFF00FFFFFF00C0C0C000000000000000000000000000000000000000
      0000800080008080800080008000800080008000800080008000800080008000
      80008000800000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF00000000000080800000000000FFFFFF000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000008000800080808000800080008000800080008000800080000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF00808080000000000080808000FFFFFF000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000080008000808080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF0000000000000000000000FF000000FF000000
      FF000000FF00FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000FF000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF0000000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      FF000000FF00FF000000FF0000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF0000000000FF000000FF000000FF000000FF000000FF0000000000
      00000000000000000000000000000000000000000000FF0000000000FF000000
      FF000000FF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF0000000000FF0000000000FF000000000000000000FF0000000000
      00000000000000000000000000000000000000000000FF0000000000FF000000
      FF000000FF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000FF0000000000FF000000
      FF000000FF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000FF0000000000FF0000000000FF0000000000000000000000
      0000FF00000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFF
      FF00C0C0C000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000FF00FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000000000000000000000000000FFFFFF00008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000FFFFFF00008000000080
      000000800000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000FFFFFF00008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C0C0C00000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C00000000000FFFFFF0000000000C0C0C00000000000C0C0C000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000C0C0C00000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000080800000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000080800000000000000000000000000000000000800000008000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000080800000000000000000000000000000000000800000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000000000008000000000000000000000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF008000000080000000800000008000
      00008000000080000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000000000008000000000000000000000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0080000000000000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000FF0000000000
      000000000000000000000000000000000000FF00000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000800000008000000080000000000000008000000000000000000000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00800000008000000080000000FFFF
      FF00800000008000000080000000800000000000000000000000FF0000000000
      000000000000000000000000000000000000FF00000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000080000000000000008000000080000000800000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0080000000000000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF008000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000080000000000000008000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000800000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFFFF008000
      0000800000008000000080000000000000000000000000808000808080000080
      8000808080000080800080000000800000008000000080000000800000008000
      000080000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF0000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000FFFFFF008000000000000000000000000000000080808000008080008080
      8000008080008080800000808000808080000080800080808000008080008080
      8000008080000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000800000000000000000000000000000000000000000808000808080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000080808000808080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000008080
      8000008080000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000FF0000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      80000000000000FFFF00000000000000000000FFFF0000000000808080000080
      8000808080000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C3DFFFFF00000000
      DF8FFFFF00000000E78FFFFF00000000FB07FFFF00000000DB076FFB00000000
      E7DF6FFB00000000FFDFBDBB00000000F7DFBDBD00000000F7DF6FF600000000
      F7DF6FF600000000D7DFFFFF00000000E7DFFFFF00000000F7DFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FE7FFFFFFC00FC00F83FFFFFFC00FC00
      E01F8003FC000000800F0001FC00000000070001000000000003000100000000
      0001000100000000000000010000000000000001000000008001000100000000
      C0010001000F0000E0010001000F0000F0010001000F0000F8070001000F0000
      FC1F8003000F0000FE7FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0001
      E0FFFFFFE1FF0001F1FFFC00F3FF0001F9FFFC0081FF0001F9FFFC00C9FF0001
      DCEFDC00E1BF0001DCEFDC00E41F000104070400E4DF0001DE67DC00F07F0001
      DE77DC00F2770001FF3EFC00F0030001FF3CFC00F9DF0001FE00FC00F00F0001
      FFFFFFFFFFFF0001FFFFFFFFFFFF0001FFFFFFFFFFFFFFFFFFFFFFFFFFFF000F
      EFFDC0078FFF000FC7FFC0078C03000FC3FBC0078FFF000FE3F7C007FFFF000F
      F1E7C007FFFF000FF8CFC0078FFF000FFC1FC0078C03000FFE3FC0078FFF0004
      FC1FC007FFFF0000F8CFC007FFFF0000E1E7C00F8FFFF800C3F3C01F8C03FC00
      C7FDC03F8FFFFE04FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFBFFFFC001FFFF
      8FFB001F8031FFFF87F7000F8031FFFF87E700078031FFFFC3CF00038001FFF7
      E18F00018001C1F7F01F00008001C3FBF83F001F8001C7FBF83F001F8001CBFB
      F01F001F8001DCF7C18F8FF18001FF0F83C7FFF98001FFFF87E3FF758005FFFF
      8FFBFF8F8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFFC00FFFF
      ED9FFC018000FFFFED6FFC010000FFFFED6FFC010000DF43F16F00010000DF5D
      FD1F00010001E0DDFC7F00010003EEDDFEFF00010003EEC3FC7F00030003F5DD
      FD7F00070003F5DDF93F000F0003FBDDFBBF00FF0003FBC3FBBF01FF8007FFFF
      FBBF03FFF87FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'HLR'
    Filter = 
      'All supported files (*.hlr, *.hgl, *.stx, *.txt)|*.hlr;*.hgl;*.s' +
      'tx; *.txt|UniHighlighter Rules (*.hlr)|*.hlr|UniHighlighter Old ' +
      'Format (*.hgl)|*.hgl|EditPlus syntax file (*.stx)|*.stx|UltraEdi' +
      't syntax file (*.txt)|*.txt|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 160
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'HGL'
    Filter = 'UniHighlighter Rules (*.hgl)|*.hgl|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 160
  end
  object popColorStd: TPopupMenu
    Left = 40
    Top = 96
  end
  object popColorAdv: TPopupMenu
    Left = 72
    Top = 96
  end
  object popColorSys: TPopupMenu
    Left = 104
    Top = 96
  end
  object listColors16: TImageList
    Left = 40
    Top = 128
  end
  object listColors40: TImageList
    Left = 72
    Top = 128
  end
  object listColorsSys: TImageList
    Left = 104
    Top = 128
  end
  object listRules: TImageList
    Left = 8
    Top = 128
  end
  object popSampleMemoMenu: TPopupMenu
    Images = listImages
    OnPopup = popSampleMemoMenuPopup
    Left = 104
    Top = 160
    object AddselectedtoKeywords1: TMenuItem
      Caption = 'Add to Keywords'
      OnClick = AddselectedtoKeywords1Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Undo1: TMenuItem
      Caption = '&Undo'
      ImageIndex = 7
      ShortCut = 16474
      OnClick = Undo1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Cut1: TMenuItem
      Caption = 'Cu&t'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = Cut1Click
    end
    object Copy1: TMenuItem
      Caption = '&Copy'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = Copy1Click
    end
    object Paste1: TMenuItem
      Caption = '&Paste'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = Paste1Click
    end
    object Delete1: TMenuItem
      Caption = '&Delete'
      ImageIndex = 8
      OnClick = Delete1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object SelectAll1: TMenuItem
      Caption = 'Select &All'
      ShortCut = 16449
      OnClick = SelectAll1Click
    end
  end
  object OpenDialog2: TOpenDialog
    Filter = 'CLR files (*.clr)|*.clr|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 136
    Top = 160
  end
  object popFoldRegionMenu: TPopupMenu
    Images = listImages
    Left = 136
    Top = 64
    object Uptoonelevel1: TMenuItem
      Caption = '&Up to one level'
      OnClick = lbPropBackClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object AddRange1: TMenuItem
      Caption = 'Add &Fold Region'
      OnClick = DoAddFoldRegion
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object RenameRange1: TMenuItem
      Caption = 'Re&name Fold Region'
      ImageIndex = 3
      ShortCut = 113
      OnClick = DoRenameNode
    end
    object DeleteRange1: TMenuItem
      Caption = '&Delete Fold Region'
      ImageIndex = 4
      ShortCut = 46
      OnClick = DoDeleteNode
    end
  end
  object popFoldRootMenu: TPopupMenu
    Left = 160
    Top = 64
    object MenuItem12: TMenuItem
      Caption = 'Add &Fold Region'
      OnClick = DoAddFoldRegion
    end
  end
  object popMultiTags: TPopupMenu
    Left = 137
    Top = 32
    object Closemenu2: TMenuItem
      Caption = 'Close menu'
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object Addcoupletags1: TMenuItem
      Caption = '&Add couple tags'
      OnClick = Addcoupletags1Click
    end
    object Deletecoupletags1: TMenuItem
      Caption = '&Delete couple tags'
      OnClick = Deletecoupletags1Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object miSomeTag: TMenuItem
      Caption = '<Some tag>'
      GroupIndex = 1
      RadioItem = True
    end
  end
end
