// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2item.pas' rev: 20.00

#ifndef Tb2itemHPP
#define Tb2itemHPP

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
#include <Dialogs.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Commctrl.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Tb2anim.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2item
{
//-- type declarations -------------------------------------------------------
typedef TMetaClass* TTBCustomItemClass;

typedef TMetaClass* TTBCustomItemActionLinkClass;

typedef TMetaClass* TTBItemViewerClass;

typedef TMetaClass* TTBPopupWindowClass;

#pragma option push -b-
enum TTBDoneAction { tbdaNone, tbdaCancel, tbdaClickItem, tbdaOpenSystemMenu, tbdaHelpContext };
#pragma option pop

class DELPHICLASS TTBCustomItem;
struct TTBDoneActionData
{
	
public:
	TTBDoneAction DoneAction;
	TTBCustomItem* ClickItem;
	bool Sound;
	HWND Wnd;
	System::Word Key;
	int ContextID;
};


typedef void __fastcall (__closure *TTBInsertItemProc)(Classes::TComponent* AParent, TTBCustomItem* AItem);

#pragma option push -b-
enum TTBItemChangedAction { tbicInserted, tbicDeleting, tbicSubitemsChanged, tbicSubitemsBeginUpdate, tbicSubitemsEndUpdate, tbicInvalidate, tbicInvalidateAndResize, tbicRecreateItemViewers, tbicNameChanged, tbicSubMenuImagesChanged };
#pragma option pop

typedef void __fastcall (__closure *TTBItemChangedProc)(TTBCustomItem* Sender, bool Relayed, TTBItemChangedAction Action, int Index, TTBCustomItem* Item);

#pragma option push -b-
enum TTBItemDisplayMode { nbdmDefault, nbdmTextOnly, nbdmTextOnlyInMenus, nbdmImageAndText };
#pragma option pop

#pragma option push -b-
enum TTBItemOption { tboDefault, tboDropdownArrow, tboImageAboveCaption, tboLongHintInMenuOnly, tboNoAutoHint, tboNoRotation, tboSameWidth, tboShowHint, tboToolbarStyle, tboToolbarSize };
#pragma option pop

typedef Set<TTBItemOption, tboDefault, tboToolbarSize>  TTBItemOptions;

#pragma option push -b-
enum Tb2item__1 { tbisSubmenu, tbisSelectable, tbisSeparator, tbisEmbeddedGroup, tbisClicksTransparent, tbisCombo, tbisNoAutoOpen, tbisSubitemsEditable, tbisNoLineBreak, tbisRightAlign, tbisDontSelectFirst, tbisRedrawOnSelChange, tbisRedrawOnMouseOverChange };
#pragma option pop

typedef Set<Tb2item__1, tbisSubmenu, tbisRedrawOnMouseOverChange>  TTBItemStyle;

#pragma option push -b-
enum TTBPopupAlignment { tbpaLeft, tbpaRight, tbpaCenter };
#pragma option pop

typedef void __fastcall (__closure *TTBPopupEvent)(TTBCustomItem* Sender, bool FromLink);

class DELPHICLASS TTBItemViewer;
typedef void __fastcall (__closure *TTBSelectEvent)(TTBCustomItem* Sender, TTBItemViewer* Viewer, bool Selecting);

class DELPHICLASS ETBItemError;
class PASCALIMPLEMENTATION ETBItemError : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall ETBItemError(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall ETBItemError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall ETBItemError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall ETBItemError(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall ETBItemError(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall ETBItemError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall ETBItemError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall ETBItemError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~ETBItemError(void) { }
	
};


class DELPHICLASS TTBImageChangeLink;
class PASCALIMPLEMENTATION TTBImageChangeLink : public Imglist::TChangeLink
{
	typedef Imglist::TChangeLink inherited;
	
private:
	int FLastWidth;
	int FLastHeight;
public:
	/* TChangeLink.Destroy */ inline __fastcall virtual ~TTBImageChangeLink(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TTBImageChangeLink(void) : Imglist::TChangeLink() { }
	
};


class DELPHICLASS TTBCustomItemActionLink;
class DELPHICLASS TTBPopupWindow;
class DELPHICLASS TTBView;
class PASCALIMPLEMENTATION TTBCustomItem : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
public:
	TTBCustomItem* operator[](int Index) { return Items[Index]; }
	
private:
	TTBCustomItemActionLink* FActionLink;
	bool FAutoCheck;
	System::UnicodeString FCaption;
	bool FChecked;
	TTBItemDisplayMode FDisplayMode;
	bool FEnabled;
	TTBItemOptions FEffectiveOptions;
	int FGroupIndex;
	Classes::THelpContext FHelpContext;
	System::UnicodeString FHint;
	Imglist::TImageIndex FImageIndex;
	Imglist::TCustomImageList* FImages;
	TTBImageChangeLink* FImagesChangeLink;
	Classes::TList* FItems;
	TTBItemStyle FItemStyle;
	Classes::TList* FLinkParents;
	TTBItemOptions FMaskOptions;
	TTBItemOptions FOptions;
	bool FInheritOptions;
	Classes::TList* FNotifyList;
	Classes::TNotifyEvent FOnClick;
	TTBPopupEvent FOnPopup;
	TTBSelectEvent FOnSelect;
	TTBCustomItem* FParent;
	Classes::TComponent* FParentComponent;
	bool FRadioItem;
	Classes::TShortCut FShortCut;
	Imglist::TCustomImageList* FSubMenuImages;
	TTBImageChangeLink* FSubMenuImagesChangeLink;
	TTBCustomItem* FLinkSubitems;
	bool FVisible;
	void __fastcall DoActionChange(System::TObject* Sender);
	bool __fastcall ChangeImages(Imglist::TCustomImageList* &AImages, const Imglist::TCustomImageList* Value, TTBImageChangeLink* &AChangeLink);
	__classmethod void __fastcall ClickWndProc(Messages::TMessage &Message);
	TTBCustomItem* __fastcall FindItemWithShortCut(Classes::TShortCut AShortCut, TTBCustomItem* &ATopmostParent);
	TTBItemOptions __fastcall FixOptions(const TTBItemOptions AOptions);
	Classes::TBasicAction* __fastcall GetAction(void);
	int __fastcall GetCount(void);
	TTBCustomItem* __fastcall GetItem(int Index);
	void __fastcall ImageListChangeHandler(System::TObject* Sender);
	void __fastcall InternalNotify(TTBCustomItem* Ancestor, int NestingLevel, TTBItemChangedAction Action, int Index, TTBCustomItem* Item);
	bool __fastcall IsAutoCheckStored(void);
	bool __fastcall IsCaptionStored(void);
	bool __fastcall IsCheckedStored(void);
	bool __fastcall IsEnabledStored(void);
	bool __fastcall IsHelpContextStored(void);
	bool __fastcall IsHintStored(void);
	bool __fastcall IsImageIndexStored(void);
	bool __fastcall IsOnClickStored(void);
	bool __fastcall IsShortCutStored(void);
	bool __fastcall IsVisibleStored(void);
	void __fastcall Notify(TTBItemChangedAction Action, int Index, TTBCustomItem* Item);
	void __fastcall RefreshOptions(void);
	void __fastcall SetAction(Classes::TBasicAction* Value);
	void __fastcall SetCaption(System::UnicodeString Value);
	void __fastcall SetChecked(bool Value);
	void __fastcall SetDisplayMode(TTBItemDisplayMode Value);
	void __fastcall SetEnabled(bool Value);
	void __fastcall SetGroupIndex(int Value);
	void __fastcall SetImageIndex(Imglist::TImageIndex Value);
	void __fastcall SetImages(Imglist::TCustomImageList* Value);
	void __fastcall SetInheritOptions(bool Value);
	void __fastcall SetLinkSubitems(TTBCustomItem* Value);
	void __fastcall SetMaskOptions(TTBItemOptions Value);
	void __fastcall SetOptions(TTBItemOptions Value);
	void __fastcall SetRadioItem(bool Value);
	void __fastcall SetSubMenuImages(Imglist::TCustomImageList* Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SubMenuImagesChanged(void);
	void __fastcall TurnSiblingsOff(void);
	
protected:
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	virtual void __fastcall Change(bool NeedResize);
	virtual TTBPopupWindow* __fastcall CreatePopup(const TTBView* ParentView, const TTBItemViewer* ParentViewer, const bool PositionAsSubmenu, const bool SelectFirstItem, const bool Customizing, const Types::TPoint &APopupPoint, const TTBPopupAlignment Alignment);
	virtual void __fastcall DoPopup(TTBCustomItem* Sender, bool FromLink);
	virtual void __fastcall EnabledChanged(void);
	DYNAMIC TTBCustomItemActionLinkClass __fastcall GetActionLinkClass(void);
	virtual TTBView* __fastcall GetChevronParentView(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual TTBItemViewerClass __fastcall GetItemViewerClass(TTBView* AView);
	virtual TTBPopupWindowClass __fastcall GetPopupWindowClass(void);
	__classmethod void __fastcall IndexError();
	virtual void __fastcall Loaded(void);
	virtual bool __fastcall NeedToRecreateViewer(TTBItemViewer* AViewer);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	TTBCustomItem* __fastcall OpenPopup(const bool SelectFirstItem, const bool TrackRightButton, const Types::TPoint &PopupPoint, const TTBPopupAlignment Alignment, const bool ReturnClickedItemOnly);
	void __fastcall RecreateItemViewers(void);
	DYNAMIC void __fastcall SetChildOrder(Classes::TComponent* Child, int Order);
	virtual void __fastcall SetName(const Classes::TComponentName NewName);
	DYNAMIC void __fastcall SetParentComponent(Classes::TComponent* Value);
	__property TTBCustomItemActionLink* ActionLink = {read=FActionLink, write=FActionLink};
	__property TTBItemStyle ItemStyle = {read=FItemStyle, write=FItemStyle, nodefault};
	
public:
	__fastcall virtual TTBCustomItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBCustomItem(void);
	DYNAMIC bool __fastcall HasParent(void);
	DYNAMIC Classes::TComponent* __fastcall GetParentComponent(void);
	void __fastcall Add(TTBCustomItem* AItem);
	void __fastcall Clear(void);
	virtual void __fastcall Click(void);
	bool __fastcall ContainsItem(TTBCustomItem* AItem);
	void __fastcall Delete(int Index);
	TTBItemStyle __fastcall GetItemStyle(void);
	System::UnicodeString __fastcall GetShortCutText();
	int __fastcall IndexOf(TTBCustomItem* AItem);
	virtual void __fastcall InitiateAction(void);
	HIDESBASE void __fastcall Insert(int NewIndex, TTBCustomItem* AItem);
	bool __fastcall IsShortCut(Messages::TWMKey &Message);
	void __fastcall Move(int CurIndex, int NewIndex);
	TTBCustomItem* __fastcall Popup(int X, int Y, bool TrackRightButton, TTBPopupAlignment Alignment = (TTBPopupAlignment)(0x0), bool ReturnClickedItemOnly = false);
	void __fastcall PostClick(void);
	void __fastcall RegisterNotification(TTBItemChangedProc ANotify);
	HIDESBASE void __fastcall Remove(TTBCustomItem* Item);
	void __fastcall UnregisterNotification(TTBItemChangedProc ANotify);
	void __fastcall ViewBeginUpdate(void);
	void __fastcall ViewEndUpdate(void);
	__property Classes::TBasicAction* Action = {read=GetAction, write=SetAction};
	__property bool AutoCheck = {read=FAutoCheck, write=FAutoCheck, stored=IsAutoCheckStored, default=0};
	__property System::UnicodeString Caption = {read=FCaption, write=SetCaption, stored=IsCaptionStored};
	__property int Count = {read=GetCount, nodefault};
	__property bool Checked = {read=FChecked, write=SetChecked, stored=IsCheckedStored, default=0};
	__property TTBItemDisplayMode DisplayMode = {read=FDisplayMode, write=SetDisplayMode, default=0};
	__property TTBItemOptions EffectiveOptions = {read=FEffectiveOptions, nodefault};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, stored=IsEnabledStored, default=1};
	__property int GroupIndex = {read=FGroupIndex, write=SetGroupIndex, default=0};
	__property Classes::THelpContext HelpContext = {read=FHelpContext, write=FHelpContext, stored=IsHelpContextStored, default=0};
	__property System::UnicodeString Hint = {read=FHint, write=FHint, stored=IsHintStored};
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, stored=IsImageIndexStored, default=-1};
	__property Imglist::TCustomImageList* Images = {read=FImages, write=SetImages};
	__property bool InheritOptions = {read=FInheritOptions, write=SetInheritOptions, default=1};
	__property TTBCustomItem* Items[int Index] = {read=GetItem/*, default*/};
	__property TTBCustomItem* LinkSubitems = {read=FLinkSubitems, write=SetLinkSubitems};
	__property TTBItemOptions MaskOptions = {read=FMaskOptions, write=SetMaskOptions, default=0};
	__property TTBItemOptions Options = {read=FOptions, write=SetOptions, default=0};
	__property TTBCustomItem* Parent = {read=FParent};
	__property Classes::TComponent* ParentComponent = {read=FParentComponent, write=FParentComponent};
	__property bool RadioItem = {read=FRadioItem, write=SetRadioItem, default=0};
	__property Classes::TShortCut ShortCut = {read=FShortCut, write=FShortCut, stored=IsShortCutStored, default=0};
	__property Imglist::TCustomImageList* SubMenuImages = {read=FSubMenuImages, write=SetSubMenuImages};
	__property bool Visible = {read=FVisible, write=SetVisible, stored=IsVisibleStored, default=1};
	__property Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick, stored=IsOnClickStored};
	__property TTBPopupEvent OnPopup = {read=FOnPopup, write=FOnPopup};
	__property TTBSelectEvent OnSelect = {read=FOnSelect, write=FOnSelect};
};


class PASCALIMPLEMENTATION TTBCustomItemActionLink : public Actnlist::TActionLink
{
	typedef Actnlist::TActionLink inherited;
	
protected:
	TTBCustomItem* FClient;
	virtual void __fastcall AssignClient(System::TObject* AClient);
	virtual bool __fastcall IsAutoCheckLinked(void);
	virtual bool __fastcall IsCaptionLinked(void);
	virtual bool __fastcall IsCheckedLinked(void);
	virtual bool __fastcall IsEnabledLinked(void);
	virtual bool __fastcall IsHelpContextLinked(void);
	virtual bool __fastcall IsHintLinked(void);
	virtual bool __fastcall IsImageIndexLinked(void);
	virtual bool __fastcall IsShortCutLinked(void);
	virtual bool __fastcall IsVisibleLinked(void);
	virtual bool __fastcall IsOnExecuteLinked(void);
	virtual void __fastcall SetAutoCheck(bool Value);
	virtual void __fastcall SetCaption(const System::UnicodeString Value);
	virtual void __fastcall SetChecked(bool Value);
	virtual void __fastcall SetEnabled(bool Value);
	virtual void __fastcall SetHelpContext(Classes::THelpContext Value);
	virtual void __fastcall SetHint(const System::UnicodeString Value);
	virtual void __fastcall SetImageIndex(int Value);
	virtual void __fastcall SetShortCut(Classes::TShortCut Value);
	virtual void __fastcall SetVisible(bool Value);
	virtual void __fastcall SetOnExecute(Classes::TNotifyEvent Value);
public:
	/* TBasicActionLink.Create */ inline __fastcall virtual TTBCustomItemActionLink(System::TObject* AClient) : Actnlist::TActionLink(AClient) { }
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TTBCustomItemActionLink(void) { }
	
};


class DELPHICLASS TTBBaseAccObject;
class PASCALIMPLEMENTATION TTBBaseAccObject : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
public:
	virtual void __fastcall ClientIsDestroying(void) = 0 ;
	HRESULT __stdcall GetTypeInfoCount(/* out */ int &Count);
	HRESULT __stdcall GetTypeInfo(int Index, int LocaleID, /* out */ void *TypeInfo);
	HRESULT __stdcall GetIDsOfNames(const GUID &IID, void * Names, int NameCount, int LocaleID, void * DispIDs);
	HRESULT __stdcall Invoke(int DispID, const GUID &IID, int LocaleID, System::Word Flags, void *Params, void * VarResult, void * ExcepInfo, void * ArgErr);
public:
	/* TObject.Create */ inline __fastcall TTBBaseAccObject(void) : System::TInterfacedObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TTBBaseAccObject(void) { }
	
private:
	void *__IDispatch;	/* IDispatch */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_IDispatch()
	{
		_di_IDispatch intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IDispatch*(void) { return (IDispatch*)&__IDispatch; }
	#endif
	
};


class PASCALIMPLEMENTATION TTBItemViewer : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	#pragma option push -b-
	enum _TTBItemViewer__1 { tbisInvalidated, tbisLineSep };
	#pragma option pop
	
	
private:
	Types::TRect FBoundsRect;
	bool FClipped;
	int FGroupLevel;
	TTBCustomItem* FItem;
	bool FOffEdge;
	bool FShow;
	TTBView* FView;
	void __fastcall AccSelect(const bool AExecute);
	int __fastcall GetIndex(void);
	
protected:
	TTBBaseAccObject* FAccObjectInstance;
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	DYNAMIC bool __fastcall CaptionShown(void);
	virtual bool __fastcall DoExecute(void);
	virtual void __fastcall DrawItemCaption(const Graphics::TCanvas* Canvas, const Types::TRect &ARect, const System::UnicodeString ACaption, bool ADrawDisabledShadow, unsigned AFormat);
	virtual void __fastcall Entering(void);
	virtual int __fastcall GetAccRole(void);
	virtual bool __fastcall GetAccValue(System::WideString &Value);
	virtual System::UnicodeString __fastcall GetCaptionText();
	virtual void __fastcall GetCursor(const Types::TPoint &Pt, HICON &ACursor);
	Imglist::TCustomImageList* __fastcall GetImageList(void);
	bool __fastcall ImageShown(void);
	bool __fastcall IsRotated(void);
	bool __fastcall IsToolbarSize(void);
	virtual bool __fastcall IsPtInButtonPart(int X, int Y);
	virtual void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Leaving(void);
	virtual void __fastcall LosingCapture(void);
	virtual void __fastcall MouseDown(Classes::TShiftState Shift, int X, int Y, bool &MouseDownOnMenu);
	virtual void __fastcall MouseMove(int X, int Y);
	virtual void __fastcall MouseUp(int X, int Y, bool MouseWasDownOnMenu);
	virtual void __fastcall MouseWheel(int WheelDelta, int X, int Y);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	void __fastcall PostAccSelect(const bool AExecute);
	virtual bool __fastcall UsesSameWidth(void);
	
public:
	Set<_TTBItemViewer__1, tbisInvalidated, tbisLineSep>  State;
	__property Types::TRect BoundsRect = {read=FBoundsRect};
	__property bool Clipped = {read=FClipped, nodefault};
	__property int Index = {read=GetIndex, nodefault};
	__property TTBCustomItem* Item = {read=FItem};
	__property bool OffEdge = {read=FOffEdge, nodefault};
	__property bool Show = {read=FShow, nodefault};
	__property TTBView* View = {read=FView};
	__fastcall virtual TTBItemViewer(TTBView* AView, TTBCustomItem* AItem, int AGroupLevel);
	__fastcall virtual ~TTBItemViewer(void);
	void __fastcall Execute(bool AGivePriority);
	TTBBaseAccObject* __fastcall GetAccObject(void);
	System::UnicodeString __fastcall GetHintText();
	bool __fastcall IsAccessible(void);
	bool __fastcall IsToolbarStyle(void);
	Types::TPoint __fastcall ScreenToClient(const Types::TPoint &P);
};


#pragma option push -b-
enum TTBViewOrientation { tbvoHorizontal, tbvoVertical, tbvoFloating };
#pragma option pop

#pragma option push -b-
enum Tb2item__8 { tbetMouseDown, tbetExecuteSelected, tbetFromMSAA };
#pragma option pop

typedef Set<Tb2item__8, tbetMouseDown, tbetFromMSAA>  TTBEnterToolbarLoopOptions;

#pragma option push -b-
enum Tb2item__9 { vsModal, vsMouseInWindow, vsDrawInOrder, vsOppositePopup, vsIgnoreFirstMouseUp, vsShowAccels, vsDropDownMenus, vsNoAnimation };
#pragma option pop

typedef Set<Tb2item__9, vsModal, vsNoAnimation>  TTBViewState;

#pragma option push -b-
enum Tb2item__01 { vsMenuBar, vsUseHiddenAccels, vsAlwaysShowHints };
#pragma option pop

typedef Set<Tb2item__01, vsMenuBar, vsAlwaysShowHints>  TTBViewStyle;

#pragma option push -b-
enum TTBViewTimerID { tiOpen, tiClose, tiScrollUp, tiScrollDown };
#pragma option pop

typedef TMetaClass* TTBViewClass;

class PASCALIMPLEMENTATION TTBView : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::TList* FViewers;
	Set<TTBViewTimerID, tiOpen, tiScrollDown>  FActiveTimers;
	Graphics::TColor FBackgroundColor;
	Types::TPoint FBaseSize;
	bool FCapture;
	HWND FCaptureWnd;
	int FChevronOffset;
	TTBView* FChevronParentView;
	int FChevronSize;
	TTBCustomItem* FCurParentItem;
	bool FCustomizing;
	TTBDoneActionData FDoneActionData;
	int FInternalViewersAtEnd;
	int FInternalViewersAtFront;
	bool FIsPopup;
	bool FIsToolbar;
	int FMaxHeight;
	Types::TRect FMonitorRect;
	bool FMouseOverSelected;
	bool FNewViewersGetHighestPriority;
	TTBItemViewer* FOpenViewer;
	TTBView* FOpenViewerView;
	TTBPopupWindow* FOpenViewerWindow;
	TTBView* FParentView;
	TTBCustomItem* FParentItem;
	Classes::TList* FPriorityList;
	TTBViewOrientation FOrientation;
	int FScrollOffset;
	TTBItemViewer* FSelected;
	bool FSelectedViaMouse;
	bool FShowDownArrow;
	bool FShowUpArrow;
	TTBViewState FState;
	TTBViewStyle FStyle;
	int FUpdating;
	bool FUsePriorityList;
	bool FValidated;
	Controls::TWinControl* FWindow;
	int FWrapOffset;
	void __fastcall DeletingViewer(TTBItemViewer* Viewer);
	void __fastcall DrawItem(TTBItemViewer* Viewer, Graphics::TCanvas* DrawTo, bool Offscreen);
	void __fastcall FreeViewers(void);
	TTBItemViewer* __fastcall GetViewer(int Index);
	int __fastcall GetViewerCount(void);
	void __fastcall ImagesChanged(void);
	int __fastcall InsertItemViewers(const int NewIndex, const TTBCustomItem* AItem, const int AGroupLevel, const bool AddToPriorityList, const bool TopOfPriorityList);
	void __fastcall ItemNotification(TTBCustomItem* Ancestor, bool Relayed, TTBItemChangedAction Action, int Index, TTBCustomItem* Item);
	void __fastcall LinkNotification(TTBCustomItem* Ancestor, bool Relayed, TTBItemChangedAction Action, int Index, TTBCustomItem* Item);
	void __fastcall RecreateItemViewer(const int I);
	void __fastcall Scroll(bool ADown);
	void __fastcall SetCustomizing(bool Value);
	void __fastcall SetSelected(TTBItemViewer* Value);
	void __fastcall SetUsePriorityList(bool Value);
	void __fastcall StartTimer(const TTBViewTimerID ATimer, const int Interval);
	void __fastcall StopAllTimers(void);
	void __fastcall StopTimer(const TTBViewTimerID ATimer);
	void __fastcall UpdateCurParentItem(void);
	
protected:
	TTBBaseAccObject* FAccObjectInstance;
	virtual void __fastcall AutoSize(int AWidth, int AHeight);
	bool __fastcall CalculatePositions(const bool CanMoveControls, const TTBViewOrientation AOrientation, int AWrapOffset, int AChevronOffset, int AChevronSize, Types::TPoint &ABaseSize, Types::TPoint &TotalSize, int &AWrappedLines);
	virtual void __fastcall DoUpdatePositions(Types::TPoint &ASize);
	virtual TTBCustomItem* __fastcall GetChevronItem(void);
	virtual void __fastcall GetMargins(TTBViewOrientation AOrientation, Types::TRect &Margins);
	virtual TTBCustomItem* __fastcall GetMDIButtonsItem(void);
	virtual TTBCustomItem* __fastcall GetMDISystemMenuItem(void);
	TTBView* __fastcall GetParentToolbarView(void);
	TTBView* __fastcall GetRootView(void);
	bool __fastcall HandleWMGetObject(Messages::TMessage &Message);
	void __fastcall InitiateActions(void);
	virtual void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall SetAccelsVisibility(bool AShowAccels);
	
public:
	__fastcall virtual TTBView(Classes::TComponent* AOwner, TTBView* AParentView, TTBCustomItem* AParentItem, Controls::TWinControl* AWindow, bool AIsToolbar, bool ACustomizing, bool AUsePriorityList);
	__fastcall virtual ~TTBView(void);
	void __fastcall BeginUpdate(void);
	void __fastcall CancelCapture(void);
	void __fastcall CancelChildPopups(void);
	void __fastcall CancelMode(void);
	void __fastcall CloseChildPopups(void);
	bool __fastcall ContainsView(TTBView* AView);
	void __fastcall DrawSubitems(Graphics::TCanvas* ACanvas);
	void __fastcall EndModal(void);
	void __fastcall EndModalWithClick(TTBItemViewer* AViewer);
	void __fastcall EndModalWithHelp(int AContextID);
	void __fastcall EndModalWithSystemMenu(HWND AWnd, System::Word AKey);
	void __fastcall EndUpdate(void);
	void __fastcall EnterToolbarLoop(TTBEnterToolbarLoopOptions Options);
	void __fastcall ExecuteSelected(bool AGivePriority);
	TTBItemViewer* __fastcall Find(TTBCustomItem* Item);
	TTBItemViewer* __fastcall FirstSelectable(void);
	TTBBaseAccObject* __fastcall GetAccObject(void);
	HWND __fastcall GetCaptureWnd(void);
	virtual Graphics::TFont* __fastcall GetFont(void);
	void __fastcall GetOffEdgeControlList(const Classes::TList* List);
	void __fastcall GivePriority(TTBItemViewer* AViewer);
	void __fastcall HandleHintShowMessage(Controls::TCMHintShow &Message);
	TTBItemViewer* __fastcall HighestPriorityViewer(void);
	void __fastcall Invalidate(TTBItemViewer* AViewer);
	virtual void __fastcall InvalidatePositions(void);
	int __fastcall IndexOf(TTBItemViewer* AViewer);
	bool __fastcall IsModalEnding(void);
	TTBItemViewer* __fastcall NextSelectable(TTBItemViewer* CurViewer, bool GoForward);
	TTBItemViewer* __fastcall NextSelectableWithAccel(TTBItemViewer* CurViewer, System::WideChar Key, bool RequirePrimaryAccel, bool &IsOnlyItemWithAccel);
	void __fastcall NotifyFocusEvent(void);
	bool __fastcall OpenChildPopup(const bool SelectFirstItem);
	void __fastcall RecreateAllViewers(void);
	void __fastcall ScrollSelectedIntoView(void);
	void __fastcall Select(TTBItemViewer* Value, bool ViaMouse);
	void __fastcall SetCapture(void);
	void __fastcall TryValidatePositions(void);
	void __fastcall UpdateSelection(const Types::TPoint &P, const bool AllowNewSelection);
	Types::TPoint __fastcall UpdatePositions();
	void __fastcall ValidatePositions(void);
	TTBItemViewer* __fastcall ViewerFromPoint(const Types::TPoint &P);
	__property Graphics::TColor BackgroundColor = {read=FBackgroundColor, write=FBackgroundColor, nodefault};
	__property Types::TPoint BaseSize = {read=FBaseSize};
	__property bool Capture = {read=FCapture, nodefault};
	__property int ChevronOffset = {read=FChevronOffset, write=FChevronOffset, nodefault};
	__property int ChevronSize = {read=FChevronSize, write=FChevronSize, nodefault};
	__property bool Customizing = {read=FCustomizing, write=SetCustomizing, nodefault};
	__property bool IsPopup = {read=FIsPopup, nodefault};
	__property bool IsToolbar = {read=FIsToolbar, nodefault};
	__property bool MouseOverSelected = {read=FMouseOverSelected, nodefault};
	__property bool NewViewersGetHighestPriority = {read=FNewViewersGetHighestPriority, write=FNewViewersGetHighestPriority, nodefault};
	__property TTBView* ParentView = {read=FParentView};
	__property TTBCustomItem* ParentItem = {read=FParentItem};
	__property TTBItemViewer* OpenViewer = {read=FOpenViewer};
	__property TTBView* OpenViewerView = {read=FOpenViewerView};
	__property TTBViewOrientation Orientation = {read=FOrientation, write=FOrientation, nodefault};
	__property TTBItemViewer* Selected = {read=FSelected, write=SetSelected};
	__property bool SelectedViaMouse = {read=FSelectedViaMouse, nodefault};
	__property TTBViewState State = {read=FState, nodefault};
	__property TTBViewStyle Style = {read=FStyle, write=FStyle, nodefault};
	__property bool UsePriorityList = {read=FUsePriorityList, write=SetUsePriorityList, nodefault};
	__property TTBItemViewer* Viewers[int Index] = {read=GetViewer};
	__property int ViewerCount = {read=GetViewerCount, nodefault};
	__property Controls::TWinControl* Window = {read=FWindow};
	__property int WrapOffset = {read=FWrapOffset, write=FWrapOffset, nodefault};
};


typedef TMetaClass* TTBRootItemClass;

class DELPHICLASS TTBRootItem;
class PASCALIMPLEMENTATION TTBRootItem : public TTBCustomItem
{
	typedef TTBCustomItem inherited;
	
public:
	/* TTBCustomItem.Create */ inline __fastcall virtual TTBRootItem(Classes::TComponent* AOwner) : TTBCustomItem(AOwner) { }
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBRootItem(void) { }
	
};


class DELPHICLASS TTBItem;
class PASCALIMPLEMENTATION TTBItem : public TTBCustomItem
{
	typedef TTBCustomItem inherited;
	
__published:
	__property Action;
	__property AutoCheck = {default=0};
	__property Caption;
	__property Checked = {default=0};
	__property DisplayMode = {default=0};
	__property Enabled = {default=1};
	__property GroupIndex = {default=0};
	__property HelpContext = {default=0};
	__property Hint;
	__property ImageIndex = {default=-1};
	__property Images;
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property RadioItem = {default=0};
	__property ShortCut = {default=0};
	__property Visible = {default=1};
	__property OnClick;
	__property OnSelect;
public:
	/* TTBCustomItem.Create */ inline __fastcall virtual TTBItem(Classes::TComponent* AOwner) : TTBCustomItem(AOwner) { }
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBItem(void) { }
	
};


class DELPHICLASS TTBGroupItem;
class PASCALIMPLEMENTATION TTBGroupItem : public TTBCustomItem
{
	typedef TTBCustomItem inherited;
	
public:
	__fastcall virtual TTBGroupItem(Classes::TComponent* AOwner);
	
__published:
	__property InheritOptions = {default=1};
	__property LinkSubitems;
	__property MaskOptions = {default=0};
	__property Options = {default=0};
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBGroupItem(void) { }
	
};


class DELPHICLASS TTBSubmenuItem;
class PASCALIMPLEMENTATION TTBSubmenuItem : public TTBCustomItem
{
	typedef TTBCustomItem inherited;
	
private:
	bool __fastcall GetDropdownCombo(void);
	void __fastcall SetDropdownCombo(bool Value);
	
public:
	__fastcall virtual TTBSubmenuItem(Classes::TComponent* AOwner);
	
__published:
	__property Action;
	__property AutoCheck = {default=0};
	__property Caption;
	__property Checked = {default=0};
	__property DisplayMode = {default=0};
	__property bool DropdownCombo = {read=GetDropdownCombo, write=SetDropdownCombo, default=0};
	__property Enabled = {default=1};
	__property GroupIndex = {default=0};
	__property HelpContext = {default=0};
	__property Hint;
	__property ImageIndex = {default=-1};
	__property Images;
	__property InheritOptions = {default=1};
	__property LinkSubitems;
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property RadioItem = {default=0};
	__property ShortCut = {default=0};
	__property SubMenuImages;
	__property Visible = {default=1};
	__property OnClick;
	__property OnPopup;
	__property OnSelect;
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBSubmenuItem(void) { }
	
};


