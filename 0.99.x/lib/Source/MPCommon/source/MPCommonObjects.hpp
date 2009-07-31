// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpcommonobjects.pas' rev: 20.00

#ifndef MpcommonobjectsHPP
#define MpcommonobjectsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Activex.hpp>	// Pascal unit
#include <Commctrl.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rtlconsts.hpp>	// Pascal unit
#include <Themes.hpp>	// Pascal unit
#include <Uxtheme.hpp>	// Pascal unit
#include <Shlobj.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Typinfo.hpp>	// Pascal unit
#include <Mpshelltypes.hpp>	// Pascal unit
#include <Mpresources.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpcommonobjects
{
//-- type declarations -------------------------------------------------------
typedef BOOL __stdcall (*TILIsParent)(Shlobj::PItemIDList PIDL1, Shlobj::PItemIDList PIDL2, BOOL ImmediateParent);

typedef BOOL __stdcall (*TILIsEqual)(Shlobj::PItemIDList PIDL1, Shlobj::PItemIDList PIDL2);

typedef int TCommonImageIndexInteger;

class DELPHICLASS TStringListEx;
class PASCALIMPLEMENTATION TStringListEx : public Classes::TStringList
{
	typedef Classes::TStringList inherited;
	
public:
	/* TStringList.Create */ inline __fastcall TStringListEx(void)/* overload */ : Classes::TStringList() { }
	/* TStringList.Destroy */ inline __fastcall virtual ~TStringListEx(void) { }
	
};


typedef DynamicArray<Shlobj::PItemIDList> TPIDLArray;

typedef TPIDLArray TRelativePIDLArray;

typedef TPIDLArray TAbsolutePIDLArray;

typedef StaticArray<Shlobj::PItemIDList, 1> TPIDLRawArray;

typedef TPIDLRawArray *PPIDLRawArray;

__interface ICommonExtractObj;
typedef System::DelphiInterface<ICommonExtractObj> _di_ICommonExtractObj;
__interface  INTERFACE_UUID("{7F667930-E47B-4474-BA62-B100D7DBDA70}") ICommonExtractObj  : public System::IInterface 
{
	
public:
	virtual System::TObject* __fastcall GetObj(void) = 0 ;
	__property System::TObject* Obj = {read=GetObj};
};

#pragma option push -b-
enum TCommonShellContextMenuAction { cmaCopy, cmaCut, cmaPaste, cmaDelete, cmaRename, cmaProperties, cmaShortCut };
#pragma option pop

typedef Set<TCommonShellContextMenuAction, cmaCopy, cmaShortCut>  TCommonShellContextMenuActions;

#pragma option push -b-
enum TCommonShellContextMenuExtension { cmeAllFilesystemObjects, cmeDirectory, cmeDirBackground, cmeFolder, cmeAsterik, cmeShellDefault, cmePerceivedType };
#pragma option pop

typedef Set<TCommonShellContextMenuExtension, cmeAllFilesystemObjects, cmePerceivedType>  TCommonShellContextMenuExtensions;

class DELPHICLASS TCommonThemeManager;
class PASCALIMPLEMENTATION TCommonThemeManager : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	unsigned FButtonTheme;
	unsigned FComboBoxTheme;
	unsigned FEditTheme;
	unsigned FExplorerBarTheme;
	unsigned FHeaderTheme;
	unsigned FListviewTheme;
	bool FLoaded;
	Controls::TWinControl* FOwner;
	unsigned FProgressTheme;
	unsigned FRebarTheme;
	unsigned FScrollbarTheme;
	unsigned FTaskBandTheme;
	unsigned FTaskBarTheme;
	unsigned FTreeviewTheme;
	unsigned FWindowTheme;
	
public:
	__fastcall TCommonThemeManager(Controls::TWinControl* AnOwner);
	__fastcall virtual ~TCommonThemeManager(void);
	DYNAMIC void __fastcall ThemesFree(void);
	DYNAMIC void __fastcall ThemesLoad(void);
	__property unsigned ButtonTheme = {read=FButtonTheme, write=FButtonTheme, nodefault};
	__property unsigned ComboBoxTheme = {read=FComboBoxTheme, write=FComboBoxTheme, nodefault};
	__property unsigned EditThemeTheme = {read=FEditTheme, write=FEditTheme, nodefault};
	__property unsigned ExplorerBarTheme = {read=FExplorerBarTheme, write=FExplorerBarTheme, nodefault};
	__property unsigned HeaderTheme = {read=FHeaderTheme, write=FHeaderTheme, nodefault};
	__property unsigned ListviewTheme = {read=FListviewTheme, write=FListviewTheme, nodefault};
	__property bool Loaded = {read=FLoaded, nodefault};
	__property Controls::TWinControl* Owner = {read=FOwner};
	__property unsigned ProgressTheme = {read=FProgressTheme, write=FProgressTheme, nodefault};
	__property unsigned RebarTheme = {read=FRebarTheme, write=FRebarTheme, nodefault};
	__property unsigned ScrollbarTheme = {read=FScrollbarTheme, write=FScrollbarTheme, nodefault};
	__property unsigned TaskBandTheme = {read=FTaskBandTheme, write=FTaskBandTheme, nodefault};
	__property unsigned TaskBarTheme = {read=FTaskBarTheme, write=FTaskBarTheme, nodefault};
	__property unsigned TreeviewTheme = {read=FTreeviewTheme, write=FTreeviewTheme, nodefault};
	__property unsigned WindowTheme = {read=FWindowTheme, write=FWindowTheme, nodefault};
};


typedef void __fastcall (__closure *TCommonMouseEnterEvent)(System::TObject* Sender, const Types::TPoint &MousePos);

class DELPHICLASS TCommonCanvasControl;
class PASCALIMPLEMENTATION TCommonCanvasControl : public Controls::TCustomControl
{
	typedef Controls::TCustomControl inherited;
	
private:
	Graphics::TBitmap* FBackBits;
	Forms::TFormBorderStyle FBorderStyle;
	bool FCacheDoubleBufferBits;
	Controls::TControlCanvas* FCanvas;
	bool FForcePaint;
	Controls::TImageList* FImagesExtraLarge;
	Controls::TImageList* FImagesLarge;
	Controls::TImageList* FImagesSmall;
	bool FMouseEnterExitNotifyEnabled;
	bool FMouseInWindow;
	Extctrls::TTimer* FMouseTimer;
	Graphics::TCanvas* FNCCanvas;
	Classes::TNotifyEvent FOnBeginUpdate;
	Classes::TNotifyEvent FOnEndUpdate;
	TCommonMouseEnterEvent FOnMouseEnter;
	Classes::TNotifyEvent FOnMouseExit;
	bool FShowThemedBorder;
	TCommonThemeManager* FThemes;
	Controls::TControlCanvas* __fastcall GetCanvas(void);
	bool __fastcall GetThemed(void);
	void __fastcall SetBorderStyle(const Forms::TBorderStyle Value);
	void __fastcall SetCacheDoubleBufferBits(const bool Value);
	void __fastcall SetShowThemedBorder(const bool Value);
	void __fastcall SetThemed(const bool Value);
	
protected:
	bool FThemed;
	int FUpdateCount;
	virtual void __fastcall AfterPaintRect(Graphics::TCanvas* ACanvas, const Types::TRect &ClipRect);
	virtual void __fastcall CalcThemedNCSize(Types::TRect &ContextRect);
	MESSAGE void __fastcall CMColorChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMCtl3DChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMParentFontChanged(Messages::TMessage &Message);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DoBeginUpdate(void);
	void __fastcall DoEndUpdate(void);
	virtual void __fastcall DoMouseEnter(const Types::TPoint &MousePos);
	virtual void __fastcall DoMouseExit(void);
	virtual void __fastcall DoMouseTrack(const Types::TPoint &MousePos);
	virtual void __fastcall DoPaintRect(Graphics::TCanvas* ACanvas, const Types::TRect &WindowClipRect, bool SelectedOnly);
	virtual void __fastcall DoUpdate(void);
	void __fastcall KillMouseInWindowTimer(void);
	void __fastcall MouseTimerProc(System::TObject* Sender);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall PaintThemedNCBkgnd(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	void __fastcall ResizeBackBits(int NewWidth, int NewHeight);
	void __fastcall ValidateBorder(void);
	HIDESBASE MESSAGE void __fastcall WMDestroy(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Msg);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Msg);
	HIDESBASE MESSAGE void __fastcall WMPaint(Messages::TWMPaint &Msg);
	MESSAGE void __fastcall WMThemeChanged(Messages::TMessage &Message);
	__property Graphics::TBitmap* BackBits = {read=FBackBits, write=FBackBits};
	__property Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, default=1};
	__property bool CacheDoubleBufferBits = {read=FCacheDoubleBufferBits, write=SetCacheDoubleBufferBits, default=0};
	__property bool MouseInWindow = {read=FMouseInWindow, write=FMouseInWindow, nodefault};
	__property Extctrls::TTimer* MouseTimer = {read=FMouseTimer, write=FMouseTimer};
	__property Graphics::TCanvas* NCCanvas = {read=FNCCanvas, write=FNCCanvas};
	__property Classes::TNotifyEvent OnBeginUpdate = {read=FOnBeginUpdate, write=FOnBeginUpdate};
	__property Classes::TNotifyEvent OnEndUpdate = {read=FOnEndUpdate, write=FOnEndUpdate};
	__property TCommonMouseEnterEvent OnMouseEnter = {read=FOnMouseEnter, write=FOnMouseEnter};
	__property Classes::TNotifyEvent OnMouseExit = {read=FOnMouseExit, write=FOnMouseExit};
	__property bool ShowThemedBorder = {read=FShowThemedBorder, write=SetShowThemedBorder, default=1};
	__property bool Themed = {read=GetThemed, write=SetThemed, default=1};
	
public:
	__fastcall virtual TCommonCanvasControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TCommonCanvasControl(void);
	virtual void __fastcall BeginUpdate(void);
	bool __fastcall DrawWithThemes(void);
	virtual void __fastcall EndUpdate(bool Invalidate = true);
	void __fastcall SafeInvalidateRect(Types::PRect ARect, bool ImmediateUpdate);
	__property Controls::TControlCanvas* Canvas = {read=GetCanvas, write=FCanvas};
	__property Color = {default=-16777211};
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property bool ForcePaint = {read=FForcePaint, write=FForcePaint, nodefault};
	__property TCommonThemeManager* Themes = {read=FThemes};
	__property int UpdateCount = {read=FUpdateCount, nodefault};
public:
	/* TWinControl.CreateParented */ inline __fastcall TCommonCanvasControl(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TCommonDefaultCanvasState;
class PASCALIMPLEMENTATION TCommonDefaultCanvasState : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	unsigned FBkMode;
	Graphics::TFont* FFont;
	Graphics::TBrush* FBrush;
	Graphics::TPen* FPen;
	bool FCanvasStored;
	int FCopyMode;
	Types::TPoint FPenPos;
	int FTextFlags;
	Graphics::TBrush* __fastcall GetBrush(void);
	Graphics::TFont* __fastcall GetFont(void);
	Graphics::TPen* __fastcall GetPen(void);
	
public:
	__fastcall virtual ~TCommonDefaultCanvasState(void);
	void __fastcall StoreCanvas(Graphics::TCanvas* ACanvas);
	void __fastcall RestoreCanvas(Graphics::TCanvas* ACanvas);
	__property unsigned BkMode = {read=FBkMode, nodefault};
	__property bool CanvasStored = {read=FCanvasStored, nodefault};
	__property int CopyMode = {read=FCopyMode, nodefault};
	__property Graphics::TFont* Font = {read=GetFont};
	__property Graphics::TBrush* Brush = {read=GetBrush};
	__property Graphics::TPen* Pen = {read=GetPen};
	__property Types::TPoint PenPos = {read=FPenPos};
	__property int TextFlags = {read=FTextFlags, nodefault};
public:
	/* TObject.Create */ inline __fastcall TCommonDefaultCanvasState(void) : System::TObject() { }
	
};


class DELPHICLASS TCommonPIDLList;
typedef TCommonPIDLList* *PCommonPIDLList;

class DELPHICLASS TCommonPIDLManager;
class PASCALIMPLEMENTATION TCommonPIDLList : public Classes::TList
{
	typedef Classes::TList inherited;
	
private:
	TCommonPIDLManager* FLocalPIDLMgr;
	bool FSharePIDLs;
	bool FDestroying;
	Shlobj::PItemIDList __fastcall GetPIDL(int Index);
	
protected:
	__property bool Destroying = {read=FDestroying, nodefault};
	__property TCommonPIDLManager* LocalPIDLMgr = {read=FLocalPIDLMgr, write=FLocalPIDLMgr};
	
public:
	__fastcall TCommonPIDLList(void);
	__fastcall virtual ~TCommonPIDLList(void);
	virtual void __fastcall Clear(void);
	void __fastcall CloneList(TCommonPIDLList* PIDLList);
	int __fastcall CopyAdd(Shlobj::PItemIDList PIDL);
	int __fastcall FindPIDL(Shlobj::PItemIDList TestPIDL);
	virtual bool __fastcall LoadFromStream(Classes::TStream* Stream);
	virtual bool __fastcall SaveToStream(Classes::TStream* Stream);
	__property bool SharePIDLs = {read=FSharePIDLs, write=FSharePIDLs, nodefault};
};


