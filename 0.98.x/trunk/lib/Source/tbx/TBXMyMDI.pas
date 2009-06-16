unit TBXMyMDI;


// TBX Package
// Copyright 2001-2002 Alex A. Denisov. All Rights Reserved
// See TBX.chm for license and installation instructions
//
// Parts of the code are converted from original Toolbar2000 sources.
//    Original Copyright:
//    Copyright (C) 1998-2001 by Jordan Russell. All rights reserved.
//
// $Id: TBXMDI.pas,v 1.17 2002/04/07 21:26:32 alex Exp $


interface

{$I TB2Ver.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, TB2Item, TB2Toolbar, TBX;

type
  TTBXMDIButtonsItem = class;

  TTBXMDIHandler = class(TComponent)
  private
    FButtonsItem: TTBXMDIButtonsItem;
    FToolbar: TTBCustomToolbar;
    FStretchButtons: Boolean;
    fRestoreButtonVisible: boolean;
    fCloseButtonVisible: boolean;
    fMinimizeButtonVisible: boolean;
    fOnCloseButtonClick: TNotifyEvent;
    procedure SetToolbar(Value: TTBCustomToolbar);
    procedure SetStretchButtons(Value: Boolean);
    procedure SetCloseButtonVisible(const Value: boolean);
    procedure OnCloseButtonClickEvent(Sender: TObject);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Toolbar: TTBCustomToolbar read FToolbar write SetToolbar;
    property StretchButtons: Boolean read FStretchButtons write SetStretchButtons default False;
    property CloseButtonVisible: boolean read fCloseButtonVisible write SetCloseButtonVisible;
    property OnCloseButtonClick: TNotifyEvent read fOnCloseButtonClick write fOnCloseButtonClick;
  end;

  TTBXMDIButtonType = (tbmbMinimize, tbmbRestore, tbmbClose);

  TTBXMDIButtonItem = class(TTBCustomItem)
  private
    FButtonType: TTBXMDIButtonType;
  protected
    function GetItemViewerClass(AView: TTBView): TTBItemViewerClass; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TTBXMDIButtonItemViewer = class(TTBItemViewer)
  protected
    procedure CalcSize(const Canvas: TCanvas; var AWidth, AHeight: Integer); override;
    procedure Paint(const Canvas: TCanvas; const ClientAreaRect: TRect;
      IsHoverItem, IsPushed, UseDisabledShadow: Boolean); override;
  end;

  TTBXMDISepItem = class(TTBSeparatorItem)
  protected
    function GetItemViewerClass(AView: TTBView): TTBItemViewerClass; override;
  end;

  TTBXMDISepItemViewer = class(TTBSeparatorItemViewer)
  protected
    procedure CalcSize (const Canvas: TCanvas; var AWidth, AHeight: Integer); override;
  end;

