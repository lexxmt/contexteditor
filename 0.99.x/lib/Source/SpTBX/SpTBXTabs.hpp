// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxtabs.pas' rev: 20.00

#ifndef SptbxtabsHPP
#define SptbxtabsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxtabs
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TSpTBXTabEdge { tedNone, tedLeft, tedRight };
#pragma option pop

#pragma option push -b-
enum TSpTBXTabPosition { ttpTop, ttpBottom };
#pragma option pop

#pragma option push -b-
enum TSpTBXTabCloseButton { tcbNone, tcbActive, tcbAll };
#pragma option pop

typedef void __fastcall (__closure *TSpTBXTabChangeEvent)(System::TObject* Sender, int TabIndex);

typedef void __fastcall (__closure *TSpTBXTabChangingEvent)(System::TObject* Sender, int TabIndex, int NewTabIndex, bool &Allow);

typedef void __fastcall (__closure *TSpTBXTabClosingEvent)(System::TObject* Sender, bool &Allow, bool &CloseAndFree);

class DELPHICLASS TSpTBXTabItemDragObject;
class PASCALIMPLEMENTATION TSpTBXTabItemDragObject : public Sptbxitem::TSpTBXCustomDragObject
{
	typedef Sptbxitem::TSpTBXCustomDragObject inherited;
	
public:
	__fastcall virtual TSpTBXTabItemDragObject(Controls::TControl* ASourceControl, Tb2item::TTBCustomItem* AItem);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSpTBXTabItemDragObject(void) { }
	
};


class DELPHICLASS TSpTBXTabItem;
class DELPHICLASS TSpTBXTabToolbar;
class PASCALIMPLEMENTATION TSpTBXTabItem : public Sptbxitem::TSpTBXCustomItem
{
	typedef Sptbxitem::TSpTBXCustomItem inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	Sptbxitem::TSpTBXDrawImageEvent FOnDrawTabCloseButton;
	Classes::TNotifyEvent FOnTabClose;
	TSpTBXTabClosingEvent FOnTabClosing;
	Graphics::TColor __fastcall GetTabColor(void);
	Sptbxskins::TSpTBXSkinType __fastcall GetSkinType(void);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	
protected:
	virtual bool __fastcall DialogChar(System::Word CharCode);
	virtual void __fastcall DoDrawTabCloseButton(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const Sptbxitem::TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	virtual void __fastcall DoTabClose(void);
	virtual void __fastcall DoTabClosing(bool &Allow, bool &CloseAndFree);
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	bool __fastcall GetTabToolbar(/* out */ TSpTBXTabToolbar* &TabToolbar);
	virtual void __fastcall ToggleControl(void);
	__property Control;
	__property Graphics::TColor TabColor = {read=GetTabColor, nodefault};
	
public:
	__fastcall virtual TSpTBXTabItem(Classes::TComponent* AOwner);
	virtual void __fastcall Click(void);
	void __fastcall TabClose(void);
	TSpTBXTabItem* __fastcall GetNextTab(bool GoForward, Sptbxitem::TSpTBXSearchItemViewerType SearchType);
	bool __fastcall IsFirstVisible(void);
	bool __fastcall IsFirstVisibleTab(void);
	bool __fastcall IsLastVisibleTab(void);
	
__published:
	__property Action;
	__property Checked = {default=0};
	__property Enabled = {default=1};
	__property HelpContext = {default=0};
	__property ImageIndex = {default=-1};
	__property Images;
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property ShortCut = {default=0};
	__property Visible = {default=1};
	__property OnClick;
	__property OnSelect;
	__property Alignment = {default=2};
	__property CustomWidth = {default=-1};
	__property CustomHeight = {default=-1};
	__property Margins = {default=4};
	__property MinHeight = {default=0};
	__property MinWidth = {default=0};
	__property FontSettings;
	__property Wrapping = {default=1};
	__property OnDrawImage;
	__property OnDrawItem;
	__property OnDrawHint;
	__property OnDrawCaption;
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=GetSkinType, write=SetSkinType, default=2};
	__property Sptbxitem::TSpTBXDrawImageEvent OnDrawTabCloseButton = {read=FOnDrawTabCloseButton, write=FOnDrawTabCloseButton};
	__property Classes::TNotifyEvent OnTabClose = {read=FOnTabClose, write=FOnTabClose};
	__property TSpTBXTabClosingEvent OnTabClosing = {read=FOnTabClosing, write=FOnTabClosing};
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXTabItem(void) { }
	
};


