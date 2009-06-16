{ ========================================================================
  Unit:    HexEdits
  VCL:     THexEdit
  Version: 1.0
  Copyright (C) 1996, Immo Wache
  ========================================================================}
unit HexEdits;

interface
uses WinTypes, WinProcs, Classes, StdCtrls, ExtCtrls, Controls, Messages,
     SysUtils, Forms, Graphics, Menus, Buttons, Clipbrd, Dialogs;

type
//  TEditBase =(ebHex, ebDec, ebOct, ebBin);
  TEditBase =(ebDec, ebHex, ebBin, ebOct);

  THexEdit = class(TCustomEdit)
  private
    FMinValue, FMaxValue: Longint;
    FValidate: Boolean;
    FNumBase: TEditBase;
    procedure SetNumBase( NewValue: TEditBase);
    procedure SetValue( NewValue : Longint );
    function  GetValue: Longint;
    function  CheckValue( NewValue: Longint): Longint;
    procedure SetMaxValue( NewValue: Longint);
    procedure SetMinValue( NewValue: Longint);
    procedure SetValidate( B:  Boolean);
    function  SyntaxOk(const S: string): Boolean;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    function  BaseStrToInt(const S: string): Longint;
    function  IntToBaseStr(Value: Longint): string;
  protected
    function  IsValidChar( Key: Char) : Boolean; virtual;
    procedure KeyDown(var Key: Word; Shift : TShiftState ); override;
    procedure KeyPress(var Key: Char ); override;
    function  ValidCopy: Boolean;
    function  ValidPaste: Boolean;
    function  ValidCut: Boolean;
    function  ValidDelete: Boolean;
  public
    constructor Create( AOwner : TComponent ); override;
  published
    property AutoSelect;
    property AutoSize;
    property Anchors;
    property BorderStyle;
    property Color;
    property NumBase: TEditBase read FNumBase write SetNumBase;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property MaxLength;
    property MaxValue: Longint read FMaxValue write SetMaxValue;
    property MinValue: Longint read FMinValue write SetMinValue;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Validate: Boolean read FValidate write SetValidate;
    property Value: Longint read GetValue write SetValue;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

const
//  Base: array[TEditBase] of Byte =(16, 10, 8, 2);
  Base: array[TEditBase] of Byte =(10, 16, 2, 8);

constructor THexEdit.Create( AOwner : TComponent);
begin
  inherited Create( AOwner);
  {force Text to '0'}
  SetValue( 0);
end;

function THexEdit.BaseStrToInt(const S: string): Longint;
var
  Digit, I: Byte;
begin
  Result :=0;
  for I :=1 to Length( S) do
  begin
    Digit :=ord( S[I]) -ord('0');
    if Digit >10 then Dec( Digit, 7);
    Result :=Result *Base[NumBase] +Digit;
  end;
end;

function THexEdit.IntToBaseStr(Value: Longint): string;
var
  Ch: Char;
begin
  Result :='';
  repeat
    Ch :='0';
    Inc(Ch, Value mod Base[NumBase]);
    if Ch >'9' then Inc(Ch, 7);
    Insert( Ch, Result, 1);
    Value :=Value div Base[NumBase];
  until Value =0;
end;

function THexEdit.GetValue: Longint;
begin
  Result :=BaseStrToInt( Text);
end;

procedure THexEdit.SetValue(NewValue: Longint);
begin
  Text:=IntToBaseStr( CheckValue( NewValue));
end;

procedure THexEdit.SetNumBase( NewValue: TEditBase);
var
  TempValue: LongInt;
begin
  TempValue :=Value;
  FNumBase :=NewValue;
  SetValue( TempValue);
end;

function THexEdit.CheckValue( NewValue: Longint): Longint;
begin
  if NewValue <0 then NewValue :=0;
  Result :=NewValue;
  if FValidate then
  begin
    if      NewValue < FMinValue then Result:= FMinValue
    else if NewValue > FMaxValue then Result:= FMaxValue;
  end;
end;

procedure THexEdit.SetMaxValue( NewValue: Longint);
begin
  if NewValue <0 then NewValue :=0;
  FMaxValue := NewValue;
  SetValue( Value);
end;

