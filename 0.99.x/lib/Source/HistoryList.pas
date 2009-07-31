unit HistoryList;

{
  The THistoryList and TBookmarks Components V1.00

  MOST IMPORTANT :)
  =================
  This is NOT Freeware: It's PostCardWare. When you use
  this component or think it's useful, send me a post-card
  to: Florian Bömers, Colmarer Str.11, D - 28211 Bremen, Germany
  See legal.txt for more details.

  And of course, I am very interested in any application
  that uses this component (or any other application you wrote).
  If so, mail me (not the program, just an URL or similar) !
  (mail address below)

  Installation:
  =============
  1. Copy the files HistoryList.pas and HistoryList.dcr
     to the directory where you store your components
     (or let it where it is)
  2. In Delphi, select Component|Install Component. In the
     following dialog enter the path and filename of
     HistoryList.pas and hit OK.
  3. Now the THistoryList and TBookmarks components are
     available in the component palette under "Bome".

  Description
  ===========
  THistoryList:
  Manage a list of Most Recently Used files. You select the menu
  where the list will be appended. Usually this is the File menu,
  but you can also designate a "Recent Files" menu item, as seen
  in the file menu of Delphi 3.
  The addFilename procedure adds a filename to the history list. It
  is always appended at first position.
  The Directories property lets you specify whether the stored items
  are directories rather than files.

  TBookmarks:
  Manages a bookmark menu. Choose as base menu an empty menu item.
  At run time an add item is created automatically. When the user
  selects "Add", the event OnGetBookmark is fired where you have to
  provide the bookmark and a name for the bookmark. The name
  will appear in the menu. Also a Delete item is managed which lets
  the user delete an item.
  The FileBookmarks property lets you specify that the stored items
  are files rather than directories.

  Both components:
  The OnClick event occurs when the user selected an item. The filename
  will be passed to the event handler.
  In both components you have a RegKey item. There you give an unique
  name in your project. The RegPath is composed of your company
  name and the program name, separated by a backslash. When you
  provide the registry parameters, the components initialize
  themselves at start-up. Use the saveToRegistry procedure to
  let the component store themselves to registry. They are saved in
  HKEY_CURRENT_USER\Software\<RegPath>\RegKey.

  For an example implementation see the demo directory.

  Copyright
  =========
  (c) 1997-1999 by Florian Bömers

  send any comments, proposals, enhancements etc. to:
  delphi@bome.com

  other free components on:
  http://www.bome.com
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry, Menus;

