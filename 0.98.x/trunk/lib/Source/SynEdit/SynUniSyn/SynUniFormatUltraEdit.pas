{
@abstract(Provides UltraEdit highlighting schemes import and export)
@authors(Vitalik [just_vitalik@yahoo.com])
@created(2005)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatUltraEdit}
unit SynUniFormatUltraEdit;
{$ENDIF}

interface

uses
{$IFDEF SYN_CLX}
  QClasses,
  QGraphics,
  QSynUniFormat,
  QSynUniClasses,
  QSynUniRules,
  SynUniHighlighter,
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
  TSynUniFormatUltraEdit = class(TSynUniFormat)
  public
    class function Import(SynUniSyn: TSynUniSyn; FileList: TStringList): boolean;
    class function ImportFromStream(AObject: TObject; Stream: TStream): boolean; override;
    class function ImportFromFile(AObject: TObject; FileName: string): boolean; override;
  end;

implementation

(*
function Test(FileName: string): boolean;
var
  i, cur: integer;
  buf: string;
  isLoading: boolean;
begin
  Form1.Memo1.Clear;
  if not Assigned(UltraEditFile) then
    if FileName <> '' then begin
      UltraEditFile := TStringList.Create;
      UltraEditFile.LoadFromFile(FileName);
      UltraEditFileName := FileName;
      UltraEditFilePos := 0;
      Form1.Memo1.Lines.Add('File was loaded...');
    end
    else begin
      Form1.Memo1.Lines.Add('File was not assigned and not loaded...');
      Result := False;
      Exit;
    end
  else begin
    if (FileName = UltraEditFileName) and (UltraEditFilePos >= UltraEditFile.Count-1) or (FileName = '') then begin
      if Assigned(UltraEditFile) then begin
        UltraEditFile.Free;
        UltraEditFile := nil;
      end;
      UltraEditFileName := '';
      UltraEditFilePos := 0;
      Form1.Memo1.Lines.Add('Variables are deleted...');
      Form1.Memo1.Lines.Add('Exit: 1.');
      Result := False;
      Exit;
    end;
    if FileName <> UltraEditFileName then begin
      UltraEditFile.LoadFromFile(FileName);
      UltraEditFileName := FileName;
      UltraEditFilePos := 0;
      Form1.Memo1.Lines.Add('New File was loaded!');
    end;
  end;

  isLoading := False;
  for i := UltraEditFilePos to UltraEditFile.Count-1 do begin
    buf := UltraEditFile.Strings[i];
    UltraEditFilePos := i;
    if buf = '' then continue;
    if copy(buf, 1, 2) = '/L' then begin
      if not isLoading then
        isLoading := True
      else begin // isLoading = True?
        Result := True;
        Exit;
        {TrySaveFile(); ResetSynUniSyn;}
      end;
      if (buf[4] = '"') or (buf[5] = '"') then begin
        cur := pos('"', copy(buf, pos('"',buf)+1, length(buf)-pos('"',buf))) + pos('"', buf);
        Form1.Memo1.Lines.Add(' Name: ' + copy(buf, pos('"',buf)+1, cur-pos('"',buf)-1));
      end;
    end else begin
      if not isLoading then isLoading := True;
      if copy(buf, 1, 13) = '/Delimiters =' then
        Form1.Memo1.Lines.Add(' Delimiters: ' + copy(buf, pos('=',buf)+1, length(buf)-pos('=',buf)+1))
      else
      if copy(buf, 1, 2) = '/C' then begin
        if buf[4] = '"' then begin
          cur := pos('"', copy(buf, 5, length(buf)-4)) + 4;
          Form1.Memo1.Lines.Add(' C' + buf[3] + ' "' + copy(buf, 5, cur-5) + '"');
        end
        else
          Form1.Memo1.Lines.Add(' C' + buf[3] + ' "<' + 'noname' + '>"');
      end else
    end;
  end;
  Form1.Memo1.Lines.Add('');
  Form1.Memo1.Lines.Add('File has finished...');
  Result := True;
end;
*)

