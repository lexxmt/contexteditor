// ColorBtn ver 1.3  09/12/1999
// by SoftCos (Enzo Costantini)

unit ColorPicker;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons;


type

  TColBtn = class(TSpeedButton)
  protected
    procedure paint; override;
  public
    property Canvas;
  published
    property Color;
  end;

  TColorPicker = class(TCustomPanel)
    FColorDlg:TColorDialog;
  private
    FDropDownFlat : Boolean;
    FAutomaticColor : TColor;
    FIsAutomatic : Boolean;
    FAutoClicked : Boolean;
    procedure InitButtons;
    procedure UpdateButtons;
    procedure OtherBtnClick(Sender:TObject);
    procedure BtnClick(Sender:TObject);
    procedure SetAutomaticColor(Value:TColor);
    procedure SetIsAutomatic(Value:boolean);
    procedure SetDropDownFlat(Value:boolean);
    procedure ReadReg;
    procedure WriteReg;
  public
    AutoBtn,
    OtherColBtn:TColBtn;
    ColBtns: array[1..56] of TColBtn;
    OtherBtn:TSpeedButton;
    SelColor : TColor;
    RegKey : string;
    constructor Create(AOwner: TComponent); override;
    property AutomaticColor : TColor read FAutomaticColor write SetAutomaticColor;
    property IsAutomatic : boolean read FIsAutomatic write SetIsAutomatic;
    property AutoClicked:boolean read FAutoClicked default false;
    property DropDownFlat:Boolean read FDropDownFlat write SetDropDownFlat;
  end;

  TColPickDlg = class(TForm)
    ColPick: TColorPicker;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    SendCtrl:TControl;
    CloseOk:boolean;
    OtherOk:boolean;
    procedure WMKILLFOCUS(var message: TWMKILLFOCUS); message WM_KILLFOCUS;
    procedure WMERASEBKGND(var message: TWMERASEBKGND); message WM_ERASEBKGND;
  public
    SelectedColor:TColor;
    procedure Drop(Sender:TControl);
  end;


  TGlyphType = (gtForeground,gtBackground,gtLines,gtCustom);

  TColorBtn = class(TCustomPanel)
  private
    FFlat,
    FDropDownFlat : Boolean;
    FActiveColor : TColor;
    FAutomaticColor : TColor;
    FTargetColor : TColor;
    FGlyphType : TGlyphType;
    FIsAutomatic : Boolean;
    FOnBtnClick,
    FBeforeDropDown : TNotifyEvent;
    FAutoBtnCaption,
    FOtherBtnCaption:TCaption;
    FRegKey : string;
    procedure InitButtons;
    procedure Btn1Click(Sender:TObject);
    procedure Btn2Click(Sender:TObject);
    procedure SetFlat(Value:boolean);
    procedure SetActiveColor(Value:TColor);
    procedure SetGlyphType(Value:TGlyphType);
    procedure SetGlyph(Value:TBitMap);
    function GetGlyph:TBitMap;
    procedure SetRegKey(Value:string);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    Btn1:TColBtn;
    Btn2:TSpeedButton;
    procedure SetEnabled(Value:boolean);override;
  public
    AutoClicked:boolean;
    constructor Create(AOwner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure AdjustSize (var W: Integer; var H: Integer);
    procedure WMSize(var Message: TWMSize);  message WM_SIZE;
  published
    property ActiveColor : TColor read FActiveColor write SetActiveColor;
    property TargetColor : TColor read FTargetColor write FTargetColor;
    property Flat:Boolean read FFlat write SetFlat;
    property DropDownFlat:Boolean read FDropDownFlat write FDropDownFlat;
    property AutomaticColor : TColor read FAutomaticColor write FAutomaticColor;
    property IsAutomatic : boolean read FIsAutomatic write FIsAutomatic;
    property OnClick : TNotifyEvent read FOnBtnClick write FOnBtnClick;
    property BeforeDropDown : TNotifyEvent read FBeforeDropDown write FBeforeDropDown;
    property GlyphType : TGlyphType read FGlyphType write SetGlyphType default gtForeground;
    property Glyph : TBitMap read GetGlyph write SetGlyph;
    property AutoBtnCaption : TCaption read FAutoBtnCaption write FAutoBtnCaption;
    property OtherBtnCaption:TCaption read FOtherBtnCaption write FOtherBtnCaption;
    property RegKey : string read FRegKey write SetRegKey;
    property Enabled;
    property Hint;
    property ShowHint;
    property Visible;
    property Constraints;
    property Anchors;
    property ParentShowHint;
    property PopupMenu;
  end;

procedure Register;

implementation
uses Registry;
{$R *.Res}
const
     BtnDim=20;
     BtnColors:array[1..56] of TColor
     =($000000,$808080,$000040,$004040,$004000,$404000,$400000,$400040,
       $202020,$909090,$000080,$008080,$008000,$808000,$800000,$800080,
       $303030,$A0A0A0,$0000C0,$00C0C0,$00C000,$C0C000,$C00000,$C000C0,
       $404040,$B0B0B0,$0000FF,$00FFFF,$00FF00,$FFFF00,$FF0000,$FF00FF,
       $505050,$C0C0C0,$4040FF,$40FFFF,$40FF40,$FFFF40,$FF4040,$FF40FF,
       $606060,$D0D0D0,$8080FF,$80FFFF,$80FF80,$FFFF80,$FF8080,$FF80FF,
       $707070,$FFFFFF,$C0C0FF,$C0FFFF,$C0FFC0,$FFFFC0,$FFC0C0,$FFC0FF);

procedure Register;
begin
  RegisterComponents('SoftCos', [TColorBtn]);
  //RegisterComponents('SoftCos', [TColorPicker]);
end;

procedure TColBtn.Paint;
var B,X,Y:integer;
    FColor,BColor:TColor;
begin
     if Enabled
     then
     begin
          FColor:=Color;
          BColor:=clBlack;
     end
     else
     begin
          FColor:=clBtnFace;
          BColor:=clGray;
     end;
     B:=Height div 5;
     inherited;
     with Canvas do
     if Glyph.Handle<>0
     then
        begin
         X:=(Width div 2)-4+Integer(FState in [bsDown]);
         Y:= X+2;
         Pen.color:=BColor;
         Brush.Color:=FColor;
         Rectangle(X,Y,X+12,Y+10);
        end
     else
     if Caption=''
     then
        begin
         Pen.color:=clgray;
         Brush.Color:=FColor;
         Brush.Style:=bsSolid;
         Rectangle(B,B,Width-B,Height-B);
        end
     else
        begin
         Pen.color:=clgray;
         Brush.Style:=bsClear;
         Polygon([Point(B-1,B-1),
                  Point(Width-(B-1),B-1),
                  Point(Width-(B-1),Height-(B-1)),
                  Point(B-1,Height-(B-1))]);
         Pen.color:=clgray;
         Brush.Color:=FColor;
         Brush.Style:=bsSolid;
         Rectangle(B+1,B+1,Height,Height-B);
        end;
end;

constructor TColorPicker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csOpaque];
  if not NewStyleControls then ControlStyle := ControlStyle + [csFramed];
  Width := 170;
  Height :=200;
  FColorDlg:=TColorDialog.Create(self);
  FColorDlg.Options:=[cdFullOpen];
  InitButtons;
  FIsAutomatic:=true;
  FDropDownFlat:=true;
  ParentBackground:=FALSE;
