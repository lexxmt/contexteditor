unit SynHighlighterText;

{$I SynEdit.inc}

interface

uses
  SysUtils, Windows, Messages, Classes, Controls, Graphics, Registry,
  SynEditHighlighter, SynEditTypes;

type
  TtkTokenKind = (
    tkNull,
    tkUnknown);

//  TRangeState = (rsANil, rsAnsi, rsPasStyle, rsCStyle, rsUnKnown);

  TProcTableProc = procedure of Object;

type
  TSynTextSyn = class(TSynCustomHighLighter)
  private
    fSpaceAttri     :TSynHighlighterAttributes;
    fTokenID: TtkTokenKind;
    Run: LongInt;
    fTokenPos: Integer;
    fLine: PChar;
    fLineNumber : Integer;
    fProcTable: array[#0..#255] of TProcTableProc;
//    fRange: TRangeState;

    procedure MakeMethodTables;
    procedure NullProc;
    procedure UnknownProc;
  protected
    function GetIdentChars: TSynIdentChars; override;
  public
//    class function GetCapability: THighlighterCapability; override;             //gp 2000-01-20
    class function GetLanguageName: string; override;                           //gp 2000-01-20
  public
    constructor Create(AOwner: TComponent); override;
//    procedure ExportNext; override;
    destructor Destroy; override;
    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;       //mh 2000-01-17
      override;
    function GetEol: Boolean; override;
//    function GetRange: Pointer; override;
    function GetTokenID: TtkTokenKind;
    procedure SetLine(NewValue: String; LineNumber:Integer); override;
    function GetToken: String; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: integer; override;
    function GetTokenPos: Integer; override;
    procedure Next; override;
//    procedure SetLineForExport(NewValue: String); override;
//    procedure SetRange(Value: Pointer); override;
//    procedure ReSetRange; override;
  published
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri
      write fSpaceAttri;
  end;

procedure Register;

implementation

uses
  SynEditStrConst;

const
  INDENT_CHARS :TSynIdentChars = [#33..#255]-
                              ['!','"','#','$','%','&','/','(',')','=','?','*','+',';',',',':','.','-','>','<','\','|','[',']','@','{','}'];

procedure Register;
begin
  RegisterComponents(SYNS_HighlightersPage, [TSynTextSyn]);
end;

//class function TSynTextSyn.GetCapability: THighlighterCapability;             //gp 2000-01-20
//begin
//  Result := inherited GetCapability + [hcExportable];
//end;

constructor TSynTextSyn.Create(AOwner: TComponent);
begin
{begin}                                                                         //mh 2000-01-14
  inherited Create(AOwner);
  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace);
  AddAttribute(fSpaceAttri);
{end}                                                                           //mh 2000-01-14
  SetAttributesOnChange(DefHighlightChange);
  MakeMethodTables;
end; { Create }

destructor TSynTextSyn.Destroy;
begin
  inherited Destroy;
end; { Destroy }

procedure TSynTextSyn.MakeMethodTables;
var
  I: Char;
begin
  for I := #0 to #255 do
    case I of
      #0: fProcTable[I] := NullProc;
      else fProcTable[I] := UnknownProc;
    end;
end;

procedure TSynTextSyn.NullProc;
begin
  fTokenID := tkNull;
end;

procedure TSynTextSyn.SetLine(NewValue: String; LineNumber:Integer);
begin
  fLine := PChar(NewValue);
  Run := 0;
  fLineNumber := LineNumber;
  Next;
end; { SetLine }

procedure TSynTextSyn.UnknownProc;
begin
  Run:=Length(fLine);
  fTokenID := tkUnKnown;
end;

procedure TSynTextSyn.Next;
begin
  fTokenPos := Run;
  fProcTable[fLine[Run]];
end;

function TSynTextSyn.GetIdentChars: TSynIdentChars;
begin
  Result := INDENT_CHARS;
end;

class function TSynTextSyn.GetLanguageName: string;                           //gp 2000-01-20
begin
  Result := 'Text files';
end;

{begin}                                                                         //mh 2000-01-17
function TSynTextSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  result:=fSpaceAttri;
end;
{end}                                                                           //mh 2000-01-17

function TSynTextSyn.GetTokenKind: integer;
begin
  Result := ord(tkUnKnown);
end;

function TSynTextSyn.GetTokenPos: Integer;
begin
  Result := 0;
end;

function TSynTextSyn.GetEol: Boolean;
begin
  Result := fTokenId = tkNull;
end;

//function TSynTextSyn.GetRange: Pointer;
//begin
//  Result := Pointer(fRange);
//end;

function TSynTextSyn.GetToken: String;
var
  Len: LongInt;
begin
  Len := Length(fLine);
  SetString(Result, FLine, Len);
end;

function TSynTextSyn.GetTokenID: TtkTokenKind;
begin
  Result := tkUnKnown;
end;

function TSynTextSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  Result := fSpaceAttri;
end;

//procedure TSynTextSyn.SetRange(Value: Pointer);
//begin
//end;

//procedure TSynTextSyn.ReSetRange;
//begin
//  fRange := rsUnknown;
//end;

//procedure TSynTextSyn.ExportNext;
//begin
//  Next;
//  if Assigned(Exporter) then
//    with TmwCustomExport(Exporter) do begin
//        FormatToken(GetToken, fSpaceAttri, False, True);
//    end; //with
//end;

initialization
  RegisterPlaceableHighlighter(TSynTextSyn);                                  //gp 2000-01-20
end.

