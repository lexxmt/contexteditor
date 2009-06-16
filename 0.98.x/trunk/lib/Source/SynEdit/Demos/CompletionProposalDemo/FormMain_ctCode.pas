unit FormMain_ctCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynCompletionProposal, StdCtrls, SynEdit, ComCtrls;

const
  cCaseSensitive = 1;
  cAnsiStrings   = 2;
  cPrettyText    = 3;
  cInsertList    = 4;
  cMatchedText   = 5;

type
  TForm1 = class(TForm)
    scpDemo: TSynCompletionProposal;
    PageControl1: TPageControl;
    CodeCompletion: TTabSheet;
    TabSheet2: TTabSheet;
    mmoInsert: TMemo;
    mmoItem: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    SynTest: TSynEdit;
    edBiggestWord: TEdit;
    Label3: TLabel;
    cbCase: TCheckBox;
    cbAnsi: TCheckBox;
    cbPrettyText: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    SynEdit1: TSynEdit;
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure edBiggestWordChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with mmoInsert.Lines do
  begin
    Clear;
    Add('Create');
    Add('Destroy');
    Add('Add');
    Add('ClearLine');
    Add('Delete');
    Add('First');
    Add('GetMarksForLine');
    Add('Insert');
    Add('Last');
    Add('Place');
    Add('Remove');
    Add('WMCaptureChanged');
    Add('WMCopy');
    Add('WMCut');
    Add('WMDropFiles');
    Add('WMEraseBkgnd');
    Add('WMGetDlgCode');
    Add('WMHScroll');
    Add('WMPaste');
  end;

  with mmoItem.Lines do
  begin
    Clear;              
    Add('constructor '#9'Create'#9'(AOwner: TCustomSynEdit)');
    Add('destructor '#9'Destroy'#9);
    Add('function '#9'Add'#9'(Item: TSynEditMark): Integer');
    Add('procedure '#9'ClearLine'#9'(line: integer)');
    Add('procedure '#9'Delete'#9'(Index: Integer)');
    Add('function '#9'First'#9': TSynEditMark');
    Add('procedure '#9'GetMarksForLine'#9'(line: integer; var Marks: TSynEditMarks)');
    Add('procedure '#9'Insert'#9'(Index: Integer; Item: TSynEditMark)');
    Add('function '#9'Last'#9': TSynEditMark');
    Add('procedure '#9'Place'#9'(mark: TSynEditMark)');
    Add('function '#9'Remove'#9'(Item: TSynEditMark): Integer');
    Add('procedure '#9'WMCaptureChanged'#9'(var Msg: TMessage); message WM_CAPTURECHANGED');
    Add('procedure '#9'WMCopy'#9'(var Message: TMessage); message WM_COPY');
    Add('procedure '#9'WMCut'#9'(var Message: TMessage); message WM_CUT');
    Add('procedure '#9'WMDropFiles'#9'(var Msg: TMessage); message WM_DROPFILES');
    Add('procedure '#9'WMEraseBkgnd'#9'(var Msg: TMessage); message WM_ERASEBKGND');
    Add('procedure '#9'WMGetDlgCode'#9'(var Msg: TWMGetDlgCode); message WM_GETDLGCODE');
    Add('procedure '#9'WMHScroll'#9'(var Msg: TWMScroll); message WM_HSCROLL');
    Add('procedure '#9'WMPaste'#9'(var Message: TMessage); message WM_PASTE');
  end;
  scpDemo.InsertList.AddStrings(mmoInsert.Lines);
  scpDemo.ItemList.AddStrings(mmoItem.Lines);
end;

procedure TForm1.CheckBoxClick(Sender: TObject);
begin
  if Sender is TCheckBox then
  begin
    Case TCheckBox(Sender).Tag of
      cCaseSensitive : scpDemo.CaseSensitive      := TCheckBox(Sender).Checked;
      cAnsiStrings   : scpDemo.AnsiStrings        := TCheckBox(Sender).Checked;
      cPrettyText    : scpDemo.UsePrettyText      := TCheckBox(Sender).Checked;
      cInsertList    : scpDemo.UseInsertList      := TCheckBox(Sender).Checked;
      cMatchedText   : scpDemo.LimitToMatchedText := TCheckBox(Sender).Checked;
    end;
  end;
end;

procedure TForm1.edBiggestWordChange(Sender: TObject);
begin
  scpDemo.BiggestWord := edBiggestWord.Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  scpDemo.InsertList.Clear;
  scpDemo.InsertList.AddStrings(mmoInsert.Lines);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  scpDemo.ItemList.Clear;
  scpDemo.ItemList.AddStrings(mmoItem.Lines);
  scpDemo.ResetAssignedList;
end;

end.
