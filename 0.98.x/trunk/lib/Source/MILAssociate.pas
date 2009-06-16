{
   Unit Name      : MILAssociate.pas
   Component Name : TMILAssociate
   Author         : Larry J. Rutledge ( lrutledge@jps.net )
   Created        : August 4, 1998
   Last Modified  : N/A

   Description    : This component makes creating Windows file associations
                    a simple, painless process. After registering the
                    application, all that is required is a call to Associate
                    or UnAssociate to add or remove file associations.

   Instructions   : To use the component, drop it onto a form and assign values
                    to all the properties. Then in code call the RegisterApp
                    method. This process puts an entry in the Windows Registry
                    for the application that allows associations to be created.

                    To associate an extension with the application identified in
                    the component properties, call the Associate method and pass
                    it the extension to associate.

   Important Note : No notes for this component

   History        : Version  Date         Author     Description
                    -------  ----------   ------     --------------------------
                    1.0.0    08/04/1998    LJR       Created initial component.


   Proposed
   Revisions      : No currently proposed revisions
}

unit MILAssociate;

interface

uses
  Classes, Dialogs, Forms, Registry, ShlObj, SysUtils, Windows;

const
  _TITLE     = 'TMILAssociate';
  _VERSION   = '1.0.0';
  _AUTHOR    = 'Larry J. Rutledge';
  _COPYRIGHT = '© Copyright 1998, Millennial Software';

type
  { TMILAssociate - The actual component class                                }
  TMILAssociate = class(TComponent)
  private
    FKeyName   : String;
    FPathToApp : String;
    FIconPath  : String;
    FIcon      : Integer;
    FShellCmd  : String;
    FShell     : String;
    FTypeName  : String;
    FNew       : Boolean;
    FQuick     : Boolean;

    shellReg   : TRegistry;

    procedure SetKeyName(Value : String);
    procedure SetPathToApp(Value : String);
    procedure SetIconPath(Value : String);
    procedure SetIcon(Value : Integer);
    procedure SetShellCmd(Value : String);
    procedure SetShell(Value : String);
    procedure SetTypeName(Value : String);
    procedure SetNew(Value : Boolean);
    procedure SetQuick(Value : Boolean);

    function  GetKeyName   : String;
    function  GetPathToApp : String;
    function  GetIconPath  : String;
    function  GetIcon      : Integer;
    function  GetShellCmd  : String;
    function  GetShell     : String;
    function  GetTypeName  : String;
    function  GetNew       : Boolean;
    function  GetQuick     : Boolean;
  protected
    function qualifyExt(Ext : String) : String;
    function AddSlash(Path : String) : String;
    function StripPeriod(Ext : String) : String;
  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;

    procedure RegisterApp;
    procedure UnRegisterApp;

    procedure Associate(Extension : String);
    procedure UnAssociate(Extension : String);

    function  Enumerate : TStringList;
  published
    property KeyName   : String  read GetKeyName   write SetKeyName;
    property PathToApp : String  read GetPathToApp write SetPathToApp;
    property IconPath  : String  read GetIconPath  write SetIconPath;
    property Icon      : Integer read GetIcon      write SetIcon      default 0;
    property ShellCmd  : String  read GetShellCmd  write SetShellCmd;
    property Shell     : String  read GetShell     write SetShell;
    property TypeName  : String  read GetTypeName  write SetTypeName;
    property ShowInNew : Boolean read GetNew       write SetNew       default False;
    property QuickView : Boolean read GetQuick     write SetQuick     default False;
  end;

procedure Register;

implementation


{---------------------------------------------------------}
{ TIconPathProperty - IconPath Property Editor methods    }
{---------------------------------------------------------}

{---------------------------------------------------------}
{ TMILAssociate - The component implementation            )
{---------------------------------------------------------}
constructor TMILAssociate.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  FIcon     := 0;
  FNew      := False;
  FQuick    := False;
  FShellCmd := 'Open';
end;

destructor TMILAssociate.Destroy;
begin
  inherited Destroy;
end;

