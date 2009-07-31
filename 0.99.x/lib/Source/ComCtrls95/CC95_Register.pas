unit CC95_Register;

interface

uses Classes, sysutils, DesignIntf, DesignEditors, typinfo, ComCtrls95;

{$IFDEF ver90} //remove this line for explict D2 usage
{$DEFINE delphi2} //Create .DCU for D2
{$ENDIF} //remove this line for explict D2 usage

{$IFDEF ver110} //This is for BCB3  Do not remove!
{$DEFINE delphi4}
{$DEFINE BCB3}
{$ENDIF}

{$IFDEF ver120} //remove this line for explict D4 usage
{$DEFINE delphi4} //Create .DCU for D4
{$ENDIF} //remove this line for explict D4 usage

{$IFDEF ver130}
{$DEFINE Delphi4}
{$ENDIF}

type
  TPage95ControlEditor = class(TComponentEditor)
  private
    procedure NewPage;
    procedure ChangePage(Forward: boolean);
  public
    function GetVerb(index: integer): string; override;
    function GetVerbCount: integer; override;
    procedure ExecuteVerb(index: integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

function TPage95ControlEditor.GetVerb(index: integer): string;
begin
  case index of
    0: result := 'New Page';
    1: result := 'Next Page';
    2: result := 'Previous Page';
  end;
end;

function TPage95ControlEditor.GetVerbCount: integer;
begin
  result := 3;
end;

procedure TPage95ControlEditor.Edit;
var
  eventname: string;
  changeevent: TNotifyEvent;
  ppi: PPropInfo;
  pagecontrol: tpage95control;
begin
  if component is ttab95sheet then
    pagecontrol := ttab95sheet(component).pagecontrol
  else
    pagecontrol := tpage95control(component);

  changeevent := pagecontrol.OnChange;
  if assigned(changeevent) then
    eventname := designer.getmethodname(tmethod(changeevent))
  else
  begin
    eventname := pagecontrol.name + 'Change';
    ppi := GetPropInfo(pagecontrol.classinfo, 'OnChange');
{$IFDEF delphi2}
    changeevent := tnotifyevent(designer.createmethod(eventname, gettypedata(ppi.proptype)));
{$ELSE}
    changeevent := tnotifyevent(designer.createmethod(eventname, gettypedata(ppi.proptype^)));
{$ENDIF}
    pagecontrol.onchange := changeevent;
    designer.modified;
  end;
  designer.showmethod(eventname);
end;

procedure TPage95ControlEditor.ExecuteVerb(index: integer);
begin
  case index of
    0: NewPage;
    1: ChangePage(true); //Next Page
    2: ChangePage(False); //Previous Page
  end;
end;

procedure TPage95ControlEditor.NewPage;
begin
end;

procedure TPage95ControlEditor.ChangePage(forward: boolean);
begin
end;

procedure Register;
begin
  RegisterComponents('ConTEXT Components', [TTab95Control, TPage95Control]);
  RegisterClass(TTab95Sheet);
  RegisterComponentEditor(TPage95Control, TPage95ControlEditor);
  RegisterComponentEditor(TTab95Sheet, TPage95ControlEditor);
end;

end.

