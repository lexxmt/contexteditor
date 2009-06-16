unit uColorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VirtualTrees, VirtualExplorerTree, VirtualExplorerListviewEx,
  VirtualShellUtilities, VirtualWideStrings, ImgList, VirtualUnicodeControls,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TColorForm = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    Bevel1: TBevel;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    EL: TExtensionsList;
    FThumbsHighlightColor: TColor;
  public
    { Public declarations }
  end;

var
  ColorForm: TColorForm;

implementation
uses
  Unit1;

{$R *.dfm}

procedure TColorForm.FormCreate(Sender: TObject);
var
  I: integer;
begin
  //Backup the Highlight properties
  FThumbsHighlightColor := Form1.LVEx.ThumbsOptions.HighlightColor;
  EL := TExtensionsList.Create;
  EL.Assign(Form1.LVEx.ExtensionsList);

  //Fill the Color Listview
  for I := 0 to EL.Count - 1 do begin
    with ListView1.Items.Add do
      Caption := EL[I];
  end;
end;

procedure TColorForm.FormDestroy(Sender: TObject);
begin
  EL.Free;
end;

procedure TColorForm.ListView1AdvancedCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  AColor: TColor;
begin
  if (Stage = cdPrePaint) and Assigned(Item) and (Item.Index > -1) and (Item.Index < Listview1.Items.Count) then begin
    if Form1.LVEx.ThumbsOptions.Highlight = thMultipleColors then begin
      AColor := EL.Colors[Item.Index];
      if AColor <> clNone then
        Listview1.Canvas.Brush.Color := AColor;
    end
    else
      if Form1.LVEx.ThumbsOptions.Highlight = thSingleColor then
        Listview1.Canvas.Brush.Color := FThumbsHighlightColor;
  end;
end;

procedure TColorForm.Button3Click(Sender: TObject);
var
  LItem: TListItem;
begin
  if (Form1.LVEx.ThumbsOptions.Highlight = thMultipleColors) and Assigned(ListView1.Selected) then begin
    ColorDialog1.Color := EL.Colors[ListView1.Selected.Index];
    if ColorDialog1.Execute then begin
      LItem := Listview1.Selected;
      while Assigned(LItem) do begin
        EL.Colors[LItem.Index] := ColorDialog1.Color;
        LItem := Listview1.GetNextItem(LItem, sdAll, [isSelected]);
      end;
      Listview1.Invalidate;
    end;
  end
  else
    if Form1.LVEx.ThumbsOptions.Highlight = thSingleColor then begin
      ColorDialog1.Color := FThumbsHighlightColor;
      if ColorDialog1.Execute then begin
        FThumbsHighlightColor := ColorDialog1.Color;
        Listview1.Invalidate;
      end;
    end;
end;

procedure TColorForm.Button2Click(Sender: TObject);
begin
  //Reset
  if Form1.LVEx.ThumbsOptions.Highlight = thMultipleColors then
    Form1.LVEx.ExtensionsList.Assign(EL)
  else
    if Form1.LVEx.ThumbsOptions.Highlight = thSingleColor then
      Form1.LVEx.ThumbsOptions.HighlightColor := FThumbsHighlightColor;
  //Invalidate
  Form1.LVEx.SyncInvalidate;
end;


end.
