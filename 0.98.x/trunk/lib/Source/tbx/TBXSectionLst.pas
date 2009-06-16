unit TBXSectionLst;

interface

uses
  Windows, Messages, Classes, SysUtils, Controls, Graphics, Forms;

type
  TTBXSectionItems = class;
  TTBXCustomSectionList = class;

  TTBXSectionItem = class(TCollectionItem)
  private
    FControl: TControl;
    FCaption: TCaption;
    FVisible: Boolean;
    procedure SetControl(Value: TControl);
    procedure SetSize(Value: Integer);
    procedure SetCaption(const Value: TCaption);
    function  GetExpanded: Boolean;
    procedure SetExpanded(Value: Boolean);
    function  GetSize: Integer;
    procedure SetVisible(Value: Boolean);
  protected
    CachedTop: Integer;
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Invalidate;
    function SectionList: TTBXCustomSectionList;
    property Size: Integer read GetSize write SetSize stored False;
  published
    property Caption: TCaption read FCaption write SetCaption;
    property Control: TControl read FControl write SetControl;
    property Expanded: Boolean read GetExpanded write SetExpanded stored False;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

  TTBXSectionItems = class(TCollection)
  private
    FSectionList: TTBXCustomSectionList;
    function GetItem(Index: Integer): TTBXSectionItem;
    procedure SetItem(Index: Integer; Value: TTBXSectionItem);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(ASectionList: TTBXCustomSectionList);
    function Add: TTBXSectionItem;
    function FindItem(AControl: TControl): TTBXSectionItem;
    property Items[Index: Integer]: TTBXSectionItem read GetItem write SetItem; default;
    property SectionList: TTBXCustomSectionList read FSectionList;
  end;

  TSBVisibility = (sbvAuto, sbvAlways, sbvNever);
  TSBIncrement = 1..MAXINT;
  TSBUpdateOptions = set of (sboRepaintScrollbars, sboScrollClientArea);
  TSLState = set of (slsCreatingWindow, slsUpdatingScrollBars, slsThumbTracking, slsSizing);

  TTBXCustomSectionList = class(TCustomControl)
  private
    FBorderStyle: TBorderStyle;
    FItems: TTBXSectionItems;
    FScrollOffset: Integer;
    FScrollRange: Integer;
    FUpdateCount: Integer;
    FScrollIncrement: TSBIncrement;
    FScrollBarVisibility: TSBVisibility;
    FHeaderHeight: Integer;
    procedure CMControlChange(var Message: TCMControlChange); message CM_CONTROLCHANGE;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetHeaderHeight(Value: Integer);
    procedure SetItems(Value: TTBXSectionItems);
    procedure SetScrollBarVisibility(Value: TSBVisibility);
    procedure SetScrollOffset(Value: Integer);
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  protected
    HotItem: TTBXSectionItem;
    PushedItem: TTBXSectionItem;
    ScrollBarVisible: Boolean;
    State: TSLState;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DoFlipChildren; override;
    procedure DoResize; virtual;
    procedure DoScroll(DeltaY: Integer); virtual;
    function  GetHeaderHeight: Integer; virtual;
    function  GetItemRect(ItemIndex: Integer; HeaderOnly: Boolean): TRect;
    function  FindItemAt(X, Y: Integer; CaptionOnly: Boolean): TTBXSectionItem;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    procedure PaintHeaderPin(Canvas: TCanvas; R: TRect; Expanded, Hot, Pressed: Boolean); virtual;
    function  SetOffset(DY: Integer; UpdateOptions: TSBUpdateOptions; ClipRect: PRect = nil): Boolean;
    procedure SetScrollRange(DY: Integer);
    procedure UpdateItems(UpdateRange: Boolean);
    procedure UpdateScrollBar(DoRepaint: Boolean);
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property HeaderHeight: Integer read FHeaderHeight write SetHeaderHeight default 0;
    property Items: TTBXSectionItems read FItems write SetItems;
    property ScrollIncrement: TSBIncrement read FScrollIncrement write FScrollIncrement default 20;
    property ScrollBarVisibility: TSBVisibility read FScrollBarVisibility write SetScrollBarVisibility default sbvAuto;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ScrollToRect(ARect: TRect);
    procedure ScrollToItem(AItem: TTBXSectionItem);
    property ScrollOffset: Integer read FScrollOffset write SetScrollOffset;
    property ScrollRange: Integer read FScrollRange;
  end;

  TTBXSectionList = class(TTBXCustomSectionList)
  published
    property Align;
    property BorderStyle;
    property Color;
    property Font;
    property Items;
    property ParentColor;
    property ParentFont;
    property ScrollIncrement;
    property ScrollBarVisibility;
  end;

implementation

uses Math,FlatSB;

{ TTBXSectionItem }

procedure TTBXSectionItem.Assign(Source: TPersistent);

  function FindControl(AControl: TControl): TControl;
  begin
    if AControl <> nil then
      Result := SectionList.Owner.FindComponent(AControl.Name) as TControl
    else
      Result := nil;
  end;

begin
  if Source is TTBXSectionItem then
    Control := FindControl(TTBXSectionItem(Source).Control)
  else
    inherited Assign(Source);
end;

constructor TTBXSectionItem.Create(Collection: TCollection);
begin
  inherited;
  FVisible := True;
end;

destructor TTBXSectionItem.Destroy;
var
  AControl: TControl;
begin
  if SectionList.PushedItem = Self then SectionList.PushedItem := nil;
  if SectionList.HotItem = Self then SectionList.HotItem := nil;
  AControl := Control;
  FControl := nil;
  inherited Destroy;
  if (AControl <> nil) and not (csDestroying in AControl.ComponentState) and (AControl is TWinControl) then
    with TWinControl(AControl) do
      if HandleAllocated then
      begin
        BringToFront;
        Perform(CM_SHOWINGCHANGED, 0, 0);
      end;
end;

function TTBXSectionItem.GetDisplayName: string;
begin
  Result := Caption;
  if Length(Result) = 0 then Result := inherited GetDisplayName;
end;

function TTBXSectionItem.GetExpanded: Boolean;
begin
  if Control <> nil then Result := Control.Visible
  else Result := False;
end;

function TTBXSectionItem.GetSize: Integer;
begin
  if Control <> nil then Result := Control.Height
  else Result := 96;
end;

procedure TTBXSectionItem.Invalidate;
var
  R: TRect;
begin
  if Visible then
  begin
    R := SectionList.GetItemRect(Index, True);
    OffsetRect(R, 0, SectionList.ScrollOffset);
    if SectionList.HandleAllocated then
      InvalidateRect(SectionList.Handle, @R, True);
  end;
end;

function TTBXSectionItem.SectionList: TTBXCustomSectionList;
begin
  Result := TTBXSectionItems(Collection).SectionList;
end;

procedure TTBXSectionItem.SetCaption(const Value: TCaption);
begin
  if Value <> FCaption then
  begin
    FCaption := Value;
    Changed(False);
  end;
end;

procedure TTBXSectionItem.SetControl(Value: TControl);
var
  Item: TTBXSectionItem;
  OldControl: TControl;
  P: TWinControl;
begin
  if FControl <> Value then
  begin
    if Value <> nil then
    begin
      P := SectionList;
      while P <> nil do
        if P = Value then
          raise EInvalidOperation.CreateFmt('Cannot insert %s into the section list', [P.Name])
          else P := P.Parent;

      Item := TTBXSectionItems(Collection).FindItem(Value);
      if (Item <> nil) and (Item <> Self) then Item.SetControl(nil);
    end;
    OldControl := FControl;
    FControl := Value;
    if Value <> nil then Value.FreeNotification(SectionList);
    Changed(True);
    if OldControl <> nil then OldControl.Perform(CM_SHOWINGCHANGED, 0, 0);
  end;
end;

procedure TTBXSectionItem.SetExpanded(Value: Boolean);
begin
  SectionList.Invalidate;
  if Control <> nil then Control.Visible := Value;
end;

procedure TTBXSectionItem.SetSize(Value: Integer);
begin
  if Value < 16 then Value := 16;
  if GetSize <> Value then
  begin
    if Control <> nil then Control.Height := Value;
    Changed(True);
  end;
end;

procedure TTBXSectionItem.SetVisible(Value: Boolean);
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
    Changed(True);
  end;
end;

{ TTBXSectionItems }

function TTBXSectionItems.Add: TTBXSectionItem;
begin
  Result := TTBXSectionItem(inherited Add);