end;

procedure TColorPicker.InitButtons;
var
  I : integer;
  Btn: TColBtn;
  ABtn:TSpeedButton;
  X,Y: Integer;
begin
  Btn:=TColBtn.Create(Self);
  Btn.Parent := Self;
  Btn.Flat:=true;
  Btn.Tag:=100;
  Btn.Color:=ClDefault;
  Btn.GroupIndex:=1;
  Btn.Anchors:=[akBottom];
  Btn.SetBounds(5,4,Width-10,BtnDim);
  Btn.OnClick:=BtnClick;
  AutoBtn:=Btn;
  for I := 1 to 56 do
  begin
    Btn := TColBtn.Create (Self);
    Btn.Parent := Self;
    Btn.Flat:=true;
    Btn.Color:=BtnColors[I];
    Btn.Anchors:=[akBottom];
    Btn.GroupIndex:=1;
    Btn.OnClick:=BtnClick;
    X := 5 + ((I - 1) mod 8 ) * BtnDim;
    Y := BtnDim+ 10 + BtnDim*((I-1) div 8);
    Btn.SetBounds (X, Y , BtnDim,BtnDim);
    ColBtns[I] := Btn;
  end;
  Btn:=TColBtn.Create(Self);
  Btn.Parent := Self;
  Btn.Flat:=true;
  Btn.Color:=FColorDlg.Color;
  Btn.SetBounds(5,BtnDim*8+15,BtnDim,BtnDim);
  Btn.GroupIndex:=1;
  Btn.Anchors:=[akBottom];
  Btn.OnClick:=BtnClick;
  OtherColBtn:=Btn;
  ABtn:=TSpeedButton.Create(Self);
  ABtn.Parent := Self;
  ABtn.Flat:=true;
  ABtn.SetBounds(5+BtnDim,BtnDim*8+15,Width-10-BtnDim,BtnDim);
  ABtn.Anchors:=[akBottom];
  OtherBtn:=ABtn;
  OtherBtn.OnClick:=OtherBtnClick;