type

  TMenuNotify=procedure(Sender:TObject; Filename:String) of object;
  TOnGetBookmark=procedure(Sender:TObject; var Bookmark:String; var Name:String) of object;

  TDynamicMenuBase = class(TComponent)
  private
    FRegPath:String;
    FRegKey:String;
    FBaseMenu:TMenuItem;
    FOnClick:TMenuNotify;
    FLoadedReg:Boolean;
    FFirstMenuItemIndex:Integer;
    FSaveNames:Boolean;
    FRegFiles:String;
    FRegNames:String;
    FHelpContext:THelpContext;
    function ReadyToLoadReg:Boolean; virtual; abstract;
    function getFullRegPath:String;
    function getCount:Integer;  virtual; abstract;
    function getItem(index:Integer):TMenuItem;
    procedure SetRegPath(RegPath:String);
    procedure SetRegKey(RegKey:String);
    procedure SetBaseMenu(baseMenu:TMenuItem); virtual;
  protected
    procedure loadFromRegistry;
    procedure MenuItemClick(Sender:TObject);
    procedure SetHelpContext(hc:THelpContext);
  public
    constructor Create(AOwner:TComponent); override;
    procedure saveToRegistry;
    procedure addFilename(Filename:String); virtual; abstract;
    property Count:Integer read getCount;
    property Items[Index: Integer]:TMenuItem read getItem;
  published
    property RegPath:String read FRegPath write SetRegPath;
    property RegKey:String read FRegKey write SetRegKey;
    property BaseMenu:TMenuItem read FBaseMenu write setBaseMenu;
    property OnClick:TMenuNotify read FOnClick write FOnClick;
    property HelpContext:THelpContext read FHelpContext write setHelpContext default 0;
  end;

  THistoryList = class(TDynamicMenuBase)
  private
    FMaxItems:Integer;
    FMaxItemsSet:Boolean;
    FDirectories:Boolean;
    function getCount:Integer; override;
    procedure SetMaxItems(maxItems:Integer);
    function ReadyToLoadReg:Boolean; override;
    procedure SetBaseMenu(baseMenu:TMenuItem); override;
    procedure RebuildCaptions;
  public
    constructor Create(AOwner:TComponent); override;
    procedure addFilename(Filename:String); override;
    procedure RemoveFilename(Filename:String);
  published
    property MaxItems:Integer read FMaxItems write SetMaxItems stored true;
    property Directories:Boolean read FDirectories write FDirectories default false;
    property HelpContext;
  end;

  TBookmarks = class(TDynamicMenuBase)
  private
    FFileBookmarks:Boolean;
    FFileBookMarksSet:Boolean;
    FDeleteMenu:TMenuItem;
    FOnGetBookmark:TOnGetBookmark;
    FDelHelpContext:THelpContext;
    FAddHelpContext:THelpContext;
    function getCount:Integer; override;
    procedure SetFileBookmarks(FileBookmarks:Boolean);
    procedure SetOnGetBookmark(OnGetBookmark:TOnGetBookmark);
    function ReadyToLoadReg:Boolean; override;
    procedure SetBaseMenu(baseMenu:TMenuItem); override;
    procedure SetDelHelpContext(hc:THelpContext);
    procedure SetAddHelpContext(hc:THelpContext);
  protected
    procedure AddClick(Sender:TObject);
    procedure DelClick(Sender:TObject);
  public
    constructor Create(AOwner:TComponent); override;
    procedure addFilename(Filename:String); override;
  published
    property FileBookmarks:Boolean read FFileBookmarks write SetFileBookmarks stored true;
    property OnGetBookmark:TOnGetBookmark read FOnGetBookmark write SetOnGetBookmark;
    property HelpContext;
    property AddHelpContext:THelpContext read FAddHelpContext write SetAddHelpContext default 0;
    property DelHelpContext:THelpContext read FDelHelpContext write SetDelHelpContext default 0;
  end;

procedure Register;

implementation

const
  defaultRegPath='Company\Program Name';
  defaultHistoryRegKey='MRUList';
  defaultBookmarksRegKey='Bookmarks';
  defaultMaxItems=4;
  RegValueName='MRU';
  SNoItemsInHistory='(none)';

function DirectoryExists(const Name: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Name));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

constructor TDynamicMenuBase.Create(AOwner:TComponent);
begin
 inherited;
 FRegPath:=defaultRegPath;
 FRegKey:='';
 FBaseMenu:=nil;
 FOnClick:=nil;
 FLoadedReg:=false;
 FFirstMenuItemIndex:=-1;
 FSaveNames:=true;
 FRegFiles:='File';
 FRegNames:='Name';
 FHelpContext:=0;
end;

procedure TDynamicMenuBase.SetRegPath(RegPath:String);
begin
 FRegPath:=RegPath;
 LoadFromRegistry;
end;

procedure TDynamicMenuBase.SetRegKey(RegKey:String);
begin
 FRegKey:=RegKey;
 LoadFromRegistry;
end;

procedure TDynamicMenuBase.SetBaseMenu(baseMenu:TMenuItem);
begin
 if ((not assigned(FBaseMenu)) or (csDesigning in ComponentState))
    and assigned(baseMenu) then
 begin
  FBaseMenu:=BaseMenu;
  LoadFromRegistry;
 end;
end;

function TDynamicMenuBase.getFullRegPath:String;
begin
 result:='\Software\'+FRegPath+'\'+FRegKey;
end;

procedure TDynamicMenuBase.MenuItemClick(Sender:TObject);
begin
 if assigned(FOnClick) then
  FOnClick(Self, TMenuItem(Sender).Hint);
end;

function TDynamicMenuBase.getItem(index:Integer):TMenuItem;
begin
 if Count>0 then
  result:=BaseMenu[index+FFirstMenuItemIndex]
 else
  result:=nil;
end;

procedure TDynamicMenuBase.loadFromRegistry;
var values:TStringList;
    i:Integer;
begin
 if ReadyToLoadReg
    and assigned(BaseMenu)
    and (not (csDesigning in ComponentState))
    and (not FLoadedReg)
    and (RegPath<>'')
    and (CompareStr(defaultRegPath,RegPath)<>0) then
 with TRegistry.Create do
 try
  if OpenKey(getFullRegPath,false) then
  try
   values:=TStringList.Create;
   // read sorted
   i:=0;
   try
    try
     while ValueExists(FRegFiles+IntToStr(i)) do
     begin
      values.add(ReadString(FRegFiles+IntToStr(i)));
      inc(i);
     end;
    except
    end;
    if values.Count>0 then
     for i:=values.Count-1 downto 0 do
      addFilename(values[i]);
   finally
    values.Free;
   end;
  finally
   CloseKey;
  end;
 finally
  Free;
 end;
end;

procedure TDynamicMenuBase.saveToRegistry;
var i:Integer;
begin
 if Assigned(BaseMenu)
    and (RegPath<>'')
    and (CompareStr(defaultRegPath,RegPath)<>0)
    and (not (csDesigning in ComponentState)) then
 with TRegistry.Create do
 try
  if OpenKey(getFullRegPath,true) then
  try
   // write items
   for i:=0 to Count-1 do
   begin
    WriteString(FRegFiles+IntToStr(i),items[i].Hint);
   end;
   // delete eventually old ones
   i:=getCount;
   while DeleteValue(FRegFiles+IntToStr(i)) do
   begin
    inc(i);
   end;
  finally
   CloseKey;
  end;
 finally
  Free;
 end;
end;

procedure TDynamicMenuBase.SetHelpContext(hc:THelpContext);
var i:Integer;
begin
 FHelpContext:=hc;
 if not (csDesigning in ComponentState) then
  for i:=0 to Count-1 do
   items[i].HelpContext:=HelpContext;
end;

{ THistoryList }
constructor THistoryList.Create(AOwner:TComponent);
begin
 inherited;
 FRegKey:=defaultHistoryRegKey;
 FMaxItems:=defaultMaxItems;
 FMaxItemsSet:=false;
 FSaveNames:=true;
 //maybe we can find a default menu ?
 if (csDesigning in ComponentState) and (AOwner is TForm) and assigned(TForm(AOwner).Menu) then
 begin
  if assigned(TForm(AOwner).Menu.Items) and (TForm(AOwner).Menu.Items.Count>0) then
   FBaseMenu:=TForm(AOwner).Menu.Items.Items[0];
 end;
end;

procedure THistoryList.SetBaseMenu(baseMenu:TMenuItem);
begin
 if not assigned(FBaseMenu)
    and assigned(baseMenu)
    and (not (csDesigning in Componentstate)) then
 begin
  if BaseMenu.Count=0 then
  begin
//   BaseMenu.add(TMenuItem.Create(FBaseMenu));
//   BaseMenu[0].Caption:=SNoItemsInHistory;
//   BaseMenu[0].Enabled:=false;
  end;
 end;
 inherited;
end;

function isMenuDisabled(menu:TMenuItem):Boolean;
begin
 result:=(Menu.Count=1) and not Menu[0].enabled;
end;

function THistoryList.getCount:Integer;
begin
 if assigned(BaseMenu)
   and (FFirstMenuItemIndex>=0)
   and not isMenuDisabled(BaseMenu) then
  result:=BaseMenu.Count-FFirstMenuItemIndex
 else
  result:=0;
end;

//name is ignored
procedure THistoryList.addFilename(Filename:String);
var mi          :TMenuItem;
    i, lastMove :Integer;
begin
 if (Length(FileName)>0)
    and assigned(BaseMenu)
    then
 begin
  if Count=0 then
  begin
   if isMenuDisabled(BaseMenu) then
    BaseMenu.Delete(0);
   if BaseMenu.Count>0 then
   begin
    mi:=TMenuItem.Create(FBaseMenu);
    mi.Caption:='-';
    BaseMenu.add(mi);
   end;
   FFirstMenuItemIndex:=BaseMenu.Count;
  end;
  lastMove:=-1;
  for i:=FFirstMenuItemIndex to BaseMenu.Count-1 do
   if CompareStr(UpperCase(BaseMenu.Items[i].Hint),UpperCase(Filename))=0 then
   begin
    lastMove:=i;
    break;
   end;
  if lastMove=-1 then
  begin
   if getCount<MaxItems then
   begin
    mi:=TMenuItem.Create(FBaseMenu);
    mi.OnClick:=MenuItemClick;
    mi.HelpContext:=HelpContext;
    BaseMenu.add(mi);
   end;
   lastMove:=BaseMenu.Count-1;
  end;
  //finally move existing items down, deleting eventually
  //overwritten items or the last item (if list is full)

  for i:=lastMove downto FFirstMenuItemIndex+1 do
  begin
   BaseMenu.Items[i].Hint:=BaseMenu.Items[i-1].Hint;
  end;
  // now 'create' first (latest) item
  BaseMenu.Items[FFirstMenuItemIndex].Hint:=Filename;
  RebuildCaptions;
 end;