end;

constructor TTBXSectionItems.Create(ASectionList: TTBXCustomSectionList);
begin
  inherited Create(TTBXSectionItem);
  FSectionList := ASectionList;
end;

function TTBXSectionItems.FindItem(AControl: TControl): TTBXSectionItem;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := TTBXSectionItem(inherited GetItem(I));
    if Result.FControl = AControl then Exit;
  end;
  Result := nil;
end;

function TTBXSectionItems.GetItem(Index: Integer): TTBXSectionItem;
begin
  Result := TTBXSectionItem(inherited Items[Index]);
end;

function TTBXSectionItems.GetOwner: TPersistent;
begin
  Result := FSectionList;
end;

procedure TTBXSectionItems.SetItem(Index: Integer; Value: TTBXSectionItem);
begin
  inherited Items[Index] := Value;
end;

procedure TTBXSectionItems.Update(Item: TCollectionItem);
begin
  inherited;
  SectionList.UpdateItems(True);
end;

{ TTBXCustomSectionList }

procedure TTBXCustomSectionList.AlignControls(AControl: TControl; var Rect: TRect);
begin
  if not (csDestroying in ComponentState) then
  begin
    UpdateItems(True);
  end;
end;

procedure TTBXCustomSectionList.CMControlChange(var Message: TCMControlChange);
var
  Item: TTBXSectionItem;
begin
  if not (csLoading in ComponentState) then
  begin
    if Message.Inserting then
      with Items.Add do SetControl(Message.Control)
    else
    begin
      Item := Items.FindItem(Message.Control);
      if Item <> nil then Item.Free;
    end;
    Invalidate;
  end;
end;

procedure TTBXCustomSectionList.CMCtl3DChanged(var Message: TMessage);
begin
  if FBorderStyle = bsSingle then RecreateWnd;
end;

constructor TTBXCustomSectionList.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents, {csOpaque,} csDoubleClicks];
  ControlStyle := ControlStyle + [csNeedsBorderPaint];
  FBorderStyle := bsSingle;
  FItems := TTBXSectionItems.Create(Self);
  FScrollIncrement := 20;
  Width := 150;
  Height := 150;
end;

procedure TTBXCustomSectionList.CreateParams(var Params: TCreateParams);
const
  Flags: array [TSBVisibility] of Cardinal = (WS_VSCROLL, WS_VSCROLL, 0);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_CLIPCHILDREN or WS_CLIPSIBLINGS or Flags[ScrollBarVisibility];
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
    if FBorderStyle = bsSingle then
    begin
      if Ctl3D then
      begin
        ExStyle := ExStyle or WS_EX_CLIENTEDGE;
        Style := Style and not WS_BORDER;
      end
      else Style := Style or WS_BORDER;
    end
    else Style := Style and not WS_BORDER;

    if BidiMode <> bdLeftToRight then
      ExStyle := ExStyle or WS_EX_LEFTSCROLLBAR;
  end;
end;

procedure TTBXCustomSectionList.CreateWnd;
begin
  Include(State, slsCreatingWindow);
  inherited;
  Exclude(State, slsCreatingWindow);
  if not (csLoading in ComponentState) then UpdateItems(True);
  UpdateScrollBar(True);
end;

destructor TTBXCustomSectionList.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TTBXCustomSectionList.DoFlipChildren;
begin
  // don't call inherited here
end;

procedure TTBXCustomSectionList.DoResize;
begin
  // do nothing
end;

procedure TTBXCustomSectionList.DoScroll(DeltaY: Integer);
begin
  UpdateItems(False);
end;

function TTBXCustomSectionList.FindItemAt(X, Y: Integer; CaptionOnly: Boolean): TTBXSectionItem;
var
  I, HH: Integer;
begin
  Result := nil;
  if (X < 0) or (X >= ClientWidth) or (Y < 0) then Exit;
  HH := GetHeaderHeight;
  for I := 0 to Items.Count - 1 do
  begin
    Result := Items[I];
    if not Result.Visible then Continue;
    if Y < Result.CachedTop then Break;
    if Y < Result.CachedTop + HH then Exit;
    if not CaptionOnly and Result.Expanded and (Y < Result.CachedTop + HH + Result.Size) then Exit;
  end;
  Result := nil;
end;

