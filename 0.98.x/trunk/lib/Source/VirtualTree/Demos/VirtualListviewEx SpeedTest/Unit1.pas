unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, VirtualTrees, VirtualExplorerTree,
  VirtualExplorerListviewEx, VirtualShellUtilities;

type
  TForm1 = class(TForm)
    LVEx: TVirtualExplorerListviewEx;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    Splitter1: TSplitter;
    Memo2: TMemo;
    procedure FormShow(Sender: TObject);
    procedure LVExEnumFolder(Sender: TCustomVirtualExplorerTree;
      Namespace: TNamespace; var AllowAsChild: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure LVExRootChanging(Sender: TCustomVirtualExplorerTree;
      const NewValue: TRootFolder; const CurrentNamespace,
      Namespace: TNamespace; var Allow: Boolean);
  private
    { Private declarations }
    procedure FormOnIdle(Sender: TObject; var Done: Boolean);    
  public
    { Public declarations }
    T: Cardinal;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  // Disable the Shell extraction
  LVEx.ThumbsOptions.UseShellExtraction := False;
  // Load all the thumbs at once
  LVEx.ThumbsOptions.LoadAllAtOnce := True;
  // For maximum extraction speed don't compress the cache
  LVEx.ThumbsOptions.CacheOptions.Compressed := False;

  LVEx.ViewStyle := vsxThumbs;
  LVEx.Active := True;
end;

procedure TForm1.LVExRootChanging(Sender: TCustomVirtualExplorerTree;
  const NewValue: TRootFolder; const CurrentNamespace,
  Namespace: TNamespace; var Allow: Boolean);
begin
  ProgressBar1.Max := 0;

  T := GetTickCount;
  StatusBar1.Panels[1].Text := 'Elapsed Time: ...';
end;

procedure TForm1.LVExEnumFolder(Sender: TCustomVirtualExplorerTree;
  Namespace: TNamespace; var AllowAsChild: Boolean);
begin
  if LVEx.ThumbsOptions.LoadAllAtOnce then
    if Namespace.FileSystem and not Namespace.Folder then
      if LVEx.IsImageFile(Namespace.NameForParsingInFolder) then
        ProgressBar1.Max := ProgressBar1.Max + 1;
end;

procedure TForm1.FormOnIdle(Sender: TObject; var Done: Boolean);
begin
  if T = 0 then Exit;
  //The ThumbsCache gets updated frequently
  ProgressBar1.Position := LVEx.ThumbsOptions.CacheOptions.ThumbsCount;
  if ProgressBar1.Position = ProgressBar1.Max then begin
    StatusBar1.Panels[1].Text := Format('Elapsed Time: %f sec', [(GetTickCount - T)/1000]);
    T := 0;
  end;
  StatusBar1.Panels[2].Text := Format('%d/%d image files', [ProgressBar1.Position, ProgressBar1.Max]);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: integer;
  S: string;
begin
  Memo1.Lines.Clear;

  Case LVEx.ImageLibrary of
    timNone:        S := 'None';
    timGraphicEx:   S := 'GraphicEx';
    timImageEn:     S := 'ImageEn';
    timEnvision:    S := 'Envision';
    timImageMagick: S := 'ImageMagick';
  end;
  Memo1.Lines.Add('Image library: ' + S);

  Memo1.Lines.Add('Supported formats: ');
  for I := 0 to LVEx.ExtensionsList.Count - 1 do
    Memo1.Lines.Add(LVEx.ExtensionsList[I]);
  Application.OnIdle := FormOnIdle;
end;

end.
