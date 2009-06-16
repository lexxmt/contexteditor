unit Unit1;

interface

{$include ..\..\Include\Compilers.Inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, StdCtrls, VirtualExplorerTree,
  VirtualShellToolBar, VirtualTrees, VirtualShellUtilities, ActiveX,
  VirtualWideStrings, ShlObj, VirtualShellNewMenu, ToolWin,
  VirtualShellHistory, VirtualShellNotifier, VirtualShellTypes, ImgList,
  VirtualSystemImageLists, VirtualUnicodeControls,
  Buttons, Filters, XPMan;


const
  STR_FILEEXTENSIONLIST = 'Extension Filters.txt';
  STR_PROFILEDATA = 'Profile.dat';
  STR_FILTERSENABLED = 'Filters Enabled';
  STR_FILTERSDISENABLED = 'Filters Disabled';

  
type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    VirtualExplorerComboBox1: TVirtualExplorerCombobox;
    Panel3: TPanel;
    VirtualShellNewMenu1: TVirtualShellNewMenu;
    VirtualDriveToolbar1: TVirtualDriveToolbar;
    VirtualSpecialFolderToolbar1: TVirtualSpecialFolderToolbar;
    VirtualShellToolbar1: TVirtualShellToolbar;
    VirtualShellMRU1: TVirtualShellMRU;
    PopupMenuMRU: TPopupMenu;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Close1: TMenuItem;
    Tools1: TMenuItem;
    MapToDrive1: TMenuItem;
    UnMapDrive1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    VirtualShellHistory: TVirtualShellHistory;
    PageControl1: TPageControl;
    Folders: TTabSheet;
    History: TTabSheet;
    VirtualExplorerTreeview1: TVirtualExplorerTreeview;
    VirtualHistoryTree: TVirtualStringTree;
    ImageList1: TImageList;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    VirtualExplorerListview1: TVirtualExplorerListview;
    TabSheet2: TTabSheet;
    GroupBoxName: TGroupBox;
    GroupBoxType: TGroupBox;
    GroupBoxAttrib: TGroupBox;
    CheckBoxFilterFileName: TCheckBox;
    CheckBoxFilterType: TCheckBox;
    CheckBoxFileTime: TCheckBox;
    CheckBoxFilterFileAttrib: TCheckBox;
    CheckBoxTypeFolder: TCheckBox;
    CheckBoxTypeFile: TCheckBox;
    CheckBoxTypeMatch: TCheckBox;
    WideEditTypeMatch: TWideEdit;
    WideEditNameMatch: TWideEdit;
    CheckBoxNameStringMatch: TCheckBox;
    CheckBoxNameExtension: TCheckBox;
    ComboBoxNameExt: TComboBox;
    CheckBoxAttribArchive: TCheckBox;
    CheckBoxAttribSys: TCheckBox;
    CheckBoxAttribReadOnly: TCheckBox;
    CheckBoxAttribHidden: TCheckBox;
    GroupBoxTime: TGroupBox;
    DateTimePickerTimeBefore: TDateTimePicker;
    DateTimePickerTimeAfter: TDateTimePicker;
    RadioButtonTimeCreate: TRadioButton;
    RadioButtonTimeAccess: TRadioButton;
    RadioButtonTimeModify: TRadioButton;
    CheckBoxTimeEnabled: TCheckBox;
    CheckBoxTimeLock: TCheckBox;
    GroupBoxProfile: TGroupBox;
    ComboBoxProfileLoad: TComboBox;
    CheckBoxTimeAfter: TCheckBox;
    CheckBoxTimeBefore: TCheckBox;
    SpeedButtonProfileSave: TSpeedButton;
    SpeedButtonProfileDelete: TSpeedButton;
    CheckBoxGlobalEnableFilters: TCheckBox;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    XPManifest1: TXPManifest;
    procedure VirtualExplorerListview1Change(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure VirtualExplorerListview1Updating(Sender: TBaseVirtualTree;
      State: TVTUpdateState);
    procedure FormShow(Sender: TObject);
    procedure VirtualExplorerListview1GetPopupMenu(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; const P: TPoint;
      var AskParent: Boolean; var PopupMenu: TPopupMenu);
    procedure ShellNewPopupMenu1CreateNewFile(Sender: TMenu;
      const NewMenuItem: TVirtualShellNewItem; var Path, FileName: String;
      var Allow: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VirtualShellNewMenu1AfterFileCreate(Sender: TMenu;
      const NewMenuItem: TVirtualShellNewItem; const FileName: WideString);
    procedure PopupMenuMRUPopup(Sender: TObject);
    procedure VirtualExplorerListview1RootChanging(
      Sender: TCustomVirtualExplorerTree; const NewValue: TRootFolder;
      const CurrentNamespace, Namespace: TNamespace; var Allow: Boolean);
    procedure Close1Click(Sender: TObject);
    procedure MapToDrive1Click(Sender: TObject);
    procedure UnMapDrive1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VirtualExplorerListview1RootChange(
      Sender: TCustomVirtualExplorerTree);
    procedure VirtualHistoryTreeGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VirtualHistoryTreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualHistoryTreeFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure VirtualShellHistoryChange(
      Sender: TBaseVirtualShellPersistent; ItemIndex: Integer;
      ChangeType: TVSHChangeType);
    procedure VirtualExplorerListview1EnumFolder(
      Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
      var AllowAsChild: Boolean);
    procedure CheckBoxFilterFileNameClick(Sender: TObject);
    procedure CheckBoxFileTimeClick(Sender: TObject);
    procedure CheckBoxFilterFileAttribClick(Sender: TObject);
    procedure CheckBoxFilterTypeClick(Sender: TObject);
    procedure CheckBoxTimeEnabledClick(Sender: TObject);
    procedure RadioButtonTimeCreateClick(Sender: TObject);
    procedure RadioButtonTimeAccessClick(Sender: TObject);
    procedure RadioButtonTimeModifyClick(Sender: TObject);
    procedure CheckBoxTimeAfterClick(Sender: TObject);
    procedure CheckBoxTimeBeforeClick(Sender: TObject);
    procedure DateTimePickerTimeAfterChange(Sender: TObject);
    procedure DateTimePickerTimeBeforeChange(Sender: TObject);
    procedure CheckBoxTimeLockClick(Sender: TObject);
    procedure ComboBoxNameExtChange(Sender: TObject);
    procedure CheckBoxNameExtensionClick(Sender: TObject);
    procedure CheckBoxNameStringMatchClick(Sender: TObject);
    procedure WideEditNameMatchChange(Sender: TObject);
    procedure CheckBoxAttribArchiveClick(Sender: TObject);
    procedure CheckBoxAttribReadOnlyClick(Sender: TObject);
    procedure CheckBoxAttribSysClick(Sender: TObject);
    procedure CheckBoxAttribHiddenClick(Sender: TObject);
    procedure CheckBoxTypeFolderClick(Sender: TObject);
    procedure CheckBoxTypeFileClick(Sender: TObject);
    procedure CheckBoxTypeMatchClick(Sender: TObject);
    procedure WideEditTypeMatchChange(Sender: TObject);
    procedure SpeedButtonProfileSaveClick(Sender: TObject);
    procedure ComboBoxProfileLoadSelect(Sender: TObject);
    procedure ComboBoxNameExtKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxNameExtExit(Sender: TObject);
    procedure ComboBoxProfileLoadChange(Sender: TObject);
    procedure SpeedButtonProfileDeleteClick(Sender: TObject);
    procedure ComboBoxNameExtSelect(Sender: TObject);
    procedure CheckBoxGlobalEnableFiltersClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure TabSheet1Show(Sender: TObject);
    procedure StatusBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  protected
    procedure UpdateTimeFilterUI;
    procedure UpdateTypeFilterUI;
    procedure UpdateNameFilterUI;
    procedure UpdateAttribFilterUI;
    function LoadFilterArray: TFilterArray;
    procedure LoadFilters;
    procedure LoadControls;
    function FindTimeFilter: TTimeFilter;
    function Duplicate(TestStr: WideString; Strings: TStrings): Boolean;
    procedure UpdateNameExtCombo;
    procedure SelectExtension(Index: Integer);
  public
    { Public declarations }
    Sorting: TSortDirection;
    SortingColumn: Integer;
    NameFilter: TNameFilter;
    TimeFilters: TTimeFilters;
    AttribFilter: TAttribFilter;
    TypeFilter: TTypeFilter;
    Profile: TProfile;
    FiltersEnabled: Boolean;
  end;

var
  Form1: TForm1;

implementation

uses About;

{$R *.DFM}


procedure WalkPIDL(ParsedName, NormalName: TStrings; PIDL: PItemIDList);
var
  NS: TNamespace;
  i: integer;
  TempPIDL: PItemIDList;
begin
  ParsedName.Clear;
  NormalName.Clear;
  TempPIDL := PIDLMgr.CopyPIDL(PIDL);
  if PIDLMgr.IsDesktopFolder(PIDL) then
  begin
    NS := TNamespace.Create(PIDL, nil);
    NS.FreePIDLOnDestroy := False;
    ParsedName.Add(NS.NameForParsing);
    NormalName.Add(NS.NameNormal);
    NS.Free;
  end else
    for i := 0 to PIDLMgr.IDCount(TempPIDL) - 1 do
    begin
      NS := TNamespace.Create(TempPIDL, nil);
      NS.FreePIDLOnDestroy := False;
      ParsedName.Add(NS.NameForParsing);
      NormalName.Add(NS.NameNormal);
      NS.Free;
      PIDLMgr.StripLastID(TempPIDL);
    end;
  PIDLMgr.FreePIDL(TempPIDL)
end;

function TForm1.Duplicate(TestStr: WideString; Strings: TStrings): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := 0;
  while not Result and (i < Strings.Count) do
  begin
    Result := StrCompW(PWideChar(TestStr), PWideChar(WideString(Strings[i]))) = 0;
    Inc(i)
  end
end;

procedure TForm1.VirtualExplorerListview1Change(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  StatusBar1.Panels[0].Text := 'Selected Count = ' + IntToStr(VirtualExplorerListview1.SelectedCount);
end;

procedure TForm1.VirtualExplorerListview1Updating(Sender: TBaseVirtualTree; State: TVTUpdateState);
begin
  if Assigned(VirtualExplorerListview1.RootNode) then
    StatusBar1.Panels[1].Text := 'Total Objects = ' +
      IntToStr(VirtualExplorerListview1.RootNode.ChildCount);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  VirtualExplorerTreeview1.SetFocus;
  if FileExistsW('Settings.cfg') then
    VirtualShellToolbar1.LoadFromFile('Settings.cfg');
  VirtualShellMRU1.LoadFromRegistry(HKEY_CURRENT_USER, '\Software\VirtualShellTools\MRU');
  if FileExistsW(STR_PROFILEDATA) then
  begin
    Profile.LoadFromFile(STR_PROFILEDATA);
    ComboBoxProfileLoad.Items.Assign(Profile.NameList);
  end;
  if FileExistsW(STR_FILEEXTENSIONLIST) then
    ComboBoxNameExt.Items.LoadFromFile(STR_FILEEXTENSIONLIST);

  LoadControls;
  UpdateTimeFilterUI;
  UpdateNameFilterUI;
  UpdateTypeFilterUI;
  UpdateAttribFilterUI;
end;

procedure TForm1.VirtualExplorerListview1GetPopupMenu(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; const P: TPoint;
  var AskParent: Boolean; var PopupMenu: TPopupMenu);
var
  NS: TNamespace;
begin
  PopupMenu := nil;
  if (Sender as TVirtualExplorerListview).ValidateNamespace(Sender.RootNode, NS) then
    if DirExistsW(NS.NameParseAddress) or (PIDLMgr.IsDesktopFolder(NS.AbsolutePIDL)) then
      PopupMenu := VirtualShellNewMenu1;
end;

procedure TForm1.ShellNewPopupMenu1CreateNewFile(Sender: TMenu;
  const NewMenuItem: TVirtualShellNewItem; var Path, FileName: String;
  var Allow: Boolean);
var
  NS: TNamespace;
begin
  if VirtualExplorerListview1.ValidateNamespace(VirtualExplorerListview1.RootNode, NS) then
  begin
    Path := NS.NameForParsing;
    if not DirExistsW(Path) then
      Path := '';
  end
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ChangeNotifier.UnRegisterKernelChangeNotify(VirtualExplorerListview1);
  VirtualShellToolbar1.SaveToFile('Settings.cfg');
  VirtualShellMRU1.SaveToRegistry(HKEY_CURRENT_USER, '\Software\VirtualShellTools\MRU');
  Profile.SaveToFile('Profile.dat');
  ComboBoxNameExt.Items.SaveToFile(STR_FILEEXTENSIONLIST);
  NameFilter.Free;
  TimeFilters.Free;
  AttribFilter.Free;
  TypeFilter.Free;
  Profile.Free;
end;

procedure TForm1.VirtualShellNewMenu1AfterFileCreate(Sender: TMenu;
  const NewMenuItem: TVirtualShellNewItem; const FileName: WideString);
var
  Node: PVirtualNode;
  NS: TNamespace;
begin
  Assert((toEditable in VirtualExplorerListview1.TreeOptions.MiscOptions), 'You must set the toEditable option to Edit paths');

  if DirExistsW(FileName) or FileExistsW(FileName) then
  begin
    Node := VirtualExplorerListview1.FindNode(FileName);
    // Make sure we can get to the desired folder so we can select the new item
    if not Assigned(Node) then
    begin
      NS := TNamespace.Create(PathToPIDL(FileName), nil);
      Node := VirtualExplorerListview1.AddCustomNode(Node, NS, toCheckSupport in VirtualExplorerListview1.TreeOptions.MiscOptions);
    end;
    if Assigned(Node) then
    begin
      if VirtualExplorerListview1.Header.Columns.Count = 0 then
        VirtualExplorerListview1.EditNode(Node, -1)
      else
        VirtualExplorerListview1.EditNode(Node, 0)
    end
  end
end;

procedure TForm1.PopupMenuMRUPopup(Sender: TObject);
begin
  VirtualShellMRU1.FillPopupMenu(PopupMenuMRU, fpdNewestToOldest, True, 'Clear List...');
end;

procedure TForm1.VirtualExplorerListview1RootChanging(
  Sender: TCustomVirtualExplorerTree; const NewValue: TRootFolder;
  const CurrentNamespace, Namespace: TNamespace; var Allow: Boolean);
begin
  if Assigned(Namespace) then
  begin
    if DirExistsW(Namespace.NameForParsing) then
      ChangeNotifier.NotifyWatchFolder(VirtualExplorerListview1, Namespace.NameForParsing)
    else
      ChangeNotifier.NotifyWatchFolder(VirtualExplorerListview1, '')
  end;

  // Save the state of the header
  if CurrentNamespace.FileSystem then
  begin
    Sorting := VirtualExplorerListview1.Header.SortDirection;
    SortingColumn := VirtualExplorerListview1.Header.SortColumn;
  end
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.MapToDrive1Click(Sender: TObject);
begin
  WNetConnectionDialog(Handle, RESOURCETYPE_DISK)
end;

procedure TForm1.UnMapDrive1Click(Sender: TObject);
begin
  WNetDisconnectDialog(Handle, RESOURCETYPE_DISK)
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  AboutBox.ShowModal
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ChangeNotifier.RegisterKernelChangeNotify(VirtualExplorerListview1, AllKernelNotifiers);
  // Register some special Folders that the thread will be able to generate
  // notification PIDLs for Virtual Folders too.
  ChangeNotifier.RegisterKernelSpecialFolderWatch(CSIDL_DESKTOP);
  ChangeNotifier.RegisterKernelSpecialFolderWatch(CSIDL_PERSONAL);
  ChangeNotifier.RegisterKernelSpecialFolderWatch(CSIDL_COMMON_DOCUMENTS);
  VirtualHistoryTree.Images := SmallSysImages;

  NameFilter := TNameFilter.Create;
  TimeFilters := TTimeFilters.Create;
  AttribFilter := TAttribFilter.Create;
  TypeFilter := TTypeFilter.Create;
  Profile := TProfile.Create;
  StatusBar1.Panels[2].Text := STR_FILTERSDISENABLED;
end;

procedure TForm1.VirtualExplorerListview1RootChange(
  Sender: TCustomVirtualExplorerTree);
begin
  // Restore the state of the header
  if VirtualExplorerListview1.RootFolderNamespace.FileSystem then
  begin
    VirtualExplorerListview1.Header.SortDirection := Sorting;
    VirtualExplorerListview1.Header.SortColumn := SortingColumn
  end
end;

procedure TForm1.VirtualHistoryTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
begin
  if Assigned(Node) then
    CellText := VirtualShellHistory[Node.Index].NameInFolder;
end;

procedure TForm1.VirtualHistoryTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
begin
  if Assigned(Node) and (Kind in [ikSelected, ikNormal]) then
    ImageIndex := VirtualShellHistory[Node.Index].GetIconIndex(Kind = ikSelected, icLarge, true);
end;

procedure TForm1.VirtualHistoryTreeFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
  if Assigned(Node) then
    VirtualShellHistory.ItemIndex := Node.Index;
end;

procedure TForm1.VirtualShellHistoryChange(
  Sender: TBaseVirtualShellPersistent; ItemIndex: Integer;
  ChangeType: TVSHChangeType);
var
  N: PVirtualNode;
  i: Integer;
begin
  if not Assigned(VirtualHistoryTree) then exit;
  Case ChangeType of
    hctAdded:
      VirtualHistoryTree.RootNodeCount := VirtualShellHistory.Count;
    hctDeleted:
      VirtualHistoryTree.RootNodeCount := VirtualShellHistory.Count;
    hctSelected:
      begin
        i := 0;
        N := VirtualHistoryTree.RootNode.FirstChild;
        while Assigned(N) and (i < ItemIndex) do
        begin
          N := N.NextSibling;
          Inc(i)
        end;
        VirtualHistoryTree.Selected[N] := true;
        VirtualHistoryTree.FocusedNode := N;
      end;
  end;
  VirtualHistoryTree.Invalidate
end;

procedure TForm1.VirtualExplorerListview1EnumFolder(
  Sender: TCustomVirtualExplorerTree; Namespace: TNamespace;
  var AllowAsChild: Boolean);
begin
  if FiltersEnabled then
  begin
    AllowAsChild := NameFilter.ApplyFilter(Namespace);
    if AllowAsChild then
      AllowAsChild := TimeFilters.ApplyFilter(Namespace);
    if AllowAsChild then
      AllowAsChild := AttribFilter.ApplyFilter(Namespace);
    if AllowAsChild then
      AllowAsChild := TypeFilter.ApplyFilter(Namespace);
  end;
end;
procedure TForm1.UpdateNameFilterUI;
// Updates the User Interface of the FileName Filter options
var
  FilterEnabled: Boolean;
begin
  FilterEnabled := CheckBoxFilterFileName.Checked;
  CheckBoxNameExtension.Enabled := FilterEnabled;
  CheckBoxNameStringMatch.Enabled := FilterEnabled;
  ComboBoxNameExt.Enabled := CheckBoxNameExtension.Checked and FilterEnabled;
  WideEditNameMatch.Enabled := CheckBoxNameStringMatch.Checked and FilterEnabled;
end;

procedure TForm1.CheckBoxFilterFileNameClick(Sender: TObject);
// Enables/Disables the FileName Filter Options
begin
  NameFilter.Enabled := CheckBoxFilterFileName.Checked;
  UpdateNameFilterUI
end;

procedure TForm1.CheckBoxNameExtensionClick(Sender: TObject);
// Enables/Disables the Extension FileName Filter Option
begin
  NameFilter.ExtEnabled := CheckBoxNameExtension.Checked;
  UpdateNameFilterUI
end;

procedure TForm1.CheckBoxNameStringMatchClick(Sender: TObject);
// Enables/Disables the Match FileName Filter Option
begin
  NameFilter.MatchEnabled := CheckBoxNameStringMatch.Checked;
  UpdateNameFilterUI
end;

procedure TForm1.ComboBoxNameExtChange(Sender: TObject);
// Updates the Extension List for the FileName Filter when modified
begin
  NameFilter.Extension := ComboBoxNameExt.Text;
  UpdateNameFilterUI
end;

procedure TForm1.UpdateNameExtCombo;
// Checks to see if the text entered in the combo edit should be added to the dropdown
begin
  if not Duplicate(ComboBoxNameExt.Text, ComboBoxNameExt.Items) then
    ComboBoxNameExt.Items.Add(ComboBoxNameExt.Text);
  NameFilter.Extension := ComboBoxNameExt.Text;
end;

procedure TForm1.ComboBoxNameExtKeyPress(Sender: TObject; var Key: Char);
// Stores the new user defined extension list into the ComboBox
begin
  if Key = Char(VK_RETURN) then
  begin
    Key := #0;
    UpdateNameExtCombo
  end
end;

procedure TForm1.ComboBoxNameExtExit(Sender: TObject);
// Called when the focus shifts away from the Extension combo.  Need to
// see if the string in the edit should be saved in the combo
begin
  UpdateNameExtCombo
end;

procedure TForm1.SelectExtension(Index: Integer);
// Selects the desired extension and updates the Filter
begin
  if (Index > -1) and (Index < ComboBoxNameExt.Items.Count) then
    ComboBoxNameExt.ItemIndex := Index
  else
    ComboBoxNameExt.ItemIndex := -1;

  NameFilter.Extension := ComboBoxNameExt.Text;
end;

procedure TForm1.WideEditNameMatchChange(Sender: TObject);
// Updates the Match string for the FileName Filter when modified
begin
  NameFilter.Match := WideEditNameMatch.Text;
  UpdateNameFilterUI
end;

procedure TForm1.ComboBoxNameExtSelect(Sender: TObject);
// Updates the Extension edit for the FileName Filter when modified
begin
  NameFilter.Extension := ComboBoxNameExt.Text;
end;

procedure TForm1.UpdateTimeFilterUI;

  procedure HandleTimeFilter(AFilter: TTimeFilter; OverrideEnabled: Boolean);
  begin
    CheckBoxTimeEnabled.Checked := AFilter.Enabled;
    if AFilter.Enabled or OverrideEnabled then
    begin
      CheckBoxTimeAfter.Enabled := True;
      CheckBoxTimeBefore.Enabled := True;
      CheckBoxTimeAfter.Checked := AFilter.AfterTimeEnabled;
      DateTimePickerTimeAfter.Enabled := CheckBoxTimeAfter.Checked;
      DateTimePickerTimeAfter.DateTime := FileTimeToDateTime(AFilter.AfterTime);
      CheckBoxTimeBefore.Checked := AFilter.BeforeTimeEnabled;
      DateTimePickerTimeBefore.Enabled := CheckBoxTimeBefore.Checked;
      DateTimePickerTimeBefore.DateTime := FileTimeToDateTime(AFilter.BeforeTime);
      if CheckBoxTimeLock.Checked then
      begin
        TimeFilters.CreateFilter.Assign(AFilter);
        TimeFilters.AccessFilter.Assign(AFilter);
        TimeFilters.ModifyFilter.Assign(AFilter);
      end
    end else
    begin
      CheckBoxTimeAfter.Enabled := False;
      CheckBoxTimeBefore.Enabled := False;
      DateTimePickerTimeAfter.Enabled := False;
      DateTimePickerTimeBefore.Enabled := False;
    end
  end;

  procedure DisableAll;
  begin
    CheckBoxTimeAfter.Enabled := False;
    CheckBoxTimeBefore.Enabled := False;
    DateTimePickerTimeAfter.Enabled := False;
    DateTimePickerTimeBefore.Enabled := False;
  end;

begin
  RadioButtonTimeCreate.Enabled := TimeFilters.Enabled;
  RadioButtonTimeAccess.Enabled := TimeFilters.Enabled;
  RadioButtonTimeModify.Enabled := TimeFilters.Enabled;
  CheckBoxTimeLock.Enabled := TimeFilters.Enabled;
  CheckBoxTimeEnabled.Enabled := TimeFilters.Enabled;

  if TimeFilters.Enabled then
  begin
    if RadioButtonTimeCreate.Checked then
    begin
      CheckBoxTimeEnabled.Checked := TimeFilters.CreateFilter.Enabled;
      if TimeFilters.CreateFilter.Enabled then
        HandleTimeFilter(TimeFilters.CreateFilter, False)
      else
        DisableAll
    end else
    if RadioButtonTimeAccess.Checked then
    begin
      CheckBoxTimeEnabled.Checked := TimeFilters.AccessFilter.Enabled;
      if TimeFilters.AccessFilter.Enabled then
        HandleTimeFilter(TimeFilters.AccessFilter, False)
      else
        DisableAll
    end else
    if RadioButtonTimeModify.Checked then
    begin
      CheckBoxTimeEnabled.Checked := TimeFilters.ModifyFilter.Enabled;
      if TimeFilters.ModifyFilter.Enabled then
        HandleTimeFilter(TimeFilters.ModifyFilter, False)
      else
        DisableAll
    end;
  end else
    DisableAll
end;

function TForm1.FindTimeFilter: TTimeFilter;
// Looks at the Time Radio buttons and returns the Filter currently selected by
// them
begin
  Result := nil;
  if RadioButtonTimeCreate.Checked then
    Result := TimeFilters.CreateFilter
  else
  if RadioButtonTimeAccess.Checked then
    Result := TimeFilters.AccessFilter
  else
  if RadioButtonTimeModify.Checked then
    Result := TimeFilters.ModifyFilter
end;

procedure TForm1.CheckBoxFileTimeClick(Sender: TObject);
// Enables/Disables the File Time Filter Options
begin
  TimeFilters.Enabled := CheckBoxFileTime.Checked;
  UpdateTimeFilterUI
end;

procedure TForm1.RadioButtonTimeCreateClick(Sender: TObject);
// Routes the user input to the Time Create Filter
begin
  UpdateTimeFilterUI
end;

procedure TForm1.RadioButtonTimeAccessClick(Sender: TObject);
// Routes the user input to the Time Access Filter
begin
  UpdateTimeFilterUI
end;

procedure TForm1.RadioButtonTimeModifyClick(Sender: TObject);
// Routes the user input to the Time Modify Filter
begin
  UpdateTimeFilterUI
end;

procedure TForm1.CheckBoxTimeLockClick(Sender: TObject);
// Enables/Disables the locking of the user into to all Time Filters
begin
  TimeFilters.LockEnabled := CheckBoxTimeLock.Checked;
  UpdateTimeFilterUI
end;

procedure TForm1.CheckBoxTimeEnabledClick(Sender: TObject);
// Enables/Disables the Time Filter for the currently selected Time
begin
  FindTimeFilter.Enabled := CheckBoxTimeEnabled.Checked;
  UpdateTimeFilterUI
end;

procedure TForm1.CheckBoxTimeAfterClick(Sender: TObject);
// Enables/Disables the After Time Filter for the currently selected Time
begin
  FindTimeFilter.AfterTimeEnabled := CheckBoxTimeAfter.Checked;
  UpdateTimeFilterUI
end;

procedure TForm1.CheckBoxTimeBeforeClick(Sender: TObject);
// Enables/Disables the Before Time Filter for the currently selected Time
begin
  FindTimeFilter.BeforeTimeEnabled := CheckBoxTimeBefore.Checked;
  UpdateTimeFilterUI
end;

procedure TForm1.DateTimePickerTimeAfterChange(Sender: TObject);
// Updates the After Time Filter for the currently selected Time after the user
// has entered new information
begin
  FindTimeFilter.AfterTime := DateTimeToFileTime(DateTimePickerTimeAfter.DateTime);
  UpdateTimeFilterUI
end;

procedure TForm1.DateTimePickerTimeBeforeChange(Sender: TObject);
// Updates the Before Time Filter for the currently selected Time after the user
// has entered new information
begin
  FindTimeFilter.BeforeTime := DateTimeToFileTime(DateTimePickerTimeBefore.DateTime);
  UpdateTimeFilterUI
end;

procedure TForm1.UpdateAttribFilterUI;
// Updates the User Interface of the Attribute Filter options
var
  FilterEnabled: Boolean;
begin
  FilterEnabled := CheckBoxFilterFileAttrib.Checked;
  CheckBoxAttribArchive.Enabled := FilterEnabled;
  CheckBoxAttribReadOnly.Enabled := FilterEnabled;
  CheckBoxAttribSys.Enabled := FilterEnabled;
  CheckBoxAttribHidden.Enabled := FilterEnabled;
end;

procedure TForm1.CheckBoxFilterFileAttribClick(Sender: TObject);
// Enables/Disables the Attribute Filter Options
begin
  AttribFilter.Enabled := CheckBoxFilterFileAttrib.Checked;
  UpdateAttribFilterUI
end;

procedure TForm1.CheckBoxAttribArchiveClick(Sender: TObject);
// Enables/Disables the Archive Attribute Filter
begin
  AttribFilter.ArchiveEnabled := CheckBoxAttribArchive.Checked;
  UpdateAttribFilterUI
end;

procedure TForm1.CheckBoxAttribReadOnlyClick(Sender: TObject);
begin
// Enables/Disables the Archive ReadOnly Filter
  AttribFilter.ReadOnlyEnabled := CheckBoxAttribReadOnly.Checked;
  UpdateAttribFilterUI
end;

procedure TForm1.CheckBoxAttribSysClick(Sender: TObject);
// Enables/Disables the System Attribute Filter
begin
  AttribFilter.SystemEnabled := CheckBoxAttribSys.Checked;
  UpdateAttribFilterUI
end;

procedure TForm1.CheckBoxAttribHiddenClick(Sender: TObject);
// Enables/Disables the Hidden Attribute Filter
begin
  AttribFilter.HiddenEnabled := CheckBoxAttribHidden.Checked;
  UpdateAttribFilterUI
end;

procedure TForm1.UpdateTypeFilterUI;
// Updates the User Interface of the File Type Filter options
var
  FilterEnabled: Boolean;
begin
  FilterEnabled := CheckBoxFilterType.Checked;
  CheckBoxTypeFolder.Enabled := FilterEnabled;
  CheckBoxTypeFile.Enabled := FilterEnabled;
  CheckBoxTypeMatch.Enabled := FilterEnabled;
  WideEditTypeMatch.Enabled := FilterEnabled and CheckBoxTypeMatch.Checked;
end;

procedure TForm1.CheckBoxFilterTypeClick(Sender: TObject);
// Enables/Disables the File Type Filter Options
begin
  TypeFilter.Enabled := CheckBoxFilterType.Checked;
  UpdateTypeFilterUI
end;

procedure TForm1.CheckBoxTypeFolderClick(Sender: TObject);
// Enables/Disables the Folder File Type Filter
begin
  TypeFilter.FolderEnabled := CheckBoxTypeFolder.Checked;
  UpdateTypeFilterUI
end;

procedure TForm1.CheckBoxTypeFileClick(Sender: TObject);
// Enables/Disables the File File Type Filter
begin
  TypeFilter.FileEnabled := CheckBoxTypeFile.Checked;
  UpdateTypeFilterUI
end;

procedure TForm1.CheckBoxTypeMatchClick(Sender: TObject);
// Enables/Disables the Match File Type Filter
begin
  TypeFilter.MatchEnabled := CheckBoxTypeMatch.Checked;
  UpdateTypeFilterUI
end;

procedure TForm1.WideEditTypeMatchChange(Sender: TObject);
// Updates the Match string for the File Type Filter when modified
begin
  TypeFilter.Match := WideEditTypeMatch.Text;
  UpdateTypeFilterUI
end;

procedure TForm1.SpeedButtonProfileSaveClick(Sender: TObject);
// Saves a new Profile based on the current state of the Filters
var
  ProfileResult: TAddProfileResult;
begin
  ProfileResult := Profile.AddProfile(ComboBoxProfileLoad.Text, LoadFilterArray);
  if ProfileResult = aprNew then
    ComboBoxProfileLoad.Items.Add(ComboBoxProfileLoad.Text);
  if ProfileResult <> aprError then
    MessageBoxW(Application.Handle, PWideChar(STR_PROFILESAVESUCCESS), STR_CONFIRM, MB_OK or MB_ICONEXCLAMATION)
end;

procedure TForm1.SpeedButtonProfileDeleteClick(Sender: TObject);
// Deletes the selected Profile
var
  ProfileStr: WideString;
begin
  ProfileStr := ComboBoxProfileLoad.Text;
  if Profile.FindProfile(ProfileStr) > -1 then
  begin
    if MessageBoxW(Application.Handle, PWideChar(STR_PROFILEDELETEQUERY1 + ProfileStr + STR_PROFILEDELETEQUERY2),
      STR_CONFIRM, MB_YESNO or MB_ICONEXCLAMATION) = IDYES
    then begin
      // Delete the profile
      ComboBoxProfileLoad.Items.Delete(ComboBoxProfileLoad.ItemIndex);
      Profile.DeletePofile(ProfileStr);
      // Select a new Profile from the list
      if ComboBoxProfileLoad.Items.Count > 0 then
        ComboBoxProfileLoad.ItemIndex := 0
      else
        ComboBoxProfileLoad.ItemIndex := -1;
    end
  end
end;

function TForm1.LoadFilterArray: TFilterArray;
// Creates a dynamic array of the currently implemented TFilters
begin
  SetLength(Result, 4);
  Result[0] := NameFilter;
  Result[1] := TimeFilters;
  Result[2] := AttribFilter;
  Result[3] := TypeFilter;
end;

procedure TForm1.ComboBoxProfileLoadSelect(Sender: TObject);
// Selects the new Profile
begin
  // Read the Profile into the filters
  Profile.LoadProfile(ComboBoxProfileLoad.Text, LoadFilterArray);
  // Transfer the filter data into the controls
  LoadControls;
  UpdateTimeFilterUI;
  UpdateNameFilterUI;
  UpdateTypeFilterUI;
  UpdateAttribFilterUI;
  SpeedButtonProfileDelete.Enabled := Profile.FindProfile(ComboBoxProfileLoad.Text) > -1
end;

procedure TForm1.ComboBoxProfileLoadChange(Sender: TObject);
// Deletes the current Profile
begin
  SpeedButtonProfileDelete.Enabled := Profile.FindProfile(ComboBoxProfileLoad.Text) > -1
end;

procedure TForm1.CheckBoxGlobalEnableFiltersClick(Sender: TObject);
// Enables/Disables the File File Type Filter
begin
  FiltersEnabled := CheckBoxGlobalEnableFilters.Checked;
  if FiltersEnabled then
    StatusBar1.Panels[2].Text := STR_FILTERSENABLED
  else
    StatusBar1.Panels[2].Text := STR_FILTERSDISENABLED;
end;

procedure TForm1.LoadControls;
// Loads the Filter Controls with information based on the current state of the
// Filter Objects

  procedure LoadFilterControl(AFilter: TTimeFilter);
  begin
    CheckBoxTimeEnabled.Checked := AFilter.Enabled;
    CheckBoxTimeAfter.Checked := AFilter.AfterTimeEnabled;
    CheckBoxTimeBefore.Checked := AFilter.BeforeTimeEnabled;
    DateTimePickerTimeAfter.DateTime := FileTimeToDateTime(AFilter.AfterTime);
    DateTimePickerTimeBefore.DateTime := FileTimeToDateTime(AFilter.BeforeTime);
  end;

begin
  CheckBoxFilterFileName.Checked := NameFilter.Enabled;
  CheckBoxNameExtension.Checked := NameFilter.ExtEnabled;
  CheckBoxNameStringMatch.Checked := NameFilter.MatchEnabled;
  // Set the combobox extensions
  SelectExtension( ComboBoxNameExt.Items.IndexOf(NameFilter.Extension));
  WideEditNameMatch.Text := NameFilter.Match;

  CheckBoxFileTime.Checked := TimeFilters.Enabled;
  CheckBoxTimeLock.Checked := TimeFilters.LockEnabled;
  if RadioButtonTimeCreate.Checked then
    LoadFilterControl(TimeFilters.CreateFilter)
  else
  if RadioButtonTimeAccess.Checked then
    LoadFilterControl(TimeFilters.AccessFilter)
  else
  if RadioButtonTimeModify.Checked then
    LoadFilterControl(TimeFilters.ModifyFilter);

  CheckBoxFilterFileAttrib.Checked := AttribFilter.Enabled;
  CheckBoxAttribArchive.Checked := AttribFilter.ArchiveEnabled;
  CheckBoxAttribReadOnly.Checked := AttribFilter.ReadOnlyEnabled;
  CheckBoxAttribSys.Checked := AttribFilter.SystemEnabled;
  CheckBoxAttribHidden.Checked := AttribFilter.HiddenEnabled;

  CheckBoxFilterType.Checked := TypeFilter.Enabled;
  CheckBoxTypeFolder.Checked := TypeFilter.FolderEnabled;
  CheckBoxTypeFile.Checked := TypeFilter.FileEnabled;
  CheckBoxTypeMatch.Checked := TypeFilter.MatchEnabled;
  WideEditTypeMatch.Text := TypeFilter.Match
end;

procedure TForm1.LoadFilters;
// Loads the Filter controls with information based on the current state of the
// Filter objects

  procedure LoadFilterObject(AFilter: TTimeFilter);
  begin
    AFilter.Enabled := CheckBoxTimeEnabled.Checked;
    AFilter.AfterTimeEnabled := CheckBoxTimeAfter.Checked;
    AFilter.BeforeTimeEnabled := CheckBoxTimeBefore.Checked;
    AFilter.AfterTime := DateTimeToFileTime(DateTimePickerTimeAfter.DateTime);
    AFilter.BeforeTime := DateTimeToFileTime(DateTimePickerTimeBefore.DateTime);
  end;

begin
  NameFilter.Enabled := CheckBoxFilterFileName.Checked;
  NameFilter.ExtEnabled := CheckBoxNameExtension.Checked;
  NameFilter.MatchEnabled := CheckBoxNameStringMatch.Checked;
  NameFilter.Extension := ComboBoxNameExt.Text;
  NameFilter.Match := WideEditNameMatch.Text;

  TimeFilters.Enabled := CheckBoxFileTime.Enabled;
  TimeFilters.LockEnabled := CheckBoxTimeLock.Enabled;

  // If the Time Filter is locked then all filters get the same info, else only
  // load the filter that is currently checked
  if TimeFilters.LockEnabled then
  begin
    LoadFilterObject(TimeFilters.CreateFilter);
    LoadFilterObject(TimeFilters.AccessFilter);
    LoadFilterObject(TimeFilters.ModifyFilter);
  end else
  begin
    if RadioButtonTimeCreate.Checked then
      LoadFilterObject(TimeFilters.CreateFilter)
    else
    if RadioButtonTimeAccess.Checked then
      LoadFilterObject(TimeFilters.AccessFilter)
    else
    if RadioButtonTimeModify.Checked then
      LoadFilterObject(TimeFilters.ModifyFilter);
  end;

  AttribFilter.Enabled := CheckBoxFilterFileAttrib.Checked;
  AttribFilter.ArchiveEnabled := CheckBoxAttribArchive.Checked;
  AttribFilter.ReadOnlyEnabled := CheckBoxAttribReadOnly.Checked;
  AttribFilter.SystemEnabled := CheckBoxAttribSys.Checked;
  AttribFilter.HiddenEnabled := CheckBoxAttribHidden.Checked;

  TypeFilter.Enabled := CheckBoxFilterType.Checked;
  TypeFilter.FolderEnabled := CheckBoxTypeFolder.Checked;
  TypeFilter.FileEnabled := CheckBoxTypeFile.Checked;
  TypeFilter.MatchEnabled := CheckBoxTypeMatch.Checked;
  TypeFilter.Match := WideEditTypeMatch.Text
end;


procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  R: TRect;
  OldMode: Word;
begin
  R := Rect;
  Dec(R.Right, 4); // It overlaps the vertical divider somewhat
  if Panel.Index = 2 then
  begin
    if FiltersEnabled then
    begin
      DrawFrameControl(StatusBar1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONPUSH	or DFCS_PUSHED);
      InflateRect(R, -2, -2);
      StatusBar1.Canvas.Brush.Color := clRed;
      StatusBar1.Canvas.FillRect(R);
      StatusBar1.Font.Color := clWhite;
    end else
    begin
      StatusBar1.Font.Color := clBlack;
      DrawFrameControl(StatusBar1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_FLAT);
      InflateRect(R, -2, -2);
    end;
     OldMode := SetBkMode(StatusBar1.Canvas.Handle, TRANSPARENT);
    StatusBar1.Canvas.TextOut(R.Left + 4, R.Top +
      ((R.Bottom-R.Top)-StatusBar1.Canvas.TextHeight(Panel.Text)) div 2, Panel.Text);
    SetBkMode(StatusBar1.Canvas.Handle, OldMode);
  end
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin
  VirtualExplorerListview1.RefreshTree
end;

procedure TForm1.StatusBar1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Left: Integer;
begin
  Left := StatusBar1.Panels[0].Width + StatusBar1.Panels[1].Width;
  if (X > Left) and (X < Left + StatusBar1.Panels[2].Width) then
  begin
    CheckBoxGlobalEnableFilters.Checked := not CheckBoxGlobalEnableFilters.Checked;
    VirtualExplorerListview1.RefreshTree
  end
end;

end.