//------------------------------------------------------------------------------
{* * * * * * * * * * * * TSynUniFormatUltraEdit * * * * * * * * * * * * * * * *}
//------------------------------------------------------------------------------
class function TSynUniFormatUltraEdit.Import(SynUniSyn: TSynUniSyn; FileList: TStringList): boolean;
var
  i, j, qn1, qn2, bn1, bn2, cur, Nc: integer;
  qc1, qc2: char;
  word, buf: string;
  Cnames: array [1..8] of string;
  Created: array [1..8] of integer;
  isLoading: boolean;
  keyword: TSynKeyList;
const
  colors: array [1..8] of TColor =
            (clBlue, clRed, $0080FF, clGreen, clMaroon, clBlue, clBlue, clBlue);
  badsymb: array [0..8] of char = ('\', '/', ':', '*', '?', '"', '<', '>', '|');
  LINE_COMMENT  = 1;
  BLOCK_COMMENT = 2;
  STRING_CHARS  = 3;
  LINE_COMM_NUM = 4;
  SINGLE_WORD   = 5;
  WHOLE_STRING  = 6;
  ESCAPE_CHAR   = 7;

  function GetAttribute(Key: string; Style: integer): boolean;
  var pos_start, space1_pos, space2_pos, len: integer;
  begin
    Result := False;
    if pos(key, buf) = 0 then Exit;
    pos_start := pos(key, buf) + length(key);
    if (Style = LINE_COMMENT) or (Style = BLOCK_COMMENT) or (Style = STRING_CHARS) then begin
      if Style =  LINE_COMMENT then len :=  5 else
      if Style = BLOCK_COMMENT then len := 19 else
      if Style =  STRING_CHARS then len := 2  else len := 5;
      word := copy(buf, pos_start, len);
      space1_pos := pos(' ', word);
      if space1_pos > 0 then
        if space1_pos = 1 then begin
          space2_pos := pos(' ', copy(word, 2, len-1));
          if space2_pos > 0 then
            word := copy(word, 1, space2_pos);
        end else
          word := copy(word, 1, space1_pos-1)
    end
    else if Style = LINE_COMM_NUM then begin
      len := StrToInt(buf[pos_start]);
      word := copy(buf, pos_start+1, len);
      space1_pos := pos(' ', word);
      if space1_pos > 0 then
    end
    else if Style = WHOLE_STRING then
      word := copy(buf, pos_start, length(buf) - pos_start + 1)
    else if Style = ESCAPE_CHAR then
      word := buf[pos_start]
    else if Style = SINGLE_WORD then ;

    if word <> '' then Result := True;
  end;

  function GetToken2: string;
  begin
    cur := pos(' ', buf);
    if cur > 0 then begin
      Result := copy(buf, 1, cur-1);
      buf := copy(buf, cur+1, length(buf)-cur);
    end else begin
      Result := buf;   buf := '';
    end;
  end;

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
  FilePos: integer;
  FileName: string;
begin
  //Result := False;
  with SynUniSyn do begin
    FilePos := 0;
    if not Assigned(FileList) then
      if FileName <> '' then
      begin
        //'File was loaded.'
        FileList := TStringList.Create;
        FileList.LoadFromFile(FileName);
        FileName := FileName;
        FilePos := 0;
      end
      else begin
        //'File was not assigned and not loaded. Exiting...'
        Result := False;
        Exit;
      end
    else begin
  {    if (FileName = FileName) and (FilePos >= FileList.Count-1) or (FileName = '') then begin
        //'Variables are deleted. Exiting...'
        if Assigned(FileList) then begin
          FileList.Free;
          FileList := nil;
        end;
        FileName := '';
        FilePos := 0;
        Result := False;
        Exit;
      end;}
      if FileName <> FileName then begin
        //'New File was loaded.'
        FileList.LoadFromFile(FileName);
        FileName := FileName;
        FilePos := 0;
      end;
    end;
  
    MainRules.Clear;
    isLoading := False;
    qc1 := #0;   qc2 := #0;   Nc := 0;   qn1 := -1;   qn2 := -1;
    for i := FilePos to FileList.Count-1 do begin
      buf := FileList.Strings[i];
      FilePos := i;
      if buf = '' then continue;
      if copy(buf, 1, 2) = '/L' then begin
        if not isLoading then
          isLoading := True
        else begin // isLoading = True?
          Info.Author.Remark := 'Created with UltraEdit Converter. (c) Vitalik';
          Result := True;
          Exit;
        end;
        Nc := 0; bn1 := -1; bn2 := -1; qn1 := -1; qn2 := -1; qc1 := #0; qc2 := #0;
        for j := 1 to 8 do begin Cnames[j] := ''; Created[j] := -1; end;
        if (buf[4] = '"') or (buf[5] = '"') then begin
          cur := pos('"', copy(buf, pos('"',buf)+1, length(buf)-pos('"',buf))) + pos('"', buf);
          Info.General.Name := copy(buf, pos('"',buf)+1, cur-pos('"',buf)-1);
        end;
        if Info.General.Name = '' then
          Info.General.Name := ExtractFileName(FileName);
        if GetAttribute('File Extensions = ', WHOLE_STRING) then begin
          Info.General.Extensions := word;
        end;
        MainRules.AddSet('Numbers', ['0','1','2','3','4','5','6','7','8','9'], clRed);
        if GetAttribute('Nocase', SINGLE_WORD) then
          MainRules.CaseSensitive := False
        else
          MainRules.CaseSensitive := True;
        if not GetAttribute('Noquote', SINGLE_WORD) then begin
          if not GetAttribute('String Chars = ', STRING_CHARS) then
            word := '"''';
          qn1 := MainRules.RangeCount;
          qc1 := word[1];
          with MainRules.AddRange(qc1, qc1, 'String', clGray) do
            CloseOnEol := True;
          if length(word) > 1 then begin
            qn2 := MainRules.RangeCount;
            qc2 := word[2];
            with MainRules.AddRange(qc2, qc2, 'String', clGray) do
              CloseOnEol := True;
          end;
          if GetAttribute('Escape Char = ', ESCAPE_CHAR) then begin
            with MainRules.Ranges[qn1].AddKeyList('Escape', clGray) do
              KeyList.Text := word + word + #13#10 + word + qc1;
            if qn2 > -1 then
              with MainRules.Ranges[qn2].AddKeyList('Escape', clGray) do
                KeyList.Text := word + word + #13#10 + word + qc2;
          end;
        end;
        if GetAttribute('Line Comment = ', LINE_COMMENT) then begin
          with MainRules.AddRange(word, '', 'Line Comment', clTeal) do
            CloseOnEol := True;
        end;
        if GetAttribute('Line Comment Alt = ', LINE_COMMENT) then begin
          with MainRules.AddRange(word, '', 'Line Comment Alt', clTeal) do
            CloseOnEol := True;
        end;
        if GetAttribute('Line Comment Num = ', LINE_COMM_NUM) then begin
          with MainRules.AddRange(word, '', 'Line Comment Num', clTeal) do
            CloseOnEol := True;
        end;
        if GetAttribute('Block Comment On = ', BLOCK_COMMENT) then begin
          bn1 := MainRules.RangeCount;
          with MainRules.AddRange(word, '', 'Block Comment', clTeal) do
            CloseOnEol := True;
        end;
        if GetAttribute('Block Comment Off = ', BLOCK_COMMENT) then begin
          if bn1 = -1 then
            MainRules.AddRange('', word, 'Block Comment', clTeal)
          else begin
            MainRules.Ranges[bn1].CloseToken.Symbols[0] := word;
            MainRules.Ranges[bn1].CloseOnEol := False;
          end;
        end;
        if GetAttribute('Block Comment On Alt = ', BLOCK_COMMENT) then begin
          bn2 := MainRules.RangeCount;
          with MainRules.AddRange(word, '', 'Block Comment Alt', clTeal) do
            CloseOnEol := True;
        end;
        if GetAttribute('Block Comment Off Alt = ', BLOCK_COMMENT) then begin
          if bn2 = -1 then
            MainRules.AddRange('', word, 'Block Comment Alt', clTeal)
          else begin
            MainRules.Ranges[bn2].CloseToken.Symbols[0] := word;
            MainRules.Ranges[bn2].CloseOnEol := False;
          end;
        end;
      end else begin
        if not isLoading then isLoading := True;
        if copy(buf, 1, 13) = '/Delimiters =' then
          MainRules.SetDelimiters(StrToSet(copy(buf, pos('=',buf)+1, length(buf)-pos('=',buf)+1)))
        else
        if copy(buf, 1, 2) = '/C' then begin
          Nc := StrToInt(buf[3]);
          if buf[4] = '"' then begin
            cur := pos('"', copy(buf, 5, length(buf)-4)) + 4;
            Cnames[Nc] := copy(buf, 5, cur-5);
            if Created[Nc] > -1 then // already created
              MainRules.KeyLists[Created[Nc]].Name := Cnames[Nc];
          end
          else
            if Created[Nc] = -1 then // haven't created
              Cnames[Nc] := 'Word list ' + IntToStr(Nc);
        end else
        if (buf[1] = '/') and (buf[2] <> '/') then // "/XXXXXXX = ...."
        else begin
          if (buf[1] = qc1) and (qn1 <> -1) then begin
            MainRules.Ranges[qn1].Attributes.Foreground := colors[Nc];
            MainRules.Ranges[qn1].Attributes.ParentForeground := False;
          end;
          if (buf[1] = qc2) and (qn2 <> -1) then begin
            MainRules.Ranges[qn2].Attributes.Foreground := colors[Nc];
            MainRules.Ranges[qn2].Attributes.ParentForeground := False;
          end;
          word := GetToken2;
          if word = '**' then begin
            repeat
              word := GetToken2;
              with MainRules.AddRange(word, '', Cnames[Nc], colors[Nc]) do begin
                Delimiters := MainRules.Delimiters;
                CloseOnTerm := True;
              end;
            until buf = '';
          end else begin
            if Created[Nc] = -1 then begin
              Created[Nc] := MainRules.KeyListCount;
              keyword := MainRules.AddKeyList(Cnames[Nc], colors[Nc]);
            end else
              keyword := MainRules.KeyLists[Created[Nc]];
            if word = '//' then
              word := GetToken2;
            keyword.KeyList.Add(word);
            while buf <> '' do begin
              word := GetToken2;
              keyword.KeyList.Add(word);
            end;
          end;
        end;
      end;
    end;
    Info.Author.Copyright := 'Created with UltraEdit Converter. (c) Vitalik';
    { Fill schemes }
    SynUniSyn.ActiveScheme := SynUniSyn.Schemes.AddScheme('Default');
    RefreshScheme(MainRules);
    //Result := True;
  (*  if n = 1 then begin // The One
      Name := ChangeFileExt(FileName, '.hgl');
  {    TrySaveFile();}
    end else begin // The Last
      Name := ChangeFileExt(Info.General.Name, '.hgl');
      for j := 0 to 8 do
        while Pos(badsymb[j], Name) > 0 do
          Name[Pos(badsymb[j], Name)] := ' ';
  {    TrySaveFile();}
    end;*)
  end;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatUltraEdit.ImportFromStream(AObject: TObject; Stream: TStream): boolean;
var
  FileList: TStringList;
begin
  FileList := TStringList.Create;
  FileList.LoadFromStream(Stream);
  Result := Import(TSynUniSyn(AObject), FileList);
  FreeAndNil(FileList);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatUltraEdit.ImportFromFile(AObject: TObject; FileName: string): boolean;
var
  FileList: TStringList;
begin
  FileList := TStringList.Create;
  FileList.LoadFromFile(FileName);
  Result := Import(TSynUniSyn(AObject), FileList);
  FreeAndNil(FileList);
end;

end.
