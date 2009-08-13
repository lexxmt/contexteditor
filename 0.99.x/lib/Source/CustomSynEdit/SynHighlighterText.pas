{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynHighlighterGeneral.pas, released 2000-04-07.
The Original Code is based on the mwGeneralSyn.pas file from the
mwEdit component suite by Martin Waldenburg and other developers, the Initial
Author of this file is Martin Waldenburg.
Portions written by Martin Waldenburg are copyright 1999 Martin Waldenburg.
Unicode translation by Maël Hörz.
All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterGeneral.pas,v 1.15.2.8 2008/09/14 16:25:00 maelh Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}
{
@abstract(Provides a customizable highlighter for SynEdit)
@author(Martin Waldenburg, converted to SynEdit by Michael Hieke)
@created(1999)
@lastmod(2000-06-23)
The SynHighlighterGeneral unit provides a customizable highlighter for SynEdit.
}

{$IFNDEF QSYNHIGHLIGHTERGENERAL}
unit SynHighlighterText;
{$ENDIF}

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditTypes,
  QSynEditHighlighter,
  QSynUnicode,
{$ELSE}
  Windows,
  Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode,
{$ENDIF}
  SysUtils,
  Classes;

type
  TtkTokenKind = (tkIdentifier, tkNull, tkSpace, tkUnknown);

  TRangeState = (rsANil, rsUnKnown);

type
  TSynTextSyn = class(TSynCustomHighlighter)
  private
    fRange: TRangeState;
    fTokenID: TtkTokenKind;
    procedure SpaceProc;
    procedure UnknownProc;
    function GetIdentifierChars: UnicodeString;
    procedure SetIdentifierChars(const Value: UnicodeString);
  protected
    fIdentifierAttri: TSynHighlighterAttributes;
    fIdentChars: UnicodeString;
    fSpaceAttri: TSynHighlighterAttributes;
    procedure IdentProc;
    procedure NullProc;
  public
    class function GetLanguageName: string; override;
    class function GetFriendlyLanguageName: UnicodeString; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;
    function IsWordBreakChar(AChar: WideChar): Boolean; override;
    procedure Next; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
{$IFNDEF SYN_CLX}
    function SaveToRegistry(RootKey: HKEY; Key: string): boolean; override;
    function LoadFromRegistry(RootKey: HKEY; Key: string): boolean; override;
{$ENDIF}
  published
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property IdentifierChars: UnicodeString read GetIdentifierChars write SetIdentifierChars;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
  end;

procedure Register;

implementation

uses
{$IFDEF SYN_CLX}
  QSynEditStrConst;
{$ELSE}
  SynEditStrConst;
{$ENDIF}

procedure Register;
begin
  RegisterComponents('ConTEXT COmponents', [TSynTextSyn]);
end;

function TSynTextSyn.IsIdentChar(AChar: WideChar): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 1 to Length(fIdentChars) do
    if AChar = fIdentChars[i] then
    begin
      Result := True;
      Exit;
    end;
end;

function TSynTextSyn.IsWordBreakChar(AChar: WideChar): Boolean;
begin
  Result := inherited IsWordBreakChar(AChar) and not IsIdentChar(AChar);
end;

constructor TSynTextSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);

  SetAttributesOnChange(DefHighlightChange);

  fIdentChars := '_0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' + 'abcdefghijklmnopqrstuvwxyz';
  fRange := rsUnknown;
end; { Create }

destructor TSynTextSyn.Destroy;
begin
  inherited Destroy;
end; { Destroy }

procedure TSynTextSyn.IdentProc;
begin
  while IsIdentChar(fLine[Run]) do
    inc(Run);
  fTokenId := tkIdentifier;
end;

procedure TSynTextSyn.NullProc;
begin
  fTokenID := tkNull;
  inc(Run);
end;

procedure TSynTextSyn.SpaceProc;
begin
  inc(Run);
  fTokenID := tkSpace;
  while (FLine[Run] <= #32) and not IsLineEnd(Run) do
    inc(Run);
end;

procedure TSynTextSyn.UnknownProc;
begin
  inc(Run);
  fTokenID := tkUnknown;
end;

procedure TSynTextSyn.Next;
begin
  fTokenPos := Run;
  case fLine[Run] of
    'A'..'Z', 'a'..'z', '_', '0'..'9': IdentProc;
    #0: NullProc;
    #1..#9, #11, #12, #14..#32: SpaceProc;
  else
    UnknownProc;
  end;
  inherited;
end;

function TSynTextSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynTextSyn.GetEol: Boolean;
begin
  Result := Run = fLineLen + 1;
end;

function TSynTextSyn.GetRange: Pointer;
begin
  Result := Pointer(fRange);
end;

function TSynTextSyn.GetTokenID: TtkTokenKind;
begin
  Result := fTokenId;
end;

function TSynTextSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkIdentifier: Result := fIdentifierAttri;
    tkSpace: Result := fSpaceAttri;
    tkUnknown: Result := fIdentifierAttri;
  else
    Result := nil;
  end;
end;

function TSynTextSyn.GetTokenKind: integer;
begin
  Result := Ord(fTokenId);
end;

procedure TSynTextSyn.ResetRange;
begin
  fRange := rsUnknown;
end;

procedure TSynTextSyn.SetRange(Value: Pointer);
begin
  fRange := TRangeState(Value);
end;

class function TSynTextSyn.GetLanguageName: string;
begin
  Result := SYNS_LangGeneral;
end;

{$IFNDEF SYN_CLX}

function TSynTextSyn.LoadFromRegistry(RootKey: HKEY; Key: string): boolean;
var
  r: TBetterRegistry;
begin
  r := TBetterRegistry.Create;
  try
    r.RootKey := RootKey;
    if r.OpenKeyReadOnly(Key) then
    begin
      Result := inherited LoadFromRegistry(RootKey, Key);
    end
    else
      Result := false;
  finally r.Free;
  end;
end;

function TSynTextSyn.SaveToRegistry(RootKey: HKEY; Key: string): boolean;
var
  r: TBetterRegistry;
begin
  r := TBetterRegistry.Create;
  try
    r.RootKey := RootKey;
    if r.OpenKey(Key, true) then
    begin
      Result := true;
      Result := inherited SaveToRegistry(RootKey, Key);
    end
    else
      Result := false;
  finally r.Free;
  end;
end;
{$ENDIF}

function TSynTextSyn.GetIdentifierChars: UnicodeString;
begin
  Result := fIdentChars;
end;

procedure TSynTextSyn.SetIdentifierChars(const Value: UnicodeString);
begin
  fIdentChars := Value;
end;

class function TSynTextSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result := SYNS_FriendlyLangGeneral;
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynTextSyn);
{$ENDIF}
end.