end;

procedure THistoryList.RebuildCaptions;
var
  i, ii :integer;
  s     :string;
begin
  for i:=FFirstMenuItemIndex to BaseMenu.Count-1 do begin
    ii:=i-FFirstMenuItemIndex+1;
    s:=IntToStr(ii);
    if (ii<10) then
      s:='&'+s;
    BaseMenu.Items[i].Caption:=s+' '+BaseMenu.Items[i].Hint;
  end;
end;

procedure THistoryList.RemoveFilename(Filename:String);
var
  i :integer;
begin
  i:=FFirstMenuItemIndex;
  while (i<BaseMenu.Count) do begin
    if (CompareStr(UpperCase(BaseMenu.Items[i].Hint),UpperCase(Filename))=0) then begin
      BaseMenu.Items[i].Free;
      RebuildCaptions;
      BREAK;
    end;
    inc(i);
  end;
end;

procedure THistoryList.SetMaxItems(maxItems:Integer);
begin
 if MaxItems<1 then
 begin
  exit;
 end;
 while getCount>maxItems do
  BaseMenu.Delete(BaseMenu.Count-1);
 FMaxItems:=MaxItems;
 if not FMaxItemsSet then
 begin
  FMaxItemsSet:=true;
  LoadFromRegistry;
 end;
end;

function THistoryList.ReadyToLoadReg:Boolean;
begin
 result:=FMaxItemsSet;
end;

{ TBookmarks }
constructor TBookmarks.Create(AOwner:TComponent);
begin
 inherited;
 FFileBookmarks:=false;
 FFileBookMarksSet:=false;
 FFirstMenuItemIndex:=2;
 FRegKey:=defaultBookmarksRegKey;
 FDelHelpContext:=0;
 FAddHelpContext:=0;

 // by default: before-last menuitem
 if (csDesigning in ComponentState) and (AOwner is TForm) and assigned(TForm(AOwner).Menu) then
 begin
  if assigned(TForm(AOwner).Menu.Items) and (TForm(AOwner).Menu.Items.Count>0) then
  begin
   if TForm(AOwner).Menu.Items.Count>1 then
    FBaseMenu:=TForm(AOwner).Menu.Items.Items[TForm(AOwner).Menu.Items.Count-2]
   else
    FBaseMenu:=TForm(AOwner).Menu.Items.Items[0];
  end;
 end;
end;

// returns count of bookmarks
function TBookmarks.getCount:Integer;
begin
 if assigned(BaseMenu) and (BaseMenu.Count>3) then
  result:=BaseMenu.Count-3
 else
  result:=0;
end;

procedure TBookmarks.SetFileBookmarks(FileBookmarks:Boolean);
begin
 FFileBookmarksSet:=true;
 FFIleBookmarks:=FileBookmarks;
 LoadFromRegistry;
end;

procedure TBookmarks.SetOnGetBookmark(OnGetBookmark:TOnGetBookmark);
begin
 FOnGetBookmark:=OnGetBookmark;
 if assigned(FBaseMenu) and (FBaseMenu.Count>0) then
  BaseMenu[0].enabled:=assigned(FOnGetBookmark);
end;