end;

procedure TColorPicker.UpdateButtons;
var I : integer;
begin
     Height:=Height-22;
     for I:=1 to 56
     do ColBtns[I].Top:=ColBtns[I].Top-22;
     OtherColBtn.Top:=OtherColBtn.Top-22;
     OtherBtn.Top:=OtherBtn.Top-22;
end;

procedure TColorPicker.ReadReg;
var ECIni:TRegistry;
    I : Integer;
begin
     ECIni := TRegistry.Create;
     try
     with ECIni do
     if OpenKey('SoftWare',false) and
        OpenKey('SoftCos',false) and
        OpenKey(RegKey,false)
       then
     for I:=0 to 15 do
       FColorDlg.CustomColors.Add('Color'+Char(65+I)+'='+
                                    ReadString('Color'+Char(65+I)));
     finally
     ECIni.Free;
     end;
end;


procedure TColorPicker.WriteReg;
var ECIni:TRegistry;
    I:integer;
begin
     ECIni := TRegistry.Create;
     try
     with ECIni do
     if OpenKey('SoftWare',true) and
        OpenKey('SoftCos',true) and
        OpenKey(RegKey,true)
     then
     for I:=0 to 15 do
     WriteString(FColorDlg.CustomColors.Names[I],
     FColorDlg.CustomColors.Values[FColorDlg.CustomColors.Names[I]]);
     finally ECIni.Free; end;
end;

procedure TColorPicker.OtherBtnClick(Sender:TObject);
begin
     FColorDlg.Color:=OtherColBtn.Color;
     TColPickDlg(Owner).OtherOk:=true;
     ReadReg;
     if FColorDlg.Execute
     then
       begin
         OtherColBtn.Color:=FColorDlg.Color;
         WriteReg;
       end;  
     TColPickDlg(Owner).OtherOk:=false;
     SendMessage(TColPickDlg(Owner).Handle,WM_SETFOCUS,0,0);
end;

procedure TColorPicker.BtnClick(Sender:TObject);

begin
     if TControl(Sender).Tag=100
     then FAutoClicked:=true
     else FAutoClicked:=false;
     SelColor:=TColBtn(Sender).Color;
     SendMessage(TwinControl(Owner).handle,WM_KeyDown,vk_return,0);

end;

procedure TColorPicker.SetAutomaticColor(Value:TColor);
begin
     if Value<>FAutomaticColor
     then
     begin
          FAutomaticColor:=Value;
          AutoBtn.Color:=Value;
     end;
end;
procedure TColorPicker.SetIsAutomatic(Value:boolean);
begin
     if Value<>FIsAutomatic
     then
     begin
          FIsAutoMatic:=Value;
          AutoBtn.visible:=Value;
     end;
     if not FIsAutomatic
     then UpdateButtons;
end;

procedure TColorPicker.SetDropDownFlat(Value:boolean);
var i:integer;
begin
     if Value<>FDropDownFlat
     then
     try
        FDropDownFlat:=Value;
        for i:=1 to 56 do ColBtns[i].Flat:=Value;
        AutoBtn.Flat:=Value;
        OtherBtn.Flat:=Value;
        OtherColBtn.Flat:=Value;
     except
     end;
end;


{TColPickDlg}


procedure TColPickDlg.Drop(Sender:TControl);
begin
     SendCtrl:=Sender;
     Show;
end;

procedure TColPickDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=vk_escape then Close;
     if Key=vk_return then
                         begin
                           SelectedColor:=ColPick.SelColor;
                           CloseOk:=true;
                           Close;
                         end;
     Key:=0;
end;

procedure TColPickDlg.FormShow(Sender: TObject);
var i:integer;
    ok:boolean;
begin
     CloseOk:=false;
     ok:=false;
     for i:=1 to 56 do
     begin
          if BtnColors[i]=SelectedColor
          then
              begin
                ColPick.ColBtns[i].down:=true;
                Ok:=true;
              end;
     end;
     if not Ok
     then
        begin
             ColPick.OtherColBtn.Color:=SelectedColor;
             ColPick.OtherColBtn.Down:=true;
        end;
end;

procedure TColPickDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if CloseOk
          then
          with TColorBtn(SendCtrl) do
          begin
            Btn1.Color:=SelectedColor;
            FActiveColor:=SelectedColor;
            FTargetColor:=SelectedColor;
            AutoClicked:=ColPick.AutoClicked;
            Btn1Click(Sender);
          end;
     Action:=caFree;
end;

procedure TColPickDlg.WMKILLFOCUS(var message: TWMKILLFOCUS);
begin
     if not OtherOk then Self.Close;
end;

procedure TColPickDlg.WMERASEBKGND(var message: TWMERASEBKGND);
begin
     message.Result := 1;
end;

{TColorBtn}

constructor TColorBtn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ParentBackground:=FALSE;
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csOpaque];
  if not NewStyleControls then ControlStyle := ControlStyle + [csFramed];
  Height :=22;
  BevelOuter:=bvNone;
  InitButtons;
  FFlat:=false;
  FDropDownFlat:=true;
  FIsAutomatic:=True;
  FAutoBtnCaption:='Automatic';
  FOtherBtnCaption:='&Other colors...';
  FRegKey:='Palette0';
end;

procedure TColorBtn.InitButtons;

begin
  Btn1:=TColBtn.Create(Self);
  Btn1.Parent := Self;
  Btn1.Color:=FActiveColor;
  Btn1.OnClick:=Btn1Click;
  Btn1.Glyph.Handle:= LoadBitmap(HInstance,'FRCOLOR');
  Btn2:=TSpeedButton.Create(Self);
  Btn2.Parent := Self;
  Btn2.Glyph.Handle:= LoadBitmap(HInstance,'DROPDOWN');
  Btn2.OnClick:=Btn2Click;
end;

procedure TColorBtn.CMMouseEnter(var Message: TMessage);
begin//

end;

procedure TColorBtn.CMMouseLeave(var Message: TMessage);
begin//

end;

procedure TColorBtn.Btn1Click(Sender:TObject);
begin
     if not (csDesigning in ComponentState) and Assigned(FOnBtnClick) then
     FOnBtnClick(Self);
end;

procedure TColorBtn.Btn2Click(Sender:TObject);
var P:TPoint;
    Dlg:TColPickDlg;
