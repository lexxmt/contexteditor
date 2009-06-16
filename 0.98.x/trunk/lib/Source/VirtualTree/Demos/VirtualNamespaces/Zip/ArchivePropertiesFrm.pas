unit ArchivePropertiesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ExtCtrls, Gauges;

type
  TArchivePropertiesForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    fpName: TLabel;
    fpType: TLabel;
    fpSize: TLabel;
    fpPackedSize: TLabel;
    fpRatio: TLabel;
    fpModified: TLabel;
    Label7: TLabel;
    fpCRC: TLabel;
    Label8: TLabel;
    fpPath: TLabel;
    gauge: TGauge;
    imIcon: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// var
//   ArchivePropertiesForm: TArchivePropertiesForm;

implementation

{$R *.dfm}

procedure TArchivePropertiesForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TArchivePropertiesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArchivePropertiesForm.FormDestroy(Sender: TObject);
begin
 imIcon.Picture.Icon.ReleaseHandle
end;

end.