function TTBXCustomSectionList.GetHeaderHeight: Integer;
begin
  if FHeaderHeight = 0 then Result := Abs(Font.Height) + 6
  else Result := FHeaderHeight;
end;

function TTBXCustomSectionList.GetItemRect(ItemIndex: Integer; HeaderOnly: Boolean): TRect;
var
  Item: TTBXSectionItem;
begin
  Item := Items[ItemIndex];
  Result.Left := 0;
  Result.Right := ClientWidth;
  Result.Top := Item.CachedTop;
  Result.Bottom := Result.Top;
  if Item.Visible then Inc(Result.Bottom, GetHeaderHeight);
  if not HeaderOnly and Item.Expanded then Inc(Result.Bottom, Item.Size);
end;

procedure TTBXCustomSectionList.Loaded;
begin
  inherited;
  UpdateItems(True);
end;

procedure TTBXCustomSectionList.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TTBXSectionItem;
  R: TRect;
begin
  inherited;
  Inc(Y, -ScrollOffset);
  if Button = mbLeft then
  begin
    Item := FindItemAt(X, Y, True);
    if Item <> nil then
    begin
      PushedItem := Item;
      PushedItem.Invalidate;
    end;
  end;
end;

procedure TTBXCustomSectionList.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Item: TTBXSectionItem;
  R: TRect;
begin
  inherited;
  if PushedItem = nil then
  begin
    Item := FindItemAt(X, Y, True);
    if Item <> HotItem then
    begin
      if HotItem <> nil then HotItem.Invalidate;
      HotItem := Item;
      if HotItem <> nil then HotItem.Invalidate;
    end;
  end;
end;

procedure TTBXCustomSectionList.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    if PushedItem <> nil then
    begin
      PushedItem.Expanded := not PushedItem.Expanded;
      ScrollToItem(PushedItem);
    end;
    PushedItem := nil;
  end;
end;

procedure TTBXCustomSectionList.Notification(AComponent: TComponent; Operation: TOperation);
var
  Item: TTBXSectionItem;
begin
  inherited Notification(AComponent, Operation);
  if not (csDestroying in ComponentState) and (Operation = opRemove) then
  begin
    if (AComponent is TControl) then
    begin
      Item := Items.FindItem(TControl(AComponent));
      if Item <> nil then Item.FControl := nil;
    end;
  end;
end;

procedure TTBXCustomSectionList.Paint;
var
  I, H: Integer;
  R: TRect;
  Item: TTBXSectionItem;
begin
  with Canvas do
  begin
    Font := Self.Font;
    for I := 0 to Items.Count - 1 do
    begin
      Item := Items[I];
      R := GetItemRect(I, True);
      OffsetRect(R, 0, ScrollOffset);
      if RectVisible(Canvas.Handle, R) then
      begin
        H := R.Bottom - R.Top;
        PaintHeaderPin(Canvas, Rect(R.Left, R.Top, R.Left + H, R.Bottom), Item.Expanded, False, PushedItem = Item);
        Inc(R.Left, H);
        Brush.Color := Color;
        if Item = HotItem then Font.Color := clHotLight;
        DrawText(Handle, PChar(Item.Caption), Length(Item.Caption), R, DT_SINGLELINE or DT_VCENTER);
        if Item = HotItem then Font.Color := Self.Font.Color;
      end;
    end;
  end;
end;

procedure TTBXCustomSectionList.PaintHeaderPin(Canvas: TCanvas; R: TRect; Expanded, Hot, Pressed: Boolean);
var
  X, Y, Sz: Integer;
begin
  with Canvas do
  begin
    with R do
    begin
      X := (Left + Right) div 2;
      Y := (Top + Bottom) div 2;
      Sz := Min(Right - X, Bottom - Y);
      Sz := (Sz + 3) div 3;
      if Sz < 1 then Sz := 1;
      Brush.Color := clBtnFace;//clHotLight;
      Pen.Color := clHighlight;
      if Pressed then
      begin
        Dec(X); Dec(Y);
        Sz := Sz * 3 div 4;
        Polygon([Point(X + Sz, Y - Sz), Point(X + Sz, Y + Sz), Point(X - Sz, Y + Sz)]);
      end
      else if Expanded then
      begin
        Dec(Y);
        Polygon([Point(X + Sz, Y), Point(X, Y + Sz), Point(X - Sz, Y)]);
      end
      else
      begin
        Dec(X);
        Polygon([Point(X, Y - Sz), Point(X + Sz, Y), Point(X, Y + Sz)]);
      end;
    end;
  end;