begin
     if not (csDesigning in ComponentState) and
             Assigned(FBeforeDropDown)
     then FBeforeDropDown(Self);
     P.X:=TControl(Sender).Left-TControl(Sender).height;
     P.Y:=TControl(Sender).Top+TControl(Sender).height;
     P:=ClientToScreen(P);
     Dlg:= TColPickDlg.CreateNew(Application);
     with Dlg do
     begin
          Left:=P.X;
          Top:=P.Y;
          BorderIcons := [];
          BorderStyle := bsNone;
          ColPick:=TColorPicker.Create(Dlg);
          ColPick.Parent := Dlg;
          ColPick.AutomaticColor:=FAutomaticColor;
          ColPick.IsAutomatic:=FIsAutomatic;
          ColPick.DropDownFlat:=FDropDownFlat;
          ColPick.AutoBtn.Caption:=FAutoBtnCaption;
          ColPick.OtherBtn.Caption:=FOtherBtnCaption;
          ColPick.RegKey:=FRegKey;
          ColPick.Left := 0;
          ColPick.Top := 0;
          ClientHeight:=ColPick.Height;
          ClientWidth:=ColPick.Width;
          OnKeyDown:= FormKeyDown;
          OnShow:=FormShow;
          OnClose:=FormClose;
          SelectedColor:=TargetColor;
          Drop(TColorBtn(self));
     end;
end;

procedure TColorBtn.SetFlat(value:boolean);
begin
     if Value<>FFlat
     then
     begin
        FFlat:=Value;
        Btn1.Flat:=Value;
        Btn2.Flat:=Value;
     end;
end;

procedure TColorBtn.AdjustSize (var W: Integer; var H: Integer);
begin
  if (csLoading in ComponentState) then Exit;
  if Btn1 = nil then Exit;
  W:=H+(H div 2)+4;
  Btn1.SetBounds(0,0,H,H);
  Btn2.SetBounds(H,0,(H div 2)+4,H);
end;

procedure TColorBtn.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  W, H: Integer;
begin
  W := AWidth;
  H := AHeight;
  AdjustSize (W, H);
 inherited SetBounds (ALeft, ATop, W, H);
end;

procedure TColorBtn.WMSize(var Message: TWMSize);
var
  W, H: Integer;
begin
  inherited;
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds(Left, Top, W, H);
  Message.Result := 0;
end;

procedure TColorBtn.SetActiveColor(Value:TColor);
begin
     if Value<>FActiveColor
     then
         begin
              FActiveColor:=Value;
              Btn1.Color:=Value;
         end;
end;

procedure TColorBtn.SetGlyphType(Value:TGlyphType);
begin
     if Value<>FGlyphType
     then
       begin
            FGlyphType:=Value;
            case FGlyphType of
            gtForeground:
            Btn1.Glyph.Handle:=LoadBitmap(HInstance,'FRCOLOR');
            gtBackground:
            Btn1.Glyph.Handle:=LoadBitmap(HInstance,'BKCOLOR');
            gtLines:
            Btn1.Glyph.Handle:=LoadBitmap(HInstance,'LNCOLOR');
            gtCustom:
            Btn1.Glyph:=nil;
            end;
            Btn1.Invalidate;
       end;
end;

procedure TColorBtn.SetGlyph(Value:TBitMap);
begin
     FGlyphType:=gtCustom;
     Btn1.Glyph:=Value;
     Btn1.Invalidate;
end;

function TColorBtn.GetGlyph:TBitMap;
begin
     result:= btn1.Glyph;
end;

procedure TColorBtn.SetRegKey(Value:string);
begin
     if Value<>FRegKey
     then
     begin
          if Value=''
          then FRegKey:='Palette0'
          else FRegKey:=Value;
     end;
end;

procedure TColorBtn.SetEnabled(Value:boolean);
begin
     Btn1.Enabled:=Value;
     Btn2.Enabled:=Value;
     inherited;
end;


end.


