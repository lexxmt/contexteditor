{
@abstract(TSynUniSyn rules source)
@authors(Fantasist [walking_in_the_sky@yahoo.com], Vit [nevzorov@yahoo.com],
         Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2003)
@lastmod(01.08.2005 17:24:09)
}

{$IFNDEF QSYNUNIREG}
unit SynUniReg;
{$ENDIF}

interface

{$I SynUniHighlighter.inc}

uses
{$IFDEF SYN_COMPILER_6_UP}
  DesignIntf,
  DesignEditors,
{$ELSE}
  DsgnIntf,
{$ENDIF}
{$IFDEF SYN_CLX}
  Qt,
  QDialogs,
  QSynEditStrConst,
  QSynUniHighlighter;
{$ELSE}
  Classes,
  Dialogs,
  SynEditStrConst,
  SynUniHighlighter,
  {$IFDEF INTERNAL_DESIGNER}
  SynUniDesigner,
  {$ENDIF}
  Windows;
{$ENDIF}

type
  TSynUniEditor = class(TDefaultEditor)
    procedure Edit; override;
    procedure Load;
    procedure Clear;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;
 
resourcestring
  sEdit = 'Edit...';
  sLoadFromFile = 'Load From File...';
  sClear = 'Clear';

procedure Register;

implementation

//------------------------------------------------------------------------------
procedure Register;
begin
  RegisterComponents(SYNS_ComponentsPage, [TSynUniSyn]);
  RegisterComponentEditor(TSynUniSyn, TSynUniEditor);
end;

//------------------------------------------------------------------------------
{* * * * * * * * * * * * * * TSynUniEditor * * * * * * * * * * * * * * * * * * }
//------------------------------------------------------------------------------
procedure TSynUniEditor.Edit;
begin
  {$IFDEF INTERNAL_DESIGNER}
  if TSynUniDesigner.EditHighlighter( Component as TSynUniSyn ) then
    Designer.Modified();
  {$IFDEF UNIDESIGNER20}Designer.Modified();{$ENDIF}
  {$ELSE}
  MessageBox(0, 'Sorry, internal SynUniDesigner is disabled', 'Information', MB_ICONINFORMATION);
  {$ENDIF}
end;

//------------------------------------------------------------------------------
procedure TSynUniEditor.Load;
var
  OpenDlg: TOpenDialog;
begin
  OpenDlg := TOpenDialog.Create(nil);
  if OpenDlg.Execute then
  begin
    (Component as TSynUniSyn).LoadFromFile(OpenDlg.FileName);
    Designer.Modified();
  end;
  OpenDlg.Free;
end;

//------------------------------------------------------------------------------
procedure TSynUniEditor.Clear;
begin
  (Component as TSynUniSyn).Clear;
  Designer.Modified();
end;

//------------------------------------------------------------------------------
procedure TSynUniEditor.ExecuteVerb(Index: Integer);
begin
  if GetVerb(Index) = 'Edit...' then
    Edit
  else
  if GetVerb(Index) = 'Load From File...' then
    Load
  else
  if GetVerb(Index) = 'Clear' then
    Clear;
end;

//------------------------------------------------------------------------------
function TSynUniEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sEdit;
    1: Result := sLoadFromFile;
    2: Result := sClear;
  end;
end;

//------------------------------------------------------------------------------
function TSynUniEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

end.