procedure TBookmarks.SetBaseMenu(baseMenu:TMenuItem);
begin
 if not assigned(FBaseMenu)
    and assigned(baseMenu)
    and (not (csDesigning in Componentstate)) then
 begin
  while BaseMenu.Count>0 do
   BaseMenu.Delete(0);
  BaseMenu.add(TMenuItem.Create(FBaseMenu));
  BaseMenu[0].Caption:='&Add';
  BaseMenu[0].HelpContext:=FAddHelpContext;
  if FFileBookmarks then
   BaseMenu[0].Hint:='Add the current file to the bookmarks.'
  else
   BaseMenu[0].Hint:='Add the current directory to the bookmarks.';
  BaseMenu[0].OnClick:=AddClick;
  BaseMenu[0].enabled:=assigned(FOnGetBookmark);
  BaseMenu.add(TMenuItem.Create(FBaseMenu));
  BaseMenu[1].Caption:='-';
  BaseMenu[1].visible:=false;
  FDeleteMenu:=TMenuItem.Create(FBaseMenu);
  FDeleteMenu.Caption:='&Delete';
  FDeleteMenu.Hint:='Delete a bookmark';
  FDeleteMenu.HelpContext:=FDelHelpContext;
  FDeleteMenu.visible:=false;
  BaseMenu.add(FDeleteMenu);
 end;
 inherited;
end;

procedure TBookmarks.addFilename(Filename:String);
var mi:TMenuItem;
    i, ii:Integer;
    existsAlready:Boolean;
    name :string;
begin
 name:='';
 if (Length(FileName)>0)
    and (Length(Name)>0)
    and assigned(BaseMenu)
    and ((FileBookmarks and FileExists(Filename))
         or (DirectoryExists(Filename))) then
 begin
  if not FileBookmarks
   and (Filename[length(Filename)]='\')
   and not ((length(Filename)>1) and (Filename[length(Filename)-1]=':')) then
   Filename:=copy(Filename,1,length(Filename)-1);
  if Count=0 then
  begin
   FDeleteMenu.visible:=true;
   BaseMenu[1].visible:=true;
  end;
  // if the path exists already, only the name is changed
  existsAlready:=false;
  for i:=0 to Count-1 do
   if CompareStr(Items[i].Hint,Filename)=0 then
   begin
    Items[i].Caption:=Name;
    for ii:=0 to Count-1 do
     if CompareStr(FDeleteMenu.Items[ii].Hint,Filename)=0 then
     begin
      FDeleteMenu.Items[ii].Caption:=Name;
      break;
     end;
    existsAlready:=true;
    break;
   end;
  if not existsAlready then
  begin
   mi:=TMenuItem.Create(FBaseMenu);
   mi.Caption:=Name;
   mi.Hint:=Filename;
   mi.OnClick:=MenuItemClick;
   mi.HelpContext:=HelpContext;
   BaseMenu.Insert(BaseMenu.Count-1,mi);

   mi:=TMenuItem.Create(FBaseMenu);
   mi.Caption:=Name;
   mi.Hint:=Filename;
   mi.OnClick:=DelClick;
   mi.HelpContext:=FDelHelpContext;
   FDeleteMenu.Add(mi);
  end;
 end;
end;

procedure TBookmarks.AddClick(Sender:TObject);
var Bookmark,Name:String;
begin
 if assigned(FOnGetBookmark) then
 begin
  Bookmark:='';
  Name:='';
  FOnGetBookmark(self,Bookmark,Name);
  addFilename(Bookmark);
 end;
end;

procedure TBookmarks.DelClick(Sender:TObject);
var i:Integer;
begin
 for i:=0 to Count-1 do
  if CompareStr(Items[i].Hint,TMenuItem(sender).Hint)=0 then
  begin
   BaseMenu.Remove(Items[i]);
   break;
  end;
 FDeleteMenu.Remove(TMenuItem(sender));
 if Count=0 then
 begin
  FDeleteMenu.visible:=false;
  BaseMenu.Items[1].visible:=false;
 end;
end;

function TBookmarks.ReadyToLoadReg:Boolean;
begin
 result:=FFileBookmarksSet;
end;

procedure TBookmarks.SetDelHelpContext(hc:THelpContext);
var i:Integer;
begin
 FDelHelpContext:=hc;
 if not (csDesigning in ComponentState) and assigned(FDeleteMenu) then
 begin
  FDeleteMenu.HelpContext:=hc;
  for i:=0 to FDeleteMenu.Count-1 do
   FDeleteMenu.Items[i].HelpContext:=hc;
 end;
end;

procedure TBookmarks.SetAddHelpContext(hc:THelpContext);
begin
 FAddHelpCOntext:=hc;
 if not (csDesigning in ComponentState) and Assigned(BaseMenu) and (BaseMenu.Count>0) then
  BaseMenu.Items[0].HelpContext:=hc;
end;

procedure Register;
begin
 RegisterComponents('ConTEXT Components', [THistoryList,TBookmarks]);
end;


end.
