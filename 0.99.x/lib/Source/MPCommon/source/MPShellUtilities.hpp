// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpshellutilities.pas' rev: 20.00

#ifndef MpshellutilitiesHPP
#define MpshellutilitiesHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Shlobj.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Activex.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit
#include <Mpshelltypes.hpp>	// Pascal unit
#include <Mpcommonobjects.hpp>	// Pascal unit
#include <Mpcommonutilities.hpp>	// Pascal unit
#include <Mpthreadmanager.hpp>	// Pascal unit
#include <Mpresources.hpp>	// Pascal unit
#include <Mpdataobject.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Contnrs.hpp>	// Pascal unit
#include <Comobj.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpshellutilities
{
//-- type declarations -------------------------------------------------------
typedef StaticArray<int, 37> TColumnWidthArray;

typedef TColumnWidthArray *PColumnWidthArray;

#pragma option push -b-
enum TExecuteVerbShift { evsCurrent, evsUp, evsDown };
#pragma option pop

#pragma option push -b-
enum TDefaultFolderIcon { diNormalFolder, diOpenFolder, diUnknownFile, diLink, diMyDocuments };
#pragma option pop

#pragma option push -b-
enum TMPBrowseFlag { mpbfComputers, mpbfPrinters, mpbfDontGoBelowDomain, mpbfFileSysAncestors, mpbfFileSysFolder, mpbfIncludeFiles, mpbfNewStyleDialog, mpbfEditBox, mpbfIncludeURLs, mpbfSharable, mpbfMustExist };
#pragma option pop

typedef Set<TMPBrowseFlag, mpbfComputers, mpbfMustExist>  TMPBrowseFlags;

#pragma option push -b-
enum TNamespaceState { nsFreePIDLOnDestroy, nsIsRecycleBin, nsRecycleBinChecked, nsOwnsParent, nsShellDetailsSupported, nsShellFolder2Supported, nsShellOverlaySupported, nsThreadedIconLoaded, nsThreadedIconLoading, nsThreadedImageLoaded, nsThreadedImageLoading, nsThreadedImageResizing, nsThreadedTileInfoLoaded, nsThreadedTileInfoLoading, nsIconIndexChanged };
#pragma option pop

typedef Set<TNamespaceState, nsFreePIDLOnDestroy, nsIconIndexChanged>  TNamespaceStates;

typedef HRESULT __stdcall (*TSHLimitInputEdit)(HWND hWndEdit, _di_IShellFolder psf);

typedef Mpshelltypes::_di_IShellDetailsBCB6 IVETShellDetails;

#pragma option push -b-
enum Mpshellutilities__1 { scInFolderName, scNormalName, scParsedName, scSmallIcon, scSmallOpenIcon, scOverlayIndex, scCreationTime, scLastAccessTime, scLastWriteTime, scFileSize, scFileSizeKB, scFileSizeInt64, scFileType, scInvalidIDListData, scFileSystem, scFolder, scCanDelete, scCanRename, scGhosted, scCanCopy, scCanMove, scCanLink, scLink, scFileSysAncestor, scCompressed, scFileTimes, scSupportedColumns, scFolderSize, scVirtualHook, scHookedNamespace, scVirtualNamespace, scRootVirtualNamespace, scHardHookedNamespace, scDetailsOfCache, scBrowsable };
#pragma option pop

typedef Set<Mpshellutilities__1, scInFolderName, scBrowsable>  TShellCache;

#pragma option push -b-
enum Mpshellutilities__2 { caFileSystem, caFolder, caCanDelete, caCanRename, caGhosted, caCanCopy, caCanMove, caCanLink, caLink, caFileSysAncestor, caCompressed, caVirtualHook, caHookedNamespace, caVirtualNamespace, caRootVirtualNamespace, caHardHookedNamespace, caBrowsable };
#pragma option pop

typedef Set<Mpshellutilities__2, caFileSystem, caBrowsable>  TCacheAttributes;

#pragma option push -b-
enum TSHColumnState { csTypeString, csTypeInt, csTypeDate, csOnByDefault, csSlow, csExtended, csSecondaryUI, csHidden };
#pragma option pop

typedef Set<TSHColumnState, csTypeString, csHidden>  TSHColumnStates;

#pragma option push -b-
enum THotKeyModifier { hkmAlt, hkmControl, hkmExtendedKey, hkmShift };
#pragma option pop

typedef Set<THotKeyModifier, hkmAlt, hkmShift>  THotKeyModifiers;

#pragma option push -b-
enum TCmdShow { swHide, swMaximize, swMinimize, swRestore, swShow, swShowDefault, swShowMinimized, swShowMinNoActive, swShowNA, swShowNoActive, swShowNormal };
#pragma option pop

#pragma option push -b-
enum TIconSize { icSmall, icLarge };
#pragma option pop

#pragma option push -b-
enum TFileSort { fsFileType, fsFileExtension };
#pragma option pop

#pragma option push -b-
enum TObjectDescription { odError, odRootRegistered, odFile, odDirectory, odUnidentifiedFileItem, od35Floppy, od525Floppy, odRemovableDisk, odFixedDrive, odMappedDrive, odCDROMDrive, odRAMDisk, odUnidentifiedDevice, odNetworkDomain, odNetworkServer, odNetworkShare, odNetworkRestOfNet, odUnidentifiedNetwork, odComputerImaging, odComputerAudio, odShareDocuments };
#pragma option pop

#pragma option push -b-
enum TDetailsColumnTitleInfo { tiCenterAlign, tiLeftAlign, tiRightAlign, tiContainsImage };
#pragma option pop

#pragma option push -b-
enum Mpshellutilities__3 { foFolders, foNonFolders, foHidden, foShareable, foNetworkPrinters };
#pragma option pop

typedef Set<Mpshellutilities__3, foFolders, foNetworkPrinters>  TFileObjects;

typedef TFileObjects *PFileObjects;

typedef DynamicArray<Mpshelltypes::tagSHCOLUMNID> TSHColumnIDArray;

typedef DynamicArray<GUID> TGUIDArray;

typedef DynamicArray<System::WideString> TWideStringArray;

typedef DynamicArray<Mpshelltypes::_di_ICategorizer> TCategoryArray;

struct TCategoryInfo
{
	
public:
	System::WideString Description;
	bool Collapsed;
	bool Hidden;
};


typedef DynamicArray<TCategoryInfo> TCategoryInfoArray;

typedef DynamicArray<bool> TBooleanArray;

struct TCategoriesInfo
{
	
public:
	TSHColumnIDArray ColumnID;
	TGUIDArray CatGUID;
	TWideStringArray CategoryNames;
	TCategoryInfoArray Categories;
	TBooleanArray CanCatatorize;
	int DefaultColumn;
	int CategoryCount;
};


#pragma option push -b-
enum TBtyeSize { bsKiloBytes, bsMegaBytes, bsGigiBytes, bsTereBytes, bsCustom };
#pragma option pop

typedef DynamicArray<unsigned> TMenuItemIDArray;

typedef DynamicArray<System::Word> TVisibleColumnIndexArray;

#pragma option push -b-
enum TDetailsOfCacheFlag { docCaptionValid, docStatesValid, docThreadLoading, docThreadLoaded };
#pragma option pop

typedef Set<TDetailsOfCacheFlag, docCaptionValid, docThreadLoaded>  TDetailsOfCacheFlags;

struct TDetailsOfCacheRec;
typedef TDetailsOfCacheRec *PDetailsOfCacheRec;

#pragma pack(push,1)
struct TDetailsOfCacheRec
{
	
public:
	TDetailsOfCacheFlags Cached;
	System::WideString Caption;
	TSHColumnStates States;
};
#pragma pack(pop)


typedef DynamicArray<TDetailsOfCacheRec> TDetailsOfCacheArray;

#pragma pack(push,1)
struct TCacheData
{
	
public:
	TCacheAttributes Attributes;
	int SmallIcon;
	int SmallOpenIcon;
	System::WideString InFolderName;
	System::WideString NormalName;
	System::WideString ParsedName;
	System::WideString CreationTime;
	System::WideString LastAccessTime;
	System::WideString LastWriteTime;
	System::WideString FileSize;
	System::WideString FileSizeKB;
	System::WideString FileType;
	__int64 FileSizeInt64;
	int SupportedColumns;
	__int64 FolderSize;
	int OverlayIndex;
	int OverlayIconIndex;
	TDetailsOfCacheArray DetailsOfCache;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TShellCacheRec
{
	
public:
	TShellCache ShellCacheFlags;
	TCacheData Data;
};
#pragma pack(pop)


struct TSHGetFileInfoRec;
typedef TSHGetFileInfoRec *PSHGetFileInfoRec;

#pragma pack(push,1)
struct TSHGetFileInfoRec
{
	
public:
	System::WideString FileType;
};
#pragma pack(pop)


#pragma option push -b-
enum TShellContextMenuFlag { cmfCanRename, cmfDefaultOnly, cmfExplore, cmfExtendedVerbs, cmfIncludeStatic, cmfItemMenu, cmfNoDefault, cmfNormal, cmfNoVerbs, cmfVerbsOnly };
#pragma option pop

typedef Set<TShellContextMenuFlag, cmfCanRename, cmfVerbsOnly>  TShellContextMenuFlags;

class DELPHICLASS TNamespace;
typedef DynamicArray<TNamespace*> TNamespaceArray;

class DELPHICLASS TCommonShellContextMenu;
typedef void __fastcall (__closure *TCommonShellMenuEvent)(TCommonShellContextMenu* Sender);

typedef void __fastcall (__closure *TCommonShellMenuInvokeEvent)(TCommonShellContextMenu* Sender, Menus::TMenuItem* MenuItem, Shlobj::PCMInvokeCommandInfo InvokeInfo, bool &Handled);

typedef void __fastcall (__closure *TCommonShellMenuMergeEvent)(TCommonShellContextMenu* Sender, HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);

typedef void __fastcall (__closure *TCommonShellMenuItemEvent)(TCommonShellContextMenu* Sender, _di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &Handled);

typedef void __fastcall (__closure *TCommonShellMenuNewItemEvent)(TCommonShellContextMenu* Sender, TNamespace* NS);

typedef TCommonShellMenuItemEvent TCommonShellMenuCopyEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuCreateShortcutEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuCutEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuDeleteEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuNewFolderEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuPasteEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuPasteLinkEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuPasteShortCutEvent;

typedef TCommonShellMenuItemEvent TCommonShellMenuProperitesEvent;

typedef int __stdcall (*TSHShellFolderView_Message)(HWND hWndMain, unsigned uMsg, int lParm);

class DELPHICLASS EVSTInvalidFileName;
class PASCALIMPLEMENTATION EVSTInvalidFileName : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall EVSTInvalidFileName(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EVSTInvalidFileName(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EVSTInvalidFileName(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EVSTInvalidFileName(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EVSTInvalidFileName(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EVSTInvalidFileName(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EVSTInvalidFileName(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EVSTInvalidFileName(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EVSTInvalidFileName(void) { }
	
};


class DELPHICLASS TStreamableClass;
class PASCALIMPLEMENTATION TStreamableClass : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	int FStreamVersion;
	
public:
	__fastcall TStreamableClass(void);
	virtual void __fastcall LoadFromFile(System::WideString FileName, int Version = 0x0, bool ReadVerFromStream = false);
	virtual void __fastcall LoadFromStream(Classes::TStream* S, int Version = 0x0, bool ReadVerFromStream = false);
	virtual void __fastcall SaveToFile(System::WideString FileName, int Version = 0x0, bool ReadVerFromStream = false);
	virtual void __fastcall SaveToStream(Classes::TStream* S, int Version = 0x0, bool WriteVerToStream = false);
	__property int StreamVersion = {read=FStreamVersion, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TStreamableClass(void) { }
	
};


class DELPHICLASS TStreamableList;
class PASCALIMPLEMENTATION TStreamableList : public Classes::TList
{
	typedef Classes::TList inherited;
	
private:
	int FStreamVersion;
	
public:
	__fastcall TStreamableList(void);
	virtual void __fastcall LoadFromFile(System::WideString FileName, int Version = 0x0, bool ReadVerFromStream = false);
	virtual void __fastcall LoadFromStream(Classes::TStream* S, int Version = 0x0, bool ReadVerFromStream = false);
	virtual void __fastcall SaveToFile(System::WideString FileName, int Version = 0x0, bool ReadVerFromStream = false);
	virtual void __fastcall SaveToStream(Classes::TStream* S, int Version = 0x0, bool WriteVerToStream = false);
	__property int StreamVersion = {read=FStreamVersion, nodefault};
public:
	/* TList.Destroy */ inline __fastcall virtual ~TStreamableList(void) { }
	
};


class DELPHICLASS TReferenceCounted;
class PASCALIMPLEMENTATION TReferenceCounted : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	int FRefCount;
	
public:
	void __fastcall AddRef(void);
	void __fastcall Release(void);
public:
	/* TObject.Create */ inline __fastcall TReferenceCounted(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TReferenceCounted(void) { }
	
};


class DELPHICLASS TReferenceCountedList;
class PASCALIMPLEMENTATION TReferenceCountedList : public Classes::TList
{
	typedef Classes::TList inherited;
	
protected:
	int FRefCount;
	
public:
	void __fastcall AddRef(void);
	void __fastcall Release(void);
	__property int RefCount = {read=FRefCount, nodefault};
public:
	/* TList.Destroy */ inline __fastcall virtual ~TReferenceCountedList(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TReferenceCountedList(void) : Classes::TList() { }
	
};


class DELPHICLASS TExtractImage;
class PASCALIMPLEMENTATION TExtractImage : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	unsigned FFlags;
	unsigned FPriority;
	unsigned FHeight;
	unsigned FWidth;
	unsigned FColorDepth;
	Mpshelltypes::_di_IExtractImage FExtractImageInterface;
	Mpshelltypes::_di_IExtractImage2 FExtractImage2Interface;
	TNamespace* FOwner;
	bool FPathExtracted;
	Graphics::TBitmap* __fastcall GetImage(void);
	System::WideString __fastcall GetImagePath();
	Mpshelltypes::_di_IExtractImage __fastcall GetExtractImageInterface();
	Mpshelltypes::_di_IExtractImage2 __fastcall GetExtractImageInterface2();
	
protected:
	__property bool PathExtracted = {read=FPathExtracted, write=FPathExtracted, nodefault};
	
public:
	__fastcall TExtractImage(void);
	__property unsigned ColorDepth = {read=FColorDepth, write=FColorDepth, nodefault};
	__property System::WideString ImagePath = {read=GetImagePath};
	__property Graphics::TBitmap* Image = {read=GetImage};
	__property Mpshelltypes::_di_IExtractImage ExtractImageInterface = {read=GetExtractImageInterface};
	__property Mpshelltypes::_di_IExtractImage2 ExtractImage2Interface = {read=GetExtractImageInterface2};
	__property unsigned Flags = {read=FFlags, write=FFlags, nodefault};
	__property unsigned Height = {read=FHeight, write=FHeight, nodefault};
	__property TNamespace* Owner = {read=FOwner, write=FOwner};
	__property unsigned Priority = {read=FPriority, nodefault};
	__property unsigned Width = {read=FWidth, write=FWidth, nodefault};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TExtractImage(void) { }
	
};


class DELPHICLASS TVirtualShellLink;
class PASCALIMPLEMENTATION TVirtualShellLink : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	System::WideString FFileName;
	_di_IShellLinkA FShellLinkA;
	_di_IShellLinkW FShellLinkW;
	int FIconIndex;
	_ITEMIDLIST *FTargetIDList;
	TCmdShow FShowCmd;
	THotKeyModifiers FHotKeyModifiers;
	System::WideString FTargetPath;
	System::WideString FArguments;
	System::WideString FDescription;
	System::WideString FWorkingDirectory;
	System::WideString FIconLocation;
	System::Word FHotKey;
	bool FSilentWrite;
	_di_IShellLinkA __fastcall GetShellLinkAInterface();
	_di_IShellLinkW __fastcall GetShellLinkWInterface();
	
protected:
	void __fastcall FreeTargetIDList(void);
	
public:
	__fastcall virtual ~TVirtualShellLink(void);
	bool __fastcall ReadLink(System::WideString LinkFileName);
	bool __fastcall WriteLink(System::WideString LinkFileName);
	__property System::WideString Arguments = {read=FArguments, write=FArguments};
	__property System::WideString Description = {read=FDescription, write=FDescription};
	__property System::WideString FileName = {read=FFileName, write=FFileName};
	__property System::Word HotKey = {read=FHotKey, write=FHotKey, nodefault};
	__property THotKeyModifiers HotKeyModifiers = {read=FHotKeyModifiers, write=FHotKeyModifiers, nodefault};
	__property int IconIndex = {read=FIconIndex, write=FIconIndex, nodefault};
	__property System::WideString IconLocation = {read=FIconLocation, write=FIconLocation};
	__property Shlobj::PItemIDList TargetIDList = {read=FTargetIDList, write=FTargetIDList};
	__property _di_IShellLinkA ShellLinkAInterface = {read=GetShellLinkAInterface};
	__property _di_IShellLinkW ShellLinkWInterface = {read=GetShellLinkWInterface};
	__property TCmdShow ShowCmd = {read=FShowCmd, write=FShowCmd, nodefault};
	__property bool SilentWrite = {read=FSilentWrite, write=FSilentWrite, nodefault};
	__property System::WideString TargetPath = {read=FTargetPath, write=FTargetPath};
	__property System::WideString WorkingDirectory = {read=FWorkingDirectory, write=FWorkingDirectory};
public:
	/* TComponent.Create */ inline __fastcall virtual TVirtualShellLink(Classes::TComponent* AOwner) : Classes::TComponent(AOwner) { }
	
};


class DELPHICLASS TShellSortHelper;
class PASCALIMPLEMENTATION TShellSortHelper : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	TFileSort FFileSort;
	
public:
	virtual int __fastcall CompareIDSort(int SortColumn, TNamespace* NS1, TNamespace* NS2);
	virtual int __fastcall DiscriminateFolders(TNamespace* NS1, TNamespace* NS2);
	virtual int __fastcall SortFileSize(TNamespace* NS1, TNamespace* NS2);
	virtual int __fastcall SortFileTime(const _FILETIME &FT1, const _FILETIME &FT2, TNamespace* NS1, TNamespace* NS2);
	virtual int __fastcall SortString(System::WideString S1, System::WideString S2, TNamespace* NS1, TNamespace* NS2);
	virtual int __fastcall SortType(TNamespace* NS1, TNamespace* NS2);
	__property TFileSort FileSort = {read=FFileSort, write=FFileSort, nodefault};
public:
	/* TObject.Create */ inline __fastcall TShellSortHelper(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TShellSortHelper(void) { }
	
};


typedef bool __fastcall (__closure *TEnumFolderCallback)(HWND MessageWnd, Shlobj::PItemIDList APIDL, TNamespace* AParent, void * Data, bool &Terminate);

typedef void __fastcall (__closure *TContextMenuCmdCallback)(TNamespace* Namespace, System::WideString Verb, int MenuItemID, bool &Handled);

typedef void __fastcall (__closure *TContextMenuShowCallback)(TNamespace* Namespace, HMENU Menu, bool &Allow);

typedef void __fastcall (__closure *TContextMenuAfterCmdCallback)(TNamespace* Namespace, System::WideString Verb, int MenuItemID, bool Successful);

class PASCALIMPLEMENTATION TNamespace : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	_ITEMIDLIST *FAbsolutePIDL;
	TCategoriesInfo FCatInfo;
	Mpshelltypes::_di_IContextMenu FCurrentContextMenu;
	Mpshelltypes::_di_IContextMenu2 FCurrentContextMenu2;
	_di_IDropTarget FDropTargetInterface;
	TExtractImage* FExtractImage;
	int FIconCache;
	Graphics::TBitmap* FImage;
	int FNamespaceID;
	Classes::TWndMethod FOldWndProcForContextMenu;
	TNamespace* FParent;
	Mpshelltypes::_di_IPropertyStore FPropertyStoreInterface;
	_ITEMIDLIST *FRelativePIDL;
	Mpshelltypes::_di_IShellDetailsBCB6 FShellDetailsInterface;
	_di_IShellFolder FShellFolder;
	_di_IShellFolder2 FShellFolder2;
	_di_IShellIcon FShellIconInterface;
	TVirtualShellLink* FShellLink;
	TSHGetFileInfoRec *FSHGetFileInfoRec;
	TNamespaceStates FStates;
	int FTag;
	Mpcommonutilities::TCommonIntegerDynArray FTileDetail;
	_di_IQueryInfo FQueryInfoInterface;
	_WIN32_FIND_DATAA *FWin32FindDataA;
	_WIN32_FIND_DATAW *FWin32FindDataW;
	bool FSystemIsSuperHidden;
	Mpshelltypes::_di_IShellIconOverlay FShellIconOverlayInterface;
	Mpshelltypes::_di_ICategoryProvider FCategoryProviderInterface;
	Mpshelltypes::_di_IBrowserFrameOptions FBrowserFrameOptionsInterface;
	Mpshelltypes::_di_IQueryAssociations FQueryAssociationsInterface;
	int __fastcall GetCategoryCount(void);
	Mpshelltypes::_di_IContextMenu __fastcall GetCurrentContextMenu();
	Mpshelltypes::_di_IContextMenu2 __fastcall GetCurrentContextMenu2();
	TNamespace* __fastcall GetParent(void);
	Mpshelltypes::_di_IPropertyStore __fastcall GetPropertyStoreInterface();
	void __fastcall SetCurrentContextMenu(const Mpshelltypes::_di_IContextMenu Value);
	void __fastcall SetCurrentContextMenu2(const Mpshelltypes::_di_IContextMenu2 Value);
	
protected:
	TShellCacheRec FShellCache;
	virtual bool __fastcall GetArchive(void);
	virtual System::WideString __fastcall GetAttributesString();
	virtual bool __fastcall GetBrowsable(void);
	virtual Mpshelltypes::_di_IBrowserFrameOptions __fastcall GetBrowserFrameOptionsInterface();
	virtual bool __fastcall GetCanCopy(void);
	virtual bool __fastcall GetCanDelete(void);
	virtual bool __fastcall GetCanLink(void);
	virtual bool __fastcall GetCanMoniker(void);
	virtual bool __fastcall GetCanMove(void);
	virtual bool __fastcall GetCanRename(void);
	virtual Mpshelltypes::_di_ICategoryProvider __fastcall GetCategoryProviderInterface();
	virtual GUID __fastcall GetCLSID();
	virtual bool __fastcall GetCompressed(void);
	virtual Mpshelltypes::_di_IContextMenu2 __fastcall GetContextMenu2Interface();
	virtual Mpshelltypes::_di_IContextMenu3 __fastcall GetContextMenu3Interface();
	virtual Mpshelltypes::_di_IContextMenu __fastcall GetContextMenuInterface();
	virtual System::TDateTime __fastcall GetCreationDateTime(void);
	virtual System::WideString __fastcall GetCreationTime();
	virtual _FILETIME __fastcall GetCreationTimeRaw();
	virtual _di_IDataObject __fastcall GetDataObjectInterface();
	virtual TObjectDescription __fastcall GetDescription(void);
	virtual bool __fastcall GetDetailsSupported(void);
	virtual bool __fastcall GetDirectory(void);
	virtual bool __fastcall GetDropTarget(void);
	virtual _di_IDropTarget __fastcall GetDropTargetInterface();
	virtual bool __fastcall GetEncrypted(void);
	virtual System::WideString __fastcall GetExtension();
	virtual _di_IExtractIconA __fastcall GetExtractIconAInterface();
	virtual _di_IExtractIconW __fastcall GetExtractIconWInterface();
	virtual TExtractImage* __fastcall GetExtractImage(void);
	virtual System::WideString __fastcall GetFileName();
	virtual bool __fastcall GetFileSysAncestor(void);
	virtual bool __fastcall GetFileSystem(void);
	virtual System::WideString __fastcall GetFileType();
	virtual bool __fastcall GetFolder(void);
	virtual bool __fastcall GetFreePIDLOnDestroy(void);
	virtual bool __fastcall GetGhosted(void);
	virtual bool __fastcall GetHasPropSheet(void);
	virtual bool __fastcall GetHasStorage(void);
	virtual bool __fastcall GetHasSubFolder(void);
	virtual bool __fastcall GetHidden(void);
	virtual bool __fastcall GetIconIndexChanged(void);
	virtual System::WideString __fastcall GetInfoTip();
	virtual bool __fastcall GetIsSlow(void);
	virtual System::TDateTime __fastcall GetLastAccessDateTime(void);
	virtual System::WideString __fastcall GetLastAccessTime();
	virtual _FILETIME __fastcall GetLastAccessTimeRaw();
	virtual System::TDateTime __fastcall GetLastWriteDateTime(void);
	virtual System::WideString __fastcall GetLastWriteTime();
	virtual _FILETIME __fastcall GetLastWriteTimeRaw();
	virtual bool __fastcall GetLink(void);
	virtual System::WideString __fastcall GetNameAddressbar();
	virtual System::WideString __fastcall GetNameAddressbarInFolder();
	virtual System::WideString __fastcall GetNameForEditing();
	virtual System::WideString __fastcall GetNameForEditingInFolder();
	virtual System::WideString __fastcall GetNameForParsing();
	virtual System::WideString __fastcall GetNameForParsingInFolder();
	virtual System::WideString __fastcall GetNameInFolder();
	virtual System::WideString __fastcall GetNameNormal();
	virtual System::WideString __fastcall GetNameParseAddress();
	virtual System::WideString __fastcall GetNameParseAddressInFolder();
	virtual bool __fastcall GetNewContent(void);
	virtual bool __fastcall GetNonEnumerated(void);
	virtual bool __fastcall GetNormal(void);
	virtual bool __fastcall GetOffLine(void);
	virtual int __fastcall GetOverlayIconIndex(void);
	virtual int __fastcall GetOverlayIndex(void);
	virtual Mpshelltypes::_di_IShellDetailsBCB6 __fastcall GetParentShellDetailsInterface();
	virtual _di_IShellFolder __fastcall GetParentShellFolder();
	virtual _di_IShellFolder2 __fastcall GetParentShellFolder2();
	virtual Mpshelltypes::_di_IQueryAssociations __fastcall GetQueryAssociationsInterface();
	virtual _di_IQueryInfo __fastcall GetQueryInfoInterface();
	virtual bool __fastcall GetReadOnly(void);
	virtual bool __fastcall GetReadOnlyFile(void);
	virtual bool __fastcall GetReparsePoint(void);
	virtual bool __fastcall GetRemovable(void);
	virtual bool __fastcall GetShare(void);
	virtual Mpshelltypes::_di_IShellDetailsBCB6 __fastcall GetShellDetailsInterface();
	virtual _di_IShellFolder __fastcall GetShellFolder();
	virtual _di_IShellFolder2 __fastcall GetShellFolder2();
	virtual _di_IShellIcon __fastcall GetShellIconInterface();
	virtual Mpshelltypes::_di_IShellIconOverlay __fastcall GetShellIconOverlayInterface();
	virtual TVirtualShellLink* __fastcall GetShellLink(void);
	virtual System::WideString __fastcall GetShortFileName();
	virtual System::WideString __fastcall GetSizeOfFile();
	virtual System::WideString __fastcall GetSizeOfFileDiskUsage();
	virtual __int64 __fastcall GetSizeOfFileInt64(void);
	virtual System::WideString __fastcall GetSizeOfFileKB();
	virtual bool __fastcall GetSparseFile(void);
	virtual bool __fastcall GetStorage(void);
	virtual bool __fastcall GetStorageAncestor(void);
	virtual bool __fastcall GetStream(void);
	virtual bool __fastcall GetSubFolders(void);
	virtual bool __fastcall GetSubItems(void);
	virtual bool __fastcall GetSystem(void);
	virtual bool __fastcall GetTemporary(void);
	virtual bool __fastcall GetThreadedDetailLoaded(int ColumnIndex);
	virtual bool __fastcall GetThreadedDetailLoading(int ColumnIndex);
	virtual bool __fastcall GetThreadedIconLoaded(void);
	virtual bool __fastcall GetThreadedImageLoaded(void);
	virtual bool __fastcall GetThreadedImageLoading(void);
	virtual bool __fastcall GetThreadIconLoading(void);
	virtual bool __fastcall GetValid(void);
	HWND __fastcall ParentWnd(void);
	void __fastcall EnsureDetailCache(void);
	void __fastcall ExecuteContextMenuVerbMultiPath(System::WideString Verb, TNamespaceArray Namespaces, TExecuteVerbShift ShiftKeyState = (TExecuteVerbShift)(0x0));
	void __fastcall LoadCategoryInfo(void);
	virtual void __fastcall SetFreePIDLOnDestroy(const bool Value);
	virtual void __fastcall SetIconIndexChanged(const bool Value);
	virtual void __fastcall SetThreadedDetailLoaded(int ColumnIndex, bool Value);
	virtual void __fastcall SetThreadedDetailLoading(int ColumnIndex, bool Value);
	virtual void __fastcall SetThreadIconLoading(const bool Value);
	virtual void __fastcall SetThreadImageLoading(const bool Value);
	Mpshelltypes::_di_ICategorizer __fastcall CreateCategory(const GUID &GUID);
	bool __fastcall EnumFuncDummy(HWND MessageWnd, Shlobj::PItemIDList APIDL, TNamespace* AParent, void * Data, bool &Terminate);
	System::WideString __fastcall ExplorerStyleAttributeStringList(bool CapitalLetters);
	System::WideString __fastcall DisplayNameOf(unsigned Flags);
	void __fastcall GetDataFromIDList(void);
	void __fastcall GetFileTimes(void);
	void __fastcall GetSHFileInfo(void);
	TMenuItemIDArray __fastcall InjectCustomSubMenu(HMENU Menu, System::UnicodeString Caption, Menus::TPopupMenu* PopupMenu, HMENU &SubMenu);
	Mpshelltypes::_di_IContextMenu __fastcall InternalGetContextMenuInterface(Mpcommonobjects::TPIDLArray PIDLArray);
	_di_IDataObject __fastcall InternalGetDataObjectInterface(Mpcommonobjects::TPIDLArray PIDLArray);
	bool __fastcall InternalShowContextMenu(Controls::TWinControl* Owner, TContextMenuCmdCallback ContextMenuCmdCallback, TContextMenuShowCallback ContextMenuShowCallback, TContextMenuAfterCmdCallback ContextMenuAfterCmdCallback, Mpcommonobjects::TPIDLArray PIDLArray, Types::PPoint Position, Menus::TPopupMenu* CustomShellSubMenu, System::WideString CustomSubMenuCaption);
	bool __fastcall InternalSubItems(unsigned Flags);
	void __fastcall ReplacePIDL(Shlobj::PItemIDList NewPIDL, TNamespace* AParent);
	bool __fastcall ShowContextMenuMultiPath(Controls::TWinControl* Owner, TNamespace* Focused, TNamespaceArray Namespaces, Types::PPoint Position = (void *)(0x0));
	void __fastcall WindowProcForContextMenu(Messages::TMessage &Message);
	__property TCategoriesInfo CatInfo = {read=FCatInfo, write=FCatInfo};
	__property Mpshelltypes::_di_IContextMenu CurrentContextMenu = {read=GetCurrentContextMenu, write=SetCurrentContextMenu};
	__property Mpshelltypes::_di_IContextMenu2 CurrentContextMenu2 = {read=GetCurrentContextMenu2, write=SetCurrentContextMenu2};
	__property TShellCacheRec ShellCache = {read=FShellCache, write=FShellCache};
	__property bool SystemIsSuperHidden = {read=FSystemIsSuperHidden, write=FSystemIsSuperHidden, nodefault};
	
public:
	__fastcall TNamespace(Shlobj::PItemIDList PIDL, TNamespace* AParent);
	__fastcall virtual ~TNamespace(void);
	__fastcall virtual TNamespace(int CustomID, TNamespace* AParent);
	__fastcall virtual TNamespace(System::WideString FileName);
	virtual bool __fastcall CanCopyAll(TNamespaceArray NamespaceArray);
	virtual bool __fastcall CanCutAll(TNamespaceArray NamespaceArray);
	virtual bool __fastcall CanDeleteAll(TNamespaceArray NamespaceArray);
	virtual bool __fastcall CanPasteToAll(TNamespaceArray NamespaceArray);
	virtual bool __fastcall CanShowPropertiesOfAll(TNamespaceArray NamespaceArray);
	virtual TNamespace* __fastcall Clone(bool ReleasePIDLOnDestroy);
	virtual System::ShortInt __fastcall ComparePIDL(Shlobj::PItemIDList PIDLToCompare, bool IsAbsolutePIDL, int Column = 0x0);
	virtual System::WideString __fastcall ContextMenuItemHelp(unsigned MenuItemID);
	virtual System::WideString __fastcall ContextMenuVerb(unsigned MenuItemID);
	virtual bool __fastcall Copy(TNamespaceArray NamespaceArray);
	virtual bool __fastcall Cut(TNamespaceArray NamespaceArray);
	virtual _di_IDataObject __fastcall DataObjectMulti(TNamespaceArray NamespaceArray);
	virtual bool __fastcall Delete(TNamespaceArray NamespaceArray, TExecuteVerbShift ShiftKeyState = (TExecuteVerbShift)(0x0));
	virtual Classes::TAlignment __fastcall DetailsAlignment(int ColumnIndex);
	virtual System::WideString __fastcall DetailsColumnTitle(int ColumnIndex);
	virtual System::WideString __fastcall DetailsDefaultColumnTitle(int ColumnIndex);
	virtual System::WideString __fastcall DetailsDefaultOf(int ColumnIndex);
	virtual int __fastcall DetailsDefaultSupportedColumns(void);
	virtual TSHColumnStates __fastcall DetailsGetDefaultColumnState(int ColumnIndex);
	virtual System::WideString __fastcall DetailsOf(int ColumnIndex);
	virtual System::WideString __fastcall DetailsOfEx(int ColumnIndex);
	virtual int __fastcall DetailsSupportedColumns(void);
	virtual TVisibleColumnIndexArray __fastcall DetailsSupportedVisibleColumns();
	virtual bool __fastcall DetailsValidIndex(int DetailsIndex);
	virtual HRESULT __fastcall DragEffect(int grfKeyState);
	virtual HRESULT __fastcall DragEnter(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint &pt, int &dwEffect);
	virtual HRESULT __fastcall DragLeave(void);
	virtual HRESULT __fastcall DragOver(int grfKeyState, const Types::TPoint &pt, int &dwEffect);
	virtual HRESULT __fastcall Drop(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint &pt, int &dwEffect);
	virtual int __fastcall EnumerateFolder(HWND MessageWnd, bool Folders, bool NonFolders, bool IncludeHidden, TEnumFolderCallback EnumFunc, void * UserData);
	virtual int __fastcall EnumerateFolderEx(HWND MessageWnd, TFileObjects FileObjects, TEnumFolderCallback EnumFunc, void * UserData, Classes::TNotifyEvent AfterValidEnumIDList = 0x0);
	virtual bool __fastcall ExecuteContextMenuVerb(System::WideString AVerb, Mpcommonobjects::TPIDLArray APIDLArray, HWND MessageWindowParent = (HWND)(0x0), TExecuteVerbShift ShiftKeyState = (TExecuteVerbShift)(0x0));
	virtual __int64 __fastcall FolderSize(bool Invalidate, bool RecurseFolder = false);
	virtual int __fastcall GetIconIndex(bool OpenIcon, TIconSize IconSize, bool ForceLoad = true);
	virtual Graphics::TBitmap* __fastcall GetImage(void);
	bool __fastcall VerifyPIDLRelationship(TNamespaceArray NamespaceArray, bool Silent = false);
	virtual void __fastcall HandleContextMenuMsg(int Msg, int wParam, int lParam, int &Result);
	virtual void __fastcall InvalidateCache(void);
	void __fastcall InvalidateDetailsOfCache(bool FlushStrings);
	virtual void __fastcall InvalidateNamespace(bool RefreshIcon = true);
	virtual void __fastcall InvalidateRelativePIDL(TFileObjects FileObjects);
	virtual void __fastcall InvalidateThumbImage(void);
	virtual bool __fastcall IsChildByNamespace(TNamespace* TestNamespace, bool Immediate);
	virtual bool __fastcall IsChildByPIDL(Shlobj::PItemIDList TestPIDL, bool Immediate);
	virtual bool __fastcall IsChildOfRemovableDrive(void);
	virtual bool __fastcall IsControlPanel(void);
	virtual bool __fastcall IsControlPanelChildFolder(void);
	virtual bool __fastcall IsDesktop(void);
	virtual bool __fastcall IsMyComputer(void);
	virtual bool __fastcall IsNetworkNeighborhood(void);
	virtual bool __fastcall IsNetworkNeighborhoodChild(void);
	virtual bool __fastcall IsParentByNamespace(TNamespace* TestNamespace, bool Immediate);
	virtual bool __fastcall IsParentByPIDL(Shlobj::PItemIDList TestPIDL, bool Immediate);
	bool __fastcall IsRecycleBin(void);
	virtual bool __fastcall OkToBrowse(bool ShowExplorerMsg);
	virtual Shlobj::PItemIDList __fastcall ParseDisplayName(void)/* overload */;
	virtual Shlobj::PItemIDList __fastcall ParseDisplayName(System::WideString Path)/* overload */;
	virtual bool __fastcall Paste(TNamespaceArray NamespaceArray, bool AsShortCut = false);
	void __fastcall SetDetailByThread(int ColumnIndex, System::WideString Detail);
	virtual void __fastcall SetIconIndexByThread(int IconIndex, int OverlayIndex, bool ClearThreadLoading);
	virtual void __fastcall SetImageByThread(Graphics::TBitmap* Bitmap, bool ClearThreadLoading);
	virtual bool __fastcall SetNameOf(System::WideString NewName);
	virtual bool __fastcall ShellExecuteNamespace(System::WideString WorkingDir, System::WideString CmdLineArguments, bool ExecuteFolder = false, bool ExecuteFolderShortCut = false, bool RunInThread = false);
	virtual bool __fastcall ShowContextMenu(Controls::TWinControl* Owner, TContextMenuCmdCallback ContextMenuCmdCallback, TContextMenuShowCallback ContextMenuShowCallback, TContextMenuAfterCmdCallback ContextMenuAfterCmdCallback, Types::PPoint Position = (void *)(0x0), Menus::TPopupMenu* CustomShellSubMenu = (Menus::TPopupMenu*)(0x0), System::WideString CustomSubMenuCaption = L"");
	virtual bool __fastcall ShowContextMenuMulti(Controls::TWinControl* Owner, TContextMenuCmdCallback ContextMenuCmdCallback, TContextMenuShowCallback ContextMenuShowCallback, TContextMenuAfterCmdCallback ContextMenuAfterCmdCallback, TNamespaceArray NamespaceArray, Types::PPoint Position = (void *)(0x0), Menus::TPopupMenu* CustomShellSubMenu = (Menus::TPopupMenu*)(0x0), System::WideString CustomSubMenuCaption = L"", TNamespace* Focused = (TNamespace*)(0x0));
	virtual void __fastcall ShowPropertySheet(void);
	virtual void __fastcall ShowPropertySheetMulti(TNamespaceArray NamespaceArray, bool UseSHMultiFileProperties = true, bool ForceNonMultiPath = false);
	virtual bool __fastcall SubFoldersEx(unsigned Flags = (unsigned)(0x20));
	virtual bool __fastcall SubItemsEx(unsigned Flags = (unsigned)(0x40));
	virtual bool __fastcall TestAttributesOf(unsigned Flags, bool FlushCache, bool SoftFlush = false);
	__property Shlobj::PItemIDList AbsolutePIDL = {read=FAbsolutePIDL, write=FAbsolutePIDL};
	__property bool AdvDetailsSupported = {read=GetDetailsSupported, nodefault};
	__property bool Browsable = {read=GetBrowsable, nodefault};
	__property Mpshelltypes::_di_IBrowserFrameOptions BrowserFrameOptionsInterface = {read=GetBrowserFrameOptionsInterface};
	__property bool CanCopy = {read=GetCanCopy, nodefault};
	__property bool CanDelete = {read=GetCanDelete, nodefault};
	__property bool CanLink = {read=GetCanLink, nodefault};
	__property bool CanMoniker = {read=GetCanMoniker, nodefault};
	__property bool CanMove = {read=GetCanMove, nodefault};
	__property bool CanRename = {read=GetCanRename, nodefault};
	__property int CategoryCount = {read=GetCategoryCount, nodefault};
	__property Mpshelltypes::_di_ICategoryProvider CategoryProviderInterface = {read=GetCategoryProviderInterface};
	__property GUID CLSID = {read=GetCLSID};
	__property Mpshelltypes::_di_IContextMenu ContextMenuInterface = {read=GetContextMenuInterface};
	__property Mpshelltypes::_di_IContextMenu2 ContextMenu2Interface = {read=GetContextMenu2Interface};
	__property Mpshelltypes::_di_IContextMenu3 ContextMenu3Interface = {read=GetContextMenu3Interface};
	__property _di_IDataObject DataObjectInterface = {read=GetDataObjectInterface};
	__property TObjectDescription Description = {read=GetDescription, nodefault};
	__property bool DropTarget = {read=GetDropTarget, nodefault};
	__property _di_IDropTarget DropTargetInterface = {read=GetDropTargetInterface};
	__property bool Encrypted = {read=GetEncrypted, nodefault};
	__property TExtractImage* ExtractImage = {read=GetExtractImage};
	__property _di_IExtractIconA ExtractIconAInterface = {read=GetExtractIconAInterface};
	__property _di_IExtractIconW ExtractIconWInterface = {read=GetExtractIconWInterface};
	__property bool FileSystem = {read=GetFileSystem, nodefault};
	__property bool FileSysAncestor = {read=GetFileSysAncestor, nodefault};
	__property bool Folder = {read=GetFolder, nodefault};
	__property bool FreePIDLOnDestroy = {read=GetFreePIDLOnDestroy, write=SetFreePIDLOnDestroy, nodefault};
	__property bool Ghosted = {read=GetGhosted, nodefault};
	__property bool HasPropSheet = {read=GetHasPropSheet, nodefault};
	__property bool HasStorage = {read=GetHasStorage, nodefault};
	__property bool HasSubFolder = {read=GetHasSubFolder, nodefault};
	__property int IconCache = {read=FIconCache, write=FIconCache, nodefault};
	__property bool IconIndexChanged = {read=GetIconIndexChanged, write=SetIconIndexChanged, nodefault};
	__property bool IsSlow = {read=GetIsSlow, nodefault};
	__property bool Link = {read=GetLink, nodefault};
	__property System::WideString InfoTip = {read=GetInfoTip};
	__property System::WideString NameAddressbar = {read=GetNameAddressbar};
	__property System::WideString NameAddressbarInFolder = {read=GetNameAddressbarInFolder};
	__property System::WideString NameForEditing = {read=GetNameForEditing};
	__property System::WideString NameForEditingInFolder = {read=GetNameForEditingInFolder};
	__property System::WideString NameForParsing = {read=GetNameForParsing};
	__property System::WideString NameForParsingInFolder = {read=GetNameForParsingInFolder};
	__property System::WideString NameInFolder = {read=GetNameInFolder};
	__property System::WideString NameNormal = {read=GetNameNormal};
	__property System::WideString NameParseAddress = {read=GetNameParseAddress};
	__property System::WideString NameParseAddressInFolder = {read=GetNameParseAddressInFolder};
	__property int NamespaceID = {read=FNamespaceID, nodefault};
	__property bool NewContent = {read=GetNewContent, nodefault};
	__property bool NonEnumerated = {read=GetNonEnumerated, nodefault};
	__property TNamespace* Parent = {read=GetParent};
	__property _di_IShellFolder ParentShellFolder = {read=GetParentShellFolder};
	__property _di_IShellFolder2 ParentShellFolder2 = {read=GetParentShellFolder2};
	__property Mpshelltypes::_di_IShellDetailsBCB6 ParentShellDetailsInterface = {read=GetParentShellDetailsInterface};
	__property Mpshelltypes::_di_IPropertyStore PropertyStoreInterface = {read=GetPropertyStoreInterface};
	__property Mpshelltypes::_di_IQueryAssociations QueryAssociationsInterface = {read=GetQueryAssociationsInterface};
	__property bool ReadOnly = {read=GetReadOnly, nodefault};
	__property Shlobj::PItemIDList RelativePIDL = {read=FRelativePIDL};
	__property bool Removable = {read=GetRemovable, nodefault};
	__property bool Share = {read=GetShare, nodefault};
	__property _di_IShellFolder ShellFolder = {read=GetShellFolder};
	__property _di_IShellFolder2 ShellFolder2 = {read=GetShellFolder2};
	__property Mpshelltypes::_di_IShellDetailsBCB6 ShellDetailsInterface = {read=GetShellDetailsInterface};
	__property TVirtualShellLink* ShellLink = {read=GetShellLink};
	__property _di_IShellIcon ShellIconInterface = {read=GetShellIconInterface};
	__property Mpshelltypes::_di_IShellIconOverlay ShellIconOverlayInterface = {read=GetShellIconOverlayInterface};
	__property System::WideString ShortFileName = {read=GetShortFileName};
	__property bool SparseFile = {read=GetSparseFile, nodefault};
	__property TNamespaceStates States = {read=FStates, write=FStates, nodefault};
	__property bool Storage = {read=GetStorage, nodefault};
	__property bool StorageAncestor = {read=GetStorageAncestor, nodefault};
	__property bool Stream = {read=GetStream, nodefault};
	__property bool SubFolders = {read=GetSubFolders, nodefault};
	__property bool SubItems = {read=GetSubItems, nodefault};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	__property bool ThreadedDetailLoaded[int Column] = {read=GetThreadedDetailLoaded, write=SetThreadedDetailLoaded};
	__property bool ThreadedDetailLoading[int Column] = {read=GetThreadedDetailLoading, write=SetThreadedDetailLoading};
	__property bool ThreadedIconLoaded = {read=GetThreadedIconLoaded, nodefault};
	__property bool ThreadIconLoading = {read=GetThreadIconLoading, write=SetThreadIconLoading, nodefault};
	__property bool ThreadImageLoaded = {read=GetThreadedImageLoaded, nodefault};
	__property bool ThreadImageLoading = {read=GetThreadedImageLoading, write=SetThreadImageLoading, nodefault};
	__property Mpcommonutilities::TCommonIntegerDynArray TileDetail = {read=FTileDetail, write=FTileDetail};
	__property _di_IQueryInfo QueryInfoInterface = {read=GetQueryInfoInterface};
	__property Windows::PWin32FindDataA Win32FindDataA = {read=FWin32FindDataA};
	__property Windows::PWin32FindDataW Win32FindDataW = {read=FWin32FindDataW};
	__property System::WideString AttributesString = {read=GetAttributesString};
	__property bool Archive = {read=GetArchive, nodefault};
	__property bool Compressed = {read=GetCompressed, nodefault};
	__property System::WideString CreationTime = {read=GetCreationTime};
	__property System::TDateTime CreationDateTime = {read=GetCreationDateTime};
	__property _FILETIME CreationTimeRaw = {read=GetCreationTimeRaw};
	__property bool Directory = {read=GetDirectory, nodefault};
	__property System::WideString Extension = {read=GetExtension};
	__property System::WideString FileName = {read=GetFileName};
	__property System::WideString FileType = {read=GetFileType};
	__property bool Hidden = {read=GetHidden, nodefault};
	__property System::WideString LastAccessTime = {read=GetLastAccessTime};
	__property System::TDateTime LastAccessDateTime = {read=GetLastAccessDateTime};
	__property _FILETIME LastAccessTimeRaw = {read=GetLastAccessTimeRaw};
	__property System::WideString LastWriteTime = {read=GetLastWriteTime};
	__property System::TDateTime LastWriteDateTime = {read=GetLastWriteDateTime};
	__property _FILETIME LastWriteTimeRaw = {read=GetLastWriteTimeRaw};
	__property bool Normal = {read=GetNormal, nodefault};
	__property bool OffLine = {read=GetOffLine, nodefault};
	__property int OverlayIndex = {read=GetOverlayIndex, nodefault};
	__property int OverlayIconIndex = {read=GetOverlayIconIndex, nodefault};
	__property bool ReadOnlyFile = {read=GetReadOnlyFile, nodefault};
	__property bool ReparsePoint = {read=GetReparsePoint, nodefault};
	__property System::WideString SizeOfFile = {read=GetSizeOfFile};
	__property __int64 SizeOfFileInt64 = {read=GetSizeOfFileInt64};
	__property System::WideString SizeOfFileKB = {read=GetSizeOfFileKB};
	__property System::WideString SizeOfFileDiskUsage = {read=GetSizeOfFileDiskUsage};
	__property bool SystemFile = {read=GetSystem, nodefault};
	__property bool Temporary = {read=GetTemporary, nodefault};
	__property bool Valid = {read=GetValid, nodefault};
};


class DELPHICLASS TVirtualNameSpaceList;
class PASCALIMPLEMENTATION TVirtualNameSpaceList : public Contnrs::TObjectList
{
	typedef Contnrs::TObjectList inherited;
	
public:
	TNamespace* operator[](int Index) { return Items[Index]; }
	
private:
	TNamespace* __fastcall GetItems(int Index);
	void __fastcall SetItems(int Index, TNamespace* ANamespace);
	
public:
	HIDESBASE int __fastcall Add(TNamespace* ANamespace);
	void __fastcall FillArray(TNamespaceArray &NamespaceArray);
	HIDESBASE int __fastcall IndexOf(TNamespace* ANamespace);
	HIDESBASE void __fastcall Insert(int Index, TNamespace* ANamespace);
	__property TNamespace* Items[int Index] = {read=GetItems, write=SetItems/*, default*/};
public:
	/* TObjectList.Create */ inline __fastcall TVirtualNameSpaceList(void)/* overload */ : Contnrs::TObjectList() { }
	
public:
	/* TList.Destroy */ inline __fastcall virtual ~TVirtualNameSpaceList(void) { }
	
};


struct TMenuItemLink;
typedef TMenuItemLink *PMenuItemLink;

struct TMenuItemLink
{
	
public:
	unsigned MenuID;
	Menus::TMenuItem* Item;
};


class DELPHICLASS TMenuItemMap;
class PASCALIMPLEMENTATION TMenuItemMap : public Classes::TList
{
	typedef Classes::TList inherited;
	
public:
	PMenuItemLink operator[](int Index) { return Items[Index]; }
	
protected:
	HIDESBASE PMenuItemLink __fastcall Get(int Index);
	HIDESBASE void __fastcall Put(int Index, PMenuItemLink Item);
	
public:
	HIDESBASE PMenuItemLink __fastcall Add(void);
	HIDESBASE PMenuItemLink __fastcall First(void);
	HIDESBASE int __fastcall IndexOf(PMenuItemLink Item);
	virtual void __fastcall Clear(void);
	HIDESBASE PMenuItemLink __fastcall Insert(int Index);
	HIDESBASE PMenuItemLink __fastcall Last(void);
	HIDESBASE int __fastcall Remove(PMenuItemLink Item);
	__property PMenuItemLink Items[int Index] = {read=Get, write=Put/*, default*/};
public:
	/* TList.Destroy */ inline __fastcall virtual ~TMenuItemMap(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TMenuItemMap(void) : Classes::TList() { }
	
};


class PASCALIMPLEMENTATION TCommonShellContextMenu : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	_di_IShellFolder FActiveFolder;
	Mpcommonobjects::TPIDLArray FActivePIDLs;
	bool FCopyValidated;
	Mpshelltypes::_di_IContextMenu FCurrentContextMenu;
	Mpshelltypes::_di_IContextMenu2 FCurrentContextMenu2;
	bool FCutValidated;
	Mpcommonobjects::TCommonShellContextMenuExtensions FExtensions;
	bool FFromDesktop;
	TNamespace* FLocalFocused;
	TNamespaceArray FLocalNamespaces;
	TMenuItemMap* FMenuMap;
	Controls::TWinControl* FMsgWnd;
	Classes::TWndMethod FOldWndProcForContextMenu;
	Classes::TStringList* FKeyStrings;
	TCommonShellMenuEvent FOnHide;
	TCommonShellMenuInvokeEvent FOnInvokeCommand;
	TCommonShellMenuMergeEvent FOnMenuMerge;
	TCommonShellMenuMergeEvent FOnMenuMergeBottom;
	TCommonShellMenuMergeEvent FOnMenuMergeTop;
	TCommonShellMenuItemEvent FOnShellMenuCopy;
	TCommonShellMenuItemEvent FOnShellMenuCreateShortcut;
	TCommonShellMenuItemEvent FOnShellMenuCut;
	TCommonShellMenuItemEvent FOnShellMenuDelete;
	TCommonShellMenuItemEvent FOnShellMenuNewFolder;
	TCommonShellMenuItemEvent FOnShellMenuPaste;
	TCommonShellMenuItemEvent FOnShellMenuPasteLink;
	TCommonShellMenuItemEvent FOnShellMenuPasteShortCut;
	TCommonShellMenuItemEvent FOnShellMenuProperites;
	TCommonShellMenuEvent FOnShow;
	int FRefCount;
	bool FReferenceCounted;
	bool FRenameMenuItem;
	void *FStub;
	bool FPasteMenuItem;
	_di_IDataObject FUIObjectOfDataObject;
	_di_IDropTarget FUIObjectOfDropTarget;
	
protected:
	virtual HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	HIDESBASE int __stdcall _AddRef(void);
	HIDESBASE int __stdcall _Release(void);
	HRESULT __stdcall ParseDisplayName(HWND hwndOwner, void * pbcReserved, System::WideChar * lpszDisplayName, /* out */ unsigned &pchEaten, /* out */ Shlobj::PItemIDList &ppidl, unsigned &dwAttributes);
	HRESULT __stdcall EnumObjects(HWND hwndOwner, unsigned grfFlags, /* out */ _di_IEnumIDList &EnumIDList);
	HRESULT __stdcall BindToObject(Shlobj::PItemIDList pidl, void * pbcReserved, const GUID &riid, /* out */ void *ppvOut);
	HRESULT __stdcall BindToStorage(Shlobj::PItemIDList pidl, void * pbcReserved, const GUID &riid, /* out */ void *ppvObj);
	HRESULT __stdcall CompareIDs(int lParam, Shlobj::PItemIDList pidl1, Shlobj::PItemIDList pidl2);
	HRESULT __stdcall CreateViewObject(HWND hwndOwner, const GUID &riid, /* out */ void *ppvOut);
	HRESULT __stdcall GetAttributesOf(unsigned cidl, Shlobj::PItemIDList &apidl, unsigned &rgfInOut);
	HRESULT __stdcall GetUIObjectOf(HWND hwndOwner, unsigned cidl, Shlobj::PItemIDList &apidl, const GUID &riid, void * prgfInOut, /* out */ void *ppvOut);
	HRESULT __stdcall GetDisplayNameOf(Shlobj::PItemIDList pidl, unsigned uFlags, _STRRET &lpName);
	HRESULT __stdcall SetNameOf(HWND hwndOwner, Shlobj::PItemIDList pidl, System::WideChar * lpszName, unsigned uFlags, Shlobj::PItemIDList &ppidlOut);
	HRESULT __stdcall DragEnter(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall DragOver(int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall DragLeave(void);
	HRESULT __stdcall Drop(const _di_IDataObject dataObj, int grfKeyState, const Types::TPoint pt, int &dwEffect);
	HRESULT __stdcall DefMenuCreateCallback(const _di_IShellFolder psf, HWND wnd, const _di_IDataObject pdtObj, unsigned uMsg, int WParm, int lParm);
	void __fastcall AddMenuKey(System::WideString Key);
	void __fastcall AddMenuKeys(Classes::TStringList* Keys);
	void __fastcall ClearKeys(void);
	virtual void __fastcall DoCopy(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoCreateShortCut(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoCut(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoDelete(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoHide(void);
	virtual void __fastcall DoInvokeCommand(Menus::TMenuItem* MenuItem, Shlobj::PCMInvokeCommandInfo InvokeInfo);
	virtual void __fastcall DoMenuMerge(HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);
	virtual void __fastcall DoMenuMergeBottom(HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);
	virtual void __fastcall DoMenuMergeTop(HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);
	virtual void __fastcall DoNewFolder(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoPaste(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoPasteLink(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoPasteShortCut(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoProperties(_di_IShellFolder ShellFolder, _di_IDataObject DataObject, bool &DoDefault);
	virtual void __fastcall DoShow(void);
	HKEY __fastcall DuplicateKey(HKEY Key);
	bool __fastcall FindCommandId(unsigned CmdID, Menus::TMenuItem* &MenuItem);
	void __stdcall HandleContextMenuMsg(int Msg, int wParam, int lParam, int &Result);
	bool __fastcall InternalShowContextMenu(Controls::TWinControl* Owner, Shlobj::PItemIDList ParentPIDL, Mpcommonobjects::TPIDLArray ChildPIDLs, System::WideString Verb, Types::PPoint Position = (void *)(0x0), TExecuteVerbShift ShiftKeyState = (TExecuteVerbShift)(0x0));
	void __fastcall LoadMultiFolderPIDLArray(TNamespaceArray Namespaces, Mpcommonobjects::TPIDLArray &PIDLs);
	virtual void __fastcall LoadRegistryKeyStrings(TNamespace* Focused) = 0 ;
	void __fastcall WindowProcForContextMenu(Messages::TMessage &Message);
	__property _di_IShellFolder ActiveFolder = {read=FActiveFolder, write=FActiveFolder};
	__property Mpcommonobjects::TPIDLArray ActivePIDLs = {read=FActivePIDLs, write=FActivePIDLs};
	__property bool CopyValidated = {read=FCopyValidated, write=FCopyValidated, nodefault};
	__property Mpshelltypes::_di_IContextMenu2 CurrentContextMenu2 = {read=FCurrentContextMenu2, write=FCurrentContextMenu2};
	__property Mpshelltypes::_di_IContextMenu CurrentContextMenu = {read=FCurrentContextMenu, write=FCurrentContextMenu};
	__property bool CutValidated = {read=FCutValidated, write=FCutValidated, nodefault};
	__property Mpcommonobjects::TCommonShellContextMenuExtensions Extensions = {read=FExtensions, write=FExtensions, nodefault};
	__property bool FromDesktop = {read=FFromDesktop, write=FFromDesktop, nodefault};
	__property Classes::TStringList* KeyStrings = {read=FKeyStrings, write=FKeyStrings};
	__property TNamespace* LocalFocused = {read=FLocalFocused, write=FLocalFocused};
	__property TNamespaceArray LocalNamespaces = {read=FLocalNamespaces, write=FLocalNamespaces};
	__property TMenuItemMap* MenuMap = {read=FMenuMap, write=FMenuMap};
	__property Controls::TWinControl* MsgWnd = {read=FMsgWnd, write=FMsgWnd};
	__property TCommonShellMenuEvent OnHide = {read=FOnHide, write=FOnHide};
	__property TCommonShellMenuInvokeEvent OnInvokeCommand = {read=FOnInvokeCommand, write=FOnInvokeCommand};
	__property TCommonShellMenuMergeEvent OnMenuMerge = {read=FOnMenuMerge, write=FOnMenuMerge};
	__property TCommonShellMenuMergeEvent OnMenuMergeBottom = {read=FOnMenuMergeBottom, write=FOnMenuMergeBottom};
	__property TCommonShellMenuMergeEvent OnMenuMergeTop = {read=FOnMenuMergeTop, write=FOnMenuMergeTop};
	__property TCommonShellMenuItemEvent OnShellMenuCopy = {read=FOnShellMenuCopy, write=FOnShellMenuCopy};
	__property TCommonShellMenuItemEvent OnShellMenuCreateShortCut = {read=FOnShellMenuCreateShortcut, write=FOnShellMenuCreateShortcut};
	__property TCommonShellMenuItemEvent OnShellMenuCut = {read=FOnShellMenuCut, write=FOnShellMenuCut};
	__property TCommonShellMenuItemEvent OnShellMenuDelete = {read=FOnShellMenuDelete, write=FOnShellMenuDelete};
	__property TCommonShellMenuItemEvent OnShellMenuNewFolder = {read=FOnShellMenuNewFolder, write=FOnShellMenuNewFolder};
	__property TCommonShellMenuItemEvent OnShellMenuPaste = {read=FOnShellMenuPaste, write=FOnShellMenuPaste};
	__property TCommonShellMenuItemEvent OnShellMenuPasteLink = {read=FOnShellMenuPasteLink, write=FOnShellMenuPasteLink};
	__property TCommonShellMenuItemEvent OnShellMenuPasteShortCut = {read=FOnShellMenuPasteShortCut, write=FOnShellMenuPasteShortCut};
	__property TCommonShellMenuItemEvent OnShellMenuProperites = {read=FOnShellMenuProperites, write=FOnShellMenuProperites};
	__property TCommonShellMenuEvent OnShow = {read=FOnShow, write=FOnShow};
	__property int RefCount = {read=FRefCount, write=FRefCount, nodefault};
	__property void * Stub = {read=FStub, write=FStub};
	__property bool RenameMenuItem = {read=FRenameMenuItem, write=FRenameMenuItem, default=1};
	__property bool PasteMenuItem = {read=FPasteMenuItem, write=FPasteMenuItem, default=1};
	__property _di_IDataObject UIObjectOfDataObject = {read=FUIObjectOfDataObject, write=FUIObjectOfDataObject};
	__property _di_IDropTarget UIObjectOfDropTarget = {read=FUIObjectOfDropTarget, write=FUIObjectOfDropTarget};
	
public:
	__fastcall virtual TCommonShellContextMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TCommonShellContextMenu(void);
	int __fastcall MergeMenuIntoContextMenu(Menus::TPopupMenu* Menu, HMENU ContextMenu, int Index, unsigned idStart);
	void __fastcall ClearMenuMap(void);
	__property bool ReferenceCounted = {read=FReferenceCounted, write=FReferenceCounted, nodefault};
private:
	void *__IDropTarget;	/* IDropTarget */
	void *__IShellFolder;	/* IShellFolder */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_IDropTarget()
	{
		_di_IDropTarget intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IDropTarget*(void) { return (IDropTarget*)&__IDropTarget; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_IShellFolder()
	{
		_di_IShellFolder intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IShellFolder*(void) { return (IShellFolder*)&__IShellFolder; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator System::_di_IInterface()
	{
		System::_di_IInterface intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IInterface*(void) { return (IInterface*)&__IDropTarget; }
	#endif
	
};


class DELPHICLASS TCommonShellBackgroundContextMenu;
class PASCALIMPLEMENTATION TCommonShellBackgroundContextMenu : public TCommonShellContextMenu
{
	typedef TCommonShellContextMenu inherited;
	
private:
	bool FAutoDetectNewItem;
	Mpcommonobjects::TCommonPIDLList* FFinalItemList;
	Mpcommonobjects::TCommonPIDLList* FInitialItemList;
	TCommonShellMenuNewItemEvent FOnNewItem;
	Menus::TMenuItem* FPaste;
	Menus::TMenuItem* FPasteShortCut;
	Menus::TPopupMenu* FPopupMenuProperties;
	Menus::TPopupMenu* FPopupMenuPaste;
	Menus::TPopupMenu* FPopupMenuPasteShortCut;
	Menus::TMenuItem* FProperties;
	bool FShowPasteItem;
	bool FShowPasteShortCutItem;
	bool FShowPropertiesItem;
	
protected:
	void __fastcall ClickPaste(System::TObject* Sender);
	void __fastcall ClickPasteShortCut(System::TObject* Sender);
	void __fastcall ClickProperties(System::TObject* Sender);
	virtual void __fastcall DoHide(void);
	virtual void __fastcall DoMenuMerge(HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);
	virtual void __fastcall DoMenuMergeBottom(HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);
	virtual void __fastcall DoMenuMergeTop(HMENU Menu, unsigned IndexMenu, unsigned &CmdFirst, unsigned CmdLast, TShellContextMenuFlags Flags);
	virtual void __fastcall DoNewItem(TNamespace* NS);
	virtual void __fastcall DoShow(void);
	virtual void __fastcall LoadRegistryKeyStrings(TNamespace* Focused);
	__property Mpcommonobjects::TCommonPIDLList* FinalItemList = {read=FFinalItemList, write=FFinalItemList};
	__property Mpcommonobjects::TCommonPIDLList* InitialItemList = {read=FInitialItemList, write=FInitialItemList};
	__property Menus::TMenuItem* Paste = {read=FPaste, write=FPaste};
	__property Menus::TMenuItem* PasteShortCut = {read=FPasteShortCut, write=FPasteShortCut};
	__property Menus::TPopupMenu* PopupMenuProperties = {read=FPopupMenuProperties, write=FPopupMenuProperties};
	__property Menus::TPopupMenu* PopupMenuPaste = {read=FPopupMenuPaste, write=FPopupMenuPaste};
	__property Menus::TPopupMenu* PopupMenuPasteShortCut = {read=FPopupMenuPasteShortCut, write=FPopupMenuPasteShortCut};
	__property Menus::TMenuItem* Properties = {read=FProperties, write=FProperties};
	__property RenameMenuItem = {default=0};
	__property PasteMenuItem = {default=0};
	
public:
	__fastcall virtual TCommonShellBackgroundContextMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TCommonShellBackgroundContextMenu(void);
	bool __fastcall EnumCallback(HWND MessageWnd, Shlobj::PItemIDList APIDL, TNamespace* AParent, void * Data, bool &Terminate);
	virtual bool __fastcall ShowContextMenu(Controls::TWinControl* Owner, TNamespace* Root, Types::PPoint Position = (void *)(0x0));
	
__published:
	__property bool AutoDetectNewItem = {read=FAutoDetectNewItem, write=FAutoDetectNewItem, nodefault};
	__property OnHide;
	__property OnInvokeCommand;
	__property OnMenuMerge;
	__property OnMenuMergeBottom;
	__property OnMenuMergeTop;
	__property TCommonShellMenuNewItemEvent OnNewItem = {read=FOnNewItem, write=FOnNewItem};
	__property OnShow;
	__property bool ShowPasteItem = {read=FShowPasteItem, write=FShowPasteItem, default=1};
	__property bool ShowPasteShortCutItem = {read=FShowPasteShortCutItem, write=FShowPasteShortCutItem, default=1};
	__property bool ShowPropertiesItem = {read=FShowPropertiesItem, write=FShowPropertiesItem, default=1};
};


class DELPHICLASS TCommonShellMultiParentContextMenu;
class PASCALIMPLEMENTATION TCommonShellMultiParentContextMenu : public TCommonShellContextMenu
{
	typedef TCommonShellContextMenu inherited;
	
protected:
	virtual void __fastcall LoadRegistryKeyStrings(TNamespace* Focused);
	
public:
	virtual bool __fastcall ExecuteContextMenuVerb(Controls::TWinControl* Owner, TNamespaceArray Namespaces, System::UnicodeString Verb, TExecuteVerbShift ShiftKeyState = (TExecuteVerbShift)(0x0));
	virtual bool __fastcall ShowContextMenu(Controls::TWinControl* Owner, TNamespace* Focused, TNamespaceArray Namespaces, Types::PPoint Position = (void *)(0x0));
	
__published:
	__property OnHide;
	__property OnShellMenuCopy;
	__property OnShellMenuCreateShortCut;
	__property OnShellMenuCut;
	__property OnShellMenuDelete;
	__property OnShellMenuNewFolder;
	__property OnShellMenuPaste;
	__property OnShellMenuPasteLink;
	__property OnShellMenuPasteShortCut;
	__property OnShellMenuProperites;
	__property RenameMenuItem = {default=1};
	__property PasteMenuItem = {default=1};
	__property OnShow;
public:
	/* TCommonShellContextMenu.Create */ inline __fastcall virtual TCommonShellMultiParentContextMenu(Classes::TComponent* AOwner) : TCommonShellContextMenu(AOwner) { }
	/* TCommonShellContextMenu.Destroy */ inline __fastcall virtual ~TCommonShellMultiParentContextMenu(void) { }
	
};


class DELPHICLASS TExplorerThreadInstance;
class PASCALIMPLEMENTATION TExplorerThreadInstance : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	int FMaxRef;
	int FRefCount;
	
public:
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	__property int MaxRef = {read=FMaxRef, nodefault};
	__property int RefCount = {read=FRefCount, write=FRefCount, nodefault};
public:
	/* TObject.Create */ inline __fastcall TExplorerThreadInstance(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TExplorerThreadInstance(void) { }
	
private:
	void *__IInterface;	/* System::IInterface */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator System::_di_IInterface()
	{
		System::_di_IInterface intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IInterface*(void) { return (IInterface*)&__IInterface; }
	#endif
	
};


//-- var, const, procedure ---------------------------------------------------
static const ShortInt VET_DEFAULT_COLUMN_ARRAY_WIDTH = 0x25;
static const ShortInt DefaultDetailColumns = 0x5;
static const ShortInt ID_TIMER_NOTIFY = 0x64;
static const ShortInt ID_TIMER_ENUMBKGND = 0x65;
static const ShortInt ID_TIMER_AUTOSCROLL = 0x66;
static const ShortInt ID_TIMER_SHELLNOTIFY = 0x67;
static const ShortInt SHORTCUT_ICON_INDEX = 0x1d;
static const ShortInt SHELL_NAMESPACE_ID = -1;
static const Word SHGDN_FOREDITING = 0x1000;
static const Word DEFAULTPIDLARRAYSIZE = 0x2000;
static const ShortInt STREAM_VERSION_DEFAULT = -1;
#define STR_IMAGE_THREAD_EVENT L"jdkImageThreadEvent"
extern PACKAGE TColumnWidthArray VET_DEFAULT_COLUMNWIDTHS;
extern PACKAGE StaticArray<int, 4> VET_DEFAULT_DRIVES_COLUMNWIDTHS;
extern PACKAGE StaticArray<int, 2> VET_DEFAULT_CONTROLPANEL_COLUMNWIDTHS;
extern PACKAGE StaticArray<int, 2> VET_DEFAULT_NETWORK_COLUMNWIDTHS;
#define MYCOMPUTER_NSE_PATH L"\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\"\
	"MyComputer\\NameSpace\\"
extern PACKAGE Mpcommonobjects::TCommonPIDLManager* PIDLMgr;
extern PACKAGE TNamespace* DesktopFolder;
extern PACKAGE TNamespace* RecycleBinFolder;
extern PACKAGE TNamespace* PhysicalDesktopFolder;
extern PACKAGE TNamespace* DrivesFolder;
extern PACKAGE TNamespace* HistoryFolder;
extern PACKAGE TNamespace* PrinterFolder;
extern PACKAGE TNamespace* ControlPanelFolder;
extern PACKAGE TNamespace* NetworkNeighborHoodFolder;
extern PACKAGE TNamespace* TemplatesFolder;
extern PACKAGE TNamespace* MyDocumentsFolder;
extern PACKAGE TNamespace* FavoritesFolder;
extern PACKAGE TNamespace* ProgramFilesFolder;
extern PACKAGE TNamespace* UserDocumentsFolder;
extern PACKAGE TSHLimitInputEdit SHLimitInputEdit;
extern PACKAGE TColumnWidthArray VET_ColumnWidths;
extern PACKAGE TSHShellFolderView_Message SHShellFolderView_Message;
extern PACKAGE TExplorerThreadInstance* ExplorerThreadInstance;
extern PACKAGE System::WordBool __stdcall (*AnimateWindow)(HWND Wnd, unsigned dwTime, unsigned dwFlags);
extern PACKAGE bool MP_UseModalDialogs;
extern PACKAGE bool MP_UseSpecialReparsePointOverlay;
extern PACKAGE bool MP_ThreadedShellExecute;
extern PACKAGE Mpshelltypes::TSHSetThreadRef MP_SHSetThreadRef;
extern PACKAGE Mpshelltypes::TSHGetThreadRef MP_SHGetThreadRef;
extern PACKAGE Mpshelltypes::TSHCreateThread MP_SHCreateThread;
extern PACKAGE Mpshelltypes::TSHCreateThreadRef MP_SHCreateThreadRef;
extern PACKAGE Mpshelltypes::TSHReleaseThreadRef MP_SHReleaseThreadRef;
extern PACKAGE Mpshelltypes::TSHSetInstanceExplorer MP_SHSetInstanceExplorer;
extern PACKAGE Mpshelltypes::TSHGetInstanceExplorer MP_SHGetInstanceExplorer;
extern PACKAGE HWND GlobalParentWnd;
extern PACKAGE void __fastcall SaveDefaultColumnWidths(Classes::TStream* S);
extern PACKAGE void __fastcall LoadDefaultColumnWidths(Classes::TStream* S);
extern PACKAGE void __fastcall RestoreDefaultColumnWidths(void);
extern PACKAGE bool __fastcall PIDLIsFolder(Shlobj::PItemIDList APIDL);
extern PACKAGE bool __fastcall SpecialVariableReplacePath(System::WideString &Path);
extern PACKAGE bool __fastcall IsSpecialVariable(System::WideString TestPath, TNamespace* &NS);
extern PACKAGE System::UnicodeString __fastcall GUIDToInterfaceStr(const GUID &riid);
extern PACKAGE TShellContextMenuFlags __fastcall CFM_FlagsToShellContextMenuFlags(unsigned Flags);
extern PACKAGE bool __fastcall ClipboardContainsShellFormats(void);
extern PACKAGE bool __fastcall MapVerbToIntResource(Mpshelltypes::_di_IContextMenu ContextMenu, HMENU Menu, System::WideString Verb, System::WideChar * &IntResVerbW, char * &IntResVerbA);
extern PACKAGE bool __fastcall MPBrowseForFolder(System::WideString Title, Shlobj::PItemIDList RootFolder, Shlobj::PItemIDList InitialPath, TMPBrowseFlags BrowseFlags, Shlobj::PItemIDList &SelectedPath)/* overload */;
extern PACKAGE bool __fastcall MPBrowseForFolder(System::WideString Title, System::WideString RootFolder, System::WideString InitialPath, TMPBrowseFlags BrowseFlags, System::WideString &SelectedPath)/* overload */;
extern PACKAGE int __fastcall MergeMenuIntoContextMenu(Menus::TPopupMenu* Menu, HMENU ContextMenu, int Index, unsigned idStart);
extern PACKAGE Mpcommonobjects::TPIDLArray __fastcall NamespaceToRelativePIDLArray(TNamespaceArray Namespaces);
extern PACKAGE Shlobj::PItemIDList __fastcall FindBrowseableRootPIDL(TNamespace* NS);
extern PACKAGE bool __fastcall IsParentBrowseable(TNamespace* NS);
extern PACKAGE Mpcommonobjects::TPIDLArray __fastcall NamespaceToAbsolutePIDLArray(TNamespaceArray Namespaces);
extern PACKAGE Shlobj::PItemIDList __fastcall PathToPIDL(System::WideString APath, HWND ParentWindowHandle = (HWND)(0x0));
extern PACKAGE System::WideString __fastcall PIDLToPath(Shlobj::PItemIDList APIDL);
extern PACKAGE bool __fastcall IENamespaceShown(bool PerUser);
extern PACKAGE bool __fastcall DirExistsVET(System::WideString APath, bool ShowSystemMessages)/* overload */;
extern PACKAGE bool __fastcall DirExistsVET(TNamespace* NS, bool ShowSystemMessages)/* overload */;
extern PACKAGE int __fastcall RectWidth(const Types::TRect &ARect);
extern PACKAGE int __fastcall RectHeight(const Types::TRect &ARect);
extern PACKAGE bool __fastcall PotentialMappedDrive(TNamespace* NS);
extern PACKAGE unsigned __fastcall FileObjectsToFlags(TFileObjects FileObjects);
extern PACKAGE System::WideString __fastcall FileObjectsToString(TFileObjects FileObjects);
extern PACKAGE bool __fastcall ConvertLocalStrToTFileTime(System::WideString LocalStr, _FILETIME &FileTime);
extern PACKAGE System::WideString __fastcall ConvertTFileTimeToLocalStr(const _FILETIME &AFileTime);
extern PACKAGE System::TDateTime __fastcall ConvertFileTimetoDateTime(const _FILETIME &AFileTime);
extern PACKAGE TNamespace* __fastcall CreateSpecialNamespace(int FolderID);
extern PACKAGE int __fastcall DefaultSystemImageForFileExt(System::WideString FileExt);
extern PACKAGE int __fastcall DefaultSystemImageIndex(TDefaultFolderIcon FolderType);
extern PACKAGE BOOL __stdcall FileIconInit(BOOL FullInit);
extern PACKAGE bool __fastcall CreateShellLink(System::WideString ALnkFilePath, System::WideString ATargetFilePath, System::WideString AnArguments = L"", System::WideString AWorkingDir = L"", System::WideString ADescription = L"", TCmdShow AShowCmd = (TCmdShow)(0xa), System::Word AHotKey = (System::Word)(0x0), THotKeyModifiers AHotKeyModifier = THotKeyModifiers() , System::WideString AnIconLocation = L"", int AnIconIndex = 0x0);
extern PACKAGE System::WideString __fastcall HotKeyModifiersToStr(THotKeyModifiers HotKeyMod);
extern PACKAGE void __fastcall PIDLQuickSort(Mpcommonobjects::TPIDLArray PIDLList, const _di_IShellFolder ParentFolder, int L, int R);
extern PACKAGE void __fastcall PIDLListQuickSort(Mpcommonobjects::TCommonPIDLList* PIDLList, const _di_IShellFolder ParentFolder, int L, int R);
extern PACKAGE bool __fastcall GetDiskFreeSpaceMP(System::WideChar * Drive, unsigned &SectorsperCluster, unsigned &BytesperSector, unsigned &FreeClusters, unsigned &TotalClusters);
extern PACKAGE __int64 __fastcall DriveSize(System::WideChar * Drive)/* overload */;
extern PACKAGE System::WideString __fastcall DriveSize(System::WideChar * Drive, TBtyeSize ByteSize)/* overload */;
extern PACKAGE __int64 __fastcall DriveFreeSpace(System::WideChar * Drive)/* overload */;
extern PACKAGE System::WideString __fastcall DriveFreeSpace(System::WideChar * Drive, TBtyeSize ByteSize)/* overload */;

}	/* namespace Mpshellutilities */
using namespace Mpshellutilities;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpshellutilitiesHPP
