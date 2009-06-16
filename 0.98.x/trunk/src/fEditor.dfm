object fmEditor: TfmEditor
  Left = 447
  Top = 126
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'fmEditor'
  ClientHeight = 315
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnMouseWheel = FormMouseWheel
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memo: TConTEXTSynEdit
    Left = 0
    Top = 0
    Width = 539
    Height = 287
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Fixedsys'
    Font.Style = []
    PopupMenu = fmMain.TBXPopupMenu1
    TabOrder = 0
    OnDragDrop = memoDragDrop
    OnDragOver = memoDragOver
    OnKeyPress = memoKeyPress
    OnMouseDown = memoMouseDown
    OnMouseMove = memoMouseMove
    OnMouseUp = memoMouseUp
    Gutter.AutoSize = True
    Gutter.DigitCount = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Terminal'
    Gutter.Font.Style = []
    Gutter.Width = 20
    Gutter.Gradient = True
    Gutter.GradientSteps = 32
    InsertCaret = ctHorizontalLine
    Lines.Strings = (
      '')
    MaxScrollWidth = 4096
    MaxUndo = 64000
    Options = [eoAltSetsColumnMode, eoAutoIndent, eoAutoSizeMaxScrollWidth, eoDragDropEditing, eoHideShowScrollbars, eoKeepCaretX, eoShowScrollHint, eoShowSpecialChars, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
    WantTabs = True
    OnChange = memoChange
    OnCommandProcessed = memoCommandProcessed
    OnDropFiles = memoDropFiles
    OnProcessCommand = memoProcessCommand
    OnProcessUserCommand = memoProcessUserCommand
    OnSpecialLineColors = memoSpecialLineColors
    OnStatusChange = memoStatusChange
    OnPaintTransient = memoPaintTransient
    BlockIndent = 2
    TrimTrailingSpaces = False
    ChangeTrackerEnabled = False
    ChangeTrackerChangedColor = clBlack
    ChangeTrackerSavedColor = clBlack
    RemovedKeystrokes = <
      item
        Command = ecDeleteLastChar
        ShortCut = 8200
      end
      item
        Command = ecLineBreak
        ShortCut = 8205
      end
      item
        Command = ecContextHelp
        ShortCut = 112
      end
      item
        Command = ecLineBreak
        ShortCut = 16461
      end
      item
        Command = ecInsertLine
        ShortCut = 16462
      end
      item
        Command = ecNormalSelect
        ShortCut = 24654
      end
      item
        Command = ecColumnSelect
        ShortCut = 24643
      end
      item
        Command = ecLineSelect
        ShortCut = 24652
      end
      item
        Command = ecMatchBracket
        ShortCut = 24642
      end>
    AddedKeystrokes = <
      item
        Command = ecLineBreak
      end
      item
        Command = ecInsertLine
      end
      item
        Command = ecNormalSelect
      end
      item
        Command = ecColumnSelect
      end
      item
        Command = ecLineSelect
      end
      item
        Command = ecMatchBracket
        ShortCut = 16461
      end
      item
        Command = ecNone
      end>
  end
  object pnStatus: TStatusBar
    Left = 0
    Top = 296
    Width = 539
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'XY'
        Width = 100
      end
      item
        Alignment = taCenter
        Text = 'Insert'
        Width = 80
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 90
      end
      item
        Alignment = taCenter
        Width = 90
      end
      item
        Alignment = taCenter
        Text = 'DOS'
        Width = 65
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
    OnResize = pnStatusResize
  end
  object dockBottom: TTBXDock
    Left = 0
    Top = 287
    Width = 539
    Height = 9
    AllowDrag = False
    Position = dpBottom
  end
end
