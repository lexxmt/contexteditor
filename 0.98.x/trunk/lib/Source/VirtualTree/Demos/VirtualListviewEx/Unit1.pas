unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, Buttons, VirtualTrees,
  VirtualExplorerTree, VirtualExplorerListviewEx, VirtualShellUtilities,
  VirtualWideStrings, VirtualUnicodeControls;

type
  TForm1 = class(TForm)
    VET: TVirtualExplorerTreeview;
    LVEx: TVirtualExplorerListviewEx;
    Splitter1: TSplitter;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    MemoHelp1: TMemo;
    FrameList: TListView;
    ColorDialog1: TColorDialog;
    StatusBar1: TStatusBar;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    MemoHelp2: TMemo;
    Label7: TLabel;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Memo1: TMemo;
    Label8: TLabel;
    Button2: TButton;
    Button3: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Bevel2: TBevel;
    Panel5: TPanel;
    Bevel3: TBevel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ComboBox3: TComboBox;
    SpeedButton3: TSpeedButton;
    Label11: TLabel;
    ProgressBar1: TProgressBar;
    CheckBox6: TCheckBox;
    Label12: TLabel;
    TrackBar6: TTrackBar;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    Button4: TButton;
    TabSheet4: TTabSheet;
    CheckBox13: TCheckBox;
    Label9: TLabel;
    CheckBox14: TCheckBox;
    Label13: TLabel;
    procedure LVExThumbsDrawAfter(Sender: TCustomVirtualExplorerListviewEx;
      ACanvas: TCanvas; ListItem: TListItem; ThumbData: PThumbnailData;
      AImageRect, ADetailsRect: TRect; var DefaultDraw: Boolean);
    procedure LVExThumbsDrawBefore(Sender: TCustomVirtualExplorerListviewEx;
      ACanvas: TCanvas; ListItem: TListItem; ThumbData: PThumbnailData;
      AImageRect, ADetailsRect: TRect; var DefaultDraw: Boolean);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure FrameListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LVExChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure LVExRootRebuild(Sender: TCustomVirtualExplorerTree);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure LVExFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure Memo1Exit(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure LVExEnumFolder(Sender: TCustomVirtualExplorerTree;
      Namespace: TNamespace; var AllowAsChild: Boolean);
    procedure LVExRootChanging(Sender: TCustomVirtualExplorerTree;
      const NewValue: TRootFolder; const CurrentNamespace,
      Namespace: TNamespace; var Allow: Boolean);
    procedure CheckBox6Click(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
  private
    { Private declarations }
    procedure FormOnIdle(Sender: TObject; var Done: Boolean);
  public
    { Public declarations }
    FFrameBitmap: TBitmap;
    FCommentNode: PVirtualNode;
    procedure UpdateFrameBitmap;
    procedure BuildTree;
    procedure CommentMode(Edit: boolean);
  end;

var
  Form1: TForm1;

implementation
uses
  uColorForm;

{$R *.dfm}

//{$R winxp.res}

//WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
{ Form }

procedure TForm1.FormCreate(Sender: TObject);
begin
  LVEx.ThumbsOptions.CacheOptions.DefaultFilename := Edit1.Text;
  LVEx.ThumbsOptions.CacheOptions.CentralFolder := IncludeTrailingBackslashW(ExtractFilePath(Application.ExeName)) + 'Cache';

  //set default options and build the tree
  FFrameBitmap := TBitmap.Create;
  Application.OnIdle := FormOnIdle;
  PageControl1.ActivePageIndex := 0;
  ColorDialog1.Color := LVEx.Color;
  Panel2.Color := LVEx.Color;
  CheckBox1Click(Self);
  ComboBox1.ItemIndex := 7;
  ComboBox1Click(Self);
  ComboBox2.ItemIndex := 4;
  ComboBox2Click(Self);
  ComboBox3.ItemIndex := Ord(LVEx.ThumbsOptions.Highlight);

  CheckBox3.Checked := not LVEx.ThumbsOptions.BorderOnFiles;
  CheckBox4.Checked := LVEx.ThumbsOptions.Details;
  CheckBox6.Checked := LVEx.ThumbsOptions.LoadAllAtOnce;
  CheckBox7.Checked := LVEx.ThumbsOptions.ShowSmallIcon;
  CheckBox12.Checked := LVEx.ThumbsOptions.ShowXLIcons;
  CheckBox11.Checked := LVEx.ThumbsOptions.UseSubsampling;
  CheckBox9.Checked := LVEx.ThumbsOptions.UseShellExtraction;
  CheckBox10.Checked := LVEx.ThumbsOptions.CacheOptions.Compressed;

  TrackBar3.Position := LVEx.ThumbsOptions.Width div 10;
  TrackBar4.Position := LVEx.ThumbsOptions.Height div 10;
  TrackBar1.Position := LVEx.ThumbsOptions.SpaceWidth div 10;
  TrackBar2.Position := LVEx.ThumbsOptions.SpaceHeight div 10;
  TrackBar6.Position := LVEx.ThumbsOptions.BorderSize;

  Application.HintHidePause := 5000;

  BuildTree;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FFrameBitmap.Free;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if LVEx.ThumbsOptions.CacheOptions.AutoSave then
    LVEx.ThumbsOptions.CacheOptions.Save; //Save the cache on exit
end;

procedure TForm1.FormOnIdle(Sender: TObject; var Done: Boolean);
begin
  //The ThumbsCache gets updated frequently
  StatusBar1.Panels[1].Text := Format('Thumbs Cache size: %d Kb', [LVEx.ThumbsOptions.CacheOptions.Size div 1024]);
  ProgressBar1.Position := LVEx.ThumbsOptions.CacheOptions.ThumbsCount;
  Caption := Format('Max = %d   Pos = %d', [ProgressBar1.Max, ProgressBar1.Position]);
end;

procedure TForm1.ComboBox2Click(Sender: TObject);
var
  I: integer;
begin
  I := Combobox2.ItemIndex;
  if I > -1 then
    LVEx.ViewStyle := TViewStyleEx(I);
  Panel4.Visible := LVEx.ViewStyle = vsxThumbs;
end;

//WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
{ Thumbnail Options }

procedure TForm1.ComboBox1Click(Sender: TObject);
var
  I: integer;
begin
  if CheckBox1.Checked then
    LVEx.ThumbsOptions.Border := tbNone
  else begin
    I := Combobox1.ItemIndex;
    if I > -1 then
      LVEx.ThumbsOptions.Border := TThumbnailBorder(I);
  end;
end;

procedure TForm1.TrackBar6Change(Sender: TObject);
begin
  if LVEx.ThumbsOptions.BorderSize <> TrackBar6.Position then
    LVEx.ThumbsOptions.BorderSize := TrackBar6.Position;
  //show hint
  TrackBar6.Hint := IntToStr(LVEx.ThumbsOptions.BorderSize);
  Application.ActivateHint(Mouse.CursorPos);
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  if LVEx.ThumbsOptions.Width <> TrackBar3.Position * 10 then begin
    LVEx.ThumbsOptions.Width := TrackBar3.Position * 10;
    UpdateFrameBitmap;
  end;
  //show hint
  TrackBar3.Hint := IntToStr(LVEx.ThumbsOptions.Width);
  Application.ActivateHint(Mouse.CursorPos);
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
  if LVEx.ThumbsOptions.Height <> TrackBar4.Position * 10 then begin
    LVEx.ThumbsOptions.Height := TrackBar4.Position * 10;
    UpdateFrameBitmap;
  end;
  //show hint
  TrackBar4.Hint := IntToStr(LVEx.ThumbsOptions.Height);
  Application.ActivateHint(Mouse.CursorPos);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  if LVEx.ThumbsOptions.SpaceWidth <> TrackBar1.Position * 10 then begin
    LVEx.ThumbsOptions.SpaceWidth := TrackBar1.Position * 10;
    UpdateFrameBitmap;
  end;
  //show hint
  TrackBar1.Hint := IntToStr(LVEx.ThumbsOptions.SpaceWidth);
  Application.ActivateHint(Mouse.CursorPos);
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  if LVEx.ThumbsOptions.SpaceHeight <> TrackBar2.Position * 10 then begin
    LVEx.ThumbsOptions.SpaceHeight := TrackBar2.Position * 10;
    UpdateFrameBitmap;
  end;
  //show hint
  TrackBar2.Hint := IntToStr(LVEx.ThumbsOptions.SpaceHeight);
  Application.ActivateHint(Mouse.CursorPos);
end;

procedure TForm1.ComboBox3Click(Sender: TObject);
var
  I: integer;
begin
  I := Combobox3.ItemIndex;
  if I > -1 then
    LVEx.ThumbsOptions.Highlight := TThumbnailHighlight(I);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  ColorForm.ShowModal;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Panel2.Visible := CheckBox1.Checked;
  FrameList.Arrange(arDefault);
  ComboBox1Click(nil);
  UpdateFrameBitmap;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.BorderOnFiles := not CheckBox3.Checked;
end;

procedure TForm1.CheckBox13Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.HideCaptions := CheckBox13.Checked;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.Details := CheckBox4.Checked;
  UpdateFrameBitmap;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.LoadAllAtOnce := CheckBox6.Checked;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.ShowSmallIcon := CheckBox7.Checked;
end;

procedure TForm1.CheckBox12Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.ShowXLIcons := CheckBox12.Checked;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  LVEx.ShowHint := true;
  LVEx.ThumbsOptions.DetailedHints := CheckBox8.Checked;
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.UseShellExtraction := CheckBox9.Checked;
end;

procedure TForm1.CheckBox11Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.UseSubsampling := CheckBox11.Checked;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then begin
    Panel2.Color := ColorDialog1.Color;
    if CheckBox1.Checked and (LVEx.ViewStyle = vsxThumbs) then
      LVEx.SyncInvalidate; //force repaint
  end;
end;

procedure TForm1.FrameListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if CheckBox1.Checked and Assigned(Item) and Selected then
    UpdateFrameBitmap;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  // Optimal settings for maximum thumbnail exctraction speed and rendering

  // Custom Draw OFF
  CheckBox1.Checked := False;
  CheckBox1Click(nil);
  // Cache AutoLoad OFF
  CheckBox2.Checked := False;
  CheckBox2Click(nil);
  // Cache AutoSave OFF
  CheckBox5.Checked := False;
  CheckBox5Click(nil);
  // Compressed OFF
  CheckBox10.Checked := False;
  CheckBox10Click(nil);
  // Thumbnail details OFF
  CheckBox4.Checked := False;
  CheckBox4Click(nil);
  // Show smallicon OFF
  CheckBox7.Checked := False;
  CheckBox7Click(nil);
  // ShellExtraction OFF
  CheckBox9.Checked := False;
  CheckBox9Click(nil);
  // Subsampling OFF
  CheckBox11.Checked := False;
  CheckBox11Click(nil);
  // LoadAllAtOnce ON
  CheckBox6.Checked := False;
  CheckBox6Click(nil);
end;

//WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
{ Cache Options }

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.CacheOptions.AutoLoad := CheckBox2.Checked;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.CacheOptions.AutoSave := CheckBox5.Checked;
end;

procedure TForm1.CheckBox10Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.CacheOptions.Compressed := CheckBox10.Checked;
end;

procedure TForm1.CheckBox14Click(Sender: TObject);
begin
  if CheckBox14.Checked then
    LVEx.ThumbsOptions.CacheOptions.CacheProcessing := tcpAscending
  else
    LVEx.ThumbsOptions.CacheOptions.CacheProcessing := tcpDescending;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Panel5.Visible := RadioButton1.Checked;
  if RadioButton1.Checked then
    LVEx.ThumbsOptions.CacheOptions.StorageType := tcsPerFolder
  else
    LVEx.ThumbsOptions.CacheOptions.StorageType := tcsCentral;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  //update the cache filename
  LVEx.ThumbsOptions.CacheOptions.DefaultFilename := Edit1.Text;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.CacheOptions.ClearCache;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  LVEx.ThumbsOptions.CacheOptions.Reload(LVEx.FocusedNode);
end;

//WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
{ Comments Processing }

procedure TForm1.CommentMode(Edit: boolean);
begin
  if Edit then begin
    Button2.Enabled := False;
    Button3.Enabled := True;
    Memo1.ReadOnly := False;
    Memo1.Color := clWindow;
    Memo1.Ctl3D := True;
    Memo1.SetFocus;
  end
  else begin
    Button2.Enabled := True;
    Button3.Enabled := False;
    Memo1.ReadOnly := True;
    Memo1.Color := clBtnFace;
    LVEx.SetFocus;
  end;
end;

procedure TForm1.Memo1Exit(Sender: TObject);
var
  CI: TThumbsCacheItem;
begin
  // Reset the Memo
  if Button3.Enabled and not Button3.Focused then begin
    CommentMode(false);
    // Get the Cache item to get the comment
    if LVEx.ThumbsOptions.CacheOptions.Read(LVEx.FocusedNode, CI) then
      Memo1.Text := CI.Comment
    else
      Memo1.Text := '';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FCommentNode := LVEx.FocusedNode;
  CommentMode(true);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  CI: TThumbsCacheItem;
begin
  CommentMode(false);
  if Assigned(FCommentNode) and (FCommentNode = LVEx.FocusedNode) then
    // Get the Cache item and change the comment
    if LVEx.ThumbsOptions.CacheOptions.Read(FCommentNode, CI) then
      CI.Comment := Memo1.Text;
end;

//WMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
{ ExplorerListviewEx }

procedure TForm1.BuildTree;
var
  Node: PVirtualNode;
begin
  VET.BeginUpdate;
  try
    VET.Active := true;
    LVEx.Active := true;
    //expand MyComputer
    Node := VET.FindNodeByPIDL(DrivesFolder.AbsolutePIDL);
    if Assigned(Node) then VET.Expanded[Node] := true;
  finally
    VET.EndUpdate;
  end;
end;

procedure TForm1.LVExRootRebuild(Sender: TCustomVirtualExplorerTree);
begin
  //update the statusbar
  LVExChange(LVEx, nil);
end;

procedure TForm1.LVExRootChanging(Sender: TCustomVirtualExplorerTree;
  const NewValue: TRootFolder; const CurrentNamespace,
  Namespace: TNamespace; var Allow: Boolean);
begin
  ProgressBar1.Max := 0;
end;

procedure TForm1.LVExEnumFolder(Sender: TCustomVirtualExplorerTree;
  Namespace: TNamespace; var AllowAsChild: Boolean);
begin
  if LVEx.ThumbsOptions.LoadAllAtOnce then
    if Namespace.FileSystem and not Namespace.Folder then
      if LVEx.IsImageFile(Namespace.NameForParsingInFolder) then
        ProgressBar1.Max := ProgressBar1.Max + 1;
end;

procedure TForm1.LVExChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  NS: TNamespace;
  S: string;
begin
  //SelectedFile only works with FileSystem namespaces.
  if LVEx.ValidateNamespace(LVEx.GetFirstSelected, NS) then S := NS.NameNormal
  else S := '';
  StatusBar1.Panels[2].Text := 'Total Count = ' + IntToStr(LVEx.VisibleCount);
  StatusBar1.Panels[3].Text := 'Selected Count = ' + IntToStr(LVEx.SelectedCount);
  StatusBar1.Panels[4].Text := S;
end;

procedure TForm1.LVExThumbsDrawBefore(Sender: TCustomVirtualExplorerListviewEx;
  ACanvas: TCanvas; ListItem: TListItem; ThumbData: PThumbnailData;
  AImageRect, ADetailsRect: TRect; var DefaultDraw: Boolean);
begin
  //Draw the custom background
  if CheckBox1.Checked then
    if (ThumbData.State = tsValid) or (LVEx.ThumbsOptions.BorderOnFiles) then begin
      if not ListItem.selected then begin
        ACanvas.Brush.Color := ColorDialog1.Color;
        ACanvas.FillRect(AImageRect);
      end
      else
        if LVEx.ThumbsOptions.Details then begin //don't fill the details background when selected
          ACanvas.Brush.Color := LVEx.Color;
          ACanvas.FillRect(ADetailsRect);
        end;
    end;
end;

procedure TForm1.LVExThumbsDrawAfter(Sender: TCustomVirtualExplorerListviewEx;
  ACanvas: TCanvas; ListItem: TListItem; ThumbData: PThumbnailData;
  AImageRect, ADetailsRect: TRect; var DefaultDraw: Boolean);
begin
  //Draw custom frame border
  if CheckBox1.Checked then
    if (ThumbData.State = tsValid) or (LVEx.ThumbsOptions.BorderOnFiles) then
      ACanvas.Draw(0, 0, FFrameBitmap);
end;

procedure TForm1.UpdateFrameBitmap;
var
  B: TBitmap;
  R: TRect;
  I: integer;
begin
  if Assigned(FrameList.ItemFocused) then
    I := FrameList.ItemFocused.Index
  else
    I := 0;

  B := TBitmap.Create;
  try
    ImageList1.GetBitmap(I, B);
    R := LVEx.GetThumbDrawingBounds(false, true); //Get only the icon rect
    FFrameBitmap.width := R.Right;
    FFrameBitmap.height := R.Bottom;
    FFrameBitmap.Canvas.StretchDraw(R, B);
    FFrameBitmap.TransparentColor := FFrameBitmap.Canvas.Pixels[R.Right div 2, R.Bottom div 2];
    FFrameBitmap.Transparent := true;
  finally
    B.free;
  end;

  if LVEx.ViewStyle = vsxThumbs then
    LVEx.SyncInvalidate; //force repaint
end;

procedure TForm1.LVExFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
var
  CI: TThumbsCacheItem;
  TD: PThumbnailData;
begin
  FCommentNode := nil;
  if Button3.Enabled then
    CommentMode(false);
  // Get the Cache item to get the comment
  if LVEx.ThumbsOptions.CacheOptions.Read(Node, CI) then
    Memo1.Text := CI.Comment
  else
    Memo1.Text := '';
  Button2.Enabled := LVEx.ValidateThumbnail(Node, TD) and (TD.State = tsValid);
end;

end.