end;

procedure TTBXCustomSectionList.ScrollToItem(AItem: TTBXSectionItem);
var
  R: TRect;
begin
  R.Left := 0;
  R.Right := 0;
  R.Top := AItem.CachedTop;
  R.Bottom := R.Top + GetHeaderHeight;
  if AItem.Expanded then Inc(R.Bottom, AItem.Size);
  ScrollToRect(R);
end;

procedure TTBXCustomSectionList.ScrollToRect(ARect: TRect);
var
  R: TRect;
  CH: Integer;
  DY: Integer;
begin
  R := ClientRect;
  with R do
  begin
    CH := Bottom - Top;
  end;

  DY := 0;

  OffsetRect(ARect, 0, ScrollOffset);

  with ARect do
  begin
    if Top < 0 then DY := Top
    else if Bottom > CH then
    begin
      if Bottom - Top > CH then Bottom := Top + CH;
      DY := Bottom - CH;
    end;
  end;

  SetOffset(ScrollOffset - DY, [sboRepaintScrollbars, sboScrollClientArea], @R);
end;

procedure TTBXCustomSectionList.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TTBXCustomSectionList.SetHeaderHeight(Value: Integer);
begin
  if Value < 0 then Value := 0;
  FHeaderHeight := Value;
  Realign;
end;

procedure TTBXCustomSectionList.SetItems(Value: TTBXSectionItems);
begin
  FItems.Assign(Value);
end;

function TTBXCustomSectionList.SetOffset(DY: Integer; UpdateOptions: TSBUpdateOptions; ClipRect: PRect): Boolean;
var
  CH: Integer;
  DeltaY: Integer;
  DoRepaint: Boolean;
begin
  CH := ClientHeight;
  if CH < 0 then CH := 0;

  if DY < CH - FScrollRange then DY := CH - FScrollRange;
  if DY > 0 then DY := 0;
  DeltaY := DY - FScrollOffset;

  Result := DeltaY <> 0;
  if Result then
  begin
    DoRepaint := sboRepaintScrollbars in UpdateOptions;
    FScrollOffset := DY;

    if FUpdateCount = 0 then
    begin
      if sboScrollClientArea in UpdateOptions then
        ScrollWindow(Handle, 0, DeltaY, ClipRect, ClipRect);

      if (DeltaY <> 0) and ([slsThumbTracking, slsSizing] * State = []) then
      begin
        UpdateScrollBar(DoRepaint);
      end;
    end;

    DoScroll(DeltaY);
  end;
end;

procedure TTBXCustomSectionList.SetScrollBarVisibility(Value: TSBVisibility);
begin
  FScrollBarVisibility := Value;
  if not (csLoading in ComponentState) and HandleAllocated then RecreateWnd;
end;

procedure TTBXCustomSectionList.SetScrollOffset(Value: Integer);
var
  R: TRect;
begin
  R := ClientRect;
  SetOffset(Value, [sboRepaintScrollbars, sboScrollClientArea], @R);
end;

procedure TTBXCustomSectionList.SetScrollRange(DY: Integer);
begin
  if FScrollRange <> DY then
  begin
    FScrollRange := DY;
    UpdateScrollBar(True);
  end;
end;

procedure TTBXCustomSectionList.UpdateItems(UpdateRange: Boolean);
var
  I, Y, HH: Integer;
  Item: TTBXSectionItem;
  OldClientWidth: Integer;
begin
  Y := 0;
  HH := GetHeaderHeight;
  for I := 0 to Items.Count - 1 do
  begin
    Item := Items[I];
    Item.CachedTop := Y;
    if Item.Visible then Inc(Y, HH);
    if Item.Expanded or (csDesigning in ComponentState) then
    begin
      if Item.Control <> nil then
        Item.Control.BoundsRect := Bounds(0, Y + ScrollOffset, ClientWidth, Item.Size);
      Y := Y + Item.Size;
    end;
  end;
  Invalidate;
  if UpdateRange then
  begin
    OldClientWidth := ClientWidth;
    if csDesigning in ComponentState then Inc(Y, 48);
    SetScrollRange(Y);
    if ClientWidth <> OldClientWidth then UpdateItems(False);
  end;