class PASCALIMPLEMENTATION TCommonPIDLManager : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	_di_IMalloc FMalloc;
	
public:
	__fastcall TCommonPIDLManager(void);
	__fastcall virtual ~TCommonPIDLManager(void);
	System::WideChar * __fastcall AllocStrGlobal(System::WideString SourceStr);
	Shlobj::PItemIDList __fastcall AppendPIDL(Shlobj::PItemIDList DestPIDL, Shlobj::PItemIDList SrcPIDL);
	bool __fastcall BindToParent(Shlobj::PItemIDList AbsolutePIDL, _di_IShellFolder &Folder);
	Shlobj::PItemIDList __fastcall CopyPIDL(Shlobj::PItemIDList APIDL);
	bool __fastcall EqualPIDL(Shlobj::PItemIDList PIDL1, Shlobj::PItemIDList PIDL2);
	void __fastcall FreeAndNilPIDL(Shlobj::PItemIDList &PIDL);
	void __fastcall FreeOLEStr(System::WideChar * OLEStr);
	void __fastcall FreePIDL(Shlobj::PItemIDList PIDL);
	Shlobj::PItemIDList __fastcall CopyLastID(Shlobj::PItemIDList IDList);
	Shlobj::PItemIDList __fastcall GetPointerToLastID(Shlobj::PItemIDList IDList);
	int __fastcall IDCount(Shlobj::PItemIDList APIDL);
	bool __fastcall IsDesktopFolder(Shlobj::PItemIDList APIDL);
	bool __fastcall IsEmptyPIDL(Shlobj::PItemIDList APIDL);
	bool __fastcall IsSubPIDL(Shlobj::PItemIDList FullPIDL, Shlobj::PItemIDList SubPIDL);
	Shlobj::PItemIDList __fastcall NextID(Shlobj::PItemIDList APIDL);
	int __fastcall PIDLSize(Shlobj::PItemIDList APIDL);
	Shlobj::PItemIDList __fastcall LoadFromStream(Classes::TStream* Stream);
	void __fastcall ParsePIDL(Shlobj::PItemIDList AbsolutePIDL, TCommonPIDLList* &PIDLList, bool AllAbsolutePIDLs);
	void __fastcall ParsePIDLArray(PPIDLRawArray PIDLArray, TCommonPIDLList* &PIDLList, int Count, bool Relative, bool CopyPIDLs);
	Shlobj::PItemIDList __fastcall StringToPIDL(System::AnsiString PIDLStr);
	Shlobj::PItemIDList __fastcall StripLastID(Shlobj::PItemIDList IDList)/* overload */;
	Shlobj::PItemIDList __fastcall StripLastID(Shlobj::PItemIDList IDList, System::Word &Last_CB, Shlobj::PItemIDList &LastID)/* overload */;
	void __fastcall SaveToStream(Classes::TStream* Stream, Shlobj::PItemIDList PIDL);
	__property _di_IMalloc Malloc = {read=FMalloc};
};


class DELPHICLASS TCommonMemoryStreamHelper;
class PASCALIMPLEMENTATION TCommonMemoryStreamHelper : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	bool __fastcall ReadBoolean(Classes::TStream* S);
	Graphics::TColor __fastcall ReadColor(Classes::TStream* S);
	__int64 __fastcall ReadInt64(Classes::TStream* S);
	int __fastcall ReadInteger(Classes::TStream* S);
	System::AnsiString __fastcall ReadString(Classes::TStream* S);
	System::WideString __fastcall ReadWideString(Classes::TStream* S);
	System::Extended __fastcall ReadExtended(Classes::TStream* S);
	void __fastcall ReadStream(Classes::TStream* SourceStream, Classes::TStream* TargetStream);
	void __fastcall WriteBoolean(Classes::TStream* S, bool Value);
	void __fastcall WriteColor(Classes::TStream* S, Graphics::TColor Value);
	void __fastcall WriteExtended(Classes::TStream* S, System::Extended Value);
	void __fastcall WriteInt64(Classes::TStream* S, __int64 Value);
	void __fastcall WriteInteger(Classes::TStream* S, int Value);
	void __fastcall WriteStream(Classes::TStream* SourceStream, Classes::TStream* TargetStream);
	void __fastcall WriteString(Classes::TStream* S, System::AnsiString Value);
	void __fastcall WriteWideString(Classes::TStream* S, System::WideString Value);
public:
	/* TObject.Create */ inline __fastcall TCommonMemoryStreamHelper(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonMemoryStreamHelper(void) { }
	
};


class DELPHICLASS TCommonStream;
class PASCALIMPLEMENTATION TCommonStream : public Classes::TMemoryStream
{
	typedef Classes::TMemoryStream inherited;
	
public:
	bool __fastcall ReadBoolean(void);
	System::Byte __fastcall ReadByte(void);
	int __fastcall ReadInteger(void);
	System::AnsiString __fastcall ReadString();
	Classes::TStringList* __fastcall ReadStringList(void);
	System::WideString __fastcall ReadWideString();
	void __fastcall WriteBoolean(bool Value);
	void __fastcall WriteByte(System::Byte Value);
	void __fastcall WriteInteger(int Value);
	void __fastcall WriteString(const System::AnsiString Value);
	void __fastcall WriteStringList(Classes::TStringList* Value);
	void __fastcall WriteWideString(const System::WideString Value);
public:
	/* TMemoryStream.Destroy */ inline __fastcall virtual ~TCommonStream(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TCommonStream(void) : Classes::TMemoryStream() { }
	
};


class DELPHICLASS TCommonCheckBound;
class PASCALIMPLEMENTATION TCommonCheckBound : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Types::TRect FBounds;
	int FSize;
	
public:
	__property int Size = {read=FSize, write=FSize, nodefault};
	__property Types::TRect Bounds = {read=FBounds, write=FBounds};
public:
	/* TObject.Create */ inline __fastcall TCommonCheckBound(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonCheckBound(void) { }
	
};


class DELPHICLASS TCommonCheckBoundManager;
class PASCALIMPLEMENTATION TCommonCheckBoundManager : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FList;
	Types::TRect __fastcall GetBound(int Size);
	TCommonCheckBound* __fastcall GetCheckBound(int Index);
	
protected:
	void __fastcall Clear(void);
	TCommonCheckBound* __fastcall Find(int Size);
	__property Classes::TList* List = {read=FList, write=FList};
	__property TCommonCheckBound* CheckBound[int Index] = {read=GetCheckBound};
	
public:
	__fastcall TCommonCheckBoundManager(void);
	__fastcall virtual ~TCommonCheckBoundManager(void);
	__property Types::TRect Bound[int Size] = {read=GetBound};
};


#pragma option push -b-
enum TSysImageListSize { sisSmall, sisLarge, sisExtraLarge };
#pragma option pop

class DELPHICLASS TCommonSysImages;
class PASCALIMPLEMENTATION TCommonSysImages : public Controls::TImageList
{
	typedef Controls::TImageList inherited;
	
private:
	TSysImageListSize FImageSize;
	Mpshelltypes::_di_IImageList FJumboImages;
	void __fastcall SetImageSize(const TSysImageListSize Value);
	
protected:
	void __fastcall RecreateHandle(void);
	void __fastcall Flush(void);
	__property Mpshelltypes::_di_IImageList JumboImages = {read=FJumboImages};
	
public:
	__fastcall virtual TCommonSysImages(Classes::TComponent* AOwner);
	__fastcall virtual ~TCommonSysImages(void);
	__property TSysImageListSize ImageSize = {read=FImageSize, write=SetImageSize, nodefault};
public:
	/* TCustomImageList.CreateSize */ inline __fastcall TCommonSysImages(int AWidth, int AHeight) : Controls::TImageList(AWidth, AHeight) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define IID_ICommonExtractObj L"{7F667930-E47B-4474-BA62-B100D7DBDA70}"
extern PACKAGE TCommonMemoryStreamHelper* StreamHelper;
extern PACKAGE TCommonCheckBoundManager* Checks;
extern PACKAGE Graphics::TFont* MarlettFont;
extern PACKAGE BOOL __fastcall ILIsParent(Shlobj::PItemIDList PIDL1, Shlobj::PItemIDList PIDL2, BOOL ImmediateParent);
extern PACKAGE BOOL __fastcall ILIsEqual(Shlobj::PItemIDList PIDL1, Shlobj::PItemIDList PIDL2);
extern PACKAGE void __fastcall FlushImageLists(void);
extern PACKAGE TCommonSysImages* __fastcall ExtraLargeSysImages(void);
extern PACKAGE TCommonSysImages* __fastcall LargeSysImages(void);
extern PACKAGE TCommonSysImages* __fastcall SmallSysImages(void);
extern PACKAGE void __fastcall CreateFullyQualifiedShellDataObject(TPIDLArray AbsolutePIDLs, _di_IDataObject &ADataObject);

}	/* namespace Mpcommonobjects */
using namespace Mpcommonobjects;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpcommonobjectsHPP
