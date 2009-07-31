// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpshelltypes.pas' rev: 20.00

#ifndef MpshelltypesHPP
#define MpshelltypesHPP

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
#include <Comobj.hpp>	// Pascal unit
#include <Commctrl.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------
#include <comdef.h>
#include <oleidl.h>
#include <comcat.h>
#include <comcat.h>
#include <shtypes.h>
#include <winioctl.h>
namespace Mpshellutilities { class TNamespace; }
typedef DelphiInterface<IDropTarget>   _di_IDropTarget;
typedef DelphiInterface<IQueryInfo>    _di_IQueryInfo;
typedef DelphiInterface<IEnumString> _di_IEnumString;
typedef DelphiInterface<IBindCtx> _di_IBindCtx;
typedef DelphiInterface<IClassFactory> _di_IClassFactory;
typedef DelphiInterface<IDeskBand> _di_IDeskBand;
typedef DelphiInterface<IDropSource> _di_IDropSource;
typedef _SHELLDETAILS tagSHELLDETAILS;
namespace Activex { typedef System::DelphiInterface<IEnumGUID> _di_IEnumGUID; }

namespace Mpshelltypes
{
//-- type declarations -------------------------------------------------------
__interface IShellIconOverlayIdentifier;
typedef System::DelphiInterface<IShellIconOverlayIdentifier> _di_IShellIconOverlayIdentifier;
__interface  INTERFACE_UUID("{0C6C4200-C589-11D0-999A-00C04FD655E1}") IShellIconOverlayIdentifier  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall IsMemberOf(System::WideChar * pwszPath, unsigned dwAttrib) = 0 ;
	virtual HRESULT __stdcall GetOverlayInfo(System::WideChar * pwszIconFile, int cchMax, int &pIndex, unsigned &pdwFlags) = 0 ;
	virtual HRESULT __stdcall GetPriority(int &pPriority) = 0 ;
};

typedef StaticArray<System::UnicodeString, 55> Mpshelltypes__1;

#pragma pack(push,1)
struct TNotifyRegister
{
	
public:
	_ITEMIDLIST *ItemIDList;
	BOOL bWatchSubTree;
};
#pragma pack(pop)


struct TDWordItemID;
typedef TDWordItemID *PDWordItemID;

#pragma pack(push,1)
struct TDWordItemID
{
	
public:
	System::Word cb;
	unsigned dwItem1;
	unsigned dwItem2;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TShellNotifyRec
{
	
public:
	_ITEMIDLIST *PIDL1;
	_ITEMIDLIST *PIDL2;
};
#pragma pack(pop)


typedef TShellNotifyRec *PShellNotifyRec;

__interface IContextMenu;
typedef System::DelphiInterface<IContextMenu> _di_IContextMenu;
__interface  INTERFACE_UUID("{000214E4-0000-0000-C000-000000000046}") IContextMenu  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall QueryContextMenu(HMENU Menu, unsigned indexMenu, unsigned idCmdFirst, unsigned idCmdLast, unsigned uFlags) = 0 ;
	virtual HRESULT __stdcall InvokeCommand(_CMINVOKECOMMANDINFOEX &lpici) = 0 ;
	virtual HRESULT __stdcall GetCommandString(unsigned idCmd, unsigned uType, PUINT pwReserved, char * pszName, unsigned cchMax) = 0 ;
};

__interface IContextMenu2;
typedef System::DelphiInterface<IContextMenu2> _di_IContextMenu2;
__interface  INTERFACE_UUID("{000214F4-0000-0000-C000-000000000046}") IContextMenu2  : public IContextMenu 
{
	
public:
	virtual HRESULT __stdcall HandleMenuMsg(unsigned uMsg, int WParam, int LParam) = 0 ;
};

__interface IContextMenu3;
typedef System::DelphiInterface<IContextMenu3> _di_IContextMenu3;
__interface  INTERFACE_UUID("{BCFCE0A0-EC17-11D0-8D10-00A0C90F2719}") IContextMenu3  : public IContextMenu2 
{
	
public:
	virtual HRESULT __stdcall HandleMenuMsg2(unsigned uMsg, int wParam, int lParam, int &lpResult) = 0 ;
};

__interface IShellIconOverlay;
typedef System::DelphiInterface<IShellIconOverlay> _di_IShellIconOverlay;
__interface  INTERFACE_UUID("{7D688A70-C613-11D0-999B-00C04FD655E1}") IShellIconOverlay  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetOverlayIndex(Shlobj::PItemIDList pidl, void *pIndex) = 0 ;
	virtual HRESULT __stdcall GetOverlayIconIndex(Shlobj::PItemIDList pidl, void *pIconIndex) = 0 ;
};

__interface IDropTargetHelper;
typedef System::DelphiInterface<IDropTargetHelper> _di_IDropTargetHelper;
__interface  INTERFACE_UUID("{4657278B-411B-11D2-839A-00C04FD918D0}") IDropTargetHelper  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall DragEnter(HWND hwndTarget, _di_IDataObject pDataObject, Types::TPoint &ppt, int dwEffect) = 0 ;
	virtual HRESULT __stdcall DragLeave(void) = 0 ;
	virtual HRESULT __stdcall DragOver(Types::TPoint &ppt, int dwEffect) = 0 ;
	virtual HRESULT __stdcall Drop(_di_IDataObject pDataObject, Types::TPoint &ppt, int dwEffect) = 0 ;
	virtual HRESULT __stdcall Show(bool fShow) = 0 ;
};

struct TSHDragImage;
typedef TSHDragImage *PSHDragImage;

#pragma pack(push,1)
struct TSHDragImage
{
	
public:
	#pragma pack(push,8)
	tagSIZE sizeDragImage;
	#pragma pack(pop)
	#pragma pack(push,8)
	Types::TPoint ptOffset;
	#pragma pack(pop)
	HBITMAP hbmpDragImage;
	unsigned ColorRef;
};
#pragma pack(pop)


__interface IExtractImage;
typedef System::DelphiInterface<IExtractImage> _di_IExtractImage;
__interface  INTERFACE_UUID("{BB2E617C-0920-11D1-9A0B-00C04FC2D6C1}") IExtractImage  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetLocation(System::WideChar * Buffer, unsigned BufferSize, unsigned &Priority, tagSIZE &Size, unsigned ColorDepth, unsigned &Flags) = 0 ;
	virtual HRESULT __stdcall Extract(HBITMAP &BmpImage) = 0 ;
};

__interface IExtractImage2;
typedef System::DelphiInterface<IExtractImage2> _di_IExtractImage2;
__interface  INTERFACE_UUID("{953BB1EE-93B4-11D1-98A3-00C04FB687DA}") IExtractImage2  : public IExtractImage 
{
	
public:
	virtual HRESULT __stdcall GetTimeStamp(_FILETIME &DateStamp) = 0 ;
};

__interface IShellDetailsBCB6;
typedef System::DelphiInterface<IShellDetailsBCB6> _di_IShellDetailsBCB6;
__interface  INTERFACE_UUID("{000214EC-0000-0000-C000-000000000046}") IShellDetailsBCB6  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetDetailsOf(Shlobj::PItemIDList PIDL, unsigned iColumn, tagSHELLDETAILS &data) = 0 ;
	virtual HRESULT __stdcall ColumnClick(unsigned iColumn) = 0 ;
};

#pragma pack(push,1)
struct tagEXTRASEARCH
{
	
public:
	GUID guidSearch;
	StaticArray<System::WideChar, 80> wszFriendlyName;
	StaticArray<System::WideChar, 2084> wszUrl;
};
#pragma pack(pop)


typedef tagEXTRASEARCH *PExtraSearch;

typedef tagEXTRASEARCH TExtraSearch;

#pragma pack(push,1)
struct tagSHCOLUMNID
{
	
public:
	GUID fmtid;
	unsigned pid;
};
#pragma pack(pop)


typedef tagSHCOLUMNID *PSHColumnID;

typedef tagSHCOLUMNID TSHColumnID;

struct PERSIST_FOLDER_TARGET_INFO
{
	
public:
	_ITEMIDLIST *pidlTargetFolder;
	StaticArray<System::WideChar, 260> szTargetParsingName;
	StaticArray<System::WideChar, 260> szNetworkProvider;
	unsigned dwAttributes;
	int csidl;
};


typedef PERSIST_FOLDER_TARGET_INFO TPersistFolderTargetInfo;

typedef PERSIST_FOLDER_TARGET_INFO *PPersistFolderTargetInfo;

struct TSHColumnInit;
typedef TSHColumnInit *PSHColumnInit;

#pragma pack(push,1)
struct TSHColumnInit
{
	
public:
	unsigned dwFlags;
	unsigned dwReserved;
	StaticArray<System::WideChar, 261> wszFolder;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TSHColumnInfo
{
	
public:
	tagSHCOLUMNID scid;
	System::Word vt;
	unsigned fmt;
	unsigned cChars;
	unsigned csFlags;
	StaticArray<System::WideChar, 80> wszTitle;
	StaticArray<System::WideChar, 128> wszDescription;
};
#pragma pack(pop)


struct TSHColumnData;
typedef TSHColumnData *PSHColumnData;

#pragma pack(push,1)
struct TSHColumnData
{
	
public:
	unsigned dwFlags;
	unsigned dwFileAttributes;
	unsigned dwReserved;
	System::WideChar *pwszExt;
	StaticArray<System::WideChar, 261> wszFile;
};
#pragma pack(pop)


__interface IAutoComplete;
typedef System::DelphiInterface<IAutoComplete> _di_IAutoComplete;
__interface  INTERFACE_UUID("{00BB2762-6A77-11D0-A535-00C04FD7D062}") IAutoComplete  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall Init(HWND hWndEdit, System::_di_IInterface punkACL, System::WideChar * RegKeyPath, System::WideChar * QuickComplete) = 0 ;
	virtual HRESULT __stdcall Enabled(BOOL fEnable) = 0 ;
};

__interface IAutoComplete2;
typedef System::DelphiInterface<IAutoComplete2> _di_IAutoComplete2;
__interface  INTERFACE_UUID("{EAC04BC0-3791-11D2-BB95-0060977B464C}") IAutoComplete2  : public IAutoComplete 
{
	
public:
	virtual HRESULT __stdcall SetOptions(unsigned dwFlag) = 0 ;
	virtual HRESULT __stdcall GetOptions(/* out */ unsigned &pdwFlag) = 0 ;
};

__interface IACList;
typedef System::DelphiInterface<IACList> _di_IACList;
__interface  INTERFACE_UUID("{77A130B0-94FD-11D0-A544-00C04FD7D062}") IACList  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall Expand(System::WideChar * pazExpand) = 0 ;
};

__interface IACList2;
typedef System::DelphiInterface<IACList2> _di_IACList2;
__interface  INTERFACE_UUID("{470141A0-5186-11D2-BBB6-0060977B464C}") IACList2  : public IACList 
{
	
public:
	virtual HRESULT __stdcall SetOptions(unsigned pdwFlag) = 0 ;
	virtual HRESULT __stdcall GetOptions(unsigned &pdwFlag) = 0 ;
};

__interface ICurrentWorkingDirectory;
typedef System::DelphiInterface<ICurrentWorkingDirectory> _di_ICurrentWorkingDirectory;
__interface  INTERFACE_UUID("{91956D21-9276-11D1-921A-006097DF5BD4}") ICurrentWorkingDirectory  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetDirectory(System::WideChar * pwzPath, unsigned cchSize) = 0 ;
	virtual HRESULT __stdcall SetDirectory(System::WideChar * pwzPath) = 0 ;
};

#pragma pack(push,1)
struct tagACTCTXA
{
	
public:
	unsigned cbSize;
	unsigned dwFlags;
	char *lpSource;
	System::Word wProcessorArchitecture;
	System::Word wLangId;
	char *lpAssemblyDirectory;
	char *lpResourceName;
	char *lpApplicationName;
	unsigned hModule;
};
#pragma pack(pop)


typedef tagACTCTXA TActCTXA;

typedef tagACTCTXA *PActCTXA;

#pragma pack(push,1)
struct tagACTCTXW
{
	
public:
	unsigned cbSize;
	unsigned dwFlags;
	System::WideChar *lpSource;
	System::Word wProcessorArchitecture;
	System::Word wLangId;
	System::WideChar *lpAssemblyDirectory;
	System::WideChar *lpResourceName;
	System::WideChar *lpApplicationName;
	unsigned hModule;
};
#pragma pack(pop)


typedef tagACTCTXW TActCTXW;

typedef tagACTCTXW *PActCTXW;

typedef _PROPSHEETPAGEA TPropSheetPageA;

typedef _PROPSHEETPAGEW TPropSheetPageW;

typedef _PROPSHEETPAGEA TPropSheetPage;

typedef unsigned __stdcall (*TThreadProc)(void * lpParameter);

typedef Activex::TOleEnum CommandStateChangeConstants;

typedef Activex::TOleEnum OLECMDID;

typedef Activex::TOleEnum OLECMDF;

typedef Activex::TOleEnum OLECMDEXECOPT;

typedef Activex::TOleEnum tagREADYSTATE;

typedef Activex::TOleEnum ShellWindowTypeConstants;

typedef Activex::TOleEnum ShellWindowFindWindowOptions;

typedef Activex::TOleEnum RefreshConstants;

typedef Activex::TOleEnum BrowserNavConstants;

typedef System::OleVariant *POleVariant1;