end;

procedure TTBXCustomSectionList.UpdateScrollBar(DoRepaint: Boolean);
const
  ScrollMasks: array[Boolean] of Cardinal = (0, SIF_DISABLENOSCROLL);
var
  ScrollInfo: TScrollInfo;
  PageHeight: Integer;
begin
  if HandleAllocated then
  begin
    PageHeight := ClientHeight;
    if PageHeight < 0 then PageHeight := 0;

    if ScrollBarVisibility in [sbvAuto, sbvAlways] then
    begin
      ScrollInfo.cbSize := SizeOf(ScrollInfo);
      ScrollInfo.fMask := SIF_ALL;
      FlatSB_GetScrollInfo(Handle, SB_VERT, ScrollInfo);

      if (FScrollRange > PageHeight) or (ScrollBarVisibility = sbvAlways) then
      begin
        ScrollBarVisible := True;
        FlatSB_ShowScrollBar(Handle, SB_VERT, True);
        ScrollInfo.nMin := 0;
        ScrollInfo.nMax := FScrollRange;
        ScrollInfo.nPos := -FScrollOffset;
        ScrollInfo.nPage := Max(0, PageHeight + 1);
        ScrollInfo.fMask := SIF_ALL or ScrollMasks[ScrollBarVisibility = sbvAlways];
        FlatSB_SetScrollInfo(Handle, SB_VERT, ScrollInfo, DoRepaint);
      end
      else
      begin
        ScrollInfo.nMin := 0;
        ScrollInfo.nMax := 0;
        ScrollInfo.nPos := 0;
        ScrollInfo.nPage := 0;
        ScrollBarVisible := False;
        FlatSB_ShowScrollBar(Handle, SB_VERT, False);
        FlatSB_SetScrollInfo(Handle, SB_VERT, ScrollInfo, False);
      end;
      SetScrollOffset(-GetScrollPos(Handle, SB_VERT));
    end
    else
    begin
      ScrollBarVisible := False;
      FlatSB_ShowScrollBar(Handle, SB_VERT, False);
      SetScrollOffset(FScrollOffset);
    end;
  end;
end;

procedure TTBXCustomSectionList.WMNCHitTest(var Message: TWMNCHitTest);
begin
  DefaultHandler(Message);
end;

procedure TTBXCustomSectionList.WMSize(var Message: TWMSize);
begin
  inherited;
  if HandleAllocated and ([slsSizing, slsCreatingWindow] * State = []) then
  try
    Include(State, slsSizing);
    DoResize;
    UpdateScrollBar(True);
  finally
    Exclude(State, slsSizing);
  end;
end;

procedure TTBXCustomSectionList.WMVScroll(var Message: TWMVScroll);
var
  CH: Integer;

  function GetRealScrollPosition: Integer;
  var
    SI: TScrollInfo;
    Code: Integer;
  begin
    SI.cbSize := SizeOf(TScrollInfo);
    SI.fMask := SIF_TRACKPOS;
    Code := SB_VERT;
    FlatSB_GetScrollInfo(Handle, Code, SI);
    Result := SI.nTrackPos;
  end;

begin
  CH := ClientHeight;

  case Message.ScrollCode of
    SB_BOTTOM: SetScrollOffset(-ScrollRange);

    SB_ENDSCROLL:
      begin
        Exclude(State, slsThumbTracking);
        UpdateScrollBar(True);
        RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_INVALIDATE or RDW_NOERASE or RDW_NOCHILDREN);
      end;

    SB_LINEUP: SetScrollOffset(ScrollOffset + ScrollIncrement);

    SB_LINEDOWN: SetScrollOffset(ScrollOffset - ScrollIncrement);

    SB_PAGEUP: SetScrollOffset(ScrollOffset + CH);

    SB_PAGEDOWN: SetScrollOffset(ScrollOffset - CH);

    SB_THUMBPOSITION, SB_THUMBTRACK:
      begin
        Include(State, slsThumbTracking);
        SetScrollOffset(-GetRealScrollPosition);
      end;

    SB_TOP: SetScrollOffset(0);
  end;
  Message.Result := 0;
end;

end.
