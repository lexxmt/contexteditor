unit FontCtls;
{
Two controls for choosing installed fonts for Delphi 2, 32-bit.
Slight adjustments necessary for use under Delphi 1.
They show TTF, Type1 and bitmap fonts with individual bitmaps.
No more fuss with FontDialog!
Suggestions/improvements welcome.
-----------------------------------------------------------------------
Quality freeware from Sight&Sound, Slovenia : http://www.sight-sound.si
Version 1.0: release date 15.11.1996
}

interface

uses
 Windows, Messages, Classes, Graphics, Controls, StdCtrls;

type
  FontTypes = (PS, TTF, RASTER, UNKNOWN);

  TFontClass = Class
                FntName : String;
                FntType : FontTypes;
                Fixed   : boolean;
               End;

  TFontStrList = Class(TStringList)
                  Destructor Destroy; Override;
                 End;

  TBitmapArray = array [0..3] of TBitmap;

  TFilterOption = (ShowTrueType, ShowPostScript, ShowRaster, ShowFixedOnly);
  TFilterOptions = Set of TFilterOption;

  EValidateFont = procedure (Sender: TObject; Font: TFontClass; var accept:Boolean) of object;

  TFontListBox = Class(TCustomListBox)
  private
    { Private declarations }
    FFilterOptions : TFilterOptions;
    FontStringList : TFontStrList;
    FOnValidateFont : EValidateFont;
    FBitmaps : TBitmapArray;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  protected
    { Protected declarations }
    procedure CreateWnd; override;
    procedure SetFilterOptions(Value : TFilterOptions);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure   ReBuild;
  published
   { pusblish the TListBox properties }
   property Align;
   property BorderStyle;
   property Color;
   property Ctl3D;
   property DragCursor;
   property DragMode;
   property Enabled;
   property ExtendedSelect;
   property FilterOptions: TFilterOptions
            read FFilterOptions
            write SetFilterOptions
            default [ShowTrueType, ShowPostScript, ShowRaster];
   property Font;
   property IntegralHeight;
   property ItemHeight;
   property Items;
   property MultiSelect;
   property ParentColor;
   property ParentCtl3D;
   property ParentFont;
   property ParentShowHint;
   property PopupMenu;
   property ShowHint;
   property TabOrder;
   property TabWidth;
   property Visible;
   { pusblished the TListBox events }                                               
   property OnValidateFont:EValidateFont read FOnValidateFont write FOnValidateFont;
   property OnClick;
   property OnDblClick;
   property OnDragDrop;
   property OnDragOver;
   property OnDrawItem;
   property OnEndDrag;
   property OnEnter;
   property OnExit;
   property OnKeyDown;
   property OnKeyPress;
   property OnKeyUp;
   property OnMeasureItem;
   property OnMouseDown;
   property OnMouseMove;
   property OnMouseUp;
   property OnStartDrag;
  end;

  TFontComboBox = Class(TCustomComboBox)
  private
    { Private declarations }
    FFilterOptions : TFilterOptions;
    FontStringList : TFontStrList;
    FOnValidateFont : EValidateFont;
    FBitmaps : TBitmapArray;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  protected
    { Protected declarations }
    procedure CreateWnd; override;
    procedure SetFilterOptions(Value : TFilterOptions);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure   ReBuild;
  published
   { pusblish the TComboBox properties }
   property Align;
   property Color;
   property Ctl3D;
   property DragMode;
   property DragCursor;
   property DropDownCount;
   property Enabled;
   property FilterOptions: TFilterOptions
            read FFilterOptions
            write SetFilterOptions
            default [ShowTrueType, ShowPostScript, ShowRaster];
   property Font;
   property ItemHeight;
   property Items;
   property MaxLength;
   property ParentColor;
   property ParentCtl3D;
   property ParentFont;
   property ParentShowHint;
   property PopupMenu;
   property ShowHint;
   property TabOrder;
   property TabStop;
   property Text;
   property Visible;
   property OnValidateFont:EValidateFont read FOnValidateFont write FOnValidateFont;
   property OnChange;
   property OnClick;
   property OnDblClick;
   property OnDragDrop;
   property OnDragOver;
   property OnDrawItem;
   property OnDropDown;
   property OnEndDrag;
   property OnEnter;
   property OnExit;
   property OnKeyDown;
   property OnKeyPress;
   property OnKeyUp;
   property OnMeasureItem;
   property OnStartDrag;
  end;

procedure Register;

{$R FONTSYMB.RES}

implementation

Destructor TFontStrList.Destroy;
(* User defined list destructor *)
Var
 Temp : TObject;
Begin
 While Count > 0 Do
  Begin
   Temp := Objects[0];
   Temp.Free;
   Delete(0);
  End;
 Inherited Destroy;
End;

function AddFontToList(Sender: TObject; FntClass : TFontClass):Boolean;
var
 cont: Boolean;