__interface IWebBrowser;
typedef System::DelphiInterface<IWebBrowser> _di_IWebBrowser;
__interface  INTERFACE_UUID("{EAB22AC1-30C1-11CF-A7EB-0000C05BAE0B}") IWebBrowser  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall GoBack(void) = 0 ;
	virtual HRESULT __safecall GoForward(void) = 0 ;
	virtual HRESULT __safecall GoHome(void) = 0 ;
	virtual HRESULT __safecall GoSearch(void) = 0 ;
	virtual HRESULT __safecall Navigate(const System::WideString URL, System::OleVariant &Flags, System::OleVariant &TargetFrameName, System::OleVariant &PostData, System::OleVariant &Headers) = 0 ;
	virtual HRESULT __safecall Refresh(void) = 0 ;
	virtual HRESULT __safecall Refresh2(System::OleVariant &Level) = 0 ;
	virtual HRESULT __safecall Stop(void) = 0 ;
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Get_Container(_di_IDispatch &__Get_Container_result) = 0 ;
	virtual HRESULT __safecall Get_Document(_di_IDispatch &__Get_Document_result) = 0 ;
	virtual HRESULT __safecall Get_TopLevelContainer(System::WordBool &__Get_TopLevelContainer_result) = 0 ;
	virtual HRESULT __safecall Get_Type_(System::WideString &__Get_Type__result) = 0 ;
	virtual HRESULT __safecall Get_Left(int &__Get_Left_result) = 0 ;
	virtual HRESULT __safecall Set_Left(int pl) = 0 ;
	virtual HRESULT __safecall Get_Top(int &__Get_Top_result) = 0 ;
	virtual HRESULT __safecall Set_Top(int pl) = 0 ;
	virtual HRESULT __safecall Get_Width(int &__Get_Width_result) = 0 ;
	virtual HRESULT __safecall Set_Width(int pl) = 0 ;
	virtual HRESULT __safecall Get_Height(int &__Get_Height_result) = 0 ;
	virtual HRESULT __safecall Set_Height(int pl) = 0 ;
	virtual HRESULT __safecall Get_LocationName(System::WideString &__Get_LocationName_result) = 0 ;
	virtual HRESULT __safecall Get_LocationURL(System::WideString &__Get_LocationURL_result) = 0 ;
	virtual HRESULT __safecall Get_Busy(System::WordBool &__Get_Busy_result) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Container() { _di_IDispatch __r; HRESULT __hr = Get_Container(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Container = {read=_scw_Get_Container};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Document() { _di_IDispatch __r; HRESULT __hr = Get_Document(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Document = {read=_scw_Get_Document};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_TopLevelContainer() { System::WordBool __r; HRESULT __hr = Get_TopLevelContainer(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool TopLevelContainer = {read=_scw_Get_TopLevelContainer};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Type_() { System::WideString __r; HRESULT __hr = Get_Type_(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Type_ = {read=_scw_Get_Type_};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Left() { int __r; HRESULT __hr = Get_Left(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Left = {read=_scw_Get_Left, write=Set_Left};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Top() { int __r; HRESULT __hr = Get_Top(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Top = {read=_scw_Get_Top, write=Set_Top};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Width() { int __r; HRESULT __hr = Get_Width(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Width = {read=_scw_Get_Width, write=Set_Width};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Height() { int __r; HRESULT __hr = Get_Height(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Height = {read=_scw_Get_Height, write=Set_Height};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_LocationName() { System::WideString __r; HRESULT __hr = Get_LocationName(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString LocationName = {read=_scw_Get_LocationName};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_LocationURL() { System::WideString __r; HRESULT __hr = Get_LocationURL(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString LocationURL = {read=_scw_Get_LocationURL};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_Busy() { System::WordBool __r; HRESULT __hr = Get_Busy(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool Busy = {read=_scw_Get_Busy};
};

__interface IWebBrowserApp;
typedef System::DelphiInterface<IWebBrowserApp> _di_IWebBrowserApp;
__interface  INTERFACE_UUID("{0002DF05-0000-0000-C000-000000000046}") IWebBrowserApp  : public IWebBrowser 
{
	
public:
	virtual HRESULT __safecall Quit(void) = 0 ;
	virtual HRESULT __safecall ClientToWindow(int &pcx, int &pcy) = 0 ;
	virtual HRESULT __safecall PutProperty(const System::WideString Property_, const System::OleVariant vtValue) = 0 ;
	virtual HRESULT __safecall GetProperty(const System::WideString Property_, System::OleVariant &__GetProperty_result) = 0 ;
	virtual HRESULT __safecall Get_Name(System::WideString &__Get_Name_result) = 0 ;
	virtual HRESULT __safecall Get_HWND(int &__Get_HWND_result) = 0 ;
	virtual HRESULT __safecall Get_FullName(System::WideString &__Get_FullName_result) = 0 ;
	virtual HRESULT __safecall Get_Path(System::WideString &__Get_Path_result) = 0 ;
	virtual HRESULT __safecall Get_Visible(System::WordBool &__Get_Visible_result) = 0 ;
	virtual HRESULT __safecall Set_Visible(System::WordBool pBool) = 0 ;
	virtual HRESULT __safecall Get_StatusBar(System::WordBool &__Get_StatusBar_result) = 0 ;
	virtual HRESULT __safecall Set_StatusBar(System::WordBool pBool) = 0 ;
	virtual HRESULT __safecall Get_StatusText(System::WideString &__Get_StatusText_result) = 0 ;
	virtual HRESULT __safecall Set_StatusText(const System::WideString StatusText) = 0 ;
	virtual HRESULT __safecall Get_ToolBar(int &__Get_ToolBar_result) = 0 ;
	virtual HRESULT __safecall Set_ToolBar(int Value) = 0 ;
	virtual HRESULT __safecall Get_MenuBar(System::WordBool &__Get_MenuBar_result) = 0 ;
	virtual HRESULT __safecall Set_MenuBar(System::WordBool Value) = 0 ;
	virtual HRESULT __safecall Get_FullScreen(System::WordBool &__Get_FullScreen_result) = 0 ;
	virtual HRESULT __safecall Set_FullScreen(System::WordBool pbFullScreen) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Name() { System::WideString __r; HRESULT __hr = Get_Name(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Name = {read=_scw_Get_Name};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_HWND() { int __r; HRESULT __hr = Get_HWND(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int HWND = {read=_scw_Get_HWND};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_FullName() { System::WideString __r; HRESULT __hr = Get_FullName(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString FullName = {read=_scw_Get_FullName};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Path() { System::WideString __r; HRESULT __hr = Get_Path(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Path = {read=_scw_Get_Path};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_Visible() { System::WordBool __r; HRESULT __hr = Get_Visible(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool Visible = {read=_scw_Get_Visible, write=Set_Visible};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_StatusBar() { System::WordBool __r; HRESULT __hr = Get_StatusBar(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool StatusBar = {read=_scw_Get_StatusBar, write=Set_StatusBar};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_StatusText() { System::WideString __r; HRESULT __hr = Get_StatusText(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString StatusText = {read=_scw_Get_StatusText, write=Set_StatusText};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_ToolBar() { int __r; HRESULT __hr = Get_ToolBar(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int ToolBar = {read=_scw_Get_ToolBar, write=Set_ToolBar};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_MenuBar() { System::WordBool __r; HRESULT __hr = Get_MenuBar(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool MenuBar = {read=_scw_Get_MenuBar, write=Set_MenuBar};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_FullScreen() { System::WordBool __r; HRESULT __hr = Get_FullScreen(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool FullScreen = {read=_scw_Get_FullScreen, write=Set_FullScreen};
};

__interface IWebBrowser2;
typedef System::DelphiInterface<IWebBrowser2> _di_IWebBrowser2;
__interface  INTERFACE_UUID("{D30C1661-CDAF-11D0-8A3E-00C04FC9E26E}") IWebBrowser2  : public IWebBrowserApp 
{
	
public:
	virtual HRESULT __safecall Navigate2(System::OleVariant &URL, System::OleVariant &Flags, System::OleVariant &TargetFrameName, System::OleVariant &PostData, System::OleVariant &Headers) = 0 ;
	virtual HRESULT __safecall QueryStatusWB(Activex::TOleEnum cmdID, Activex::TOleEnum &__QueryStatusWB_result) = 0 ;
	virtual HRESULT __safecall ExecWB(Activex::TOleEnum cmdID, Activex::TOleEnum cmdexecopt, System::OleVariant &pvaIn, System::OleVariant &pvaOut) = 0 ;
	virtual HRESULT __safecall ShowBrowserBar(System::OleVariant &pvaClsid, System::OleVariant &pvarShow, System::OleVariant &pvarSize) = 0 ;
	virtual HRESULT __safecall Get_ReadyState(Activex::TOleEnum &__Get_ReadyState_result) = 0 ;
	virtual HRESULT __safecall Get_Offline(System::WordBool &__Get_Offline_result) = 0 ;
	virtual HRESULT __safecall Set_Offline(System::WordBool pbOffline) = 0 ;
	virtual HRESULT __safecall Get_Silent(System::WordBool &__Get_Silent_result) = 0 ;
	virtual HRESULT __safecall Set_Silent(System::WordBool pbSilent) = 0 ;
	virtual HRESULT __safecall Get_RegisterAsBrowser(System::WordBool &__Get_RegisterAsBrowser_result) = 0 ;
	virtual HRESULT __safecall Set_RegisterAsBrowser(System::WordBool pbRegister) = 0 ;
	virtual HRESULT __safecall Get_RegisterAsDropTarget(System::WordBool &__Get_RegisterAsDropTarget_result) = 0 ;
	virtual HRESULT __safecall Set_RegisterAsDropTarget(System::WordBool pbRegister) = 0 ;
	virtual HRESULT __safecall Get_TheaterMode(System::WordBool &__Get_TheaterMode_result) = 0 ;
	virtual HRESULT __safecall Set_TheaterMode(System::WordBool pbRegister) = 0 ;
	virtual HRESULT __safecall Get_AddressBar(System::WordBool &__Get_AddressBar_result) = 0 ;
	virtual HRESULT __safecall Set_AddressBar(System::WordBool Value) = 0 ;
	virtual HRESULT __safecall Get_Resizable(System::WordBool &__Get_Resizable_result) = 0 ;
	virtual HRESULT __safecall Set_Resizable(System::WordBool Value) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline Activex::TOleEnum _scw_Get_ReadyState() { Activex::TOleEnum __r; HRESULT __hr = Get_ReadyState(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property Activex::TOleEnum ReadyState = {read=_scw_Get_ReadyState};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_Offline() { System::WordBool __r; HRESULT __hr = Get_Offline(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool Offline = {read=_scw_Get_Offline, write=Set_Offline};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_Silent() { System::WordBool __r; HRESULT __hr = Get_Silent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool Silent = {read=_scw_Get_Silent, write=Set_Silent};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_RegisterAsBrowser() { System::WordBool __r; HRESULT __hr = Get_RegisterAsBrowser(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool RegisterAsBrowser = {read=_scw_Get_RegisterAsBrowser, write=Set_RegisterAsBrowser};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_RegisterAsDropTarget() { System::WordBool __r; HRESULT __hr = Get_RegisterAsDropTarget(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool RegisterAsDropTarget = {read=_scw_Get_RegisterAsDropTarget, write=Set_RegisterAsDropTarget};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_TheaterMode() { System::WordBool __r; HRESULT __hr = Get_TheaterMode(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool TheaterMode = {read=_scw_Get_TheaterMode, write=Set_TheaterMode};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_AddressBar() { System::WordBool __r; HRESULT __hr = Get_AddressBar(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool AddressBar = {read=_scw_Get_AddressBar, write=Set_AddressBar};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_Resizable() { System::WordBool __r; HRESULT __hr = Get_Resizable(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool Resizable = {read=_scw_Get_Resizable, write=Set_Resizable};
};

__interface FolderItemVerb;
typedef System::DelphiInterface<FolderItemVerb> _di_FolderItemVerb;
__interface  INTERFACE_UUID("{08EC3E00-50B0-11CF-960C-0080C7F4EE85}") FolderItemVerb  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Get_Name(System::WideString &__Get_Name_result) = 0 ;
	virtual HRESULT __safecall DoIt(void) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Name() { System::WideString __r; HRESULT __hr = Get_Name(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Name = {read=_scw_Get_Name};
};

__interface FolderItemVerbs;
typedef System::DelphiInterface<FolderItemVerbs> _di_FolderItemVerbs;
__interface  INTERFACE_UUID("{1F8352C0-50B0-11CF-960C-0080C7F4EE85}") FolderItemVerbs  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall Get_Count(int &__Get_Count_result) = 0 ;
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Item(const System::OleVariant index, _di_FolderItemVerb &__Item_result) = 0 ;
	virtual HRESULT __safecall _NewEnum(System::_di_IInterface &___NewEnum_result) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Count() { int __r; HRESULT __hr = Get_Count(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Count = {read=_scw_Get_Count};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
};

__interface FolderItem;
typedef System::DelphiInterface<FolderItem> _di_FolderItem;
__interface  INTERFACE_UUID("{FAC32C80-CBE4-11CE-8350-444553540000}") FolderItem  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Get_Name(System::WideString &__Get_Name_result) = 0 ;
	virtual HRESULT __safecall Set_Name(const System::WideString pbs) = 0 ;
	virtual HRESULT __safecall Get_Path(System::WideString &__Get_Path_result) = 0 ;
	virtual HRESULT __safecall Get_GetLink(_di_IDispatch &__Get_GetLink_result) = 0 ;
	virtual HRESULT __safecall Get_GetFolder(_di_IDispatch &__Get_GetFolder_result) = 0 ;
	virtual HRESULT __safecall Get_IsLink(System::WordBool &__Get_IsLink_result) = 0 ;
	virtual HRESULT __safecall Get_IsFolder(System::WordBool &__Get_IsFolder_result) = 0 ;
	virtual HRESULT __safecall Get_IsFileSystem(System::WordBool &__Get_IsFileSystem_result) = 0 ;
	virtual HRESULT __safecall Get_IsBrowsable(System::WordBool &__Get_IsBrowsable_result) = 0 ;
	virtual HRESULT __safecall Get_ModifyDate(System::TDateTime &__Get_ModifyDate_result) = 0 ;
	virtual HRESULT __safecall Set_ModifyDate(System::TDateTime pdt) = 0 ;
	virtual HRESULT __safecall Get_Size(int &__Get_Size_result) = 0 ;
	virtual HRESULT __safecall Get_type_(System::WideString &__Get_type__result) = 0 ;
	virtual HRESULT __safecall Verbs(_di_FolderItemVerbs &__Verbs_result) = 0 ;
	virtual HRESULT __safecall InvokeVerb(const System::OleVariant vVerb) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Name() { System::WideString __r; HRESULT __hr = Get_Name(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Name = {read=_scw_Get_Name, write=Set_Name};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Path() { System::WideString __r; HRESULT __hr = Get_Path(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Path = {read=_scw_Get_Path};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_GetLink() { _di_IDispatch __r; HRESULT __hr = Get_GetLink(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch GetLink = {read=_scw_Get_GetLink};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_GetFolder() { _di_IDispatch __r; HRESULT __hr = Get_GetFolder(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch GetFolder = {read=_scw_Get_GetFolder};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_IsLink() { System::WordBool __r; HRESULT __hr = Get_IsLink(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool IsLink = {read=_scw_Get_IsLink};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_IsFolder() { System::WordBool __r; HRESULT __hr = Get_IsFolder(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool IsFolder = {read=_scw_Get_IsFolder};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_IsFileSystem() { System::WordBool __r; HRESULT __hr = Get_IsFileSystem(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool IsFileSystem = {read=_scw_Get_IsFileSystem};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_IsBrowsable() { System::WordBool __r; HRESULT __hr = Get_IsBrowsable(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool IsBrowsable = {read=_scw_Get_IsBrowsable};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::TDateTime _scw_Get_ModifyDate() { System::TDateTime __r; HRESULT __hr = Get_ModifyDate(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::TDateTime ModifyDate = {read=_scw_Get_ModifyDate, write=Set_ModifyDate};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Size() { int __r; HRESULT __hr = Get_Size(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Size = {read=_scw_Get_Size};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_type_() { System::WideString __r; HRESULT __hr = Get_type_(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString type_ = {read=_scw_Get_type_};
};

__interface FolderItem2;
typedef System::DelphiInterface<FolderItem2> _di_FolderItem2;
__interface  INTERFACE_UUID("{EDC817AA-92B8-11D1-B075-00C04FC33AA5}") FolderItem2  : public FolderItem 
{
	
public:
	virtual HRESULT __safecall InvokeVerbEx(const System::OleVariant vVerb, const System::OleVariant vArgs) = 0 ;
	virtual HRESULT __safecall ExtendedProperty(const System::WideString bstrPropName, System::OleVariant &__ExtendedProperty_result) = 0 ;
};

__interface FolderItems;
typedef System::DelphiInterface<FolderItems> _di_FolderItems;
__interface  INTERFACE_UUID("{744129E0-CBE5-11CE-8350-444553540000}") FolderItems  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall Get_Count(int &__Get_Count_result) = 0 ;
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Item(const System::OleVariant index, _di_FolderItem &__Item_result) = 0 ;
	virtual HRESULT __safecall _NewEnum(System::_di_IInterface &___NewEnum_result) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_Count() { int __r; HRESULT __hr = Get_Count(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int Count = {read=_scw_Get_Count};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
};

__interface FolderItems2;
typedef System::DelphiInterface<FolderItems2> _di_FolderItems2;
__interface  INTERFACE_UUID("{C94F0AD0-F363-11D2-A327-00C04F8EEC7F}") FolderItems2  : public FolderItems 
{
	
public:
	virtual HRESULT __safecall InvokeVerbEx(const System::OleVariant vVerb, const System::OleVariant vArgs) = 0 ;
};

__interface FolderItems3;
typedef System::DelphiInterface<FolderItems3> _di_FolderItems3;
__interface  INTERFACE_UUID("{EAA7C309-BBEC-49D5-821D-64D966CB667F}") FolderItems3  : public FolderItems2 
{
	
public:
	virtual HRESULT __safecall Filter(int grfFlags, const System::WideString bstrFileSpec) = 0 ;
	virtual HRESULT __safecall Get_Verbs(_di_FolderItemVerbs &__Get_Verbs_result) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_FolderItemVerbs _scw_Get_Verbs() { _di_FolderItemVerbs __r; HRESULT __hr = Get_Verbs(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_FolderItemVerbs Verbs = {read=_scw_Get_Verbs};
};

__interface Folder;
typedef System::DelphiInterface<Folder> _di_Folder;
__interface  INTERFACE_UUID("{BBCBDE60-C3FF-11CE-8350-444553540000}") Folder  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall Get_Title(System::WideString &__Get_Title_result) = 0 ;
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Get_ParentFolder(_di_Folder &__Get_ParentFolder_result) = 0 ;
	virtual HRESULT __safecall Items(_di_FolderItems &__Items_result) = 0 ;
	virtual HRESULT __safecall ParseName(const System::WideString bName, _di_FolderItem &__ParseName_result) = 0 ;
	virtual HRESULT __safecall NewFolder(const System::WideString bName, const System::OleVariant vOptions) = 0 ;
	virtual HRESULT __safecall MoveHere(const System::OleVariant vItem, const System::OleVariant vOptions) = 0 ;
	virtual HRESULT __safecall CopyHere(const System::OleVariant vItem, const System::OleVariant vOptions) = 0 ;
	virtual HRESULT __safecall GetDetailsOf(const System::OleVariant vItem, int iColumn, System::WideString &__GetDetailsOf_result) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WideString _scw_Get_Title() { System::WideString __r; HRESULT __hr = Get_Title(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WideString Title = {read=_scw_Get_Title};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_Folder _scw_Get_ParentFolder() { _di_Folder __r; HRESULT __hr = Get_ParentFolder(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_Folder ParentFolder = {read=_scw_Get_ParentFolder};
};

__interface Folder2;
typedef System::DelphiInterface<Folder2> _di_Folder2;
__interface  INTERFACE_UUID("{F0D2D8EF-3890-11D2-BF8B-00C04FB93661}") Folder2  : public Folder 
{
	
public:
	virtual HRESULT __safecall Get_Self(_di_FolderItem &__Get_Self_result) = 0 ;
	virtual HRESULT __safecall Get_OfflineStatus(int &__Get_OfflineStatus_result) = 0 ;
	virtual HRESULT __safecall Synchronize(void) = 0 ;
	virtual HRESULT __safecall Get_HaveToShowWebViewBarricade(System::WordBool &__Get_HaveToShowWebViewBarricade_result) = 0 ;
	virtual HRESULT __safecall DismissedWebViewBarricade(void) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_FolderItem _scw_Get_Self() { _di_FolderItem __r; HRESULT __hr = Get_Self(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_FolderItem Self = {read=_scw_Get_Self};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_OfflineStatus() { int __r; HRESULT __hr = Get_OfflineStatus(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int OfflineStatus = {read=_scw_Get_OfflineStatus};
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_HaveToShowWebViewBarricade() { System::WordBool __r; HRESULT __hr = Get_HaveToShowWebViewBarricade(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool HaveToShowWebViewBarricade = {read=_scw_Get_HaveToShowWebViewBarricade};
};

__interface Folder3;
typedef System::DelphiInterface<Folder3> _di_Folder3;
__interface  INTERFACE_UUID("{A7AE5F64-C4D7-4D7F-9307-4D24EE54B841}") Folder3  : public Folder2 
{
	
public:
	virtual HRESULT __safecall Get_ShowWebViewBarricade(System::WordBool &__Get_ShowWebViewBarricade_result) = 0 ;
	virtual HRESULT __safecall Set_ShowWebViewBarricade(System::WordBool pbShowWebViewBarricade) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline System::WordBool _scw_Get_ShowWebViewBarricade() { System::WordBool __r; HRESULT __hr = Get_ShowWebViewBarricade(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property System::WordBool ShowWebViewBarricade = {read=_scw_Get_ShowWebViewBarricade, write=Set_ShowWebViewBarricade};
};

__interface IShellFolderViewDual;
typedef System::DelphiInterface<IShellFolderViewDual> _di_IShellFolderViewDual;
__interface  INTERFACE_UUID("{E7A1AF80-4D96-11CF-960C-0080C7F4EE85}") IShellFolderViewDual  : public IDispatch 
{
	
public:
	virtual HRESULT __safecall Get_Application(_di_IDispatch &__Get_Application_result) = 0 ;
	virtual HRESULT __safecall Get_Parent(_di_IDispatch &__Get_Parent_result) = 0 ;
	virtual HRESULT __safecall Get_Folder(_di_Folder &__Get_Folder_result) = 0 ;
	virtual HRESULT __safecall SelectedItems(_di_FolderItems &__SelectedItems_result) = 0 ;
	virtual HRESULT __safecall Get_FocusedItem(_di_FolderItem &__Get_FocusedItem_result) = 0 ;
	virtual HRESULT __safecall SelectItem(System::OleVariant &pvfi, int dwFlags) = 0 ;
	virtual HRESULT __safecall PopupItemMenu(const _di_FolderItem pfi, const System::OleVariant vx, const System::OleVariant vy, System::WideString &__PopupItemMenu_result) = 0 ;
	virtual HRESULT __safecall Get_Script(_di_IDispatch &__Get_Script_result) = 0 ;
	virtual HRESULT __safecall Get_ViewOptions(int &__Get_ViewOptions_result) = 0 ;
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Application() { _di_IDispatch __r; HRESULT __hr = Get_Application(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Application = {read=_scw_Get_Application};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Parent() { _di_IDispatch __r; HRESULT __hr = Get_Parent(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Parent = {read=_scw_Get_Parent};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_Folder _scw_Get_Folder() { _di_Folder __r; HRESULT __hr = Get_Folder(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_Folder Folder = {read=_scw_Get_Folder};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_FolderItem _scw_Get_FocusedItem() { _di_FolderItem __r; HRESULT __hr = Get_FocusedItem(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_FolderItem FocusedItem = {read=_scw_Get_FocusedItem};
	#pragma option push -w-inl
	/* safecall wrapper */ inline _di_IDispatch _scw_Get_Script() { _di_IDispatch __r; HRESULT __hr = Get_Script(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property _di_IDispatch Script = {read=_scw_Get_Script};
	#pragma option push -w-inl
	/* safecall wrapper */ inline int _scw_Get_ViewOptions() { int __r; HRESULT __hr = Get_ViewOptions(__r); System::CheckSafecallResult(__hr); return __r; }
	#pragma option pop
	__property int ViewOptions = {read=_scw_Get_ViewOptions};
};

__dispinterface DShellFolderViewEvents;
typedef System::DelphiInterface<DShellFolderViewEvents> _di_DShellFolderViewEvents;
__dispinterface  INTERFACE_UUID("{62112AA2-EBE4-11CF-A5FB-0020AFE7292D}") DShellFolderViewEvents  : public IDispatch 
{
	
};

struct QCMINFO_IDMAP_PLACEMENT
{
	
public:
	unsigned id;
	unsigned fFlags;
};


typedef QCMINFO_IDMAP_PLACEMENT *PQCMINFO_IDMAP_PLACEMENT;

typedef QCMINFO_IDMAP_PLACEMENT TQCMInfoIDMapPlacement;

typedef PQCMINFO_IDMAP_PLACEMENT PQCMInfoIDMapPlacement;

struct QCMINFO_IDMAP
{
	
public:
	unsigned nMaxIDs;
	StaticArray<QCMINFO_IDMAP_PLACEMENT, 1> pIdList;
};


typedef QCMINFO_IDMAP *PQCMINFO_IDMAP;

struct QCMINFO
{
	
public:
	HMENU menu;
	unsigned indexMenu;
	unsigned idCmdFirst;
	unsigned idCmdLast;
	QCMINFO_IDMAP *pIDMap;
};


typedef QCMINFO *PQCMINFO;

typedef QCMINFO TQCMInfo;

struct TBINFO
{
	
public:
	unsigned cbuttons;
	unsigned uFlags;
};


typedef TBINFO TTBInfo;

typedef TBINFO *PTBInfo;

#pragma pack(push,1)
struct tagTCategoryInfo
{
	
public:
	unsigned CategoryInfo;
	StaticArray<System::WideChar, 260> wscName;
};
#pragma pack(pop)


__interface ICategorizer;
typedef System::DelphiInterface<ICategorizer> _di_ICategorizer;
__interface  INTERFACE_UUID("{A3B14589-9174-49A8-89A3-06A1AE2B9BA7}") ICategorizer  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetDescription(System::WideChar * pszDesc, unsigned cch) = 0 ;
	virtual HRESULT __stdcall GetCategory(unsigned cidl, Shlobj::PItemIDList apidl, System::Word *rgCategoryIds) = 0 ;
	virtual HRESULT __stdcall GetCategoryInfo(unsigned dwCategoryId, tagTCategoryInfo &pci) = 0 ;
	virtual HRESULT __stdcall CompareCategory(unsigned csfFlags, unsigned dwCategoryId1, unsigned dwCategoryId2) = 0 ;
};

__interface ICategoryProvider;
typedef System::DelphiInterface<ICategoryProvider> _di_ICategoryProvider;
__interface  INTERFACE_UUID("{9AF64809-5864-4C26-A720-C1F78C086EE3}") ICategoryProvider  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall CanCategorizeOnSCID(tagSHCOLUMNID &pscid) = 0 ;
	virtual HRESULT __stdcall GetDefaultCategory(const GUID &pguid, tagSHCOLUMNID &pscid) = 0 ;
	virtual HRESULT __stdcall GetCategoryForSCID(tagSHCOLUMNID &pscid, GUID &pguid) = 0 ;
	virtual HRESULT __stdcall EnumCategories(/* out */ Activex::_di_IEnumGUID &penum) = 0 ;
	virtual HRESULT __stdcall GetCategoryName(const GUID &pguid, System::WideChar * pszName, unsigned cch) = 0 ;
	virtual HRESULT __stdcall CreateCategory(const GUID &pguid, const GUID &riid, /* out */ _di_ICategorizer &ppv) = 0 ;
};

#pragma option push -b-
enum TBrowserFrameOption { bfoBrowserPersistSettings, bfoRenameFolderOptionsToInternet, bfoBothOptions, bfoPreferInternetShortcut, bfoBrowseNoInNewProcess, bfoEnableHyperlinkTracking, bfoUseIEOfflineSupport, bfoSubstituteInternetStartPage, bfoUseIELogoBanding, bfoAddIEToCaptionBar, bfoUseDialupRef, bfoUseIEToolbar, bfoNoParentFolderSupport, bfoNoReopenNextRestart, bfoGoHomePage, bfoPreferIEProcess, bfoShowNavigationCancelled };
#pragma option pop

typedef Set<TBrowserFrameOption, bfoBrowserPersistSettings, bfoShowNavigationCancelled>  TBrowserFrameOptions;

__interface IBrowserFrameOptions;
typedef System::DelphiInterface<IBrowserFrameOptions> _di_IBrowserFrameOptions;
__interface  INTERFACE_UUID("{10DF43C8-1DBE-11D3-8B34-006097DF5BD4}") IBrowserFrameOptions  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetFrameOptions(unsigned dwRequested, unsigned &pdwResult) = 0 ;
};

__interface IQueryAssociations;
typedef System::DelphiInterface<IQueryAssociations> _di_IQueryAssociations;
__interface  INTERFACE_UUID("{C46CA590-3C3F-11D2-BEE6-0000F805CA57}") IQueryAssociations  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall Init(unsigned flags, System::WideChar * pwszAssoc, HKEY hkProgid, HWND hwnd) = 0 ;
	virtual HRESULT __stdcall GetString(unsigned flags, unsigned str, System::WideChar * pwszExtra, System::WideChar * pwszOut, unsigned &pcchOut) = 0 ;
	virtual HRESULT __stdcall GetKey(unsigned flags, unsigned key, System::WideChar * pwszExtra, HKEY &phkeyOut) = 0 ;
	virtual HRESULT __stdcall GetData(unsigned flags, unsigned data, System::WideChar * pwszExtra, /* out */ void * &pvOut, unsigned &pcbOut) = 0 ;
	virtual HRESULT __stdcall GetEnum(unsigned flags, unsigned assocenum, System::WideChar * pszExtra, const GUID &riid, /* out */ void * &ppvOut) = 0 ;
};

__interface IImageList;
typedef System::DelphiInterface<IImageList> _di_IImageList;
__interface  INTERFACE_UUID("{46EB5926-582E-4017-9FDF-E8998DAA0950}") IImageList  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall Add(HBITMAP Image, HBITMAP Mask, int &Index) = 0 ;
	virtual HRESULT __stdcall ReplaceIcon(int IndexToReplace, HICON Icon, int &Index) = 0 ;
	virtual HRESULT __stdcall SetOverlayImage(int iImage, int iOverlay) = 0 ;
	virtual HRESULT __stdcall Replace(int Index, HBITMAP Image, HBITMAP Mask) = 0 ;
	virtual HRESULT __stdcall AddMasked(HBITMAP Image, unsigned MaskColor, int &Index) = 0 ;
	virtual HRESULT __stdcall Draw(_IMAGELISTDRAWPARAMS &DrawParams) = 0 ;
	virtual HRESULT __stdcall Remove(int Index) = 0 ;
	virtual HRESULT __stdcall GetIcon(int Index, unsigned Flags, HICON &Icon) = 0 ;
	virtual HRESULT __stdcall GetImageInfo(int Index, _IMAGEINFO &ImageInfo) = 0 ;
	virtual HRESULT __stdcall Copy(int iDest, System::_di_IInterface SourceList, int iSource, unsigned Flags) = 0 ;
	virtual HRESULT __stdcall Merge(int i1, System::_di_IInterface List2, int i2, int dx, int dy, const GUID ID, /* out */ void *ppvOut) = 0 ;
	virtual HRESULT __stdcall Clone(const GUID ID, /* out */ void *ppvOut) = 0 ;
	virtual HRESULT __stdcall GetImageRect(int Index, Types::TRect &rc) = 0 ;
	virtual HRESULT __stdcall GetIconSize(int &cx, int &cy) = 0 ;
	virtual HRESULT __stdcall SetIconSize(int cx, int cy) = 0 ;
	virtual HRESULT __stdcall GetImageCount(int &Count) = 0 ;
	virtual HRESULT __stdcall SetImageCount(unsigned NewCount) = 0 ;
	virtual HRESULT __stdcall SetBkColor(unsigned BkColor, unsigned &OldColor) = 0 ;
	virtual HRESULT __stdcall GetBkColor(unsigned &BkColor) = 0 ;
	virtual HRESULT __stdcall BeginDrag(int iTrack, int dxHotSpot, int dyHotSpot) = 0 ;
	virtual HRESULT __stdcall EndDrag(void) = 0 ;
	virtual HRESULT __stdcall DragEnter(HWND hWndLock, int x, int y) = 0 ;
	virtual HRESULT __stdcall DragLieave(HWND hWndLock) = 0 ;
	virtual HRESULT __stdcall DragMove(int x, int y) = 0 ;
	virtual HRESULT __stdcall SetDragCursorImage(System::_di_IInterface Image, int iDrag, int dxHotSpot, int dyHotSpot) = 0 ;
	virtual HRESULT __stdcall DragShowNoLock(BOOL fShow) = 0 ;
	virtual HRESULT __stdcall GetDragImage(Types::TPoint &CurrentPos, Types::TPoint &HotSpot, const GUID ID, /* out */ void *ppvOut) = 0 ;
	virtual HRESULT __stdcall GetImageFlags(int i, unsigned dwFlags) = 0 ;
	virtual HRESULT __stdcall GetOverlayImage(int iOverlay, int &iIndex) = 0 ;
};

typedef HRESULT __stdcall (*TSHGetImageList)(int iImageList, const GUID &RefID, /* out */ void *ImageList);

typedef _IMAGELISTDRAWPARAMS *PImageListDrawParams;

typedef _IMAGELISTDRAWPARAMS TImageListDrawParams;

struct TDFMICS;
typedef TDFMICS *PDFMICS;

#pragma pack(push,1)
struct TDFMICS
{
	
public:
	unsigned cbSize;
	unsigned fMask;
	int lParam;
	unsigned idCmdFirst;
	unsigned idDefMax;
	_CMINVOKECOMMANDINFO *pici;
	System::_di_IInterface punkSite;
};
#pragma pack(pop)


typedef HRESULT __stdcall (*TFNDFMCallback)(_di_IShellFolder psf, HWND wnd, _di_IDataObject pdtObj, unsigned uMsg, int WParm, int lParm);

__interface IShellFolderViewCB;
typedef System::DelphiInterface<IShellFolderViewCB> _di_IShellFolderViewCB;
__interface  INTERFACE_UUID("{2047E320-F2A9-11CE-AE65-08002B2E1262}") IShellFolderViewCB  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall MessageSFVCB(unsigned uMsg, int WParam, int LParam) = 0 ;
};

#pragma pack(push,1)
struct TSFVM_WEBVIEW_CONTENT_DATA
{
	
public:
	int l1;
	int l2;
	System::_di_IInterface pUnk;
	System::_di_IInterface pUnk2;
	_di_IEnumIDList pEnum;
};
#pragma pack(pop)


typedef TSFVM_WEBVIEW_CONTENT_DATA *PSFVM_WEBVIEW_CONTENT_DATA;

struct TSFVM_WEBVIEW_TASKSECTION_DATA
{
	
public:
	System::_di_IInterface pEnum;
	System::_di_IInterface pEnum2;
};


typedef TSFVM_WEBVIEW_TASKSECTION_DATA *PSFVM_WEBVIEW_TASKSECTION_DATA;

struct TSFVM_WEBVIEW_THEME_DATA
{
	
public:
	System::WideChar *pszTheme;
};


typedef TSFVM_WEBVIEW_THEME_DATA *PSFVM_WEBVIEW_THEME_DATA;

struct TSFVM_WEBVIEW_LAYOUT_DATA
{
	
public:
	unsigned flags;
	System::_di_IInterface pUnk;
};


typedef TSFVM_WEBVIEW_LAYOUT_DATA *PSFVM_WEBVIEW_LAYOUT_DATA;

struct TSFVCBSelectInfo;
typedef TSFVCBSelectInfo *PSFVCBSelectInfo;

struct TSFVCBSelectInfo
{
	
public:
	unsigned uOldState;
	unsigned uNewState;
	_ITEMIDLIST *pidl;
};


struct TBDDDATA;
typedef TBDDDATA *PBDDDATA;

#pragma pack(push,1)
struct TBDDDATA
{
	
public:
	HWND hwndFrom;
	System::Variant *pva;
	unsigned dwUnused;
};
#pragma pack(pop)


__interface IShellItem;
typedef System::DelphiInterface<IShellItem> _di_IShellItem;
__interface  INTERFACE_UUID("{43826D1E-E718-42EE-BC55-A1E261C37BFE}") IShellItem  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall BindToHandler(_di_IBindCtx pbc, const GUID rbhid, const GUID &riid, /* out */ void * &ppvOut) = 0 ;
	virtual HRESULT __stdcall GetParent(_di_IShellItem &ppsi) = 0 ;
	virtual HRESULT __stdcall GetDisplayName(unsigned sigdnName, System::WideChar * &ppszName) = 0 ;
	virtual HRESULT __stdcall GetAttributes(unsigned sfgaoMask, unsigned &psfgaoAttribs) = 0 ;
	virtual HRESULT __stdcall Compare(_di_IShellItem psi, unsigned hint, int &piOrder) = 0 ;
};

__interface IEnumShellItems;
typedef System::DelphiInterface<IEnumShellItems> _di_IEnumShellItems;
__interface  INTERFACE_UUID("{4670AC35-34A6-4D2B-B7B6-CD665C6189A5}") IEnumShellItems  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall Next(unsigned celt, /* out */ _di_IShellItem &rgelt, /* out */ unsigned &pceltFetched) = 0 ;
	virtual HRESULT __stdcall Skip(unsigned celt) = 0 ;
	virtual HRESULT __stdcall Reset(void) = 0 ;
	virtual HRESULT __stdcall Clone(/* out */ _di_IEnumShellItems &ppenum) = 0 ;
};

__interface IShellItemArray;
typedef System::DelphiInterface<IShellItemArray> _di_IShellItemArray;
__interface  INTERFACE_UUID("{90CF20DE-73B4-4AA4-BA7A-82FF310AF24A}") IShellItemArray  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall BindToHandler(_di_IBindCtx pbc, const GUID &rbhid, const GUID &riid, /* out */ void *ppvOut) = 0 ;
	virtual HRESULT __stdcall GetAttrributes(int nEnum, unsigned dwRequested, /* out */ unsigned &pdwResult) = 0 ;
	virtual HRESULT __stdcall GetCount(/* out */ unsigned &pCount) = 0 ;
	virtual HRESULT __stdcall GetItemAt(unsigned nIndex, /* out */ _di_IShellItem &ppItem) = 0 ;
	virtual HRESULT __stdcall EnumItems(/* out */ _di_IEnumShellItems &enumShellItems) = 0 ;
};

__interface IUIElement;
typedef System::DelphiInterface<IUIElement> _di_IUIElement;
__interface  INTERFACE_UUID("{EC6FE84F-DC14-4FBB-889F-EA50FE27FE0F}") IUIElement  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall get_Name(_di_IShellItemArray pItemArray, System::WideChar * &bstrName) = 0 ;
	virtual HRESULT __stdcall get_Icon(_di_IShellItemArray pItemArray, System::WideChar * &bstrName) = 0 ;
	virtual HRESULT __stdcall get_Tooltip(_di_IShellItemArray pItemArray, System::WideChar * &bstrName) = 0 ;
};

struct TDetailsInfo;
typedef TDetailsInfo *PDetailsInfo;

#pragma pack(push,1)
struct TDetailsInfo
{
	
public:
	_ITEMIDLIST *pidl;
	int Fmt;
	int cxChar;
	#pragma pack(push,8)
	_STRRET str;
	#pragma pack(pop)
	int iImage;
};
#pragma pack(pop)


typedef HRESULT __stdcall (*TShellViewExProc)(_di_IShellView psvOuter, _di_IShellFolder psf, HWND hwndMain, unsigned uMsg, int wParam, int lParam);

#pragma pack(push,1)
struct TShellViewCreate
{
	
public:
	unsigned dwSize;
	_di_IShellFolder pShellFolder;
	_di_IShellView psvOuter;
	_di_IShellFolderViewCB pfnCallback;
};
#pragma pack(pop)


typedef HRESULT __stdcall (*TSHCreateShellFolderView)(TShellViewCreate &psvcbi, /* out */ void *ppv);

struct BANDSITEINFO
{
	
public:
	unsigned dwMask;
	unsigned dwState;
	unsigned dwStyle;
};


typedef BANDSITEINFO TBandSiteInfo;

typedef BANDSITEINFO *PBandSiteInfo;

__interface IBandSite;
typedef System::DelphiInterface<IBandSite> _di_IBandSite;
__interface  INTERFACE_UUID("{4CF504B0-DE96-11D0-8B3F-00A0C911E8E5}") IBandSite  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall AddBand(System::_di_IInterface pUnk) = 0 ;
	virtual HRESULT __stdcall EnumBands(unsigned Band, unsigned &pdwBandID) = 0 ;
	virtual HRESULT __stdcall QueryBand(unsigned BandID, _di_IDeskBand &ppstb, unsigned &pdwState, System::WideChar * pszName, int cchName) = 0 ;
	virtual HRESULT __stdcall SetBandState(unsigned dwBandID, unsigned dwMask, unsigned dwState) = 0 ;
	virtual HRESULT __stdcall RemoveBand(unsigned dwBandID) = 0 ;
	virtual HRESULT __stdcall GetBandObject(unsigned dwBandID, const GUID &riid, /* out */ void * &ppv) = 0 ;
	virtual HRESULT __stdcall SetBandSiteInfo(const BANDSITEINFO &pbsinfo) = 0 ;
	virtual HRESULT __stdcall GetBandSiteInfo(BANDSITEINFO &pbsInfo) = 0 ;
};

typedef unsigned __stdcall (*TFindFirstFileExW)(System::WideChar * lpFileName, unsigned fInfoLevelId, _WIN32_FIND_DATAW &lpFindFileData, unsigned fSearchOp, void * lpSearchFilter, unsigned dwAdditionalFlags);

typedef unsigned __stdcall (*TFindFirstFileExA)(System::WideChar * lpFileName, unsigned fInfoLevelId, _WIN32_FIND_DATAW &lpFindFileData, unsigned fSearchOp, void * lpSearchFilter, unsigned dwAdditionalFlags);

#pragma pack(push,1)
struct _tagpropertykey
{
	
public:
	GUID fmtid;
	unsigned pid;
};
#pragma pack(pop)


typedef _tagpropertykey *PPropertyKey;

typedef _tagpropertykey TPropertyKey;

__interface IPropertyStore;
typedef System::DelphiInterface<IPropertyStore> _di_IPropertyStore;
__interface  INTERFACE_UUID("{886D8EEB-8CF2-4446-8D02-CDBA1DBDCF99}") IPropertyStore  : public System::IInterface 
{
	
public:
	virtual HRESULT __stdcall GetCount(/* out */ unsigned &cProps) = 0 ;
	virtual HRESULT __stdcall GetAt(unsigned iProp, /* out */ _tagpropertykey &pkey) = 0 ;
	virtual HRESULT __stdcall GetValue(const _tagpropertykey &key, /* out */ tagPROPVARIANT &pv) = 0 ;
	virtual HRESULT __stdcall SetValue(const _tagpropertykey &key, const tagPROPVARIANT &propvar) = 0 ;
	virtual HRESULT __stdcall Commit(void) = 0 ;
};

typedef HRESULT __stdcall (*TSHSetThreadRef)(System::_di_IInterface punk);

typedef HRESULT __stdcall (*TSHGetThreadRef)(/* out */ System::_di_IInterface &ppunk);

typedef HRESULT __stdcall (*TSHCreateThreadRef)(unsigned &pcRef, /* out */ System::_di_IInterface &ppunk);

typedef HRESULT __stdcall (*TSHReleaseThreadRef)(void);

typedef BOOL __stdcall (*TSHCreateThread)(Windows::TThreadStartRoutine pfnThreadProc, void * pData, unsigned dwFlags, Windows::TThreadStartRoutine pfnCallback);

typedef void __stdcall (*TSHSetInstanceExplorer)(System::_di_IInterface unk);

typedef HRESULT __stdcall (*TSHGetInstanceExplorer)(/* out */ System::_di_IInterface &ppunk);

//-- var, const, procedure ---------------------------------------------------
static const int ComCtl_470 = 0x40046;
static const int ComCtl_471 = 0x40047;
static const int ComCtl_472 = 0x40048;
static const int ComCtl_580 = 0x50050;
static const int ComCtl_581 = 0x50050;
static const int ComCtl_600 = 0x60000;
#define SID_IShellIconOverlayIdentifier L"{0C6C4200-C589-11D0-999A-00C04FD655E1}"
extern PACKAGE GUID IID_IShellIconOverlayIdentifier;
extern PACKAGE StaticArray<unsigned, 55> NETWORK_PROVIDER_TYPES;
extern PACKAGE Mpshelltypes__1 NETWORK_PROVIDER_TYPE_IDS;
static const ShortInt ICON_BLANK = 0x0;
static const ShortInt ICON_DATA = 0x1;
static const ShortInt ICON_APP = 0x2;
static const ShortInt ICON_FOLDER = 0x3;
static const ShortInt ICON_FOLDEROPEN = 0x4;
extern PACKAGE GUID IID_IPersistFolder3;
#define SID_IColumnProvider L"{E8025004-1C42-11d2-BE2C-00A0C9A83DA1}"
static const ShortInt ACLO_ALLOBJECTS = 0xf;
extern PACKAGE GUID DIID_DWebBrowserEvents;
extern PACKAGE GUID DIID_DWebBrowserEvents2;
extern PACKAGE GUID CLSID_ToolbarExtButtons;
extern PACKAGE GUID DIID_DShellFolderViewEvents;
extern PACKAGE GUID IID_FolderItemVerbs;
extern PACKAGE GUID IID_FolderItemVerb;
extern PACKAGE GUID IID_FolderItems;
extern PACKAGE GUID IID_FolderItems2;
extern PACKAGE GUID IID_FolderItems3;
extern PACKAGE GUID IID_Folder;
extern PACKAGE GUID IID_Folder2;
extern PACKAGE GUID IID_Folder3;
#define SID_IBrowserFrameOptions L"{10DF43C8-1DBE-11D3-8B34-006097DF5BD4}"
static const ShortInt BFO_BROWSER_PERSIST_SETTINGS = 0x1;
static const ShortInt BFO_RENAME_FOLDER_OPTIONS_TOINTERNET = 0x2;
static const ShortInt BFO_BOTH_OPTIONS = 0x4;
static const ShortInt BIF_PREFER_INTERNET_SHORTCUT = 0x8;
static const ShortInt BFO_BROWSE_NO_IN_NEW_PROCESS = 0x10;
static const ShortInt BFO_ENABLE_HYPERLINK_TRACKING = 0x20;
static const ShortInt BFO_USE_IE_OFFLINE_SUPPORT = 0x40;
static const Byte BFO_SUBSTITUE_INTERNET_START_PAGE = 0x80;
static const Word BFO_USE_IE_LOGOBANDING = 0x100;
static const Word BFO_ADD_IE_TOCAPTIONBAR = 0x200;
static const Word BFO_USE_DIALUP_REF = 0x400;
static const Word BFO_USE_IE_TOOLBAR = 0x800;
static const Word BFO_NO_PARENT_FOLDER_SUPPORT = 0x1000;
static const Word BFO_NO_REOPEN_NEXT_RESTART = 0x2000;
static const Word BFO_GO_HOME_PAGE = 0x4000;
static const Word BFO_PREFER_IEPROCESS = 0x8000;
static const int BFO_SHOW_NAVIGATION_CANCELLED = 0x10000;
static const unsigned BFO_QUERY_ALL = 0xffffffff;
#define bfoNone EMPTYSET
#define bfoQueryAll (Set<TBrowserFrameOption, bfoBrowserPersistSettings, bfoShowNavigationCancelled> () << bfoBrowserPersistSettings << bfoRenameFolderOptionsToInternet << bfoBothOptions << bfoPreferInternetShortcut << bfoBrowseNoInNewProcess << bfoEnableHyperlinkTracking << bfoUseIEOfflineSupport << bfoSubstituteInternetStartPage << bfoUseIELogoBanding << bfoAddIEToCaptionBar << bfoUseDialupRef << bfoUseIEToolbar << bfoNoParentFolderSupport << bfoNoReopenNextRestart << bfoGoHomePage << bfoPreferIEProcess << bfoShowNavigationCancelled )
static const ShortInt ASSOCENUM_NONE = 0x1;
#define SID_IImageList L"{46EB5926-582E-4017-9FDF-E8998DAA0950}"
extern PACKAGE GUID IID_IImageList;
#define SID_IShellFolderViewCB L"{2047E320-F2A9-11CE-AE65-08002B2E1262}"
extern PACKAGE GUID IID_IShellFolderViewCB;
static const ShortInt SFVM_GETHELPTEXTA = 0x45;
static const ShortInt SFVM_GETTOOLTIPTEXTA = 0x46;
static const ShortInt SFVM_GETICONOVERLAY = 0x47;
static const ShortInt SFVM_SETICONOVERLAY = 0x48;
static const ShortInt SFVM_ALTERDROPEFFECT = 0x49;
#define SID_IAssociationArray L"{3B877E3C-67DE-4F9A-B29B-17D0A1521C6A}"
#define shlwapi L"shlwapi.dll"

}	/* namespace Mpshelltypes */
using namespace Mpshelltypes;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpshelltypesHPP
