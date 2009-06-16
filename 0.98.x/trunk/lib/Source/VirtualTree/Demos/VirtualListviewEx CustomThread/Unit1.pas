unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, VirtualExplorerTree,
  VirtualExplorerListviewEx, VirtualWideStrings, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    LVEx: TVirtualExplorerListviewEx;
    VET: TVirtualExplorerTreeview;
    Panel1: TPanel;
    Splitter1: TSplitter;
    ComboBox2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure LVExThumbThreadClass(
      Sender: TCustomVirtualExplorerListviewEx;
      var ThreadClass: TThumbThreadClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TTextThumbThread = class(TThumbThread)
  protected
    function CreateThumbnail(Filename: WideString; var Thumbnail: TBitmap;
      var ImageWidth, ImageHeight: integer; var CompressIt: boolean): Boolean; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBox2Click(Sender: TObject);
var
  I: integer;
begin
  I := Combobox2.ItemIndex;
  if I > -1 then
    LVEx.ViewStyle := TViewStyleEx(I);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  VET.Active := true;
  LVEx.Active := true;
  LVEx.ExtensionsList.Add('.pas', clMoneyGreen);
end;

procedure TForm1.LVExThumbThreadClass(Sender: TCustomVirtualExplorerListviewEx;
  var ThreadClass: TThumbThreadClass);
begin
  ThreadClass := TTextThumbThread;
end;

{ TTextThumbThread }

function TTextThumbThread.CreateThumbnail(Filename: WideString;
  var Thumbnail: TBitmap; var ImageWidth, ImageHeight: integer;
  var CompressIt: boolean): Boolean;
var
  L: TStringList;
  R: TRect;
begin
  if ExtractFileExtW(Filename) = '.pas' then begin
    L := TStringList.Create;
    try
      L.LoadFromFile(Filename);

      //draw the text file in the bitmap
      Thumbnail.Width := ThumbWidth;
      Thumbnail.Height := ThumbHeight;
      R := Rect(0, 0, ThumbWidth, ThumbHeight);
      Thumbnail.Canvas.Brush.Color := clBlack;
      Thumbnail.Canvas.FillRect(R);
      Thumbnail.Canvas.Font.Name := 'Small Fonts';
      Thumbnail.Canvas.Font.Size := 6;
      Thumbnail.Canvas.Font.Color := clWhite;
      DrawText(Thumbnail.Canvas.Handle, PChar(L.Text), -1, R, DT_NOCLIP);

      //Return the image size, since this is a text file it doesn't matter
      ImageWidth := -1;
      ImageHeight := -1;
      CompressIt := False;

      Result := True;
    finally
      L.Free;
    end;
  end
  else
    Result := inherited CreateThumbnail(Filename, Thumbnail, ImageWidth, ImageHeight, CompressIt);
end;

end.