procedure THexEdit.SetMinValue( NewValue: Longint);
begin
  if NewValue <0 then NewValue :=0;
  FMinValue := NewValue;
  SetValue( Value);
end;

procedure THexEdit.SetValidate( B:  Boolean);
begin
  FValidate :=B;
  SetValue( Value);
end;

function THexEdit.SyntaxOk(const S: string): Boolean;
var
  I:        Byte;
  NewValue: LongInt;
begin
  { syntax correct if all chars are valid }
  Result := True;
  for I :=1 to Length(S) do
  begin
     if not (S[I] in ['0'..'9', 'A'..'F']) or
        (BaseStrToInt( S[I]) >=Base[NumBase]) then Result := False;
  end;
  { syntax correct if Value inside bounds }
  if Result and FValidate then
  begin
    NewValue :=BaseStrToInt( S);
    if (NewValue < FMinValue) or (NewValue > FMaxValue) then Result:= False;
  end;
end;

procedure THexEdit.CMEnter( var Message: TCMGotFocus);
begin
  if AutoSelect and not( csLButtonDown in ControlState ) then SelectAll;
  inherited;
end;

procedure THexEdit.CMExit( var Message: TCMExit);
begin
  inherited;
  SetValue( Value);
end;

function THexEdit.IsValidChar( Key: Char): Boolean;
begin
  case Key of
    '0'..'9', 'A'..'F':
         Result := SyntaxOk( Copy( Text, 1, SelStart ) +
                             Key +
                             Copy( Text, SelStart+1+SelLength, 255 ));
    ^H: if SelLength = 0 then                         { ^H = Backspace }
          Result := SyntaxOk( Copy( Text, 1, SelStart-1 ) +
                              Copy( Text, SelStart+1, 255 ))
        else
          Result := SyntaxOk( Copy( Text, 1, SelStart ) +
                              Copy( Text, SelStart+1+SelLength, 255 ));
  else
    Result := False;
  end;{case}
end;

function THexEdit.ValidCopy: Boolean;
begin
  Result :=True;
end;

function THexEdit.ValidPaste: Boolean;
begin
  if Clipboard.HasFormat(CF_TEXT) then
    Result :=SyntaxOk( Copy( Text, 1, SelStart ) +
                       Clipboard.AsText +
                       Copy( Text, SelStart+1, 255 ))
  else
    result:=FALSE;
end;

function THexEdit.ValidCut: Boolean;
begin
  Result :=SyntaxOk( Copy( Text, 1, SelStart ) +
                     Copy( Text, SelStart+1+SelLength, 255 ));
end;

function THexEdit.ValidDelete: Boolean;
var
  S: string;
begin
  if SelLength =0 then
    S :=Copy( Text, 1, SelStart ) +Copy( Text, SelStart+2, 255 )
  else
    S :=Copy( Text, 1, SelStart ) +Copy( Text, SelStart+1+SelLength, 255 );
  Result :=SyntaxOk( S);
end;

procedure THexEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  { handle Copy-, Paste-, Cut-, Delete-Keys}
  if ssShift in Shift then
  begin
    if      Key =VK_INSERT then begin if not ValidPaste then Key :=0 end
    else if Key =VK_DELETE then begin if not ValidCut   then Key :=0 end
  end
  else if ssCtrl in Shift then
  begin
    if      Key =VK_INSERT then begin if not ValidCopy then Key :=0 end
    else if Key =VK_DELETE then begin if not ValidDelete then Key :=0 end
  end
  else if Key =VK_DELETE then begin if not ValidDelete then Key :=0 end;
  inherited KeyDown( Key, Shift);
end;

procedure THexEdit.KeyPress(var Key: Char);
begin
  if FValidate then begin
    { handle Copy Paste Cut Keys}
    if      Key =^C then begin if not ValidCopy  then Key :=#0 end
    else if Key =^V then begin if not ValidPaste then Key :=#0 end
    else if Key =^X then begin if not ValidCut   then Key :=#0 end
    else
    begin
      Key :=UpCase( Key);  {transform a..f to A..F}
      if not IsValidChar( Key) then Key := #0;
    end;
    if Key <>#0 then inherited KeyPress( Key);
  end;
end;

procedure Register;
begin
  RegisterComponents('Add-On''s', [THexEdit]);
end;

end.