class DELPHICLASS TTBSeparatorItem;
class PASCALIMPLEMENTATION TTBSeparatorItem : public TTBCustomItem
{
	typedef TTBCustomItem inherited;
	
private:
	bool FBlank;
	void __fastcall SetBlank(bool Value);
	
protected:
	virtual TTBItemViewerClass __fastcall GetItemViewerClass(TTBView* AView);
	
public:
	__fastcall virtual TTBSeparatorItem(Classes::TComponent* AOwner);
	
__published:
	__property bool Blank = {read=FBlank, write=SetBlank, default=0};
	__property Hint;
	__property Visible = {default=1};
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBSeparatorItem(void) { }
	
};


class DELPHICLASS TTBSeparatorItemViewer;
class PASCALIMPLEMENTATION TTBSeparatorItemViewer : public TTBItemViewer
{
	typedef TTBItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	virtual bool __fastcall UsesSameWidth(void);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TTBSeparatorItemViewer(TTBView* AView, TTBCustomItem* AItem, int AGroupLevel) : TTBItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TTBSeparatorItemViewer(void) { }
	
};


class DELPHICLASS TTBControlItem;
class PASCALIMPLEMENTATION TTBControlItem : public TTBCustomItem
{
	typedef TTBCustomItem inherited;
	
private:
	Controls::TControl* FControl;
	bool FDontFreeControl;
	void __fastcall SetControl(Controls::TControl* Value);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TTBControlItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBControlItem(void);
	__property bool DontFreeControl = {read=FDontFreeControl, write=FDontFreeControl, nodefault};
	
__published:
	__property Controls::TControl* Control = {read=FControl, write=SetControl};
};