procedure TMILAssociate.SetKeyName(Value : String);
begin
  if FKeyName <> Value then
  begin
    FKeyName := Value;
  end;
end;

procedure TMILAssociate.SetPathToApp(Value : String);
begin
  if FPathToApp <> Value then
  begin
    FPathToApp := Value;
  end;
end;

procedure TMILAssociate.SetIconPath(Value : String);
begin
  if FIconPath <> Value then
  begin
    FIconPath := Value;
  end;
end;

procedure TMILAssociate.SetIcon(Value : Integer);
begin
  if FIcon <> Value then
  begin
    FIcon := Value;
  end;
end;

procedure TMILAssociate.SetShellCmd(Value : String);
begin
  if FShellCmd <> Value then
  begin
    FShellCmd := Value;
  end;
end;

procedure TMILAssociate.SetShell(Value : String);
begin
  if FShell <> Value then
  begin
    FShell := Value;
  end;
end;

procedure TMILAssociate.SetTypeName(Value : String);
begin
  if FTypeName <> Value then
  begin
    FTypeName := Value;
  end;
end;

procedure TMILAssociate.SetNew(Value : Boolean);
begin
  if FNew <> Value then
  begin
    FNew := Value;
  end;
end;

procedure TMILAssociate.SetQuick(Value : Boolean);
begin
  if FQuick <> Value then
  begin
    FQuick := Value;
  end;
end;

function  TMILAssociate.GetKeyName : String;
begin
  Result := FKeyName;
end;

function  TMILAssociate.GetPathToApp : String;
begin
  Result := FPathToApp;
end;

function  TMILAssociate.GetIconPath : String;
begin
  Result := FIconPath;
end;

function  TMILAssociate.GetIcon : Integer;
begin
  Result := FIcon;
end;

function  TMILAssociate.GetShellCmd : String;
begin
  Result := FShellCmd;
end;

function  TMILAssociate.GetShell : String;
begin
  Result := FShell;
end;

function  TMILAssociate.GetTypeName : String;
begin
  Result := FTypeName;
end;

function  TMILAssociate.GetNew : Boolean;
begin
  Result := FNew;
end;

function  TMILAssociate.GetQuick : Boolean;
begin
  Result := FQuick;
end;

(******************************************************************************)
(* QualifyExt    -  Takes a file extension as a parameter and returns a file  *)
(*                  extension with a leading period (.)                       *)
(******************************************************************************)
function  TMILAssociate.qualifyExt(Ext : String) : String;
begin
  if Pos('.', Ext) > 1 then
    Result := Copy(Ext, Pos('.', Ext), Length(Ext))
  else
  if Ext[1] <> '.' then
    Result := '.' + Ext
  else
    Result := Ext;
end;

(******************************************************************************)
(* AddSlash      -  Takes a path as a parameter and returns a path with a     *)
(*                  leading slash (\)                                         *)
(******************************************************************************)
function  TMILAssociate.AddSlash(Path : String) : String;
begin
  if Path[Length(Path)] <> '\' then
    Result := Path + '\'
  else
    Result := Path;
end;

(******************************************************************************)
(* StripPeriod   -  Takes a file extension as a parameter and returns a file  *)
(*                  extension without a leading period (.)                    *)
(******************************************************************************)
function  TMILAssociate.StripPeriod(Ext : String) : String;
begin
  if Ext[1] = '.' then
    Result := Copy(Ext, 2, Length(Ext))
  else
    Result := Ext;
end;

(******************************************************************************)
(* RegisterApp   -  Registers the application identified by the properties in *)
(*                  the Windows registry.                                     *)
(******************************************************************************)
procedure TMILAssociate.RegisterApp;
begin
  shellReg := TRegistry.Create;
  shellReg.RootKey := HKEY_CLASSES_ROOT;

  shellReg.OpenKey(FKeyName, True);
  shellReg.WriteString('', FTypeName);

  shellReg.CloseKey;
  shellReg.OpenKey(FKeyName + '\DefaultIcon', True);
  shellReg.WriteString('', FIconPath + ',' + IntToStr(FIcon));

  shellReg.CloseKey;
  shellReg.OpenKey(FKeyName + '\Shell\' + FShellCmd + '\Command', True);
  shellReg.WriteString('', FShell);

  if FQuick then
  begin
    shellReg.CloseKey;
    shellReg.OpenKey(FKeyName + '\QuickView', True);
    shellReg.WriteString('', '*');
  end else
  begin
    shellReg.CloseKey;
    shellReg.DeleteKey(FKeyName + '\QuickView');
  end;

  shellReg.CloseKey;
  shellReg.Free;

  // Update system to notify of association change
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_FLUSH, PChar(''), PChar(''));
end;

(******************************************************************************)
(* UnRegisterApp -  UnRegisters the application identified by the properties  *)
(*                  in the Windows registry.                                  *)
(******************************************************************************)
procedure TMILAssociate.UnRegisterApp;
begin
  shellReg := TRegistry.Create;
  shellReg.RootKey := HKEY_CLASSES_ROOT;

  shellReg.DeleteKey(FKeyName + '\Shell');
  shellReg.DeleteKey(FKeyName + '\QuickView');
  shellReg.DeleteKey(FKeyName + '\DefaultIcon');
  shellReg.DeleteKey(FKeyName);

  shellReg.Free;

  // Update system to notify of association change
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_FLUSH, PChar(''), PChar(''));
end;

(******************************************************************************)
(* Associate     -  Associates the specified file extension with the currently*)
(*                  identified application. Also stores old association in the*)
(*                  event that the association needs to be restored.          *)
(******************************************************************************)
procedure TMILAssociate.Associate(Extension : String);
var
  Ext     : String;
begin
  shellReg := TRegistry.Create;
  shellReg.RootKey := HKEY_CLASSES_ROOT;
  Ext := qualifyExt(Extension);

  if FALSE (*shellReg.KeyExists(Ext)*) then
  begin
(*
    shellReg.OpenKey(Ext, True);
    WorkStr := shellReg.ReadString('');

    if FNew then
    begin
      shellReg.OpenKey('ShellNew', True);
      shellReg.WriteString('NullFile', '');
    end else
    begin
      shellReg.CloseKey;
      shellReg.DeleteKey(WorkStr + '\ShellNew');
    end;

    shellReg.CloseKey;
    if shellReg.KeyExists(WorkStr) then
    begin
      shellReg.CloseKey;
      shellReg.OpenKey(WorkStr, False);
//      if shellReg.ReadString('') = '' then
        shellReg.WriteString('', FTypeName);

      shellReg.CloseKey;
      shellReg.OpenKey(WorkStr + '\DefaultIcon', TRUE);
//        shellReg.WriteString('OldAssociation', shellReg.ReadString(''));
        shellReg.WriteString('', 'blabla');
//        shellReg.WriteString('', FIconPath + ',' + IntToStr(FIcon));
//        shellReg.CloseKey;
        shellReg.OpenKey(WorkStr + '\Shell\' + FShellCmd + '\Command', True);
//        shellReg.WriteString('OldAssociation', shellReg.ReadString(''));
        shellReg.WriteString('', FShell);

      if FQuick then
      begin
        shellReg.CloseKey;
        shellReg.OpenKey(WorkStr + '\QuickView', True);
        shellReg.WriteString('', '*');
      end else
      begin
        shellReg.CloseKey;
        shellReg.DeleteKey(WorkStr + '\QuickView');
      end;
    end else
    begin
      shellReg.CloseKey;
      shellReg.OpenKey(WorkStr, True);
      shellReg.WriteString('', FTypeName);

      shellReg.CloseKey;
      shellReg.OpenKey(WorkStr + '\DefaultIcon', True);
      shellReg.WriteString('', FIconPath + ',' + IntToStr(FIcon));

      shellReg.CloseKey;
      shellReg.OpenKey(WorkStr + '\Shell\' + FShellCmd + '\Command', True);
      shellReg.WriteString('', FShell);

      if FQuick then
      begin
        shellReg.CloseKey;
        shellReg.OpenKey(WorkStr + '\QuickView', True);
        shellReg.WriteString('', '*');
      end;
    end;
*)      
  end else
  begin
    shellReg.OpenKey(Ext, True);
    shellReg.WriteString('', FTypeName);
    shellReg.WriteString('Content Type', 'text/plain');

    if FNew then
    begin
      shellReg.OpenKey('ShellNew', True);
      shellReg.WriteString('NullFile', '');
    end;

    shellReg.CloseKey;
    shellReg.OpenKey(FTypeName, True);
    shellReg.WriteString('', FTypeName);

    shellReg.CloseKey;
    shellReg.OpenKey(FTypeName+'\DefaultIcon', True);
    shellReg.WriteString('', FIconPath + ',' + IntToStr(FIcon));

    shellReg.CloseKey;

    shellReg.OpenKey(FTypeName+'\Shell\' + FShellCmd + '\Command', True);
    shellReg.WriteString('', FShell);

    if FQuick then
    begin
      shellReg.CloseKey;
      shellReg.OpenKey(FTypeName+'\QuickView', True);
      shellReg.WriteString('', '*');
    end;
  end;

  shellReg.CloseKey;
  shellReg.Free;

  // Update system to notify of association change
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_FLUSH, PChar(''), PChar(''));
end;

(******************************************************************************)
(* UnAssociate -    If an old association was stored for the specified file   *)
(*                  file extension, it is restored.                           *)
(******************************************************************************)
procedure TMILAssociate.UnAssociate(Extension : String);
var
  Ext     : String;
  WorkStr : String;

begin
  shellReg := TRegistry.Create;
  shellReg.RootKey := HKEY_CLASSES_ROOT;

  Ext := StripPeriod(qualifyExt(Extension));

  if shellReg.KeyExists('.' + Ext) then
  begin
    shellReg.OpenKey('.' + Ext, False);
    WorkStr := shellReg.ReadString('');

    shellReg.CloseKey;
    shellReg.DeleteKey('.' + Ext);
  end;

  shellReg.CloseKey;
  shellReg.Free;

  // Update system to notify of association change
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_FLUSH, PChar(''), PChar(''));
end;

(******************************************************************************)
(* Enumerate     -  Returns a list of extensions currently associated with    *)
(*                  currently identified application.                         *)
(******************************************************************************)
function  TMILAssociate.Enumerate : TStringList;
var
  KeyList,
  ResultList : TStringList;

  iCount,
  jCount     : Integer;

  WorkStr,
  WorkStr2   : String;
  s          :string;

begin
  KeyList    := TStringList.Create;
  ResultList := TStringList.Create;

  shellReg := TRegistry.Create;
  shellReg.RootKey := HKEY_CLASSES_ROOT;
  shellReg.OpenKey('', False);
  shellReg.GetKeyNames(KeyList);

  for iCount := 0 to KeyList.Count - 1 do
  begin
    if Copy(KeyList.Strings[iCount], 1, 1) <> '.' then
    begin
      shellReg.CloseKey;
      shellReg.OpenKey(KeyList.Strings[iCount] + '\Shell\Open\Command', False);

      WorkStr := LowerCase(shellReg.ReadString(''));
      s:=LowerCase(ExtractFileName(FShell));
      if Pos(s, WorkStr) > 0 then
      begin
        for jCount := 0 to KeyList.Count - 1 do
        begin
          if Copy(KeyList.Strings[jCount], 1, 1) = '.' then
          begin
            shellReg.CloseKey;
            shellReg.OpenKey(KeyList.Strings[jCount], False);

            WorkStr2 := shellReg.ReadString('');
            if WorkStr2 = KeyList.Strings[iCount] then
              ResultList.Add(KeyList.Strings[jCount]);
          end;
        end;
      end;
    end;
  end;

  KeyList.Clear;
  KeyList.Free;

  shellReg.CloseKey;
  shellReg.Free;

  Result := ResultList;
end;

procedure Register;
begin
  RegisterComponents('Add-On''s', [TMILAssociate]);
end;

end.