class DELPHICLASS TSpTBXTabItemViewer;
class PASCALIMPLEMENTATION TSpTBXTabItemViewer : public Sptbxitem::TSpTBXItemViewer
{
	typedef Sptbxitem::TSpTBXItemViewer inherited;
	
private:
	Sptbxskins::TSpTBXSkinStatesType FTabCloseButtonState;
	Types::TRect __fastcall CorrectTabRect(const Types::TRect &ARect);
	HIDESBASE TSpTBXTabItem* __fastcall GetItem(void);
	void __fastcall GetTabCloseButtonImgList(Imglist::TCustomImageList* &AImageList, int &AImageIndex);
	bool __fastcall IsTabCloseButtonVisible(void);
	TSpTBXTabPosition __fastcall GetTabPosition(void);
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	virtual void __fastcall DoDrawButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawCaption(Graphics::TCanvas* ACanvas, const Types::TRect &ClientAreaRect, Sptbxskins::TSpTBXSkinStatesType State, System::WideString &ACaption, Types::TRect &CaptionRect, unsigned &CaptionFormat, bool IsTextRotated, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawImage(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const Sptbxitem::TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	virtual void __fastcall DoDrawTabCloseButton(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const Sptbxitem::TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	void __fastcall DrawBottomBorder(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawTab(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool AEnabled, bool AChecked, bool AHoverItem, TSpTBXTabPosition Position, bool ASeparator = false, TSpTBXTabEdge AEdge = (TSpTBXTabEdge)(0x0));
	virtual void __fastcall DrawItemRightImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	virtual tagSIZE __fastcall GetRightImageSize();
	Types::TRect __fastcall GetRightImageRect();
	virtual Graphics::TColor __fastcall GetTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	virtual void __fastcall InternalMouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Leaving(void);
	
public:
	bool __fastcall IsOnTabToolbar(void);
	__property TSpTBXTabItem* Item = {read=GetItem};
	__property Sptbxskins::TSpTBXSkinStatesType TabCloseButtonState = {read=FTabCloseButtonState, nodefault};
	__property TSpTBXTabPosition TabPosition = {read=GetTabPosition, nodefault};
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXTabItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Sptbxitem::TSpTBXItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXTabItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXCustomTabSet;
class PASCALIMPLEMENTATION TSpTBXTabToolbar : public Sptbxitem::TSpTBXToolbar
{
	typedef Sptbxitem::TSpTBXToolbar inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	int FUpdateHidden;
	bool FTabAutofit;
	int FTabAutofitMaxSize;
	int FTabCloseButtonImageIndex;
	TSpTBXTabCloseButton FTabCloseButton;
	bool FTabDragReorder;
	bool FTabBackgroundBorders;
	Graphics::TColor FTabColor;
	int FTabMaxSize;
	TSpTBXTabPosition FTabPosition;
	void __fastcall Scroll(bool ToRight);
	TSpTBXTabItem* __fastcall GetActiveTab(void);
	void __fastcall SetActiveTabIndex(int Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	void __fastcall SetTabCloseButton(const TSpTBXTabCloseButton Value);
	void __fastcall SetTabCloseButtonImageIndex(const int Value);
	void __fastcall SetTabAutofit(const bool Value);
	void __fastcall SetTabAutofitMaxSize(const int Value);
	void __fastcall SetTabBackgroundBorders(const bool Value);
	void __fastcall SetTabColor(const Graphics::TColor Value);
	void __fastcall SetTabMaxSize(const int Value);
	void __fastcall SetTabPosition(const TSpTBXTabPosition Value);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Message);
	
protected:
	Sptbxitem::TSpTBXItemCacheCollection* FHiddenTabs;
	int FActiveTabIndex;
	TSpTBXCustomTabSet* FOwnerTabControl;
	void __fastcall Autofit(void);
	void __fastcall BeginUpdateHidden(void);
	void __fastcall EndUpdateHidden(void);
	virtual Graphics::TColor __fastcall GetItemsTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	virtual void __fastcall InternalDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool PaintOnNCArea, bool PaintBorders = true);
	virtual void __fastcall DoItemNotification(Tb2item::TTBCustomItem* Ancestor, bool Relayed, Tb2item::TTBItemChangedAction Action, int Index, Tb2item::TTBCustomItem* Item);
	virtual void __fastcall RightAlignItems(void);
	virtual bool __fastcall CanDragCustomize(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	
public:
	__fastcall virtual TSpTBXTabToolbar(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXTabToolbar(void);
	int __fastcall GetTabsCount(bool VisibleOnly);
	void __fastcall InvalidateActiveTab(void);
	void __fastcall InvalidateNC(void);
	void __fastcall MakeVisible(TSpTBXTabItem* ATab);
	void __fastcall ScrollLeft(void);
	void __fastcall ScrollRight(void);
	void __fastcall ScrollState(/* out */ bool &CanScrollToLeft, /* out */ bool &CanScrollToRight);
	void __fastcall TabClose(TSpTBXTabItem* ATab);
	
__published:
	__property TSpTBXTabItem* ActiveTab = {read=GetActiveTab};
	__property int ActiveTabIndex = {read=FActiveTabIndex, write=SetActiveTabIndex, nodefault};
	__property TSpTBXTabCloseButton TabCloseButton = {read=FTabCloseButton, write=SetTabCloseButton, default=0};
	__property int TabCloseButtonImageIndex = {read=FTabCloseButtonImageIndex, write=SetTabCloseButtonImageIndex, default=-1};
	__property bool TabBackgroundBorders = {read=FTabBackgroundBorders, write=SetTabBackgroundBorders, nodefault};
	__property bool TabAutofit = {read=FTabAutofit, write=SetTabAutofit, default=0};
	__property int TabAutofitMaxSize = {read=FTabAutofitMaxSize, write=SetTabAutofitMaxSize, default=200};
	__property Graphics::TColor TabColor = {read=FTabColor, write=SetTabColor, default=-16777201};
	__property int TabMaxSize = {read=FTabMaxSize, write=SetTabMaxSize, default=-1};
	__property TSpTBXTabPosition TabPosition = {read=FTabPosition, write=SetTabPosition, default=0};
	__property bool TabDragReorder = {read=FTabDragReorder, write=FTabDragReorder, default=0};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTabToolbar(HWND ParentWindow) : Sptbxitem::TSpTBXToolbar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTabSheet;
class DELPHICLASS TSpTBXCustomTabControl;
class PASCALIMPLEMENTATION TSpTBXTabSheet : public Controls::TCustomControl
{
	typedef Controls::TCustomControl inherited;
	
private:
	TSpTBXCustomTabControl* FTabControl;
	TSpTBXTabItem* FItem;
	System::UnicodeString FItemName;
	Controls::TWinControl* FPrevFocused;
	void __fastcall ReadItemName(Classes::TReader* Reader);
	void __fastcall WriteItemName(Classes::TWriter* Writer);
	System::WideString __fastcall GetCaption();
	bool __fastcall GetTabVisible(void);
	void __fastcall SetCaption(const System::WideString Value);
	void __fastcall SetTabVisible(const bool Value);
	int __fastcall GetImageIndex(void);
	void __fastcall SetImageIndex(const int Value);
	HIDESBASE MESSAGE void __fastcall CMVisiblechanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	DYNAMIC void __fastcall VisibleChanging(void);
	__property Align = {default=5};
	__property Controls::TWinControl* PrevFocused = {read=FPrevFocused};
	
public:
	__fastcall virtual TSpTBXTabSheet(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXTabSheet(void);
	__property TSpTBXTabItem* Item = {read=FItem, write=FItem};
	__property TSpTBXCustomTabControl* TabControl = {read=FTabControl, write=FTabControl};
	
__published:
	__property PopupMenu;
	__property System::WideString Caption = {read=GetCaption, write=SetCaption};
	__property int ImageIndex = {read=GetImageIndex, write=SetImageIndex, nodefault};
	__property bool TabVisible = {read=GetTabVisible, write=SetTabVisible, default=1};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTabSheet(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TSpTBXCustomTabSet : public Sptbxitem::TSpTBXCompoundItemsControl
{
	typedef Sptbxitem::TSpTBXCompoundItemsControl inherited;
	
private:
	int FItemMoveCount;
	TSpTBXTabItem* FItemMoved;
	bool FTabVisible;
	int FLoadingActiveIndex;
	bool FUpdatingIndex;
	bool FResizing;
	Sptbxitem::TSpTBXDrawEvent FOnDrawBackground;
	TSpTBXTabChangeEvent FOnActiveTabChange;
	TSpTBXTabChangingEvent FOnActiveTabChanging;
	TSpTBXTabChangeEvent FOnActiveTabReorder;
	TSpTBXTabChangingEvent FOnActiveTabReordering;
	void __fastcall ReadHiddenItems(Classes::TReader* Reader);
	void __fastcall WriteHiddenItems(Classes::TWriter* Writer);
	int __fastcall GetActiveTabIndex(void);
	void __fastcall SetActiveTabIndex(int Value);
	Sptbxskins::TSpTBXSkinType __fastcall GetSkinType(void);
	HIDESBASE void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	bool __fastcall GetTabAutofit(void);
	void __fastcall SetTabAutofit(const bool Value);
	int __fastcall GetTabAutofitMaxSize(void);
	void __fastcall SetTabAutofitMaxSize(const int Value);
	bool __fastcall GetTabBackgroundBorders(void);
	void __fastcall SetTabBackgroundBorders(const bool Value);
	Graphics::TColor __fastcall GetTabBackgroundColor(void);
	void __fastcall SetTabBackgroundColor(const Graphics::TColor Value);
	TSpTBXTabCloseButton __fastcall GetTabCloseButton(void);
	void __fastcall SetTabCloseButton(const TSpTBXTabCloseButton Value);
	int __fastcall GetTabCloseButtonImageIndex(void);
	void __fastcall SetTabCloseButtonImageIndex(const int Value);
	bool __fastcall GetTabDragReorder(void);
	void __fastcall SetTabDragReorder(const bool Value);
	int __fastcall GetTabMaxSize(void);
	void __fastcall SetTabMaxSize(const int Value);
	TSpTBXTabPosition __fastcall GetTabPosition(void);
	void __fastcall SetTabPosition(const TSpTBXTabPosition Value);
	void __fastcall SetTabVisible(const bool Value);
	TSpTBXTabToolbar* __fastcall GetTabToolbar(void);
	HIDESBASE MESSAGE void __fastcall CMColorchanged(Messages::TMessage &Message);
	MESSAGE void __fastcall CMSpTBXControlsInvalidate(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TMessage &Message);
	MESSAGE void __fastcall WMInvalidateTabBackground(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	
protected:
	Graphics::TBitmap* FBackground;
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual bool __fastcall GetFullRepaint(void);
	virtual bool __fastcall CanActiveTabChange(const int TabIndex, const int NewTabIndex);
	virtual void __fastcall DoActiveTabChange(const int TabIndex);
	virtual bool __fastcall CanActiveTabReorder(const int TabIndex, const int NewTabIndex);
	virtual void __fastcall DoActiveTabReorder(const int TabIndex);
	virtual void __fastcall ItemNotification(Tb2item::TTBCustomItem* Ancestor, bool Relayed, Tb2item::TTBItemChangedAction Action, int Index, Tb2item::TTBCustomItem* Item);
	virtual void __fastcall TabInserted(TSpTBXTabItem* Item);
	virtual void __fastcall TabDeleting(TSpTBXTabItem* Item, bool FreeTabSheet = true);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual Sptbxitem::TSpTBXToolbarClass __fastcall GetToolbarClass(void);
	virtual void __fastcall Loaded(void);
	__property Color = {default=-16777201};
	__property ParentColor = {default=0};
	__property int ActiveTabIndex = {read=GetActiveTabIndex, write=SetActiveTabIndex, nodefault};
	__property bool TabAutofit = {read=GetTabAutofit, write=SetTabAutofit, default=0};
	__property int TabAutofitMaxSize = {read=GetTabAutofitMaxSize, write=SetTabAutofitMaxSize, default=200};
	__property Graphics::TColor TabBackgroundColor = {read=GetTabBackgroundColor, write=SetTabBackgroundColor, default=536870911};
	__property bool TabBackgroundBorders = {read=GetTabBackgroundBorders, write=SetTabBackgroundBorders, default=0};
	__property TSpTBXTabCloseButton TabCloseButton = {read=GetTabCloseButton, write=SetTabCloseButton, default=0};
	__property int TabCloseButtonImageIndex = {read=GetTabCloseButtonImageIndex, write=SetTabCloseButtonImageIndex, default=-1};
	__property bool TabDragReorder = {read=GetTabDragReorder, write=SetTabDragReorder, default=0};
	__property int TabMaxSize = {read=GetTabMaxSize, write=SetTabMaxSize, default=-1};
	__property TSpTBXTabPosition TabPosition = {read=GetTabPosition, write=SetTabPosition, default=0};
	__property bool TabVisible = {read=FTabVisible, write=SetTabVisible, default=1};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=GetSkinType, write=SetSkinType, default=2};
	__property TSpTBXTabChangeEvent OnActiveTabChange = {read=FOnActiveTabChange, write=FOnActiveTabChange};
	__property TSpTBXTabChangingEvent OnActiveTabChanging = {read=FOnActiveTabChanging, write=FOnActiveTabChanging};
	__property TSpTBXTabChangeEvent OnActiveTabReorder = {read=FOnActiveTabReorder, write=FOnActiveTabReorder};
	__property TSpTBXTabChangingEvent OnActiveTabReordering = {read=FOnActiveTabReordering, write=FOnActiveTabReordering};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	
public:
	__fastcall virtual TSpTBXCustomTabSet(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomTabSet(void);
	TSpTBXTabItem* __fastcall Add(System::WideString ACaption);
	HIDESBASE TSpTBXTabItem* __fastcall Insert(int NewIndex, System::WideString ACaption);
	bool __fastcall DrawBackground(HDC DC, const Types::TRect &ARect);
	int __fastcall GetTabSetHeight(void);
	virtual void __fastcall InvalidateBackground(bool InvalidateChildren = true);
	void __fastcall MakeVisible(TSpTBXTabItem* ATab);
	void __fastcall ScrollLeft(void);
	void __fastcall ScrollRight(void);
	void __fastcall ScrollState(/* out */ bool &Left, /* out */ bool &Right);
	virtual void __fastcall TabClick(TSpTBXTabItem* ATab);
	__property Canvas;
	__property TSpTBXTabToolbar* Toolbar = {read=GetTabToolbar};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomTabSet(HWND ParentWindow) : Sptbxitem::TSpTBXCompoundItemsControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTabSet;
class PASCALIMPLEMENTATION TSpTBXTabSet : public TSpTBXCustomTabSet
{
	typedef TSpTBXCustomTabSet inherited;
	
__published:
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Color = {default=-16777201};
	__property Constraints;
	__property DockSite = {default=0};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentColor = {default=0};
	__property ParentBiDiMode = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Visible = {default=1};
	__property OnCanResize;
	__property OnContextPopup;
	__property OnDockDrop;
	__property OnDockOver;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGetSiteInfo;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnResize;
	__property OnStartDock;
	__property OnStartDrag;
	__property OnUnDock;
	__property ActiveTabIndex;
	__property Images;
	__property TabAutofit = {default=0};
	__property TabAutofitMaxSize = {default=200};
	__property TabBackgroundColor = {default=536870911};
	__property TabBackgroundBorders = {default=0};
	__property TabCloseButton = {default=0};
	__property TabCloseButtonImageIndex = {default=-1};
	__property TabDragReorder = {default=0};
	__property TabMaxSize = {default=-1};
	__property TabPosition = {default=0};
	__property TabVisible = {default=1};
	__property SkinType = {default=2};
	__property OnActiveTabChange;
	__property OnActiveTabChanging;
	__property OnActiveTabReorder;
	__property OnActiveTabReordering;
	__property OnDrawBackground;
public:
	/* TSpTBXCustomTabSet.Create */ inline __fastcall virtual TSpTBXTabSet(Classes::TComponent* AOwner) : TSpTBXCustomTabSet(AOwner) { }
	/* TSpTBXCustomTabSet.Destroy */ inline __fastcall virtual ~TSpTBXTabSet(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTabSet(HWND ParentWindow) : TSpTBXCustomTabSet(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TSpTBXCustomTabControl : public TSpTBXCustomTabSet
{
	typedef TSpTBXCustomTabSet inherited;
	
private:
	TSpTBXTabSheet* FEmptyTabSheet;
	void __fastcall RealignTabSheets(void);
	TSpTBXTabSheet* __fastcall GetActivePage(void);
	TSpTBXTabSheet* __fastcall GetPages(int Index);
	int __fastcall GetPagesCount(void);
	void __fastcall SetActivePage(const TSpTBXTabSheet* Value);
	HIDESBASE MESSAGE void __fastcall CMSpTBXControlsInvalidate(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	Classes::TList* FPages;
	virtual void __fastcall DoActiveTabChange(const int ItemIndex);
	virtual bool __fastcall GetFullRepaint(void);
	virtual void __fastcall TabInserted(TSpTBXTabItem* Item);
	virtual void __fastcall TabDeleting(TSpTBXTabItem* Item, bool FreeTabSheet = true);
	
public:
	__fastcall virtual TSpTBXCustomTabControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomTabControl(void);
	TSpTBXTabSheet* __fastcall GetPage(TSpTBXTabItem* Item);
	__property TSpTBXTabSheet* ActivePage = {read=GetActivePage, write=SetActivePage};
	__property TSpTBXTabSheet* Pages[int Index] = {read=GetPages};
	__property int PagesCount = {read=GetPagesCount, nodefault};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomTabControl(HWND ParentWindow) : TSpTBXCustomTabSet(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTabControl;
class PASCALIMPLEMENTATION TSpTBXTabControl : public TSpTBXCustomTabControl
{
	typedef TSpTBXCustomTabControl inherited;
	
__published:
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Color = {default=-16777201};
	__property Constraints;
	__property DockSite = {default=0};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentColor = {default=0};
	__property ParentBiDiMode = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Visible = {default=1};
	__property OnCanResize;
	__property OnContextPopup;
	__property OnDockDrop;
	__property OnDockOver;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGetSiteInfo;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnResize;
	__property OnStartDock;
	__property OnStartDrag;
	__property OnUnDock;
	__property ActiveTabIndex;
	__property Images;
	__property TabAutofit = {default=0};
	__property TabAutofitMaxSize = {default=200};
	__property TabBackgroundColor = {default=536870911};
	__property TabBackgroundBorders = {default=0};
	__property TabCloseButton = {default=0};
	__property TabCloseButtonImageIndex = {default=-1};
	__property TabDragReorder = {default=0};
	__property TabMaxSize = {default=-1};
	__property TabPosition = {default=0};
	__property TabVisible = {default=1};
	__property SkinType = {default=2};
	__property OnActiveTabChange;
	__property OnActiveTabChanging;
	__property OnActiveTabReorder;
	__property OnActiveTabReordering;
	__property OnDrawBackground;
public:
	/* TSpTBXCustomTabControl.Create */ inline __fastcall virtual TSpTBXTabControl(Classes::TComponent* AOwner) : TSpTBXCustomTabControl(AOwner) { }
	/* TSpTBXCustomTabControl.Destroy */ inline __fastcall virtual ~TSpTBXTabControl(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTabControl(HWND ParentWindow) : TSpTBXCustomTabControl(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word C_SpTBXTabGroupIndex = 0x1e61;
static const Word WM_INVALIDATETABBACKGROUND = 0x2261;
extern PACKAGE Tb2item::TTBItemViewer* __fastcall SpGetNextTabItemViewer(Tb2item::TTBView* View, Tb2item::TTBItemViewer* IV, bool GoForward, Sptbxitem::TSpTBXSearchItemViewerType SearchType);
extern PACKAGE void __fastcall SpDrawXPTab(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool Checked, bool HotTrack, bool Focused, TSpTBXTabPosition Position, Sptbxskins::TSpTBXSkinType SkinType, TSpTBXTabEdge Edge = (TSpTBXTabEdge)(0x0));
extern PACKAGE void __fastcall SpDrawXPTabControlBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor AColor, bool BottomTabs, Sptbxskins::TSpTBXSkinType SkinType);

}	/* namespace Sptbxtabs */
using namespace Sptbxtabs;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxtabsHPP
