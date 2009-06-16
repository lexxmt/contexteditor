//   original system: PBJustOne by Patrick Brisacier (PBrisacier@mail.dotcom.fr)
//   using of Atom: Ken Hale and Coda Hale (kenhale@dcalcoda.com)
//   DCR contained bitmap: Troels S Eriksen (TSErikse@post8.tele.dk)
//   assembler: Paul Sitkei(sitkei@elender.hu)

unit MainInstance;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, JclFileUtils;

type
  TMainInstance = class(TComponent)
  public
    constructor Create(aOwner: TComponent); override;
  end;

const
  wmMainInstanceOpenFile = WM_USER+ 1001;  //new
  wmMultiInstanceAllowed = WM_USER+ 1002;
  wmLockPainting         = WM_USER+ 1003;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TMainInstance]);
end;

var
  MyAppName, MyClassName: array[0..255] of Char;
  NumFound: Integer;
  LastFound, MyPopup: HWND;

function LookAtAllWindows(Handle: HWND; Temp: LongInt): BOOL; stdcall;
var
  WindowName, ClassName: Array[0..255] of Char;
begin
  if (GetClassName(Handle, ClassName, SizeOf(ClassName)) > 0) and
     (StrComp(ClassName, MyClassName) = 0) and
     (GetWindowText(Handle, WindowName, SizeOf(WindowName)) > 0) and
     (StrComp(WindowName, MyAppName) = 0) then
  begin
    Inc(NumFound);
    if Handle <> Application.Handle then LastFound := Handle;
  end;
  Result:= True;
end;

function SendParam(aHandle: hWND): Boolean;             //new
var
  s              :string;
  i              :Integer;
  Atom           :tAtom;
  locked         :boolean;
begin
  Result:= False;

  if (ParamCount=0) then EXIT;

  locked:=ParamCount>1;

  if locked then
    SendMessage(aHandle, wmLockPainting, 0, 1);

  for i:= 1 to ParamCount do begin
    s:=Trim(ParamStr(i));

    if (Length(s)>0) and (s[1]<>'/') then
      s:=PathGetLongName(ExpandFileName(s));

    if (Length(s)>0) then begin
      Atom:=GlobalAddAtom(PChar(s));
      SendMessage(aHandle, wmMainInstanceOpenFile, Atom, Length(s));
      GlobalDeleteAtom(Atom);
    end;
  end;

  if locked then
    SendMessage(aHandle, wmLockPainting, 0, 0);

  Result:= True;
end;

function MultipleInstancesAllowed(aHandle: hWND):boolean;
begin
  result:=SendMessage(aHandle, wmMultiInstanceAllowed, 0, 0)=1;
end;

constructor TMainInstance.Create(aOwner: TComponent);
var
  t :dword;
begin
  inherited Create(aOwner);

  NumFound := 0;
  LastFound := 0;
  GetWindowText(Application.Handle, MyAppName, SizeOf(MyAppName));
  GetClassName(Application.Handle, MyClassName, SizeOf(MyClassName));
  EnumWindows(@LookAtAllWindows, 0);

  if (NumFound>1) then begin
    MyPopup := GetLastActivePopup(LastFound);

    if MultipleInstancesAllowed(MyPopup) then EXIT;

    BringWindowToTop(LastFound);
    if IsIconic(MyPopup) then begin
      ShowWindow(MyPopup, SW_RESTORE);
      SetForegroundWindow(MyPopup);

      t:=GetTickCount;
      while (GetTickCount<t+100) do Application.ProcessMessages;
      MyPopup := GetLastActivePopup(LastFound);
    end else
      SetForegroundWindow(MyPopup);

    SendParam(MyPopup);                                //new
    HALT;
  end;
end;

end.
