// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fDTestPrintPreview;

interface

{$I ConTEXT.inc}

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  ActnList, ImgList, Dialogs, uSafeRegistry,
  SynEditPrintPreview, Printers, uPrinting, Messages, uCommon, Menus,
  TB2Dock, TB2Toolbar, SpTBXItem, TB2Item, ComCtrls;

type
  TfmPrnPreview = class(TForm)
    StatusBar: TStatusBar;
    SynEditPrintPreview: TSynEditPrintPreview;
    TBXDock1: TSpTBXDock;
    TBXToolbar1: TSpTBXToolbar;
    ActionList1: TActionList;
    TBXItem1: TSpTBXItem;
    TBXItem2: TSpTBXItem;
    TBXItem3: TSpTBXItem;
    TBXItem4: TSpTBXItem;
    TBXSeparatorItem1: TSpTBXSeparatorItem;
    TBXSubmenuItem1: TSpTBXSubmenuItem;
    TBXSeparatorItem2: TSpTBXSeparatorItem;
    TBXItem5: TSpTBXItem;
    TBXSeparatorItem3: TSpTBXSeparatorItem;
    TBXItem6: TSpTBXItem;
    acFirst: TAction;
    acPrev: TAction;
    acNext: TAction;
    acLast: TAction;
    acZoom: TAction;
    acPrint: TAction;
    acClose: TAction;
    TBItemContainer1: TTBItemContainer;
    acWholePage: TAction;
    acPageWidth: TAction;
    acZoom25: TAction;
    acZoom50: TAction;
    acZoom100: TAction;
    acZoom200: TAction;
    acZoom400: TAction;
    TBXSubmenuItem2: TSpTBXSubmenuItem;
    TBXItem8: TSpTBXItem;
    TBXItem7: TSpTBXItem;
    TBXSeparatorItem4: TSpTBXSeparatorItem;
    TBXItem13: TSpTBXItem;
    TBXItem12: TSpTBXItem;
    TBXItem11: TSpTBXItem;
    TBXItem10: TSpTBXItem;
    TBXItem9: TSpTBXItem;

    procedure FirstCmdExecute(Sender: TObject);
    procedure PrevCmdExecute(Sender: TObject);
    procedure NextCmdExecute(Sender: TObject);
    procedure LastCmdExecute(Sender: TObject);
    procedure ZoomCmdExecute(Sender: TObject);
    procedure PrintCmdExecute(Sender: TObject);
    procedure CloseCmdExecute(Sender: TObject);
    procedure SynEditPrintPreviewMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditPrintPreviewPreviewPage(Sender: TObject;
      PageNumber: Integer);
    procedure acWholePageExecute(Sender: TObject);
    procedure acPageWidthExecute(Sender: TObject);
    procedure acZoom25Execute(Sender: TObject);
    procedure acZoom50Execute(Sender: TObject);
    procedure acZoom100Execute(Sender: TObject);
    procedure acZoom200Execute(Sender: TObject);
    procedure acZoom400Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure UpdateScrollBars;
    procedure LoadSettings;
    procedure SaveSettings;
  public
    Prn: TPrn;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.DFM}

uses
  fMain, uMultiLanguage;

type
  TMySynEditPrintPreview = class(TSynEditPrintPreview);


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.LoadSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+Name, TRUE) then begin
        ReadFormLayout(SELF);
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.SaveSettings;
begin
  with TSafeRegistry.Create do
    try
      if OpenKey(CONTEXT_REG_KEY+Name, TRUE) then begin
        WriteFormLayout(SELF);
      end;
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.UpdateScrollBars;
begin
  TMySynEditPrintPreview(SynEditPrintPreview).UpdateScrollBars;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Actions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.FirstCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.FirstPage;
  UpdateScrollbars;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.PrevCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.PreviousPage;
  UpdateScrollbars;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.NextCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.NextPage;
  UpdateScrollbars;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.LastCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.LastPage;
  UpdateScrollbars;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.ZoomCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.ScaleMode := pscWholePage;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acWholePageExecute(Sender: TObject);
begin
  SynEditPrintPreview.ScaleMode:=pscWholePage;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acPageWidthExecute(Sender: TObject);
begin
  SynEditPrintPreview.ScaleMode:=pscPageWidth;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acZoom25Execute(Sender: TObject);
begin
  SynEditPrintPreview.ScalePercent:=25;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acZoom50Execute(Sender: TObject);
begin
  SynEditPrintPreview.ScalePercent:=50;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acZoom100Execute(Sender: TObject);
begin
  SynEditPrintPreview.ScalePercent:=100;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acZoom200Execute(Sender: TObject);
begin
  SynEditPrintPreview.ScalePercent:=200;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.acZoom400Execute(Sender: TObject);
begin
  SynEditPrintPreview.ScalePercent:=400;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.PrintCmdExecute(Sender: TObject);
begin
  if Prn.DoPrintDialog then CloseCmdExecute(SELF);
//!!  SynEditPrintPreview.Print;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.CloseCmdExecute(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                     Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.SynEditPrintPreviewPreviewPage(
  Sender: TObject; PageNumber: Integer);
begin
  StatusBar.Panels[0].Text:=' '+mlStr(ML_PRN_PAGE_NUM,'Page:')+' '+IntToStr(SynEditPrintPreview.PageNumber);
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.SynEditPrintPreviewMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  FScale: Integer;
begin
  FScale := SynEditPrintPreview.ScalePercent;
  if Button = mbLeft then begin
    if SynEditPrintPreview.ScaleMode = pscWholePage then
      SynEditPrintPreview.ScalePercent := 100
    else begin
      FScale := FScale * 2;
      if FScale > 400 then
        FScale := 400;
      SynEditPrintPreview.ScalePercent := FScale;
    end;
  end
  else begin
    FScale := FScale div 2;
    if FScale < 25 then
      FScale := 25;
    SynEditPrintPreview.ScalePercent := FScale;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                   Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
constructor TfmPrnPreview.Create(AOwner: TComponent);
begin
  inherited;
  LoadSettings;
end;
//------------------------------------------------------------------------------------------
procedure TfmPrnPreview.FormShow(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);

  SynEditPrintPreview.UpdatePreview;
  SynEditPrintPreview.FirstPage;

  acFirst.Hint:=mlStr(ML_PRN_HINT_FIRST,'First page');
  acPrev.Hint:=mlStr(ML_PRN_HINT_PREV,'Previous page');
  acNext.Hint:=mlStr(ML_PRN_HINT_NEXT,'Next page');
  acLast.Hint:=mlStr(ML_PRN_HINT_LAST,'Last page');
  acZoom.Hint:=mlStr(ML_PRN_HINT_ZOOM,'Zoom');
  acPrint.Hint:=mlStr(ML_PRN_HINT_PRINT,'Print document');
end;
//------------------------------------------------------------------------------------------
destructor TfmPrnPreview.Destroy;
begin
  SaveSettings;
  inherited;
end;
//------------------------------------------------------------------------------------------

end.