  TTBXMDIButtonsItem = class(TTBCustomItem)
  private
    FCloseItem: TTBXMDIButtonItem;
    fOnCloseButtonClick: TNotifyEvent;
    fCloseButtonVisible: boolean;
    procedure InvalidateSystemMenuItem;
    procedure ItemClick(Sender: TObject);
    procedure UpdateState(W: HWND; Maximized: Boolean);
    procedure SetCloseButtonVisible(const Value: boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OnCloseButtonClick: TNotifyEvent read fOnCloseButtonClick write fOnCloseButtonClick;
    property CloseButtonVisible: boolean read fCloseButtonVisible write SetCloseButtonVisible;
  end;

implementation

{$R TBX_MDI.res}

uses
  TBXThemes, TB2Common, TB2Consts, CommCtrl;

type
  TTBViewAccess = class(TTBView);
  TTBCustomToolbarAccess = class(TTBCustomToolbar);


//----------------------------------------------------------------------------//

{ TTBXMDIHandler }

constructor TTBXMDIHandler.Create (AOwner: TComponent);
begin
  inherited;
  FButtonsItem := TTBXMDIButtonsItem.Create(Self);
  FButtonsItem.OnCloseButtonClick:=OnCloseButtonClickEvent;
end;

destructor TTBXMDIHandler.Destroy;
begin
  Toolbar := nil;
  inherited;
end;

procedure TTBXMDIHandler.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (AComponent = FToolbar) and (Operation = opRemove) then Toolbar := nil;
end;

procedure TTBXMDIHandler.OnCloseButtonClickEvent(Sender: TObject);
begin
  if Assigned(fOnCloseButtonClick) then
    fOnCloseButtonClick(Sender);
end;

procedure TTBXMDIHandler.SetCloseButtonVisible(const Value: boolean);
begin
  if (fCloseButtonVisible<>Value) then begin
    fCloseButtonVisible:=Value;
    FButtonsItem.CloseButtonVisible:=Value;
  end;
end;

procedure TTBXMDIHandler.SetStretchButtons(Value: Boolean);
begin
  if Value <> FStretchButtons then
  begin
    FStretchButtons := Value;
    with FButtonsItem do
      if FStretchButtons then
      begin
        FCloseItem.ItemStyle := FCloseItem.ItemStyle + [tbisStretch];
      end
      else
      begin
        FCloseItem.ItemStyle := FCloseItem.ItemStyle - [tbisStretch];
      end;
  end;
end;

procedure TTBXMDIHandler.SetToolbar(Value: TTBCustomToolbar);
var
  Rebuild: Boolean;
begin
  if FToolbar <> Value then
  begin
    if Assigned(FToolbar) then with TTBCustomToolbarAccess(FToolbar) do
    begin
      Rebuild := False;
      if FMDIButtonsItem = FButtonsItem then
      begin
        FMDIButtonsItem := nil;
        Rebuild := True;
      end;
      if Rebuild and Assigned(View) then View.RecreateAllViewers;
    end;
    FToolbar := Value;
    if Assigned(Value) then with TTBCustomToolbarAccess(Value) do
    begin
      FreeNotification(Self);
      FMDIButtonsItem := FButtonsItem;
      View.RecreateAllViewers;
    end;
  end;
end;



{ TTBXMDIButtonItem }

constructor TTBXMDIButtonItem.Create (AOwner: TComponent);
begin
  inherited;
  ItemStyle := ItemStyle - [tbisSelectable] + [tbisRightAlign];
end;

function TTBXMDIButtonItem.GetItemViewerClass (AView: TTBView): TTBItemViewerClass;
begin
  Result := TTBXMDIButtonItemViewer;
end;


//----------------------------------------------------------------------------//

{ TTBXMDIButtonItemViewer }

procedure TTBXMDIButtonItemViewer.CalcSize (const Canvas: TCanvas;
  var AWidth, AHeight: Integer);
begin
  if NewStyleControls then
  begin
    AWidth := GetSystemMetrics(SM_CXMENUSIZE) - CurrentTheme.MenuMDIDW;
    if AWidth < 0 then AWidth := 0;
    AHeight := GetSystemMetrics(SM_CYMENUSIZE) - CurrentTheme.MenuMDIDH;
    if AHeight < 0 then AHeight := 0;
  end
  else
  begin
    AWidth := 16;
    AHeight := 14;
  end;
end;

procedure TTBXMDIButtonItemViewer.Paint(const Canvas: TCanvas;
  const ClientAreaRect: TRect; IsHoverItem, IsPushed, UseDisabledShadow: Boolean);
const
  ButtonTypeFlags: array [TTBXMDIButtonType] of UINT = (DFCS_CAPTIONMIN,
    DFCS_CAPTIONRESTORE, DFCS_CAPTIONCLOSE);
  CDesigning: array [Boolean] of Integer = (0, IO_DESIGNING);
var
  ItemInfo: TTBXItemInfo;
begin
  FillChar(ItemInfo, SizeOf(ItemInfo), 0);
  ItemInfo.ViewType := TVT_NORMALTOOLBAR; //GetViewType(View);
  ItemInfo.ItemOptions := IO_TOOLBARSTYLE or CDesigning[csDesigning in Item.ComponentState];
  ItemInfo.Enabled := Item.Enabled{ or View.Customizing};
  ItemInfo.Pushed := IsPushed;
  ItemInfo.Selected := False;
  ItemInfo.ImageShown := False;
  ItemInfo.ImageWidth := 0;
  ItemInfo.ImageHeight := 0;
  if IsHoverItem then
  begin
    if not ItemInfo.Enabled and not TTBViewAccess(View).MouseOverSelected then ItemInfo.HoverKind := hkKeyboardHover
    else if ItemInfo.Enabled then ItemInfo.HoverKind := hkMouseHover;
  end
  else ItemInfo.HoverKind := hkNone;
  ItemInfo.IsVertical := View.Orientation = tbvoVertical;

  CurrentTheme.PaintMDIButton(Canvas, ClientAreaRect, ItemInfo,
    ButtonTypeFlags[TTBXMDIButtonItem(Item).FButtonType]);
end;


//----------------------------------------------------------------------------//

{ TTBXMDISepItem }

function TTBXMDISepItem.GetItemViewerClass(AView: TTBView): TTBItemViewerClass;
begin
  Result := TTBXMDISepItemViewer;
end;


//----------------------------------------------------------------------------//

{ TTBXMDISepItemViewer }

procedure TTBXMDISepItemViewer.CalcSize(const Canvas: TCanvas; var AWidth, AHeight: Integer);
begin
  if View.Orientation <> tbvoVertical then
  begin
    AWidth := 2;
    AHeight := 6;
  end
  else
  begin
    AWidth := 6;
    AHeight := 2;
  end;
end;


//----------------------------------------------------------------------------//

{ TTBXMDIButtonsItem }

var
  MDIButtonsItems: TList;

constructor TTBXMDIButtonsItem.Create(AOwner: TComponent);

  function CreateItem(const AType: TTBXMDIButtonType): TTBXMDIButtonItem;
  begin
    Result := TTBXMDIButtonItem.Create(Self);
    Result.FButtonType := AType;
    Result.OnClick := ItemClick;
  end;

begin
  inherited;
  ItemStyle := ItemStyle + [tbisEmbeddedGroup];
  FCloseItem := CreateItem(tbmbClose);
  Add(FCloseItem);
  UpdateState(0, False);
  AddToList(MDIButtonsItems, Self);
end;

destructor TTBXMDIButtonsItem.Destroy;
begin
  RemoveFromList(MDIButtonsItems, Self);
  inherited;
end;

procedure TTBXMDIButtonsItem.SetCloseButtonVisible(const Value: boolean);
begin
  if (fCloseButtonVisible<>Value) then begin
    fCloseButtonVisible:=Value;
    UpdateState(0, False);
  end;
end;

procedure TTBXMDIButtonsItem.UpdateState(W: HWND; Maximized: Boolean);
var
  MainForm, ChildForm: TForm;
  I: Integer;
  VisibilityChanged: Boolean;

  procedure UpdateVisible(const Item: TTBCustomItem; ItemVisible:boolean);
  begin
    if Item.Enabled <> ItemVisible then
    begin
      Item.Enabled := ItemVisible;
      VisibilityChanged := True;
    end;
  end;

begin
  VisibilityChanged := False;
  UpdateVisible(FCloseItem, fCloseButtonVisible);
  
  if VisibilityChanged and Assigned((Owner as TTBXMDIHandler).FToolbar) then
  begin
    TTBXMDIHandler(Owner).FToolbar.View.InvalidatePositions;
    TTBXMDIHandler(Owner).FToolbar.View.TryValidatePositions;
  end;
end;

procedure TTBXMDIButtonsItem.ItemClick (Sender: TObject);
begin
  if Assigned(fOnCloseButtonClick) then
    fOnCloseButtonClick(Sender);
end;

procedure TTBXMDIButtonsItem.InvalidateSystemMenuItem;
var
  View: TTBView;
begin
  if Assigned((Owner as TTBXMDIHandler).FToolbar) then
  begin
    View := TTBXMDIHandler(Owner).FToolbar.View;
  end;
end;


//----------------------------------------------------------------------------//

end.


