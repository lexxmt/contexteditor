{
@abstract(Provides EditPlus highlighting schemes import and export)
@authors(Vitalik [just_vitalik@yahoo.com])
@created(2005)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatEditPlus}
unit SynUniFormatEditPlus;
{$ENDIF}

interface

uses
{$IFDEF SYN_CLX}
  QClasses,
  QGraphics,
  QSynUniFormat,
  QSynUniClasses,
  QSynUniRules,
  QSynUniHighlighter
{$ELSE}
  Classes,
  Graphics,
  SynUniFormat,
  SynUniClasses,
  SynUniRules,
  SynUniHighlighter,
{$ENDIF}
  SysUtils;

type
  TSynUniFormatEditPlus = class(TSynUniFormat)
  public
    class function Import(SynUniSyn: TSynUniSyn; FileList: TStringList): boolean;
    class function ImportFromStream(AObject: TObject; Stream: TStream): boolean; override;
    class function ImportFromFile(AObject: TObject; FileName: string): boolean; override;
  end;

implementation

//------------------------------------------------------------------------------
class function TSynUniFormatEditPlus.Import(SynUniSyn: TSynUniSyn; FileList: TStringList): boolean;

  procedure RefreshScheme(ARange: TSynRange);
  var
    i: integer;
  begin
    with ARange, SynUniSyn do begin
      for i := 0 to RangeCount - 1 do
      begin
        with Ranges[i] do
          ActiveScheme.AddStyle(Name, Attributes.Foreground, Attributes.Background, Attributes.Style);
        RefreshScheme(Ranges[i]);
      end;
      for i := 0 to KeyListCount - 1 do
        with KeyLists[i] do
          ActiveScheme.AddStyle(Name, Attributes.Foreground, Attributes.Background, Attributes.Style);
      for i := 0 to ARange.SetCount - 1 do
        with Sets[i] do
          ActiveScheme.AddStyle(Name, Attributes.Foreground, Attributes.Background, Attributes.Style);
    end;
  end;

var
  qn1, qn2, bn1, bn2, curKwd, i: integer;
  key, value, buf: string;
const
  kwcolors: array [0..4] of TColor = (clBlue, clRed, clTeal, clOlive, clMaroon);
begin
  //Result := False;
  with SynUniSyn do begin
    MainRules.Clear;
    qn1 := -1;   qn2 := -1;   bn1 := -1;   bn2 := -1;
    curKwd := -1;
    for i := 0 to FileList.Count-1 do begin
      buf := FileList.Strings[i];
      if buf = '' then
        continue;
      if buf[1] = '#' then begin
        key := copy(buf, 1, pos('=', buf)-1);
        value := copy(buf, pos('=', buf)+1, length(buf)-pos('=', buf));
        if key = '#TITLE' then begin
          Info.General.Name := value
        end
        else if key = '#DELIMITER' then
          MainRules.Delimiters := StrToSet(value)
        else if key = '#CONTINUE_QUOTE' then begin
          if value = 'y' then begin
            if qn1 > -1 then MainRules.Ranges[qn1].CloseOnEol := False;
            if qn2 > -1 then MainRules.Ranges[qn2].CloseOnEol := False;
          end
          else begin
            if qn1 > -1 then MainRules.Ranges[qn1].CloseOnEol := True;
            if qn2 > -1 then MainRules.Ranges[qn2].CloseOnEol := True;
          end
        end
        else if key = '#CASE' then begin
          if value = 'y' then
            MainRules.CaseSensitive := True
          else
            MainRules.CaseSensitive := False;
        end
        else if (key = '#KEYWORD') or (buf = '#KEYWORD') then begin
          inc(curKwd);
          if key = '' then
            MainRules.AddKeyList('Keyword '+IntToStr(curKwd+1), kwcolors[curKwd])
          else
            MainRules.AddKeyList(value, kwcolors[curKwd]);
        end
        else if value <> '' then
          if key = '#QUOTATION1' then begin
            qn1 := MainRules.RangeCount;
            MainRules.AddRange(value[1], value[1], 'Quotaion', clFuchsia);
          end else
          if key = '#QUOTATION2' then begin
            qn2 := MainRules.RangeCount;
            MainRules.AddRange(value[1], value[1], 'Quotaion2', clFuchsia);
          end else
          if key = '#LINECOMMENT' then begin
            //ln1 := MainRules.RangeCount;
            with MainRules.AddRange(value, '', 'Line comment', clGreen) do
              CloseOnEol := True;
          end else
          if key = '#LINECOMMENT2' then begin
            //ln2 := MainRules.RangeCount;
            with MainRules.AddRange(value, '', 'Line comment 2', clGreen) do
              CloseOnEol := True;
          end else
          if key = '#COMMENTON' then begin
            if bn1 = -1 then begin
              bn1 := MainRules.RangeCount;
              MainRules.AddRange(value, '', 'Block comment', clGreen);
            end else
              MainRules.Ranges[bn1].OpenToken.Symbols[0] := value //error
          end else
          if key = '#COMMENTOFF' then begin
            if bn1 = -1 then begin
              bn1 := MainRules.RangeCount;
              MainRules.AddRange('', value, 'Block comment', clGreen);
            end else
              MainRules.Ranges[bn1].CloseToken.Symbols[0] := value //error
          end else
          if key = '#COMMENTON2' then begin
            if bn2 = -1 then begin
              bn2 := MainRules.RangeCount;
              MainRules.AddRange(value, '', 'Block comment 2', clGreen);
            end else
              MainRules.Ranges[bn2].OpenToken.Symbols[0] := value
          end else
          if key = '#COMMENTOFF2' then begin
            if bn2 = -1 then begin
              bn2 := MainRules.RangeCount;
              MainRules.AddRange('', value, 'Block comment 2', clGreen);
            end else
              MainRules.Ranges[bn2].CloseToken.Symbols[0] := value
          end else
          if copy(key, 1, 7) = '#PREFIX' then begin
            with MainRules.AddRange(value, '', 'Prefix '+key[8],
              kwColors[StrToInt(key[8])]) do
              CloseOnTerm := True;
          end
      end
      else if buf[1] = ';' then
      else begin
        MainRules.KeyLists[curKwd].KeyList.Add(buf);
      end
    end;
    MainRules.SetDelimiters(MainRules.Delimiters);
    RefreshScheme(MainRules);
    Info.Author.Copyright := 'Created with EditPlus Converter. (c) Vitalik';
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatEditPlus.ImportFromStream(AObject: TObject; Stream: TStream): boolean;
var
  FileList: TStringList;
begin
  FileList := TStringList.Create;
  FileList.LoadFromStream(Stream);
  Result := Import(TSynUniSyn(AObject), FileList);
  FreeAndNil(FileList);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatEditPlus.ImportFromFile(AObject: TObject; FileName: string): boolean;
var
  FileList: TStringList;
begin
  FileList := TStringList.Create;
  FileList.LoadFromFile(FileName);
  Result := Import(TSynUniSyn(AObject), FileList);
  FreeAndNil(FileList);
end;

end.
