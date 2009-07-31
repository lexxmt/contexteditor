{************************************************************
  This Unit contains:
  - The class/component TDirLabel.
  - The property editor TAbout.

  Suitable for Delphi 1, Delphi 2 and Delphi 3.

  Main purpose off the component TDirLabel:
  - Displaying a filename with path in a label which has a
    fixed width. Therefore the path has to be made shorter if
    necessary and possible, e.g.:
    c:\program\delphi\testen1\testen2\filenaam.pas
    can become something like:
    c:\...\testen1\testen2\filenaam.pas

  Programmer		   : Frank Millenaar Ir.
  Place 		   : Utrecht
  Date Start		   :  5- 1-1998
  Latest change 	   : 10- 1-1998
************************************************************}
unit DirLabel;

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  StdCtrls, Menus;

type

  TDirLabel = class(TCustomLabel)
  private
    { Private declarations }
    FDirName: String;
    procedure SetDirName(Value: String);
    function MakePathShorterByOneDir(Var Pad: String): Boolean;
    function KortPadIn(Pad: String; maxL: Integer): String;
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure DoDrawText(var Rect: TRect; Flags: LongInt); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  published
    { Published declarations }
    property DirName: String read FDirName write SetDirName;
    property Align;
    property Alignment;
    {property AutoSize; You don't wand AutoSize.}
    {property Caption;	Caption is replaced by DirName.}
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
    {property Layout;	Delphi 3 only}
    property Visible;
    {property WordWrap;  You don't wand wordwrap.}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  {$IFDEF WIN32}
    property OnStartDrag;
  {$ENDIF}
  end;

procedure Register;

implementation
uses
  Types;

procedure Register;
begin
  RegisterComponents('ConTEXT Components', [TDirLabel]);
end;

constructor TDirLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 65;
  Height := 17;
  AutoSize := False;
  WordWrap := False;
  FDirName := Caption;
end;

procedure TDirLabel.SetDirName(Value: String);
begin
  if FDirName <> Value then
  begin
    FDirName := Value;
    Caption := Value;
    Invalidate;
  end;
end;

procedure TDirLabel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  {Design time changing the width of DirLabel, will give
   automaticly adjustment of the path and filename.}
  if not (csLoading in ComponentState) then
    if (AWidth <> Width) then
      if FDirName = '' then
	FDirName := Caption  {some how necessary}
      else
	Caption := FDirName; {This couses the proper adjustment.}
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
end;

procedure TDirLabel.DoDrawText(var Rect: TRect; Flags: LongInt);
var
  Text: string;
  PText: array[0..255] of char;
begin
  Text := Caption; {GetLabelText;  not compatible with D1}
  if (Flags and DT_CALCRECT <> 0) and (Text = '') then Text := Text + ' ';
  Canvas.Font := Font;
  StrPCopy(PText, Text);  {PChar(Text) is not compatible with D1}
  if not Enabled then
  begin
    OffsetRect(Rect, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawText(Canvas.Handle, PText, Length(Text), Rect, Flags); 
    OffsetRect(Rect, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawText(Canvas.Handle, PText, Length(Text), Rect, Flags);
  end
  else
    DrawText(Canvas.Handle, PText, Length(Text), Rect, Flags);
end;

procedure TDirLabel.Paint;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  Rect, CalcRect: TRect;
  DrawStyle: Integer;
  Text: String;
  WidthToLong: Integer;
begin
  with Canvas do
  begin
    if not Transparent then
    begin
      Brush.Color := Self.Color;
      Brush.Style := bsSolid;
      FillRect(ClientRect);
    end;
    Brush.Style := bsClear;
    Rect := ClientRect;
    DrawStyle := DT_EXPANDTABS or DT_SINGLELINE or DT_LEFT or Alignments[Alignment];
    {Calculate with}
    Text := Caption;
    {With DT_CALCRECT there will be no drawing, you get back the
     demension of the text ractangle.}
    DoDrawText(CalcRect, DrawStyle or DT_CALCRECT);
    {CalcRect.left and right are negative numbers! Therefore
     WidthToLong := width - (-CalcRect.left - -CalcRect.right) - 1;
     becoms like the next line.}
    WidthToLong := width + CalcRect.left -CalcRect.right - 1;
    while (widthToLong < 0) and (Text <> '') do
    begin
      {Try to remove the most left directory in the 'Pad'.}
      if MakePathShorterByOneDir(Text) then
      begin
	{calculate new width}
	Caption := Text;
	DoDrawText(CalcRect, DrawStyle or DT_CALCRECT);
	WidthToLong := width + CalcRect.left -CalcRect.right - 1;
      end
      else
      begin
	Text := '';
      end;
    end;
    DoDrawText(Rect, DrawStyle);
  end;
end;

function TDirLabel.MakePathShorterByOneDir(Var Pad: String): Boolean;
{Try to remove the most left directory in the 'Pad'.}
var
  LengthPadIn: Integer;
  i: Integer;
  NewPad: String;
begin
  LengthPadIn := length(Pad);
  NewPad := Pad;
  i:= LengthPadIn;
  while (length(NewPad) = LengthPadIn) and (i > 18) do
  begin
    NewPad := KortPadIn(NewPad, i);
    dec(i);
  end;
  Pad := NewPad;
  if (length(NewPad) = LengthPadIn) then
    Result := False
  else
    Result := True;
end;

function TDirLabel.KortPadIn(Pad: String; maxL: Integer): String;
{ Tested for:
  E:\dcode\remainde\rem.db 19 -> E:\..rem.db
  E:\dcode\remainde\rem.db 20 -> E:\..\remainde\rem.db
  E:\dcode\remainde\test\a 19 -> E:\..\test\a
  E:\dcode\remainde\test\a 20 -> E:\..\remainde\test\a
  1995, Turbo Pascal }
const
  start = 6;	  {for e.g. 'c:\...' }
  MinFileL = 12;  {8 characters for the name bevore the point
		   3 characters for the extention and 1 for the point.}
var
  TempPad: String;
  Lfile: Integer;  {lengte filenaam}
  i: Integer;
begin
  If (length(Pad) > maxL) and (maxL > (start+MinFileL) ) then
  {stop if: -path is short enaugh or
	    -The new to make path lenght is shorter then (start+MinFileL) characters (6 + 12). }
  begin
    Lfile := Length(Pad);
    for i := Length(Pad) downto 0 do	 {Determen length filename}
    begin
      If Pad[i] = '\' then
      begin
	Lfile := Length(Pad)-i;
	Break;
      end;
    end;
    if (Lfile + start) >= maxL then
      TempPad := copy(Pad, length(Pad)-Lfile, 255)
    else
      TempPad := copy(Pad, length(Pad)-maxL+start, 255);

    if (length(TempPad)-Lfile) > 1 then
    begin
    {find the first '\' from the left}
    for i := 1 to (length(TempPad)-Lfile) do
    begin
      If TempPad[i] = '\' then
      begin
	{copy everything after the first '\' from the left}
	TempPad := copy(TempPad, i, 255);
	Break;
      end;
    end;
    end;
    TempPad := copy(Pad, 1, 3) + '...' + TempPad;
    KortPadIn := TempPad;
  end
  else
    KortPadIn := Pad;
end;

end.

