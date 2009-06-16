object fmIncrementalSearch: TfmIncrementalSearch
  Left = 359
  Top = 354
  ActiveControl = eFindText
  Align = alClient
  BorderStyle = bsNone
  Caption = 'fmIncrementalSearch'
  ClientHeight = 25
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object eFindText: TEdit
    Left = 7
    Top = 3
    Width = 178
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    OnChange = eFindTextChange
    OnKeyDown = eFindTextKeyDown
  end
  object TBXToolbar1: TTBXToolbar
    Left = 196
    Top = 2
    Width = 241
    Height = 22
    Caption = 'TBXToolbar1'
    Images = fmMain.ilToolbar
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object TBXItem4: TTBXItem
      Action = acFindNext
      DisplayMode = nbdmImageAndText
    end
    object TBXItem3: TTBXItem
      Action = acFindPrevious
      DisplayMode = nbdmImageAndText
    end
    object miEmphasize: TTBXItem
      Action = acEmphasize
      DisplayMode = nbdmImageAndText
      GroupIndex = 1
    end
  end
  object timClose: TTimer
    OnTimer = timCloseTimer
    Left = 592
  end
  object alIncrementalSearch: TActionList
    Images = fmMain.ilToolbar
    OnUpdate = alIncrementalSearchUpdate
    Left = 564
    object acFindNext: TAction
      Caption = 'Find &Next'
      ImageIndex = 33
      ShortCut = 114
      OnExecute = acFindNextExecute
    end
    object acFindPrevious: TAction
      Caption = 'Find &Previous'
      ImageIndex = 30
      ShortCut = 8306
      OnExecute = acFindPreviousExecute
    end
    object acEmphasize: TAction
      Caption = '&Emphasize'
      GroupIndex = 1
      ImageIndex = 55
      OnExecute = acEmphasizeExecute
    end
  end
end
