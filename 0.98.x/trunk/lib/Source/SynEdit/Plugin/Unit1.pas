unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEditHighlighter, SynEdit, SynEditDecorator, SynHighlighterPas,
  mwHighlighter, AsSynAutoCorrect;

type
  TForm1 = class(TForm)
    edit: TSynEdit;
    SynPasSyn1: TSynPasSyn;
    AsSynAutoCorrect1: TAsSynAutoCorrect;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure editMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure editKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editClick(Sender: TObject);
    procedure editKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Decorator : TSynEditDecorator;
    HyperLink : TSynEditDecoration;
    HyperLinkToken : string;
    procedure CheckHyperFree;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Decorator := TSynEditDecorator.Create(nil);
  Decorator.Editor := edit;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Decorator.Free;
end;

procedure TForm1.editMouseMove(Sender: TObject; Shift: TShiftState; X,  Y: Integer);
var
  token     : string;
  tokenType : integer;
  p         : TPoint;
  start     : integer;
  ok        : boolean;
  attri     : TSynHighlighterAttributes;
begin
  if ssCtrl in Shift then
    begin
      p.x:=x;
      p.y:=y;
      ok:=FALSE;

      p:=edit.PixelsToRowColumn(p);
      if edit.GetHighlighterAttriAtRowCol(p, token, tokenType, start, attri) then
        if SynHighlighterPas.TtkTokenKind(tokenType)=SynHighlighterPas.tkIdentifier then
          begin
            if HyperLink=nil then
              begin
                HyperLink:=Decorator.Decorations.Add;
                HyperLink.DecorationType:=dtHyperlink;
              end;

//            if p.y<>HyperLink.Line then
//              edit.InvalidateLine(HyperLink.Line);

            HyperLink.Line:=p.y;
            HyperLink.StartIndex:=start;
            HyperLink.EndIndex:=start+length(token);
            HyperLinkToken:=Token;

            ok:=TRUE;
            Screen.Cursor := crHandPoint;
          end;

      if not OK and (HyperLink<>nil) then
        begin
          CheckHyperFree;
        end;
    end;
end;

procedure TForm1.editKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_CONTROL then
    begin
      CheckHyperFree;
    end;
end;

procedure TForm1.editClick(Sender: TObject);
begin
  // Is there an active hyperlink?
  if HyperLink<>nil then
    begin
      CheckHyperFree;
      ShowMessage('The token is '+HyperLinkToken);
    end;
end;

procedure TForm1.editKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_CONTROL then
//  begin
//      editMouseMove(Sender, Shift, edit.CaretXPix, edit.CaretYPix);
//  end;
end;

procedure TForm1.CheckHyperFree;
begin
  if HyperLink<>nil then
    begin
      HyperLink.Free;
      HyperLink:=nil;
      Screen.Cursor := crDefault;
    end;
end;

end.
