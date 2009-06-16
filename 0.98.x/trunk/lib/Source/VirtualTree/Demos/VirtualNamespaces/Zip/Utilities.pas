unit Utilities;

interface

uses
  Windows;

function GetLargeFileIcon(const fname: String): hIcon;
function GetFileType(const fName: String): String;
function GetSystemTemp: string;
function MakeAttributeString(attr: Word): String;
function MakeSizeString(size: Integer): String;

function MoveDirectory(const source, destination: String): Boolean;
// deletes total tree inclusive files and subfolders !!
function DeleteDirectory(FolderName: String): Boolean;

implementation

uses
  SysUtils, ShellAPI, Graphics;

function GetLargeFileIcon(const fname: String): hIcon;
var
  info: SHFILEINFO; Flags: Cardinal;
begin
  Flags := (SHGFI_ICON or SHGFI_LARGEICON or SHGFI_USEFILEATTRIBUTES);
  SHGetFileInfo(PChar(fName), FILE_ATTRIBUTE_NORMAL, info, 0, Flags);
  Result := info.hIcon;
end;

function GetFileType(const fName: String): String;
var
   sfi: TSHFileInfo;
begin
  SHGetFileInfo(PChar(fName), FILE_ATTRIBUTE_NORMAL, sfi,
    SizeOf(TSHFileInfo), SHGFI_TYPENAME or SHGFI_USEFILEATTRIBUTES);
  Result := sfi.szTypeName;
  if Result = '' then
    Result := AnsiUpperCase(fName) + ' File';
end;

function GetSystemTemp: string;
var
  buf: array[0..255] of Char;
  len: Integer;
begin
  len := Windows.GetTempPath(255, buf);
  if buf[len-1] <> '\' then
    Result := Result + '\'
  else
    Result := buf;
end;

function MakeAttributeString(attr: Word): String;
begin
  Result := '';
  if faArchive and attr <> 0 then Result := Result + 'A';
  if faHidden and attr <> 0 then Result := Result + 'H';
  if faReadOnly and attr <> 0 then Result := Result + 'R';
  if faSysFile and attr <> 0 then Result := Result + 'S';
end;

function MakeSizeString(size: Integer): String;
begin
  if size < 1000 then
    Result := IntToStr(size) + ' bytes'
  else if size < 1000000 then
    Result := IntToStr(size DIV 1024) + ' KB'
  else
     Result := IntToStr(size DIV 1024 DIV 1024) + ' ' +
               IntToStr(size DIV 1024) + ' KB'
end;


// directory functions from CodeBank by Mertkan Yildirimli - www.mertkan.com

function DirOperations(
  Action            : String;  {COPY, DELETE, MOVE, RENAME}
  RenameOnCollision : Boolean; {Renames if directory exists}
  NoConfirmation    : Boolean; {Responds "Yes to All" to any dialogs}
  Silent            : Boolean; {No progress dialog is shown}
  ShowProgress      : Boolean; {displays progress dialog but no file names}
  FromDir           : String;  {From directory}
  ToDir             : String   {To directory}
  ): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  FromBuf, ToBuf: Array [0..255] of Char;
begin
  try
    if not DirectoryExists(FromDir) then
    begin
      Result := False;
      Exit;
    end;
    Fillchar(SHFileOpStruct, Sizeof(SHFileOpStruct), 0 );
    FillChar(FromBuf,        Sizeof(FromBuf),        0 );
    FillChar(ToBuf,          Sizeof(ToBuf),          0 );
    StrPCopy(FromBuf,        FromDir);
    StrPCopy(ToBuf,          ToDir);
    with SHFileOpStruct do
    begin
      Wnd    := 0;
      if UpperCase(Action) = 'COPY'   then wFunc := FO_COPY;
      if UpperCase(Action) = 'DELETE' then wFunc := FO_DELETE;
      if UpperCase(Action) = 'MOVE'   then wFunc := FO_MOVE;
      if UpperCase(Action) = 'RENAME' then wFunc := FO_RENAME;
      pFrom  := @FromBuf;
      pTo    := @ToBuf;
      fFlags := FOF_ALLOWUNDO;
      if RenameOnCollision then fFlags := fFlags or FOF_RENAMEONCOLLISION;
      if NoConfirmation    then fFlags := fFlags or FOF_NOCONFIRMATION;
      if Silent            then fFlags := fFlags or FOF_SILENT;
      if ShowProgress      then fFlags := fFlags or FOF_SIMPLEPROGRESS;
    end;
    Result := (SHFileOperation(SHFileOpStruct) = 0);
  except
    Result := False;
  end;
end;

function DeleteDirectory(FolderName: String): Boolean;
begin
  FolderName := ExcludeTrailingPathDelimiter(FolderName);
  Result :=
     DirOperations(
      'DELETE', //Action            : String;  //COPY, DELETE, MOVE, RENAME
      False,    //RenameOnCollision : Boolean; //Renames if directory exists
      True,     //NoConfirmation    : Boolean; //Responds "Yes to All" to any dialogs
      True,     //Silent            : Boolean; //No progress dialog is shown
      False,    //ShowProgress      : Boolean; //displays progress dialog but no file names
      FolderName,  //FromDir : String;  //From directory
      ''           //ToDir   : String   //To directory
      );
end;

function MoveDirectory(const source, destination: String): Boolean;
begin
  Result :=
    DirOperations(
      'MOVE',   {Action            : String;}  {COPY, DELETE, MOVE, RENAME}
      False,    {RenameOnCollision : Boolean;} {Renames if directory exists}
      True,     {NoConfirmation    : Boolean;} {Responds "Yes to All" to any dialogs}
      True,     {Silent            : Boolean;} {No progress dialog is shown}
      False,    {ShowProgress      : Boolean;} {displays progress dialog but no file names}
      source,     {FromDir : String;}  {From directory}
      destination {ToDir   : String}   {To directory}
      );
end;


end.

