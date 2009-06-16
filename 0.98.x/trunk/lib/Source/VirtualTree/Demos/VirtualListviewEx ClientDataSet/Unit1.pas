unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, VirtualTrees, VirtualExplorerTree,
  VirtualExplorerListviewEx, VirtualShellUtilities, VirtualWideStrings,
  DB, DBClient, DBCtrls, Grids, DBGrids, ComCtrls, Mask, Jpeg;

type
  TForm1 = class(TForm)
    VET: TVirtualExplorerTreeview;
    LVEx: TVirtualExplorerListviewEx;
    Splitter1: TSplitter;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Splitter2: TSplitter;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Filename: TWideStringField;
    ClientDataSet1Thumbnail: TGraphicField;
    ClientDataSet1DateTime: TDateTimeField;
    DBNavigator1: TDBNavigator;
    ClientDataSet1ImageWidth: TIntegerField;
    ClientDataSet1ImageHeight: TIntegerField;
    ClientDataSet1Comments: TWideStringField;
    ClientDataSet1Exif: TWideStringField;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    Image1: TImage;
    Panel2: TPanel;
    Memo1: TMemo;
    procedure ComboBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LVExThumbsCacheLoad(Sender: TThumbsCache;
      CacheFilePath: WideString; Comments: TWideStringList;
      var DoDefault: Boolean);
    procedure LVExThumbsCacheSave(Sender: TThumbsCache;
      CacheFilePath: WideString; Comments: TWideStringList;
      var DoDefault: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure LVExThumbsCacheItemAdd(
      Sender: TCustomVirtualExplorerListviewEx; NS: TNamespace;
      Thumbnail: TBitmap; var ImageWidth, ImageHeight: Integer;
      var DoDefault: Boolean);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FDatabase: WideString;
    procedure BuildTree;
    procedure OpenDatabase;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BuildTree;
var
  Node: PVirtualNode;
begin
  VET.BeginUpdate;
  try
    LVEx.ThumbsOptions.CacheOptions.Compressed := True;
    LVEx.ThumbsOptions.CacheOptions.AutoLoad := True;
    LVEx.ThumbsOptions.CacheOptions.AutoSave := True;    

    VET.Active := true;
    LVEx.Active := true;
    //expand MyComputer
    Node := VET.FindNodeByPIDL(DrivesFolder.AbsolutePIDL);
    if Assigned(Node) then VET.Expanded[Node] := true;
  finally
    VET.EndUpdate;
  end;
end;

procedure TForm1.OpenDatabase;
begin
  FDatabase := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'database.xml';
  ClientDataSet1.FileName := FDatabase;
  ClientDataSet1.Active := True;
  ClientDataSet1.LogChanges := False;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  OpenDatabase;
  BuildTree;
  PageControl1.ActivePageIndex := 0;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
var
  I: integer;
begin
  I := Combobox1.ItemIndex;
  if I > -1 then
    LVEx.ViewStyle := TViewStyleEx(I);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  while not ClientDataSet1.Eof do
    ClientDataSet1.Delete;
end;

procedure TForm1.LVExThumbsCacheLoad(Sender: TThumbsCache;
  CacheFilePath: WideString; Comments: TWideStringList;
  var DoDefault: Boolean);
var
  MS: TMemoryStream;
  D, D2: WideString;
begin
  // Don't load the internal cache, fill it with the required external database items
  DoDefault := False;

  // Find the browsing directory bookmark
  // The database is indexed in the Filename field
  D := LVEx.RootFolderNamespace.NameForParsing;
  if not ClientDataSet1.Locate('Filename', D, [loCaseInsensitive]) then
    Exit;

  // Read the database and fill the internal cache
  MS := TMemoryStream.Create;
  try
    while not ClientDataSet1.Eof do begin
      ClientDataSet1.Next;
      D2 := ExtractFileDirW(ClientDataSet1Filename.Value);
      if SpCompareText(D, D2) then begin
        // The Thumbnail was saved as a JPEG in the database
        MS.Clear;
        ClientDataSet1Thumbnail.SaveToStream(MS);

        Sender.Add(ClientDataSet1Filename.Value, ClientDataSet1Exif.Value,
          ClientDataSet1Comments.Value, ClientDataSet1DateTime.Value,
          ClientDataSet1ImageWidth.Value, ClientDataSet1ImageHeight.Value, True, MS);
      end
      else
        Break;
    end;
  finally
    MS.Free;
  end;
end;

procedure TForm1.LVExThumbsCacheSave(Sender: TThumbsCache;
  CacheFilePath: WideString; Comments: TWideStringList;
  var DoDefault: Boolean);
begin
  // Don't save the internal cache
  DoDefault := False;
end;

procedure TForm1.LVExThumbsCacheItemAdd(Sender: TCustomVirtualExplorerListviewEx;
  NS: TNamespace; Thumbnail: TBitmap; var ImageWidth, ImageHeight: Integer;
  var DoDefault: Boolean);
var
  MS: TMemoryStream;
  D: WideString;
begin
  if not ClientDataSet1.Locate('Filename', NS.NameForParsing, [loCaseInsensitive]) then begin
    // Save the browsing dir as a bookmark, this will speed the search process
    // The resulting list of files will be:
    // c:\path
    // c:\path\file1.ext
    // c:\path\file2.ext
    D := LVEx.RootFolderNamespace.NameForParsing;
    if not ClientDataSet1.Locate('Filename', D, [loCaseInsensitive]) then begin
      ClientDataSet1.Append;
      ClientDataSet1Filename.Value := D;
      ClientDataSet1.Post;
    end;
    // Save the row
    MS := TMemoryStream.Create;
    try
      // Save the thumbnail as a JPEG
      Thumbnail.SaveToStream(MS);
      ConvertBitmapStreamToJPGStream(MS, 60);

      ClientDataSet1.Append;
      ClientDataSet1Filename.Value := NS.NameForParsing; // Required field
      ClientDataSet1Thumbnail.LoadFromStream(MS);
      ClientDataSet1DateTime.Value := NS.LastWriteDateTime; // Required field
      ClientDataSet1Exif.Value := '';
      ClientDataSet1Comments.Value := '';
      ClientDataSet1ImageWidth.Value := ImageWidth;
      ClientDataSet1ImageHeight.Value := ImageHeight;
      ClientDataSet1.Post;
    finally
      MS.Free;
    end;
  end;
end;

procedure TForm1.ClientDataSet1AfterScroll(DataSet: TDataSet);
var
  MS: TMemoryStream;
  J: TJPEGImage;
begin
  // TDBImage doesn't support JPG images !
  // We must use TImage instead
  MS := TMemoryStream.Create;
  J := TJPEGImage.Create;
  try
    ClientDataSet1Thumbnail.SaveToStream(MS);
    if MS.Size > 0 then begin
      MS.Position := 0;
      J.LoadFromStream(MS);
      Image1.Picture.Assign(J);
    end;
  finally
    MS.Free;
    J.Free;
  end;
end;

end.