begin
 cont := true;
 if Sender is TFontListBox then
  with Sender as TFontListBox do
   begin
    if assigned(FOnValidateFont) then
     FOnValidateFont(Sender,FntClass,cont);
    if cont then
     with FntClass do
      if not ((ShowFixedOnly in FFilterOptions) and Fixed) then begin
        Case FntType of
         PS     : if ShowPostScript in FFilterOptions then
                   FontStringList.AddObject(FntName, fntClass);
         TTF    : if ShowTrueType in FFilterOptions then
                   FontStringList.AddObject(FntName, fntClass);
         RASTER : if ShowRaster in FFilterOptions then
                   FontStringList.AddObject(FntName, fntClass);
         else
          FontStringList.AddObject(FntName, FntClass);
        end;
     end;
   end
 else
  with Sender as TFontComboBox do
   begin
    if assigned(FOnValidateFont) then
     FOnValidateFont(Sender,FntClass,cont);
    if cont then
     with FntClass do
      if not ((ShowFixedOnly in FFilterOptions) and Fixed) then begin
        Case FntType of
         PS     : if ShowPostScript in FFilterOptions then
                   FontStringList.AddObject(FntName, fntClass);
         TTF    : if ShowTrueType in FFilterOptions then
                   FontStringList.AddObject(FntName, fntClass);
         RASTER : if ShowRaster in FFilterOptions then
                   FontStringList.AddObject(FntName, fntClass);
         else
          FontStringList.AddObject(FntName, FntClass);
        end;
      end;
   end;
 Result := true;
end;


function EnumFontFamProc(var LogFont    : TLogFont;
                         var TextMetric : TTextMetric;
                             FontType   : Integer;
                             Data       : Pointer): Integer; StdCall;
var
 FontClass : TFontClass;

begin
 FontClass := TFontClass.Create;

 With FontClass Do
  begin
   FntName := LogFont.lfFaceName;
   Case FontType of
    1 : FntType := RASTER;
    2 : FntType := PS;
    4 : FntType := TTF;
   else
    FntType := UNKNOWN;
   end;
   Fixed:=(TextMetric.tmPitchAndFamily and TMPF_FIXED_PITCH)>0;
  end;

 result := 0;

 if TObject(Data) is TFontListBox then
  begin
    if AddFontToList(TFontListBox(Data),FontClass) then
    result := 1
   else
    result := 0;
  end;
 if TObject(Data) is TFontComboBox then
  begin
   if AddFontToList(TFontComboBox(Data),FontClass) then
    result := 1
   else
    result := 0;
  end
end;

procedure GetAllInstalledScreenFonts(Sender: TObject);
(* Returns list of all installed screen fonts *)
var
 DC : HDC;
begin
 DC := GetDC(0);
 EnumFontFamilies(DC, nil, @EnumFontFamProc, LongInt(Pointer(Sender)));
 ReleaseDC(0, DC);
end;


Constructor TFontListBox.Create(AOwner: TComponent);
var i : integer;
begin
 inherited Create(AOwner);
 Font.Name  := 'MS Sans Serif';
 Font.Size  := 8;
 Font.Style := Font.Style - [fsBold];
 Sorted     := True;
 Style      := lbOwnerDrawFixed;
 ItemHeight := 16;
 FontStringList := TFontStrList.Create;
 FontStringList.Sorted := True;
 FontStringList.Clear;
 for i := 0 to 3 do
  FBitmaps[i]:= TBitmap.Create;
 FBitmaps[0].Handle := LoadBitmap(hinstance,'PS');
 FBitmaps[1].Handle := LoadBitmap(hinstance,'TTF');
 FBitmaps[2].Handle := LoadBitmap(hinstance,'RASTER');
 FBitmaps[3].Handle := LoadBitmap(hinstance,'UNKNOWN');
 FFilterOptions  := [ShowTrueType, ShowPostScript, ShowRaster];
 GetAllInstalledScreenFonts(Self);
end;

Constructor TFontComboBox.Create(AOwner: TComponent);
var i : integer;
begin
 inherited Create(AOwner);
 Font.Name  := 'MS Sans Serif';
 Font.Size  := 8;
 Font.Style := Font.Style - [fsBold];
 Sorted     := True;
 Style      := csOwnerDrawFixed;
 ItemHeight := 16;
 FontStringList := TFontStrList.Create;
 FontStringList.Sorted := True;
 FontStringList.Clear;
 for i := 0 to 3 do
  FBitmaps[i]:= TBitmap.Create;
 FBitmaps[0].Handle := LoadBitmap(hinstance,'PS');
 FBitmaps[1].Handle := LoadBitmap(hinstance,'TTF');
 FBitmaps[2].Handle := LoadBitmap(hinstance,'RASTER');
 FBitmaps[3].Handle := LoadBitmap(hinstance,'UNKNOWN');
 FFilterOptions  := [ShowTrueType, ShowPostScript, ShowRaster];
 GetAllInstalledScreenFonts(Self);
end;

Destructor TFontListBox.Destroy;
var i : integer;
begin
 for i := 0 to 3 do
  FBitmaps[i].Free;
 FontStringList.Destroy;
 inherited Destroy;
end;

Destructor TFontComboBox.Destroy;
var i : integer;
begin
 for i := 0 to 3 do
  FBitmaps[i].Free;
 FontStringList.Destroy;
 inherited Destroy;
end;


procedure TFontListBox.CreateWnd;
begin
 inherited CreateWnd;
 Items.Assign(FontStringList);
 ItemIndex := 0;
end;


procedure TFontComboBox.CreateWnd;
begin
 inherited CreateWnd;
 Items.Assign(FontStringList);
 ItemIndex := 0;
end;


procedure TFontListBox.Rebuild;
begin
 FontStringList.Clear;
 GetAllInstalledScreenFonts(Self);
 Items.Assign(FontStringList);
end;


procedure TFontComboBox.Rebuild;
begin
 FontStringList.Clear;
 GetAllInstalledScreenFonts(Self);
 Items.Assign(FontStringList);
end;


procedure TFontListBox.SetFilterOptions(Value: TFilterOptions);
begin
 if FFilterOptions <> Value then
  begin
   FFilterOptions := Value;
   Rebuild;
  end;
end;


procedure TFontComboBox.SetFilterOptions(Value: TFilterOptions);
begin
 if FFilterOptions <> Value then
  begin
   FFilterOptions := Value;
   Rebuild;
  end;
end;


procedure TFontListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
 tmpbitmap1,
 tmpbitmap2   : TBitmap;
 ARect,BRect  : TRect;
 TmpColor     : TColor;
 TmpFontClass : TFontClass;
begin
 TmpFontClass := TFontClass(FontStringList.Objects[Index]);
 tmpbitmap1      := TBitmap.Create;
 tmpbitmap1.Assign(FBitmaps[ord(TmpFontClass.FntType)]);
 if odSelected in State then
  TmpColor := clHighLight
 else
  TmpColor := Color;
 with arect do
  begin
   left   := 0;
   top    := 0;
   bottom := tmpbitmap1.Height;
   right  := tmpbitmap1.Width;
  end;
 Canvas.FillRect(Rect);
 tmpbitmap2 := TBitmap.Create;
 with tmpbitmap2, canvas do
  begin
   Height      := tmpbitmap1.Height;
   Width       := tmpbitmap1.Width;
   Brush.Color := TmpColor;
   BrushCopy(ARect, tmpbitmap1, ARect, clWhite); // white is transparent in bitmap
  end;
 with brect do
  begin
   left   := rect.left;
   top    := rect.top;
   bottom := rect.bottom;
   right  := rect.bottom-rect.top;
  end;
 with canvas do
  begin
   copyrect(bRect, tmpbitmap2.Canvas, ARect);
   TextOut(Rect.Left+brect.right+2, Rect.Top, TmpFontClass.FntName);
  end;
 tmpbitmap2.Free;
 tmpbitmap1.Free;
end;


procedure TFontComboBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
 tmpbitmap1,
 tmpbitmap2   : TBitmap;
 ARect,BRect  : TRect;
 TmpColor     : TColor;
 TmpFontClass : TFontClass;
begin
 TmpFontClass := TFontClass(FontStringList.Objects[Index]);
 tmpbitmap1 := TBitmap.Create;
 tmpbitmap1.Assign(FBitmaps[ord(TmpFontClass.FntType)]);
 if odSelected in State then
  TmpColor := clHighLight
 else
  TmpColor := Color;
 with arect do
  begin
   left   := 0;
   top    := 0;
   bottom := tmpbitmap1.Height;
   right  := tmpbitmap1.Width;
  end;
 Canvas.FillRect(Rect);
 tmpbitmap2 := TBitmap.Create;
 with tmpbitmap2, canvas do
  begin
   Height      := tmpbitmap1.Height;
   Width       := tmpbitmap1.Width;
   Brush.Color := TmpColor;
   BrushCopy(ARect, tmpbitmap1, ARect, clWhite); // white is transparent in bitmap
  end;
 with brect do
  begin
   left   := rect.left;
   top    := rect.top;
   bottom := rect.bottom;
   right  := rect.bottom-rect.top+rect.left;
  end;
 with canvas do
  begin
   copyrect(bRect, tmpbitmap2.Canvas, ARect);
   TextOut(Rect.Left+brect.right+2, Rect.Top, TmpFontClass.FntName);
  end;
 tmpbitmap2.Free;
 tmpbitmap1.Free;
end;


procedure TFontListBox.CMFontChanged(var Message: TMessage);
begin
 Canvas.Font := Font;
 ItemHeight  := Canvas.TextHeight(' ');
 inherited;
end;


procedure TFontComboBox.CMFontChanged(var Message: TMessage);
begin
 Style := csDropDownList;
 inherited;
 ItemHeight := ItemHeight;
 Style := csOwnerDrawFixed;
end;


procedure Register;
begin
 RegisterComponents('ConTEXT Components', [TFontListBox,TFontComboBox]);
end;

end.
