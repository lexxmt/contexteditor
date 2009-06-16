unit Filters;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, VirtualShellUtilities,
  VirtualWideStrings, Forms;

const
  ProfileData = 'Profile.dat';

  STR_WARNING = WideString('Warning');
  STR_CONFIRM = WideString('Confirmation');
  STR_BLANKPROFILENAME = WideString('A blank name for a Profile is not allowed');
  STR_PROFILENAME1 = WideString('The Profile "');
  STR_PROFILENAME2 = WideString('" is already used.  Overwrite the current Profile?');
  STR_PROFILENOTFOUND = WideString('" can not be found');
  STR_PROFILESAVESUCCESS = WideString('The Profile was successfully saved');
  STR_PROFILEDELETEQUERY1 = WideString('Are you sure you want to delete the Profile: ');
  STR_PROFILEDELETEQUERY2 = WideString('?');

type
  TFilter = class(TPersistent)
  private
    FEnabled: Boolean;
  public
    function Allowed(NS: TNamespace): Boolean;
    function ApplyFilter(NS: TNamespace): Boolean; virtual; abstract;
    procedure SaveToStream(S: TStream); virtual;
    procedure LoadFromStream(S: TStream); virtual;

    property Enabled: Boolean read FEnabled write FEnabled;
  end;

  TFilterArray = array of TFilter;

  TNameFilter = class(TFilter)
  private
    FExtEnabled: Boolean;
    FMatchEnabled: Boolean;
    FMatch: WideString;
    FExtension: WideString;
    FExtList: TWideStringList;
    procedure SetExtension(const Value: WideString);
  protected
    property ExtList: TWideStringList read FExtList write FExtList;
  public
    constructor Create;
    destructor Destroy; override;
    function ApplyFilter(NS: TNamespace): Boolean; override;
    procedure SaveToStream(S: TStream); override;
    procedure LoadFromStream(S: TStream); override;

    property ExtEnabled: Boolean read FExtEnabled write FExtEnabled;
    property MatchEnabled: Boolean read FMatchEnabled write FMatchEnabled;
    property Extension: WideString read FExtension write SetExtension;
    property Match: WideString read FMatch write FMatch;
  end;

  TTimeFilter = class(TFilter)
  private
    FBeforeTime: TFileTime;
    FAfterTime: TFileTime;
    FBeforeTimeEnabled: Boolean;
    FAfterTimeEnabled: Boolean;
  public
     constructor Create;
     procedure SaveToStream(S: TStream); override;
     procedure LoadFromStream(S: TStream); override;

    procedure Assign(Source: TPersistent); override;
    property AfterTime: TFileTime read FAfterTime write FAfterTime;
    property AfterTimeEnabled: Boolean read FAfterTimeEnabled write FAfterTimeEnabled;
    property BeforeTime: TFileTime read FBeforeTime write FBeforeTime;
    property BeforeTimeEnabled: Boolean read FBeforeTimeEnabled write FBeforeTimeEnabled;
  end;

  TCreationTimeFilter = class(TTimeFilter)
  public
    function ApplyFilter(NS: TNamespace): Boolean; override;
  end;

  TAccessTimeFilter = class(TTimeFilter)
  public
    function ApplyFilter(NS: TNamespace): Boolean; override;
  end;

  TModifyTimeFilter = class(TTimeFilter)
  public
    function ApplyFilter(NS: TNamespace): Boolean; override;
  end;

  TTimeFilters = class(TFilter)
  private
    FCreateFilter: TCreationTimeFilter;
    FAccessFilter: TAccessTimeFilter;
    FModifyFilter: TModifyTimeFilter;
    FLockEnabled: Boolean;
    procedure SetLockEnabled(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    function ApplyFilter(NS: TNamespace): Boolean; override;
    procedure SaveToStream(S: TStream); override;
    procedure LoadFromStream(S: TStream); override;

    property AccessFilter: TAccessTimeFilter read FAccessFilter write FAccessFilter;
    property CreateFilter: TCreationTimeFilter read FCreateFilter write FCreateFilter;
    property LockEnabled: Boolean read FLockEnabled write SetLockEnabled;
    property ModifyFilter: TModifyTimeFilter read FModifyFilter write FModifyFilter;
  end;

  TAttribFilter = class(TFilter)
  private
    FArchiveEnabled: Boolean;
    FReadOnlyEnabled: Boolean;
    FHiddenEnabled: Boolean;
    FSystemEnabled: Boolean;
  public
    function ApplyFilter(NS: TNamespace): Boolean; override;
    procedure SaveToStream(S: TStream); override;
    procedure LoadFromStream(S: TStream); override;

    property ArchiveEnabled: Boolean read FArchiveEnabled write FArchiveEnabled;
    property ReadOnlyEnabled: Boolean read FReadOnlyEnabled write FReadOnlyEnabled;
    property SystemEnabled: Boolean read FSystemEnabled write FSystemEnabled;
    property HiddenEnabled: Boolean read FHiddenEnabled write FHiddenEnabled;
  end;

  TTypeFilter = class(TFilter)
  private
    FMatchEnabled: Boolean;
    FFolderEnabled: Boolean;
    FFileEnabled: Boolean;
    FMatch: WideString;
  public
    function ApplyFilter(NS: TNamespace): Boolean; override;
    procedure SaveToStream(S: TStream); override;
    procedure LoadFromStream(S: TStream); override;

    property FolderEnabled: Boolean read FFolderEnabled write FFolderEnabled;
    property FileEnabled: Boolean read FFileEnabled write FFileEnabled;
    property MatchEnabled: Boolean read FMatchEnabled write FMatchEnabled;
    property Match: WideString read FMatch write FMatch;
  end;

  PProfileRec = ^TProfileRec;
  TProfileRec = packed record
    Name: WideString;
    Data: TMemoryStream;
  end;

  TAddProfileResult = (
    aprNew,
    aprOverwrite,
    aprError
  );

  TProfile = class(TPersistent)
  private
    FProfileList: TList;
    FNameList: TStringList;
    function GetNameList: TStringList;
  protected
    procedure ClearProfileList;
    function DuplicateProfile(Name: WideString; var Index: Integer): Boolean;
    property ProfileList: TList read FProfileList write FProfileList;
  public
    constructor Create;
    destructor Destroy; override;

    function AddProfile(Name: WideString; FilterList: TFilterArray): TAddProfileResult;
    procedure DeletePofile(Name: WideString);
    function FindProfile(Name: WideString): Integer;
    procedure LoadProfile(Name: WideString; FilterList: TFilterArray);
    procedure SaveToStream(S: TStream);
    procedure LoadFromStream(S: TStream);
    procedure SaveToFile(FileName: WideString);
    procedure LoadFromFile(FileName: WideString);

    property NameList: TStringList read GetNameList write FNameList;
  end;

  function DateTimeToFileTime(DateTime: TDateTime): TFileTime;
  function FileTimeToDateTime(FileTime: TFileTime): TDateTime;
  function ValidFileTime(DateTime: TFileTime): Boolean;

implementation

function DateTimeToFileTime(DateTime: TDateTime): TFileTime;
var
  SysTime: TSystemTime;
begin
  DateTimeToSystemTime(DateTime, SysTime);
  SystemTimeToFileTime(SysTime, Result);
end;

function FileTimeToDateTime(FileTime: TFileTime): TDateTime;
var
  SysTime: TSystemTime;
begin
  FileTimeToSystemTime(FileTime, SysTime);
  Result := SystemTimeToDateTime(SysTime);
end;

function ValidFileTime(DateTime: TFileTime): Boolean;
begin
  Result := (DateTime.dwLowDateTime <> 0) and (DateTime.dwHighDateTime <> 0)
end;

{ TNameFilter }

function TNameFilter.ApplyFilter(NS: TNamespace): Boolean;
var
  i: Integer;
  Allow: Boolean;
begin
  Allow := True;
  if Enabled then
  begin
    if ExtEnabled then
    begin
      i := 0;
      Allow := False;
      while not Allow and (i < ExtList.Count) do
      begin
        Allow := StrCompW(PWideChar(ExtList[i]), PWideChar(ExtractFileExtW(NS.NameForParsingInFolder))) = 0;
        Inc(i)
      end
    end;
    // Now check for the string matching, note if first compare excluded it then
    // don't waste our time.
    if MatchEnabled and Allow then
      Allow := Assigned(StrPosW(PWideChar(NS.NameForParsingInFolder), PWideChar(Match)));
  end;
  Result := Allow;
end;

constructor TNameFilter.Create;
begin
  ExtList := TWideStringList.Create;
end;

destructor TNameFilter.Destroy;
begin
  ExtList.Free;
  inherited;
end;

procedure TNameFilter.LoadFromStream(S: TStream);
begin
  inherited;
  S.Read(FExtEnabled, SizeOf(FExtEnabled));
  S.Read(FMatchEnabled, SizeOf(FMatchEnabled));
  LoadWideString(S, FExtension);
  LoadWideString(S, FMatch);
end;

procedure TNameFilter.SaveToStream(S: TStream);
begin
  inherited;
  S.Write(FExtEnabled, SizeOf(FExtEnabled));
  S.Write(FMatchEnabled, SizeOf(FMatchEnabled));
  SaveWideString(S, FExtension);
  SaveWideString(S, FMatch);
end;

procedure TNameFilter.SetExtension(const Value: WideString);
var
  Head, Tail: PWideChar;
  Temp: WideString;
begin
  if StrCompW(PWideChar(Value), PWideChar(FExtension)) <> 0 then
  begin
    ExtList.Clear;
    FExtension := Value;
    Temp := Value;
    Head := PWideChar(Temp);
    while Assigned(Head) do
    begin
      Tail := StrScanW(Head, WideChar('|'));
      if Assigned(Tail) then
        Tail^ := WideNull;
      ExtList.Add(ExtractFileExtW(Head));
      Head := Tail;
      if Assigned(Head) then
        Inc(Head);
    end
  end
end;

{ TTimeFilters }

function TTimeFilters.ApplyFilter(NS: TNamespace): Boolean;
var
  Allow: Boolean;
begin
  Allow := True;
  if Enabled then
  begin
    Allow := CreateFilter.ApplyFilter(NS);
    if Allow then
      Allow := AccessFilter.ApplyFilter(NS);
    if Allow then
      Allow := ModifyFilter.ApplyFilter(NS);
  end;
  Result := Allow
end;

constructor TTimeFilters.Create;
begin
  CreateFilter := TCreationTimeFilter.Create;
  AccessFilter := TAccessTimeFilter.Create;
  ModifyFilter := TModifyTimeFilter.Create;
end;

destructor TTimeFilters.Destroy;
begin
  CreateFilter.Free;
  AccessFilter.Free;
  ModifyFilter.Free;
  inherited;
end;

procedure TTimeFilters.LoadFromStream(S: TStream);
begin
  inherited;
  AccessFilter.LoadFromStream(S);
  CreateFilter.LoadFromStream(S);
  ModifyFilter.LoadFromStream(S);
  S.Read(FLockEnabled, SizeOf(FLockEnabled))
end;

procedure TTimeFilters.SaveToStream(S: TStream);
begin
  inherited;
  AccessFilter.SaveToStream(S);
  CreateFilter.SaveToStream(S);
  ModifyFilter.SaveToStream(S);
  S.Write(FLockEnabled, SizeOf(FLockEnabled))
end;

procedure TTimeFilters.SetLockEnabled(const Value: Boolean);
begin
  FLockEnabled := Value;
end;

{ TFilter }

function TFilter.Allowed(NS: TNamespace): Boolean;
begin
  Result := True;
end;

procedure TFilter.LoadFromStream(S: TStream);
begin
  S.Read(FEnabled, SizeOf(FEnabled))
end;

procedure TFilter.SaveToStream(S: TStream);
begin
  S.Write(FEnabled, SizeOf(FEnabled))
end;

{ TTimeFilter }

procedure TTimeFilter.Assign(Source: TPersistent);
var
  F: TTimeFilter;
begin
  if Source is TTimeFilter then
  begin
    F := TTimeFilter(Source);
    AfterTime := F.AfterTime;
    AfterTimeEnabled := F.AfterTimeEnabled;
    BeforeTime := F.BeforeTime;
    BeforeTimeEnabled := F.BeforeTimeEnabled;
    Enabled := F.Enabled
  end;
end;

constructor TTimeFilter.Create;
begin
  FBeforeTime := DateTimeToFileTime(Date);
  FAfterTime := DateTimeToFileTime(Date);
end;


procedure TTimeFilter.LoadFromStream(S: TStream);
begin
  inherited;
  S.Read(FBeforeTime, SizeOf(FBeforeTime));
  S.Read(FAfterTime, SizeOf(FAfterTime));
  S.Read(FBeforeTimeEnabled, SizeOf(FBeforeTimeEnabled));
  S.Read(FAfterTimeEnabled, SizeOf(FAfterTimeEnabled));
end;

procedure TTimeFilter.SaveToStream(S: TStream);
begin
  inherited;
  S.Write(FBeforeTime, SizeOf(FBeforeTime));
  S.Write(FAfterTime, SizeOf(FAfterTime));
  S.Write(FBeforeTimeEnabled, SizeOf(FBeforeTimeEnabled));
  S.Write(FAfterTimeEnabled, SizeOf(FAfterTimeEnabled));
end;

{ TAttribFilter }

function TAttribFilter.ApplyFilter(NS: TNamespace): Boolean;
begin
  if Enabled then
  begin
    Result := (ArchiveEnabled and NS.Archive) or
              (ReadOnlyEnabled and NS.ReadOnlyFile) or
              (HiddenEnabled and NS.Hidden) or
              (SystemEnabled and NS.SystemFile)
  end else
    Result := True
end;

procedure TAttribFilter.LoadFromStream(S: TStream);
begin
  inherited;
  S.Read(FArchiveEnabled, SizeOf(FArchiveEnabled));
  S.Read(FReadOnlyEnabled, SizeOf(FReadOnlyEnabled));
  S.Read(FHiddenEnabled, SizeOf(FHiddenEnabled));
  S.Read(FSystemEnabled, SizeOf(FSystemEnabled));
end;

procedure TAttribFilter.SaveToStream(S: TStream);
begin
  inherited;
  S.Write(FArchiveEnabled, SizeOf(FArchiveEnabled));
  S.Write(FReadOnlyEnabled, SizeOf(FReadOnlyEnabled));
  S.Write(FHiddenEnabled, SizeOf(FHiddenEnabled));
  S.Write(FSystemEnabled, SizeOf(FSystemEnabled));
end;

{ TTypeFilter }

function TTypeFilter.ApplyFilter(NS: TNamespace): Boolean;
var
  Allow: Boolean;
begin
  Allow := True;
  if Enabled then
  begin
    Allow := (FolderEnabled and NS.Folder) or
             (FileEnabled and not NS.Folder);
    if Allow and MatchEnabled then
      Allow := Assigned(StrPosW(PWideChar(NS.FileType), PWideChar(Match)))
  end;
  Result := Allow
end;

procedure TTypeFilter.LoadFromStream(S: TStream);
begin
  inherited;
  S.Read(FMatchEnabled, SizeOf(FMatchEnabled));
  S.Read(FFolderEnabled, SizeOf(FFolderEnabled));
  S.Read(FFileEnabled, SizeOf(FFileEnabled));
  LoadWideString(S, FMatch);
end;

procedure TTypeFilter.SaveToStream(S: TStream);
begin
  inherited;
  S.Write(FMatchEnabled, SizeOf(FMatchEnabled));
  S.Write(FFolderEnabled, SizeOf(FFolderEnabled));
  S.Write(FFileEnabled, SizeOf(FFileEnabled));
  SaveWideString(S, FMatch);
end;

{ TProfile }

function TProfile.AddProfile(Name: WideString; FilterList: TFilterArray): TAddProfileResult;
var
  Profile: PProfileRec;
  i, DupIndex: Integer;
begin
  Result := aprError;
  if Name <> '' then
  begin
    if not DuplicateProfile(Name, DupIndex) then
    begin
      New(Profile);
      Profile.Name := Name;
      Profile.Data := TMemoryStream.Create;
      for i := 0 to Length(FilterList) - 1 do
        FilterList[i].SaveToStream(Profile.Data);
      ProfileList.Add(Profile);
      Result := aprNew
    end else
    begin
      // This is suppose to be available in Win9x too
      if MessageBoxW(Application.Handle, PWideChar(STR_PROFILENAME1 + Name + STR_PROFILENAME2),
        STR_WARNING, MB_YESNO or MB_ICONHAND) = IDYES	then
      begin
        Profile := ProfileList[DupIndex];
        Profile.Data.Seek(0, soFromBeginning);
        for i := 0 to Length(FilterList) - 1 do
          FilterList[i].SaveToStream(Profile.Data);
        Result := aprOverwrite
      end;
    end;
  end else
    // This is suppose to be available in Win9x too
    if MessageBoxW(Application.Handle, PWideChar(STR_BLANKPROFILENAME),
      STR_WARNING, MB_OK or MB_ICONWARNING) = IDYES	then
end;

procedure TProfile.ClearProfileList;
var
  i: Integer;
begin
  for i := 0 to ProfileList.Count - 1 do
  begin
    PProfileRec(ProfileList[i]).Data.Free;
    Dispose(PProfileRec(ProfileList[i]))
  end;
end;

constructor TProfile.Create;
begin
  ProfileList := TList.Create;
  NameList := TStringList.Create
end;

procedure TProfile.DeletePofile(Name: WideString);
var
  i: Integer;
  Profile: PProfileRec;
begin
  i := FindProfile(Name);
  if i > -1 then
  begin
    Profile := PProfileRec(ProfileList[i]);
    ProfileList.Delete(i);
    Profile.Data.Free;
    Dispose(Profile)
  end;
end;

destructor TProfile.Destroy;
begin
  ClearProfileList;
  ProfileList.Free;
  NameList.Free;
  inherited;
end;

function TProfile.DuplicateProfile(Name: WideString; var Index: Integer): Boolean;
begin
  Index := FindProfile(Name);
  Result := Index > -1
end;

function TProfile.FindProfile(Name: WideString): Integer;
var
  i: Integer;
begin
  Result := -1;
  i := 0;
  while (Result = -1) and (i < ProfileList.Count) do
  begin
    if StrICompW(PWideChar(PProfileRec(ProfileList[i]).Name), PWideChar(Name)) = 0 then
      Result := i;
    Inc(i)
  end
end;

function TProfile.GetNameList: TStringList;
var
  i: Integer;
begin
  FNameList.Clear;
  for i := 0 to ProfileList.Count - 1 do
    FNameList.Add( PProfileRec(ProfileList[i]).Name);
  Result := FNameList;
end;

procedure TProfile.LoadFromFile(FileName: WideString);
var
  S: TWideFileStream;
begin
  S := TWideFileStream.Create(FileName, fmOpenRead or fmShareExclusive);
  try
    LoadFromStream(S)
  finally
    S.Free
  end
end;

procedure TProfile.LoadFromStream(S: TStream);
var
  i: Integer;
  Profile: PProfileRec;
  Count: Integer;
begin
  ClearProfileList;
  S.Read(Count, SizeOf(Count));
  for i := 0 to Count - 1 do
  begin
    New(Profile);
    LoadWideString(S, Profile.Name);
    Profile.Data := TMemoryStream.Create;
    // Memory Stream thinks the whole stream is his!!!! Do it by hand
    S.Read(Count, SizeOf(Count));
    Profile.Data.Size := Count;
    S.Read(Profile.Data.Memory^, Count);
    ProfileList.Add(Profile)
  end
end;

procedure TProfile.LoadProfile(Name: WideString; FilterList: TFilterArray);
var
  i: Integer;
  Profile: PProfileRec;
begin
  i := FindProfile(Name);
  if i > -1 then
  begin
    Profile := ProfileList[i];
    Profile.Data.Position := 0;
    for i := 0 to Length(FilterList) - 1 do
      FilterList[i].LoadFromStream(Profile.Data);
  end else
    MessageBoxW(Application.Handle, PWideChar(STR_PROFILENAME1 + Name + STR_PROFILENOTFOUND),
      STR_WARNING, MB_YESNOCANCEL or MB_ICONWARNING)
end;

procedure TProfile.SaveToFile(FileName: WideString);
var
  S: TWideFileStream;
begin
  S := TWideFileStream.Create(FileName, fmCreate or fmShareExclusive);
  try
    SaveToStream(S)
  finally
    S.Free
  end
end;

procedure TProfile.SaveToStream(S: TStream);
var
  i: Integer;
  Profile: PProfileRec;
  Count: Integer;
begin
  Count := ProfileList.Count;
  S.Write(Count, SizeOf(Count));
  for i := 0 to Count - 1 do
  begin
    Profile := PProfileRec(ProfileList[i]);
    SaveWideString(S, Profile.Name);
    // Memory Stream thinks the whole stream is his!!!! Do it by hand
    Count := Profile.Data.Size;
    S.Write(Count, SizeOf(Count));
    S.Write(Profile.Data.Memory^, Count);
  end
end;

{ TCreationTimeFilter }

function TCreationTimeFilter.ApplyFilter(NS: TNamespace): Boolean;
var
  Allow: Boolean;
begin
  Allow := True;
  if AfterTimeEnabled then
  begin
    if ValidFileTime(NS.CreationTimeRaw) and ValidFileTime(AfterTime) then
      Allow := CompareFileTime(NS.CreationTimeRaw, AfterTime) >= 0 ;
  end;
  // Don't waste time if the previous and disallowed the item
  if BeforeTimeEnabled and Allow then
    if ValidFileTime(NS.CreationTimeRaw) and ValidFileTime(BeforeTime) then
      Allow := CompareFileTime(NS.CreationTimeRaw, BeforeTime) <= 0;
  Result := Allow;
end;

{ TAccessTimeFilter }

function TAccessTimeFilter.ApplyFilter(NS: TNamespace): Boolean;
var
  Allow: Boolean;
begin
  Allow := True;
  if AfterTimeEnabled then
  begin
    if ValidFileTime(NS.LastAccessTimeRaw) and ValidFileTime(AfterTime) then
      Allow := CompareFileTime(NS.LastAccessTimeRaw, AfterTime) >= 0 ;
  end;
  // Don't waste time if the previous and disallowed the item
  if BeforeTimeEnabled and Allow then
    if ValidFileTime(NS.LastAccessTimeRaw) and ValidFileTime(BeforeTime) then
      Allow := CompareFileTime(NS.LastAccessTimeRaw, BeforeTime) <= 0;
  Result := Allow;
end;

{ TModifyTimeFilter }

function TModifyTimeFilter.ApplyFilter(NS: TNamespace): Boolean;
var
  Allow: Boolean;
begin
  Allow := True;
  if AfterTimeEnabled then
  begin
    if ValidFileTime(NS.LastWriteTimeRaw) and ValidFileTime(AfterTime) then
      Allow := CompareFileTime(NS.LastWriteTimeRaw, AfterTime) >= 0 ;
  end;
  // Don't waste time if the previous and disallowed the item
  if BeforeTimeEnabled and Allow then
    if ValidFileTime(NS.LastWriteTimeRaw) and ValidFileTime(BeforeTime) then
      Allow := CompareFileTime(NS.LastWriteTimeRaw, BeforeTime) <= 0;
  Result := Allow;
end;

end.