class DELPHICLASS TTBPopupView;
class PASCALIMPLEMENTATION TTBPopupView : public TTBView
{
	typedef TTBView inherited;
	
protected:
	virtual void __fastcall AutoSize(int AWidth, int AHeight);
	
public:
	virtual Graphics::TFont* __fastcall GetFont(void);
public:
	/* TTBView.Create */ inline __fastcall virtual TTBPopupView(Classes::TComponent* AOwner, TTBView* AParentView, TTBCustomItem* AParentItem, Controls::TWinControl* AWindow, bool AIsToolbar, bool ACustomizing, bool AUsePriorityList) : TTBView(AOwner, AParentView, AParentItem, AWindow, AIsToolbar, ACustomizing, AUsePriorityList) { }
	/* TTBView.Destroy */ inline __fastcall virtual ~TTBPopupView(void) { }
	
};


__interface ITBPopupWindow;
typedef System::DelphiInterface<ITBPopupWindow> _di_ITBPopupWindow;
__interface  INTERFACE_UUID("{E45CBE74-1ECF-44CB-B064-6D45B1924708}") ITBPopupWindow  : public System::IInterface 
{
	
};

class PASCALIMPLEMENTATION TTBPopupWindow : public Controls::TCustomControl
{
	typedef Controls::TCustomControl inherited;
	
private:
	bool FAccelsVisibilitySet;
	Tb2anim::TTBAnimationDirection FAnimationDirection;
	TTBView* FView;
	HIDESBASE MESSAGE void __fastcall CMHintShow(Controls::TCMHintShow &Message);
	HIDESBASE MESSAGE void __fastcall CMShowingChanged(Messages::TMessage &Message);
	MESSAGE void __fastcall WMClose(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMGetObject(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMPaint(Messages::TWMPaint &Message);
	MESSAGE void __fastcall WMPrint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMPrintClient(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWindowHandle(void);
	DYNAMIC TTBViewClass __fastcall GetViewClass(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall PaintScrollArrows(void);
	
public:
	__fastcall virtual TTBPopupWindow(Classes::TComponent* AOwner, const TTBView* AParentView, const TTBCustomItem* AItem, const bool ACustomizing);
	__fastcall virtual ~TTBPopupWindow(void);
	__property TTBView* View = {read=FView};
public:
	/* TCustomControl.Create */ inline __fastcall virtual TTBPopupWindow(Classes::TComponent* AOwner) : Controls::TCustomControl(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TTBPopupWindow(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	
private:
	void *__ITBPopupWindow;	/* ITBPopupWindow */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_ITBPopupWindow()
	{
		_di_ITBPopupWindow intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ITBPopupWindow*(void) { return (ITBPopupWindow*)&__ITBPopupWindow; }
	#endif
	
};


__interface ITBItems;
typedef System::DelphiInterface<ITBItems> _di_ITBItems;
__interface  INTERFACE_UUID("{A5C0D7CC-3EC4-4090-A0F8-3D03271877EA}") ITBItems  : public System::IInterface 
{
	
public:
	virtual TTBCustomItem* __fastcall GetItems(void) = 0 ;
};

class DELPHICLASS TTBItemContainer;
class PASCALIMPLEMENTATION TTBItemContainer : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	TTBRootItem* FItem;
	Imglist::TCustomImageList* __fastcall GetImages(void);
	TTBCustomItem* __fastcall GetItems(void);
	void __fastcall SetImages(Imglist::TCustomImageList* Value);
	
protected:
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	
public:
	__fastcall virtual TTBItemContainer(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBItemContainer(void);
	__property TTBRootItem* Items = {read=FItem};
	
__published:
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
private:
	void *__ITBItems;	/* ITBItems */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_ITBItems()
	{
		_di_ITBItems intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ITBItems*(void) { return (ITBItems*)&__ITBItems; }
	#endif
	
};


class DELPHICLASS TTBPopupMenu;
class PASCALIMPLEMENTATION TTBPopupMenu : public Menus::TPopupMenu
{
	typedef Menus::TPopupMenu inherited;
	
private:
	TTBRootItem* FItem;
	Imglist::TCustomImageList* __fastcall GetImages(void);
	TTBCustomItem* __fastcall GetItems(void);
	TTBCustomItem* __fastcall GetLinkSubitems(void);
	TTBItemOptions __fastcall GetOptions(void);
	void __fastcall RootItemClick(System::TObject* Sender);
	HIDESBASE void __fastcall SetImages(Imglist::TCustomImageList* Value);
	void __fastcall SetLinkSubitems(TTBCustomItem* Value);
	void __fastcall SetOptions(TTBItemOptions Value);
	
protected:
	DYNAMIC TTBRootItemClass __fastcall GetRootItemClass(void);
	DYNAMIC void __fastcall SetChildOrder(Classes::TComponent* Child, int Order);
	
public:
	__fastcall virtual TTBPopupMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBPopupMenu(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	DYNAMIC bool __fastcall IsShortCut(Messages::TWMKey &Message);
	virtual void __fastcall Popup(int X, int Y);
	TTBCustomItem* __fastcall PopupEx(int X, int Y, bool ReturnClickedItemOnly = false);
	
__published:
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
	__property TTBRootItem* Items = {read=FItem};
	__property TTBCustomItem* LinkSubitems = {read=GetLinkSubitems, write=SetLinkSubitems};
	__property TTBItemOptions Options = {read=GetOptions, write=SetOptions, default=0};
private:
	void *__ITBItems;	/* ITBItems */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_ITBItems()
	{
		_di_ITBItems intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ITBItems*(void) { return (ITBItems*)&__ITBItems; }
	#endif
	
};


class DELPHICLASS TTBCustomImageList;
class PASCALIMPLEMENTATION TTBCustomImageList : public Controls::TImageList
{
	typedef Controls::TImageList inherited;
	
private:
	Imglist::TCustomImageList* FCheckedImages;
	Imglist::TChangeLink* FCheckedImagesChangeLink;
	Imglist::TCustomImageList* FDisabledImages;
	Imglist::TChangeLink* FDisabledImagesChangeLink;
	Imglist::TCustomImageList* FHotImages;
	Imglist::TChangeLink* FHotImagesChangeLink;
	Graphics::TBitmap* FImagesBitmap;
	Graphics::TColor FImagesBitmapMaskColor;
	void __fastcall ChangeImages(Imglist::TCustomImageList* &AImageList, Imglist::TCustomImageList* Value, Imglist::TChangeLink* AChangeLink);
	void __fastcall ImageListChanged(System::TObject* Sender);
	void __fastcall ImagesBitmapChanged(System::TObject* Sender);
	void __fastcall SetCheckedImages(Imglist::TCustomImageList* Value);
	void __fastcall SetDisabledImages(Imglist::TCustomImageList* Value);
	void __fastcall SetHotImages(Imglist::TCustomImageList* Value);
	void __fastcall SetImagesBitmap(Graphics::TBitmap* Value);
	void __fastcall SetImagesBitmapMaskColor(Graphics::TColor Value);
	
protected:
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	__property Imglist::TCustomImageList* CheckedImages = {read=FCheckedImages, write=SetCheckedImages};
	__property Imglist::TCustomImageList* DisabledImages = {read=FDisabledImages, write=SetDisabledImages};
	__property Imglist::TCustomImageList* HotImages = {read=FHotImages, write=SetHotImages};
	__property Graphics::TBitmap* ImagesBitmap = {read=FImagesBitmap, write=SetImagesBitmap};
	__property Graphics::TColor ImagesBitmapMaskColor = {read=FImagesBitmapMaskColor, write=SetImagesBitmapMaskColor, default=16711935};
	
public:
	__fastcall virtual TTBCustomImageList(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBCustomImageList(void);
	virtual void __fastcall DrawState(Graphics::TCanvas* Canvas, int X, int Y, int Index, bool Enabled, bool Selected, bool Checked);
public:
	/* TCustomImageList.CreateSize */ inline __fastcall TTBCustomImageList(int AWidth, int AHeight) : Controls::TImageList(AWidth, AHeight) { }
	
};


class DELPHICLASS TTBImageList;
class PASCALIMPLEMENTATION TTBImageList : public TTBCustomImageList
{
	typedef TTBCustomImageList inherited;
	
__published:
	__property CheckedImages;
	__property DisabledImages;
	__property HotImages;
	__property ImagesBitmap;
	__property ImagesBitmapMaskColor = {default=16711935};
public:
	/* TTBCustomImageList.Create */ inline __fastcall virtual TTBImageList(Classes::TComponent* AOwner) : TTBCustomImageList(AOwner) { }
	/* TTBCustomImageList.Destroy */ inline __fastcall virtual ~TTBImageList(void) { }
	
public:
	/* TCustomImageList.CreateSize */ inline __fastcall TTBImageList(int AWidth, int AHeight) : TTBCustomImageList(AWidth, AHeight) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const int tbMenuBkColor = -16777212;
static const int tbMenuTextColor = -16777209;
static const ShortInt tbMenuVerticalMargin = 0x4;
static const ShortInt tbMenuImageTextSpace = 0x1;
static const ShortInt tbMenuLeftTextMargin = 0x2;
static const ShortInt tbMenuRightTextMargin = 0x3;
static const ShortInt tbMenuSeparatorOffset = 0xc;
static const ShortInt tbMenuScrollArrowHeight = 0x13;
static const ShortInt tbDropdownArrowWidth = 0x8;
static const ShortInt tbDropdownArrowMargin = 0x3;
static const ShortInt tbDropdownComboArrowWidth = 0xb;
static const ShortInt tbDropdownComboMargin = 0x2;
static const ShortInt tbLineSpacing = 0x6;
static const ShortInt tbLineSepOffset = 0x1;
static const ShortInt tbDockedLineSepOffset = 0x4;
static const Word WM_TB2K_CLICKITEM = 0x500;
extern PACKAGE Graphics::TFont* ToolbarFont;
extern PACKAGE TTBCustomItem* __fastcall TBGetItems(const System::TObject* AObject);
extern PACKAGE void __fastcall TBInitToolbarSystemFont(void);

}	/* namespace Tb2item */
using namespace Tb2item;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2itemHPP
