{
@abstract(Desginer for TSynUniSyn)
@authors(Vit [nevzorov@yahoo.com], Fantasist [walking_in_the_sky@yahoo.com],
         Vitalik [vetal-x@mail.ru])
@created(2003)
@lastmod(2004-05-12)
}

(******************************************************************************
Authors: Vit (Vitaly Nevzorov nevzorov@yahoo.com)
         Fantasist (Kirill Burtsev walking_in_the_sky@yahoo.com)
         Vitalik (Vitaly Lyapota vetal-x@mail.ru)
Official Site: http://www.unihighlighter.com
With all questions, please visit http://forum.vingrad.ru/index.php?showforum=170
******************************************************************************)

unit SynUniDesigner;

//{$DEFINE SYNPLUS} //*SCHMaster*//

{$I SynUniHighlighter.inc}

interface

uses
  Windows, Messages, Controls, SynUniHighlighter, SynUniDesignerForm;

type
  TSynUniDesigner = class(TObject)
  private
    Form: TfmDesigner;
    function Execute(FormTitle: string; LangFile: string): boolean;
    procedure SetSample(const Value: string);
    function GetSample: string;
    procedure SetTitle(const Value: string);
    function GetTitle: string;
  public
    constructor Create(Highlighter: TSynUniSyn);
    destructor Destroy; override;
    property Title: string read GetTitle write SetTitle;
    property Sample: string read GetSample write SetSample;
    class function EditHighlighter(OriginalSyn: TSynUniSyn;
      FormTitle: string = ''; LangFile: string = ''): boolean;
  end;

implementation

constructor TSynUniDesigner.Create(Highlighter: TSynUniSyn);
begin
  inherited Create;
  Form := TfmDesigner.Create(nil);
{$IFDEF UNIDESIGNER18}
  Form.OriginalSyn := Highlighter;
{$ENDIF}
{$IFDEF UNIDESIGNER20}
  Form.TotalClear();
  Form.SynUniSyn := Highlighter;
  Form.TempStart();
{$ENDIF}
{$IFDEF NEWUNIDESIGNER}
  //...
{$ENDIF}
end;

destructor TSynUniDesigner.Destroy;
begin
  Form.SampleMemo.Highlighter := nil;
  Form.Free;
  inherited;
end;

class function TSynUniDesigner.EditHighlighter(OriginalSyn: TSynUniSyn; FormTitle: string; LangFile: string): boolean;
begin
  with Create(OriginalSyn) do begin
    Result := Execute(FormTitle, LangFile);
    Free;
  end;
end;

procedure TSynUniDesigner.SetSample(const Value: string);
begin
  Form.SampleMemo.Text := Value;
end;

function TSynUniDesigner.GetSample: string;
begin
  Result := Form.SampleMemo.Text;
end;

procedure TSynUniDesigner.SetTitle(const Value: string);
begin
  Form.Caption := Value;
end;

function TSynUniDesigner.GetTitle: string;
begin
  Result := Form.Caption;
end;

{$IFDEF SYNPLUS} //*SCHMaster*//
function TSynUniDesigner.Execute(FormTitle: string; LangFile: string): boolean;
var
  msg : TMsg;
  TcClosed: boolean;
begin
  if FormTitle <> '' then Title := FormTitle;
   //###Form.Translate(LangFile);
   TcClosed := False;
   Form.ModalResult := mrNone;
   Form.Show;

  while (Form.ModalResult = mrNone) do begin
    GetMessage(msg, 0, 0, 0);
    if (msg.message = WM_QUIT) then begin
      TcClosed := True;
      Form.ModalResult := mrCancel;
      result:=False;
    end else begin
      Result := (Form.ModalResult = mrOk);
      TranslateMessage(msg);
      DispatchMessage(msg);
    end;
  end;

  Result := (Form.ModalResult = mrOk);
  if TcClosed then
    PostMessage(msg.hwnd, msg.message, msg.wParam, msg.lParam);
end;
{$ELSE}
function TSynUniDesigner.Execute(FormTitle: string; LangFile: string): boolean;
begin
  if FormTitle <> '' then Title := FormTitle;
  {$IFDEF UNIDESIGNER18}Form.Translate(LangFile);{$ENDIF}
  Result := (Form.ShowModal = mrOk);
end;
{$ENDIF}

end.
