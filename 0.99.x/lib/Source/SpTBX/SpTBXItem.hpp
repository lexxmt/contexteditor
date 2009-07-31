// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxitem.pas' rev: 20.00

#ifndef SptbxitemHPP
#define SptbxitemHPP

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
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2toolwindow.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxitem
{
//-- type declarations -------------------------------------------------------
typedef Classes::TStringList* TTntStringList;

#pragma option push -b-
enum TSpTBXPaintStage { pstPrePaint, pstPostPaint };
#pragma option pop

#pragma option push -b-
enum TSpTBXToolbarDisplayMode { tbdmSelectiveCaption, tbdmImageOnly, tbdmImageAboveCaption, tbdmTextOnly };
#pragma option pop

#pragma option push -b-
enum TSpTBXToolbarState { tstResizing, tstRightAligning, tstAnchoring };
#pragma option pop

typedef Set<TSpTBXToolbarState, tstResizing, tstAnchoring>  TSpTBXToolbarStates;

#pragma option push -b-
enum TSpBorderIcon { briSystemMenu, briMinimize, briMaximize, briClose };
#pragma option pop

typedef Set<TSpBorderIcon, briSystemMenu, briClose>  TSpBorderIcons;

#pragma option push -b-
enum TTextWrapping { twNone, twEndEllipsis, twPathEllipsis, twWrap };
#pragma option pop

#pragma option push -b-
enum TSpTBXSearchItemViewerType { sivtNormal, sivtInmediate, sivtInmediateSkipNonVisible };
#pragma option pop

typedef void __fastcall (__closure *TSpTBXGetImageIndexEvent)(System::TObject* Sender, Imglist::TCustomImageList* &AImageList, int &AItemIndex);

typedef void __fastcall (__closure *TSpTBXDrawEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);

typedef void __fastcall (__closure *TSpTBXDrawImageEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);

typedef void __fastcall (__closure *TSpTBXDrawItemEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const TSpTBXPaintStage PaintStage, bool &PaintDefault);

typedef void __fastcall (__closure *TSpTBXDrawPosEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, int X, int Y, bool &PaintDefault);

typedef void __fastcall (__closure *TSpTBXDrawTextEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ClientAreaRect, Sptbxskins::TSpTBXSkinStatesType State, System::WideString &ACaption, Types::TRect &CaptionRect, unsigned &CaptionFormat, bool IsTextRotated, const TSpTBXPaintStage PaintStage, bool &PaintDefault);

typedef void __fastcall (__closure *TSpTBXDrawHintEvent)(System::TObject* Sender, Graphics::TBitmap* AHintBitmap, System::WideString &AHint, bool &PaintDefault);

typedef void __fastcall (__closure *TSpTBXItemNotificationEvent)(System::TObject* Sender, Tb2item::TTBCustomItem* Ancestor, bool Relayed, Tb2item::TTBItemChangedAction Action, int Index, Tb2item::TTBCustomItem* Item);

typedef void __fastcall (__closure *TSpTBXRadioGroupFillStringsEvent)(System::TObject* Sender, Classes::TStringList* Strings);

typedef void __fastcall (__closure *TSpTBXPopupEvent)(System::TObject* Sender, Tb2item::TTBView* PopupView);

typedef Word TSpTBXFontSize;

class DELPHICLASS TSpTBXFontSettings;
class PASCALIMPLEMENTATION TSpTBXFontSettings : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FColor;
	Graphics::TFontName FName;
	TSpTBXFontSize FSize;
	Graphics::TFontStyles FStyle;
	Classes::TNotifyEvent FOnChange;
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetName(const Graphics::TFontName Value);
	void __fastcall SetSize(TSpTBXFontSize Value);
	void __fastcall SetStyle(const Graphics::TFontStyles Value);
	
protected:
	void __fastcall Modified(void);
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	
public:
	__fastcall TSpTBXFontSettings(void);
	void __fastcall Apply(Graphics::TFont* AFont);
	virtual void __fastcall Assign(Classes::TPersistent* Src);
	
__published:
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=536870911};
	__property Graphics::TFontName Name = {read=FName, write=SetName};
	__property TSpTBXFontSize Size = {read=FSize, write=SetSize, default=100};
	__property Graphics::TFontStyles Style = {read=FStyle, write=SetStyle, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSpTBXFontSettings(void) { }
	
};


class DELPHICLASS TSpTBXCustomDragObject;
class PASCALIMPLEMENTATION TSpTBXCustomDragObject : public Controls::TDragObjectEx
{
	typedef Controls::TDragObjectEx inherited;
	
private:
	Controls::TCursor FDragCursorAccept;
	Controls::TCursor FDragCursorCancel;
	Controls::TControl* FSourceControl;
	Tb2item::TTBCustomItem* FSourceItem;
	
protected:
	virtual Controls::TCursor __fastcall GetDragCursor(bool Accepted, int X, int Y);
	virtual void __fastcall Finished(System::TObject* Target, int X, int Y, bool Accepted);
	
public:
	__fastcall virtual TSpTBXCustomDragObject(Controls::TControl* ASourceControl, Tb2item::TTBCustomItem* AItem);
	__property Controls::TCursor DragCursorAccept = {read=FDragCursorAccept, write=FDragCursorAccept, nodefault};
	__property Controls::TCursor DragCursorCancel = {read=FDragCursorCancel, write=FDragCursorCancel, nodefault};
	__property Tb2item::TTBCustomItem* SouceItem = {read=FSourceItem};
	__property Controls::TControl* SourceControl = {read=FSourceControl};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSpTBXCustomDragObject(void) { }
	
};


class DELPHICLASS TSpTBXItemDragObject;
class PASCALIMPLEMENTATION TSpTBXItemDragObject : public TSpTBXCustomDragObject
{
	typedef TSpTBXCustomDragObject inherited;
	
public:
	/* TSpTBXCustomDragObject.Create */ inline __fastcall virtual TSpTBXItemDragObject(Controls::TControl* ASourceControl, Tb2item::TTBCustomItem* AItem) : TSpTBXCustomDragObject(ASourceControl, AItem) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSpTBXItemDragObject(void) { }
	
};


class DELPHICLASS TSpTBXCustomItemActionLink;
class PASCALIMPLEMENTATION TSpTBXCustomItemActionLink : public Tb2item::TTBCustomItemActionLink
{
	typedef Tb2item::TTBCustomItemActionLink inherited;
	
public:
	/* TBasicActionLink.Create */ inline __fastcall virtual TSpTBXCustomItemActionLink(System::TObject* AClient) : Tb2item::TTBCustomItemActionLink(AClient) { }
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TSpTBXCustomItemActionLink(void) { }
	
};


class DELPHICLASS TSpTBXCustomControl;
class PASCALIMPLEMENTATION TSpTBXCustomControl : public Controls::TCustomControl
{
	typedef Controls::TCustomControl inherited;
	
public:
	/* TCustomControl.Create */ inline __fastcall virtual TSpTBXCustomControl(Classes::TComponent* AOwner) : Controls::TCustomControl(AOwner) { }
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TSpTBXCustomControl(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomControl(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomItem;
class PASCALIMPLEMENTATION TSpTBXCustomItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	Sptbxskins::TSpGlowDirection FCaptionGlow;
	Graphics::TColor FCaptionGlowColor;
	Classes::TAlignment FAlignment;
	bool FAnchored;
	Controls::TControl* FControl;
	int FCustomWidth;
	int FCustomHeight;
	TSpTBXFontSettings* FFontSettings;
	int FMargins;
	int FMinHeight;
	int FMinWidth;
	bool FStretch;
	bool FToolbarStylePopup;
	bool FToolBoxPopup;
	TTextWrapping FWrapping;
	Classes::TNotifyEvent FOnClosePopup;
	TSpTBXPopupEvent FOnInitPopup;
	TSpTBXDrawTextEvent FOnDrawCaption;
	TSpTBXDrawHintEvent FOnDrawHint;
	TSpTBXDrawItemEvent FOnDrawItem;
	TSpTBXDrawImageEvent FOnDrawImage;
	void __fastcall FontSettingsChanged(System::TObject* Sender);
	void __fastcall SetAlignment(const Classes::TAlignment Value);
	void __fastcall SetAnchored(const bool Value);
	void __fastcall SetCaptionGlow(const Sptbxskins::TSpGlowDirection Value);
	void __fastcall SetCaptionGlowColor(const Graphics::TColor Value);
	void __fastcall SetControl(const Controls::TControl* Value);
	void __fastcall SetCustomWidth(int Value);
	void __fastcall SetCustomHeight(int Value);
	void __fastcall SetFontSettings(const TSpTBXFontSettings* Value);
	void __fastcall SetMargins(int Value);
	void __fastcall SetMinHeight(const int Value);
	void __fastcall SetMinWidth(const int Value);
	void __fastcall SetStretch(const bool Value);
	void __fastcall SetToolBoxPopup(const bool Value);
	void __fastcall SetWrapping(const TTextWrapping Value);
	
protected:
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	virtual bool __fastcall DialogChar(System::Word CharCode);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall DoDrawAdjustFont(Graphics::TFont* AFont, Sptbxskins::TSpTBXSkinStatesType State);
	virtual void __fastcall DoDrawHint(Graphics::TBitmap* AHintBitmap, System::WideString &AHint, bool &PaintDefault);
	virtual void __fastcall DoDrawButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawCaption(Graphics::TCanvas* ACanvas, const Types::TRect &ClientAreaRect, Sptbxskins::TSpTBXSkinStatesType State, System::WideString &ACaption, Types::TRect &CaptionRect, unsigned &CaptionFormat, bool IsTextRotated, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawImage(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	virtual void __fastcall DoPopupShowingChanged(Tb2item::TTBPopupWindow* APopupWindow, bool IsVisible);
	DYNAMIC Tb2item::TTBCustomItemActionLinkClass __fastcall GetActionLinkClass(void);
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	virtual Tb2item::TTBPopupWindowClass __fastcall GetPopupWindowClass(void);
	virtual void __fastcall ToggleControl(void);
	virtual void __fastcall UpdateProps(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=2};
	__property bool Anchored = {read=FAnchored, write=SetAnchored, default=0};
	__property Sptbxskins::TSpGlowDirection CaptionGlow = {read=FCaptionGlow, write=SetCaptionGlow, default=0};
	__property Graphics::TColor CaptionGlowColor = {read=FCaptionGlowColor, write=SetCaptionGlowColor, default=65535};
	__property Controls::TControl* Control = {read=FControl, write=SetControl};
	__property int CustomWidth = {read=FCustomWidth, write=SetCustomWidth, default=-1};
	__property int CustomHeight = {read=FCustomHeight, write=SetCustomHeight, default=-1};
	__property TSpTBXFontSettings* FontSettings = {read=FFontSettings, write=SetFontSettings};
	__property int Margins = {read=FMargins, write=SetMargins, default=0};
	__property int MinHeight = {read=FMinHeight, write=SetMinHeight, default=0};
	__property int MinWidth = {read=FMinWidth, write=SetMinWidth, default=0};
	__property bool ToolbarStylePopup = {read=FToolbarStylePopup, write=FToolbarStylePopup, default=0};
	__property bool ToolBoxPopup = {read=FToolBoxPopup, write=SetToolBoxPopup, default=0};
	__property bool Stretch = {read=FStretch, write=SetStretch, default=1};
	__property Classes::TNotifyEvent OnClosePopup = {read=FOnClosePopup, write=FOnClosePopup};
	__property TSpTBXPopupEvent OnInitPopup = {read=FOnInitPopup, write=FOnInitPopup};
	__property TSpTBXDrawTextEvent OnDrawCaption = {read=FOnDrawCaption, write=FOnDrawCaption};
	__property TSpTBXDrawHintEvent OnDrawHint = {read=FOnDrawHint, write=FOnDrawHint};
	__property TSpTBXDrawImageEvent OnDrawImage = {read=FOnDrawImage, write=FOnDrawImage};
	__property TSpTBXDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	
public:
	__fastcall virtual TSpTBXCustomItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomItem(void);
	virtual void __fastcall Click(void);
	HIDESBASE System::WideString __fastcall GetShortCutText();
	virtual void __fastcall InitiateAction(void);
	void __fastcall Invalidate(void);
	
__published:
	__property Caption;
	__property Hint;
	__property TTextWrapping Wrapping = {read=FWrapping, write=SetWrapping, default=3};
};


class DELPHICLASS TSpTBXItemViewer;
class PASCALIMPLEMENTATION TSpTBXItemViewer : public Tb2item::TTBItemViewer
{
	typedef Tb2item::TTBItemViewer inherited;
	
private:
	TSpTBXCustomItem* __fastcall GetItem(void);
	MESSAGE void __fastcall CMHintShow(Messages::TMessage &Message);
	void __fastcall InternalCalcSize(const Graphics::TCanvas* Canvas, bool CalcStretch, int &AWidth, int &AHeight);
	
protected:
	Types::TPoint FAnchorSize;
	int FAnchorDelta;
	virtual void __fastcall DoDrawAdjustFont(Graphics::TFont* AFont, Sptbxskins::TSpTBXSkinStatesType State);
	virtual void __fastcall DoDrawButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawCaption(Graphics::TCanvas* ACanvas, const Types::TRect &ClientAreaRect, Sptbxskins::TSpTBXSkinStatesType State, System::WideString &ACaption, Types::TRect &CaptionRect, unsigned &CaptionFormat, bool IsTextRotated, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawImage(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	virtual void __fastcall DoDrawHint(Graphics::TBitmap* AHintBitmap, const Types::TPoint &CursorPos, Types::TRect &CursorRect, System::WideString &AHint, bool &PaintDefault);
	DYNAMIC bool __fastcall CaptionShown(void);
	virtual bool __fastcall GetImageShown(void);
	virtual tagSIZE __fastcall GetImageSize();
	virtual tagSIZE __fastcall GetRightImageSize();
	virtual Graphics::TColor __fastcall GetTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	virtual void __fastcall DrawItemImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, int ImgIndex);
	virtual void __fastcall DrawItemRightImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	void __fastcall GetTextInfo(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, /* out */ Sptbxskins::TSpTBXTextInfo &TextInfo);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	virtual void __fastcall Entering(void);
	virtual void __fastcall InternalMouseMove(Classes::TShiftState Shift, int X, int Y);
	
public:
	HIDESBASE virtual System::WideString __fastcall GetCaptionText();
	HIDESBASE virtual System::WideString __fastcall GetHintText();
	__property TSpTBXCustomItem* Item = {read=GetItem};
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXItem;
class PASCALIMPLEMENTATION TSpTBXItem : public TSpTBXCustomItem
{
	typedef TSpTBXCustomItem inherited;
	
__published:
	__property Action;
	__property AutoCheck = {default=0};
	__property Checked = {default=0};
	__property DisplayMode = {default=0};
	__property Enabled = {default=1};
	__property GroupIndex = {default=0};
	__property HelpContext = {default=0};
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
	__property Alignment = {default=2};
	__property Anchored = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Control;
	__property CustomWidth = {default=-1};
	__property CustomHeight = {default=-1};
	__property FontSettings;
	__property Margins = {default=0};
	__property MinHeight = {default=0};
	__property MinWidth = {default=0};
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnDrawImage;
	__property OnDrawItem;
public:
	/* TSpTBXCustomItem.Create */ inline __fastcall virtual TSpTBXItem(Classes::TComponent* AOwner) : TSpTBXCustomItem(AOwner) { }
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXItem(void) { }
	
};


class DELPHICLASS TSpTBXRootItem;
class PASCALIMPLEMENTATION TSpTBXRootItem : public Tb2item::TTBRootItem
{
	typedef Tb2item::TTBRootItem inherited;
	
private:
	bool FToolBoxPopup;
	TSpTBXPopupEvent FOnInitPopup;
	Classes::TNotifyEvent FOnClosePopup;
	void __fastcall SetToolBoxPopup(const bool Value);
	
protected:
	virtual void __fastcall DoPopupShowingChanged(Tb2item::TTBPopupWindow* APopupWindow, bool IsVisible);
	virtual Tb2item::TTBPopupWindowClass __fastcall GetPopupWindowClass(void);
	__property bool ToolBoxPopup = {read=FToolBoxPopup, write=SetToolBoxPopup, default=0};
	
public:
	__property TSpTBXPopupEvent OnInitPopup = {read=FOnInitPopup, write=FOnInitPopup};
	__property Classes::TNotifyEvent OnClosePopup = {read=FOnClosePopup, write=FOnClosePopup};
public:
	/* TTBCustomItem.Create */ inline __fastcall virtual TSpTBXRootItem(Classes::TComponent* AOwner) : Tb2item::TTBRootItem(AOwner) { }
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXRootItem(void) { }
	
};


class DELPHICLASS TSpTBXSubmenuItem;
class PASCALIMPLEMENTATION TSpTBXSubmenuItem : public TSpTBXItem
{
	typedef TSpTBXItem inherited;
	
private:
	bool FHideEmptyPopup;
	bool __fastcall GetDropdownCombo(void);
	void __fastcall SetDropdownCombo(bool Value);
	
public:
	__fastcall virtual TSpTBXSubmenuItem(Classes::TComponent* AOwner);
	
__published:
	__property bool DropdownCombo = {read=GetDropdownCombo, write=SetDropdownCombo, default=0};
	__property bool HideEmptyPopup = {read=FHideEmptyPopup, write=FHideEmptyPopup, default=0};
	__property LinkSubitems;
	__property SubMenuImages;
	__property ToolbarStylePopup = {default=0};
	__property ToolBoxPopup = {default=0};
	__property OnPopup;
	__property OnClosePopup;
	__property OnInitPopup;
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXSubmenuItem(void) { }
	
};


class DELPHICLASS TSpTBXColorItem;
class PASCALIMPLEMENTATION TSpTBXColorItem : public TSpTBXCustomItem
{
	typedef TSpTBXCustomItem inherited;
	
private:
	Graphics::TColor FColor;
	void __fastcall SetColor(Graphics::TColor Value);
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	
public:
	__fastcall virtual TSpTBXColorItem(Classes::TComponent* AOwner);
	
__published:
	__property Action;
	__property AutoCheck = {default=0};
	__property Checked = {default=0};
	__property DisplayMode = {default=0};
	__property Enabled = {default=1};
	__property GroupIndex = {default=0};
	__property HelpContext = {default=0};
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property ShortCut = {default=0};
	__property Visible = {default=1};
	__property OnClick;
	__property OnSelect;
	__property Alignment = {default=2};
	__property Anchored = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Control;
	__property CustomWidth = {default=-1};
	__property CustomHeight = {default=-1};
	__property FontSettings;
	__property Margins = {default=0};
	__property MinHeight = {default=0};
	__property MinWidth = {default=0};
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnDrawImage;
	__property OnDrawItem;
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=16777215};
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXColorItem(void) { }
	
};


class DELPHICLASS TSpTBXColorItemViewer;
class PASCALIMPLEMENTATION TSpTBXColorItemViewer : public TSpTBXItemViewer
{
	typedef TSpTBXItemViewer inherited;
	
protected:
	virtual void __fastcall DoDrawImage(Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	virtual bool __fastcall GetImageShown(void);
	virtual tagSIZE __fastcall GetImageSize();
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXColorItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : TSpTBXItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXColorItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXCustomLabelItem;
class PASCALIMPLEMENTATION TSpTBXCustomLabelItem : public TSpTBXCustomItem
{
	typedef TSpTBXCustomItem inherited;
	
protected:
	virtual bool __fastcall DialogChar(System::Word CharCode);
	virtual void __fastcall DoDrawButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	virtual void __fastcall ToggleControl(void);
	virtual void __fastcall UpdateProps(void);
	__property Alignment = {default=0};
	
public:
	__fastcall virtual TSpTBXCustomLabelItem(Classes::TComponent* AOwner);
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXCustomLabelItem(void) { }
	
};


class DELPHICLASS TSpTBXLabelItemViewer;
class PASCALIMPLEMENTATION TSpTBXLabelItemViewer : public TSpTBXItemViewer
{
	typedef TSpTBXItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	virtual bool __fastcall DoExecute(void);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXLabelItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : TSpTBXItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXLabelItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXLabelItem;
class PASCALIMPLEMENTATION TSpTBXLabelItem : public TSpTBXCustomLabelItem
{
	typedef TSpTBXCustomLabelItem inherited;
	
__published:
	__property Enabled = {default=1};
	__property ImageIndex = {default=-1};
	__property Images;
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property Visible = {default=1};
	__property OnClick;
	__property Alignment = {default=0};
	__property Anchored = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Control;
	__property CustomWidth = {default=-1};
	__property CustomHeight = {default=-1};
	__property FontSettings;
	__property Margins = {default=0};
	__property MinHeight = {default=0};
	__property MinWidth = {default=0};
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnDrawImage;
	__property OnDrawItem;
public:
	/* TSpTBXCustomLabelItem.Create */ inline __fastcall virtual TSpTBXLabelItem(Classes::TComponent* AOwner) : TSpTBXCustomLabelItem(AOwner) { }
	
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXLabelItem(void) { }
	
};


class DELPHICLASS TSpTBXSeparatorItem;
class PASCALIMPLEMENTATION TSpTBXSeparatorItem : public Tb2item::TTBSeparatorItem
{
	typedef Tb2item::TTBSeparatorItem inherited;
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
public:
	/* TTBSeparatorItem.Create */ inline __fastcall virtual TSpTBXSeparatorItem(Classes::TComponent* AOwner) : Tb2item::TTBSeparatorItem(AOwner) { }
	
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXSeparatorItem(void) { }
	
};


class DELPHICLASS TSpTBXSeparatorItemViewer;
class PASCALIMPLEMENTATION TSpTBXSeparatorItemViewer : public Tb2item::TTBSeparatorItemViewer
{
	typedef Tb2item::TTBSeparatorItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	bool __fastcall IsStatusBarSeparator(void);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXSeparatorItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBSeparatorItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXSeparatorItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXRightAlignSpacerItem;
class PASCALIMPLEMENTATION TSpTBXRightAlignSpacerItem : public TSpTBXCustomLabelItem
{
	typedef TSpTBXCustomLabelItem inherited;
	
__published:
	__property ImageIndex = {default=-1};
	__property Images;
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property OnClick;
	__property Alignment = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property CustomWidth = {default=-1};
	__property CustomHeight = {default=-1};
	__property FontSettings;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnDrawImage;
	__property OnDrawItem;
public:
	/* TSpTBXCustomLabelItem.Create */ inline __fastcall virtual TSpTBXRightAlignSpacerItem(Classes::TComponent* AOwner) : TSpTBXCustomLabelItem(AOwner) { }
	
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXRightAlignSpacerItem(void) { }
	
};


class DELPHICLASS TSpTBXRadioGroupItem;
class PASCALIMPLEMENTATION TSpTBXRadioGroupItem : public Tb2item::TTBGroupItem
{
	typedef Tb2item::TTBGroupItem inherited;
	
private:
	int FDefaultIndex;
	int FLastClickedIndex;
	Classes::TNotifyEvent FOnClick;
	TSpTBXRadioGroupFillStringsEvent FOnFillStrings;
	Classes::TNotifyEvent FOnUpdate;
	
protected:
	Classes::TStringList* FStrings;
	virtual void __fastcall Loaded(void);
	virtual void __fastcall ItemClickEvent(System::TObject* Sender);
	virtual void __fastcall DoClick(TSpTBXItem* AItem);
	virtual void __fastcall DoFillStrings(void);
	
public:
	__fastcall virtual TSpTBXRadioGroupItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXRadioGroupItem(void);
	void __fastcall Recreate(void);
	__property int DefaultIndex = {read=FDefaultIndex, write=FDefaultIndex, nodefault};
	__property int LastClickedIndex = {read=FLastClickedIndex, nodefault};
	
__published:
	__property Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick};
	__property TSpTBXRadioGroupFillStringsEvent OnFillStrings = {read=FOnFillStrings, write=FOnFillStrings};
	__property Classes::TNotifyEvent OnUpdate = {read=FOnUpdate, write=FOnUpdate};
};


class DELPHICLASS TSpTBXSkinGroupItem;
class PASCALIMPLEMENTATION TSpTBXSkinGroupItem : public TSpTBXRadioGroupItem
{
	typedef TSpTBXRadioGroupItem inherited;
	
private:
	Classes::TNotifyEvent FOnSkinChange;
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall DoClick(TSpTBXItem* AItem);
	virtual void __fastcall DoSkinChange(void);
	virtual void __fastcall DoFillStrings(void);
	
public:
	__fastcall virtual TSpTBXSkinGroupItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXSkinGroupItem(void);
	
__published:
	__property Classes::TNotifyEvent OnSkinChange = {read=FOnSkinChange, write=FOnSkinChange};
};


class DELPHICLASS TSpTBXSystemMenuItem;
class PASCALIMPLEMENTATION TSpTBXSystemMenuItem : public TSpTBXCustomItem
{
	typedef TSpTBXCustomItem inherited;
	
private:
	bool FMDISystemMenu;
	bool FShowSize;
	void __fastcall CommandClick(System::TObject* Sender);
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	Forms::TCustomForm* __fastcall GetSystemMenuParentForm(void);
	
public:
	__fastcall virtual TSpTBXSystemMenuItem(Classes::TComponent* AOwner);
	virtual void __fastcall Click(void);
	
__published:
	__property bool MDISystemMenu = {read=FMDISystemMenu, write=FMDISystemMenu, default=0};
	__property bool ShowSize = {read=FShowSize, write=FShowSize, default=1};
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXSystemMenuItem(void) { }
	
};


class DELPHICLASS TSpTBXSystemMenuItemViewer;
class PASCALIMPLEMENTATION TSpTBXSystemMenuItemViewer : public TSpTBXItemViewer
{
	typedef TSpTBXItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXSystemMenuItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : TSpTBXItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXSystemMenuItemViewer(void) { }
	
};


typedef ShortInt TSpTBXRowColCount;

typedef void __fastcall (__closure *TSpTBXTPGetCellHint)(System::TObject* Sender, int ACol, int ARow, System::WideString &AHint);

typedef void __fastcall (__closure *TSpTBXTPDrawCellImage)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int ACol, int ARow, bool Selected, bool HotTrack, bool Enabled);

typedef void __fastcall (__closure *TSpTBXTPCellClick)(System::TObject* Sender, int ACol, int ARow, bool &Allow);

typedef void __fastcall (__closure *TSpTBXCPGetColorInfo)(System::TObject* Sender, int ACol, int ARow, Graphics::TColor &Color, System::WideString &Name);

class DELPHICLASS TSpTBXCustomToolPalette;
class PASCALIMPLEMENTATION TSpTBXCustomToolPalette : public TSpTBXCustomItem
{
	typedef TSpTBXCustomItem inherited;
	
private:
	bool FCustomImages;
	TSpTBXRowColCount FColCount;
	TSpTBXRowColCount FRowCount;
	Types::TPoint FSelectedCell;
	Classes::TNotifyEvent FOnChange;
	TSpTBXTPCellClick FOnCellClick;
	TSpTBXTPDrawCellImage FOnDrawCellImage;
	TSpTBXTPGetCellHint FOnGetCellHint;
	void __fastcall SetSelectedCell(const Types::TPoint &Value);
	
protected:
	virtual bool __fastcall DoCellClick(int ACol, int ARow);
	virtual void __fastcall DoChange(void);
	virtual void __fastcall DoDrawCellImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int ACol, int ARow, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	virtual void __fastcall DoGetCellHint(int ACol, int ARow, System::WideString &AHint);
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	virtual void __fastcall HandleClickCell(int ACol, int ARow);
	virtual void __fastcall SetColCount(TSpTBXRowColCount Value);
	virtual void __fastcall SetRowCount(TSpTBXRowColCount Value);
	__property bool CustomImages = {read=FCustomImages, write=FCustomImages, nodefault};
	__property TSpTBXRowColCount ColCount = {read=FColCount, write=SetColCount, default=1};
	__property TSpTBXRowColCount RowCount = {read=FRowCount, write=SetRowCount, default=1};
	__property Types::TPoint SelectedCell = {read=FSelectedCell, write=SetSelectedCell};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property TSpTBXTPCellClick OnCellClick = {read=FOnCellClick, write=FOnCellClick};
	__property TSpTBXTPDrawCellImage OnDrawCellImage = {read=FOnDrawCellImage, write=FOnDrawCellImage};
	__property TSpTBXTPGetCellHint OnGetCellHint = {read=FOnGetCellHint, write=FOnGetCellHint};
	
public:
	__fastcall virtual TSpTBXCustomToolPalette(Classes::TComponent* AOwner);
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXCustomToolPalette(void) { }
	
};


class DELPHICLASS TSpTBXToolPalette;
class PASCALIMPLEMENTATION TSpTBXToolPalette : public TSpTBXCustomToolPalette
{
	typedef TSpTBXCustomToolPalette inherited;
	
public:
	__property SelectedCell;
	
__published:
	__property ColCount = {default=1};
	__property HelpContext = {default=0};
	__property Images;
	__property Options = {default=0};
	__property RowCount = {default=1};
	__property Visible = {default=1};
	__property OnChange;
	__property OnCellClick;
	__property OnDrawCellImage;
	__property OnGetCellHint;
public:
	/* TSpTBXCustomToolPalette.Create */ inline __fastcall virtual TSpTBXToolPalette(Classes::TComponent* AOwner) : TSpTBXCustomToolPalette(AOwner) { }
	
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXToolPalette(void) { }
	
};


class DELPHICLASS TSpTBXToolViewer;
class PASCALIMPLEMENTATION TSpTBXToolViewer : public TSpTBXItemViewer
{
	typedef TSpTBXItemViewer inherited;
	
private:
	int FCellHeight;
	int FCellWidth;
	int FColCount;
	int FRowCount;
	Types::TPoint FHotCell;
	HIDESBASE TSpTBXCustomToolPalette* __fastcall GetItem(void);
	
protected:
	int FIndent;
	bool FMouseIsDown;
	virtual void __fastcall CalcCellSize(Graphics::TCanvas* ACanvas, int &AWidth, int &AHeight);
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	int __fastcall GetImageIndex(int Col, int Row);
	virtual tagSIZE __fastcall GetImageSize();
	virtual bool __fastcall GetImageShown(void);
	bool __fastcall GetCellAt(int X, int Y, /* out */ int &Col, /* out */ int &Row);
	virtual Types::TRect __fastcall GetCellRect(const Types::TRect &ClientAreaRect, int Col, int Row);
	System::WideString __fastcall GetCellHint(int Col, int Row);
	virtual void __fastcall DoDrawHint(Graphics::TBitmap* AHintBitmap, const Types::TPoint &CursorPos, Types::TRect &CursorRect, System::WideString &AHint, bool &PaintDefault);
	virtual void __fastcall DrawCellImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int Col, int Row, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	virtual void __fastcall Entering(void);
	void __fastcall InvalidateCell(int ACol, int ARow);
	virtual bool __fastcall IsCellVisible(const Types::TPoint &Cell);
	virtual void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall MouseDown(Classes::TShiftState Shift, int X, int Y, bool &MouseDownOnMenu);
	virtual void __fastcall MouseMove(int X, int Y);
	virtual void __fastcall MouseUp(int X, int Y, bool MouseWasDownOnMenu);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	
public:
	__fastcall virtual TSpTBXToolViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel);
	__property TSpTBXCustomToolPalette* Item = {read=GetItem};
public:
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXToolViewer(void) { }
	
};


class DELPHICLASS TSpTBXColorPalette;
class PASCALIMPLEMENTATION TSpTBXColorPalette : public TSpTBXCustomToolPalette
{
	typedef TSpTBXCustomToolPalette inherited;
	
private:
	Graphics::TColor FColor;
	bool FCustomColors;
	TSpTBXCPGetColorInfo FOnGetColor;
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetCustomColors(const bool Value);
	
protected:
	virtual void __fastcall DoChange(void);
	virtual void __fastcall DoGetCellHint(int ACol, int ARow, System::WideString &AHint);
	virtual void __fastcall DoDrawCellImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int ACol, int ARow, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	Graphics::TColor __fastcall GetCellColor(int ACol, int ARow);
	void __fastcall GetCellInfo(int ACol, int ARow, /* out */ Graphics::TColor &AColor, /* out */ System::WideString &AName);
	virtual void __fastcall SetColCount(TSpTBXRowColCount Value);
	virtual void __fastcall SetRowCount(TSpTBXRowColCount Value);
	
public:
	__fastcall virtual TSpTBXColorPalette(Classes::TComponent* AOwner);
	Types::TPoint __fastcall FindCell(Graphics::TColor AColor);
	
__published:
	__property bool CustomColors = {read=FCustomColors, write=SetCustomColors, default=0};
	__property ColCount = {default=8};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=536870911};
	__property HelpContext = {default=0};
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=128};
	__property RowCount = {default=5};
	__property Visible = {default=1};
	__property OnChange;
	__property OnCellClick;
	__property OnGetCellHint;
	__property TSpTBXCPGetColorInfo OnGetColor = {read=FOnGetColor, write=FOnGetColor};
public:
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXColorPalette(void) { }
	
};


class DELPHICLASS TSpTBXItemCache;
class PASCALIMPLEMENTATION TSpTBXItemCache : public Classes::TCollectionItem
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Tb2dock::TTBDock* FDock;
	Classes::TComponentName FName;
	Tb2item::TTBCustomItem* FItem;
	int FWidth;
	int FHeight;
	int FParentWidth;
	int FParentHeight;
	Classes::TComponentName __fastcall GetName();
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property Tb2item::TTBCustomItem* Item = {read=FItem, write=FItem};
	
__published:
	__property Tb2dock::TTBDock* Dock = {read=FDock, write=FDock};
	__property Classes::TComponentName Name = {read=GetName, write=FName};
	__property int Width = {read=FWidth, write=FWidth, default=0};
	__property int Height = {read=FHeight, write=FHeight, default=0};
	__property int ParentWidth = {read=FParentWidth, write=FParentWidth, default=0};
	__property int ParentHeight = {read=FParentHeight, write=FParentHeight, default=0};
public:
	/* TCollectionItem.Create */ inline __fastcall virtual TSpTBXItemCache(Classes::TCollection* Collection) : Classes::TCollectionItem(Collection) { }
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TSpTBXItemCache(void) { }
	
};


class DELPHICLASS TSpTBXItemCacheCollection;
class PASCALIMPLEMENTATION TSpTBXItemCacheCollection : public Classes::TCollection
{
	typedef Classes::TCollection inherited;
	
public:
	TSpTBXItemCache* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TSpTBXItemCache* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, const TSpTBXItemCache* Value);
	
public:
	HIDESBASE virtual int __fastcall Add(Tb2item::TTBCustomItem* AItem);
	int __fastcall IndexOf(Tb2item::TTBCustomItem* AItem);
	__property TSpTBXItemCache* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
public:
	/* TCollection.Create */ inline __fastcall TSpTBXItemCacheCollection(Classes::TCollectionItemClass ItemClass) : Classes::TCollection(ItemClass) { }
	/* TCollection.Destroy */ inline __fastcall virtual ~TSpTBXItemCacheCollection(void) { }
	
};


class DELPHICLASS TSpTBXDock;
class PASCALIMPLEMENTATION TSpTBXDock : public Tb2dock::TTBDock
{
	typedef Tb2dock::TTBDock inherited;
	
private:
	bool FMoving;
	bool FResizing;
	int FPrevWidth;
	int FPrevHeight;
	TSpTBXDrawEvent FOnDrawBackground;
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMMove(Messages::TWMMove &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall DrawBackground(HDC DC, const Types::TRect &DrawRect);
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	void __fastcall InternalDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	DYNAMIC void __fastcall Resize(void);
	virtual bool __fastcall UsingBackground(void);
	bool __fastcall UsingBitmap(void);
	
public:
	__fastcall virtual TSpTBXDock(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXDock(void);
	__property int PrevWidth = {read=FPrevWidth, nodefault};
	__property int PrevHeight = {read=FPrevHeight, nodefault};
	
__published:
	__property Color = {default=536870911};
	__property OnCanResize;
	__property TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXDock(HWND ParentWindow) : Tb2dock::TTBDock(ParentWindow) { }
	
};


typedef TMetaClass* TSpTBXDockClass;

class DELPHICLASS TSpTBXToolbarView;
class PASCALIMPLEMENTATION TSpTBXToolbarView : public Tb2toolbar::TTBToolbarView
{
	typedef Tb2toolbar::TTBToolbarView inherited;
	
private:
	int FMaxSize;
	void __fastcall SetMaxSize(const int Value);
	
protected:
	int FTallestItemSize;
	virtual void __fastcall DoUpdatePositions(Types::TPoint &ASize);
	
public:
	__fastcall virtual TSpTBXToolbarView(Classes::TComponent* AOwner, Tb2item::TTBView* AParentView, Tb2item::TTBCustomItem* AParentItem, Controls::TWinControl* AWindow, bool AIsToolbar, bool ACustomizing, bool AUsePriorityList);
	__property int MaxSize = {read=FMaxSize, write=SetMaxSize, nodefault};
public:
	/* TTBView.Destroy */ inline __fastcall virtual ~TSpTBXToolbarView(void) { }
	
};


class DELPHICLASS TSpTBXToolbar;
class PASCALIMPLEMENTATION TSpTBXToolbar : public Tb2toolbar::TTBCustomToolbar
{
	typedef Tb2toolbar::TTBCustomToolbar inherited;
	
private:
	bool FChevronVertical;
	bool FCompoundToolbar;
	bool FCustomizable;
	int FCustomizingCount;
	int FItemMovingCount;
	TSpTBXToolbarDisplayMode FDisplayMode;
	Types::TRect FLastDropMark;
	int FLastSelectableWidth;
	TSpTBXDrawEvent FOnDrawBackground;
	TSpTBXItemNotificationEvent FOnItemNotification;
	void __fastcall SetDisplayMode(const TSpTBXToolbarDisplayMode Value);
	int __fastcall GetMaxSize(void);
	void __fastcall SetMaxSize(const int Value);
	HIDESBASE Tb2item::TTBControlItem* __fastcall CreateWrapper(int Index, Controls::TControl* Ctl);
	Tb2item::TTBControlItem* __fastcall IsAnchoredControlItem(Tb2item::TTBCustomItem* Item);
	HIDESBASE MESSAGE void __fastcall CMControlChange(Controls::TCMControlChange &Message);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseleave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Controls::TCMHintShow &Message);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	Tb2item::TTBItemViewer* FBeginDragIV;
	TSpTBXItemCacheCollection* FAnchoredControlItems;
	TSpTBXToolbarStates FState;
	virtual void __fastcall CreateWindowHandle(const Controls::TCreateParams &Params);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall AnchorItems(bool UpdateControlItems = true);
	virtual void __fastcall RightAlignItems(void);
	virtual void __fastcall DrawNCArea(const bool DrawToDC, const HDC ADC, const HRGN Clip);
	virtual Graphics::TColor __fastcall GetItemsTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	virtual void __fastcall InternalDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool PaintOnNCArea, bool PaintBorders = true);
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	DYNAMIC Tb2toolbar::TTBChevronItemClass __fastcall GetChevronItemClass(void);
	DYNAMIC Tb2dock::TTBFloatingWindowParentClass __fastcall GetFloatingWindowParentClass(void);
	virtual int __fastcall GetRightAlignMargin(void);
	DYNAMIC Tb2toolbar::TTBToolbarViewClass __fastcall GetViewClass(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual bool __fastcall CanDragCustomize(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall DoStartDrag(Controls::TDragObject* &DragObject);
	DYNAMIC void __fastcall DragOver(System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	virtual bool __fastcall CanItemClick(Tb2item::TTBCustomItem* Item, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DoItemClick(Tb2item::TTBCustomItem* Item, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DoItemNotification(Tb2item::TTBCustomItem* Ancestor, bool Relayed, Tb2item::TTBItemChangedAction Action, int Index, Tb2item::TTBCustomItem* Item);
	__property bool CompoundToolbar = {read=FCompoundToolbar, write=FCompoundToolbar, nodefault};
	
public:
	__fastcall virtual TSpTBXToolbar(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXToolbar(void);
	DYNAMIC void __fastcall DragDrop(System::TObject* Source, int X, int Y);
	DYNAMIC void __fastcall ReadPositionData(const Tb2dock::TTBReadPositionData &Data);
	DYNAMIC void __fastcall WritePositionData(const Tb2dock::TTBWritePositionData &Data);
	void __fastcall BeginCustomize(void);
	void __fastcall EndCustomize(void);
	void __fastcall BeginItemMove(void);
	void __fastcall EndItemMove(void);
	virtual Types::TPoint __fastcall GetFloatingBorderSize();
	bool __fastcall IsCustomizing(void);
	bool __fastcall IsItemMoving(void);
	bool __fastcall IsVertical(void);
	__property int MaxSize = {read=GetMaxSize, write=SetMaxSize, default=-1};
	
__published:
	__property ActivateParent = {default=1};
	__property Align = {default=0};
	__property AutoResize = {default=1};
	__property BorderStyle = {default=1};
	__property ChevronHint;
	__property ChevronMoveItems = {default=1};
	__property ChevronPriorityForNewItems = {default=0};
	__property CloseButton = {default=1};
	__property CloseButtonWhenDocked = {default=0};
	__property CurrentDock;
	__property DefaultDock;
	__property DockableTo = {default=15};
	__property DockMode = {default=0};
	__property DockPos = {default=-1};
	__property DockRow = {default=0};
	__property DragHandleStyle = {default=2};
	__property FloatingMode = {default=0};
	__property Font;
	__property FullSize = {default=0};
	__property HideWhenInactive = {default=1};
	__property Images;
	__property Items;
	__property LastDock;
	__property LinkSubitems;
	__property MenuBar = {default=0};
	__property Options = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ProcessShortCuts = {default=0};
	__property Resizable = {default=1};
	__property ShowCaption = {default=1};
	__property ShowHint;
	__property ShrinkMode = {default=2};
	__property SmoothDrag = {default=1};
	__property Stretch = {default=0};
	__property SystemFont = {default=1};
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property UpdateActions = {default=1};
	__property UseLastDock = {default=1};
	__property Visible = {default=1};
	__property Color = {default=536870911};
	__property OnClose;
	__property OnCloseQuery;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnMove;
	__property OnRecreated;
	__property OnRecreating;
	__property OnDockChanged;
	__property OnDockChanging;
	__property OnDockChangingHidden;
	__property OnResize;
	__property OnShortCut;
	__property OnVisibleChanged;
	__property Caption;
	__property Hint;
	__property bool ChevronVertical = {read=FChevronVertical, write=FChevronVertical, default=1};
	__property bool Customizable = {read=FCustomizable, write=FCustomizable, default=1};
	__property TSpTBXToolbarDisplayMode DisplayMode = {read=FDisplayMode, write=SetDisplayMode, default=0};
	__property TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	__property TSpTBXItemNotificationEvent OnItemNotification = {read=FOnItemNotification, write=FOnItemNotification};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXToolbar(HWND ParentWindow) : Tb2toolbar::TTBCustomToolbar(ParentWindow) { }
	
};


typedef TMetaClass* TSpTBXToolbarClass;

class DELPHICLASS TSpTBXCustomToolWindow;
class PASCALIMPLEMENTATION TSpTBXCustomToolWindow : public Tb2dock::TTBCustomDockableWindow
{
	typedef Tb2dock::TTBCustomDockableWindow inherited;
	
private:
	int FMinClientWidth;
	int FMinClientHeight;
	int FMaxClientWidth;
	int FMaxClientHeight;
	TSpTBXDrawEvent FOnDrawBackground;
	int __fastcall GetClientAreaWidth(void);
	void __fastcall SetClientAreaWidth(int Value);
	int __fastcall GetClientAreaHeight(void);
	void __fastcall SetClientAreaHeight(int Value);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	
protected:
	tagSIZE FBarSize;
	virtual void __fastcall CreateWindowHandle(const Controls::TCreateParams &Params);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	DYNAMIC Tb2dock::TTBFloatingWindowParentClass __fastcall GetFloatingWindowParentClass(void);
	virtual Types::TPoint __fastcall CalcSize(Tb2dock::TTBDock* ADock);
	virtual Types::TPoint __fastcall DoArrange(bool CanMoveControls, Tb2dock::TTBDockType PreviousDockType, bool NewFloating, Tb2dock::TTBDock* NewDock);
	virtual void __fastcall GetBaseSize(Types::TPoint &ASize);
	virtual void __fastcall GetMinMaxSize(int &AMinClientWidth, int &AMinClientHeight, int &AMaxClientWidth, int &AMaxClientHeight);
	virtual void __fastcall SetClientAreaSize(int AWidth, int AHeight);
	virtual void __fastcall SizeChanging(const int AWidth, const int AHeight);
	virtual void __fastcall Paint(void);
	virtual void __fastcall DrawNCArea(const bool DrawToDC, const HDC ADC, const HRGN Clip);
	virtual void __fastcall InternalDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool PaintOnNCArea, bool PaintBorders = true);
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	__property int ClientAreaHeight = {read=GetClientAreaHeight, write=SetClientAreaHeight, nodefault};
	__property int ClientAreaWidth = {read=GetClientAreaWidth, write=SetClientAreaWidth, nodefault};
	__property int MaxClientHeight = {read=FMaxClientHeight, write=FMaxClientHeight, default=0};
	__property int MaxClientWidth = {read=FMaxClientWidth, write=FMaxClientWidth, default=0};
	__property int MinClientHeight = {read=FMinClientHeight, write=FMinClientHeight, default=32};
	__property int MinClientWidth = {read=FMinClientWidth, write=FMinClientWidth, default=32};
	__property TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	
public:
	__fastcall virtual TSpTBXCustomToolWindow(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomToolWindow(void);
	virtual Types::TPoint __fastcall GetFloatingBorderSize();
	virtual void __fastcall InvalidateBackground(bool InvalidateChildren = true);
	bool __fastcall IsVertical(void);
	DYNAMIC void __fastcall ReadPositionData(const Tb2dock::TTBReadPositionData &Data);
	DYNAMIC void __fastcall WritePositionData(const Tb2dock::TTBWritePositionData &Data);
	
__published:
	__property Caption;
	__property Color = {default=536870911};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomToolWindow(HWND ParentWindow) : Tb2dock::TTBCustomDockableWindow(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXToolWindow;
class PASCALIMPLEMENTATION TSpTBXToolWindow : public TSpTBXCustomToolWindow
{
	typedef TSpTBXCustomToolWindow inherited;
	
__published:
	__property ActivateParent = {default=1};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BorderStyle = {default=1};
	__property Caption;
	__property Color = {default=536870911};
	__property CloseButton = {default=1};
	__property CloseButtonWhenDocked = {default=0};
	__property CurrentDock;
	__property DefaultDock;
	__property DockableTo = {default=15};
	__property DockMode = {default=0};
	__property DockPos = {default=-1};
	__property DockRow = {default=0};
	__property DragHandleStyle = {default=2};
	__property FloatingMode = {default=0};
	__property Font;
	__property FullSize = {default=0};
	__property HideWhenInactive = {default=1};
	__property LastDock;
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property Resizable = {default=1};
	__property ShowCaption = {default=1};
	__property ShowHint;
	__property Stretch = {default=0};
	__property SmoothDrag = {default=1};
	__property TabOrder = {default=-1};
	__property UseLastDock = {default=1};
	__property Visible = {default=1};
	__property OnClose;
	__property OnCloseQuery;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDockChanged;
	__property OnDockChanging;
	__property OnDockChangingHidden;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnMove;
	__property OnRecreated;
	__property OnRecreating;
	__property OnResize;
	__property OnVisibleChanged;
	__property ClientAreaHeight;
	__property ClientAreaWidth;
	__property MaxClientHeight = {default=0};
	__property MaxClientWidth = {default=0};
	__property MinClientHeight = {default=32};
	__property MinClientWidth = {default=32};
	__property OnDrawBackground;
public:
	/* TSpTBXCustomToolWindow.Create */ inline __fastcall virtual TSpTBXToolWindow(Classes::TComponent* AOwner) : TSpTBXCustomToolWindow(AOwner) { }
	/* TSpTBXCustomToolWindow.Destroy */ inline __fastcall virtual ~TSpTBXToolWindow(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXToolWindow(HWND ParentWindow) : TSpTBXCustomToolWindow(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXFloatingWindowParent;
class PASCALIMPLEMENTATION TSpTBXFloatingWindowParent : public Tb2dock::TTBFloatingWindowParent
{
	typedef Tb2dock::TTBFloatingWindowParent inherited;
	
private:
	bool FCloseButtonHover;
	bool FCloseOnAltF4;
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	MESSAGE void __fastcall WMActivateApp(Messages::TWMActivateApp &Message);
	HIDESBASE MESSAGE void __fastcall WMClose(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TMessage &Message);
	MESSAGE void __fastcall WMNCMouseLeave(Messages::TMessage &Message);
	MESSAGE void __fastcall WMNCMouseMove(Messages::TWMNCHitMessage &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	void __fastcall CancelNCHover(void);
	DYNAMIC void __fastcall DrawNCArea(const bool DrawToDC, const HDC ADC, const HRGN Clip, Tb2dock::TTBToolWindowNCRedrawWhat RedrawWhat);
	void __fastcall RedrawCloseButton(void);
	DYNAMIC void __fastcall VisibleChanging(void);
	__property bool CloseButtonHover = {read=FCloseButtonHover, nodefault};
	
public:
	__fastcall virtual TSpTBXFloatingWindowParent(Classes::TComponent* AOwner, int Dummy);
	__fastcall virtual ~TSpTBXFloatingWindowParent(void);
	__property bool CloseOnAltF4 = {read=FCloseOnAltF4, write=FCloseOnAltF4, nodefault};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TSpTBXFloatingWindowParent(Classes::TComponent* AOwner) : Tb2dock::TTBFloatingWindowParent(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXFloatingWindowParent(HWND ParentWindow) : Tb2dock::TTBFloatingWindowParent(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXPopupWindow;
class PASCALIMPLEMENTATION TSpTBXPopupWindow : public Tb2item::TTBPopupWindow
{
	typedef Tb2item::TTBPopupWindow inherited;
	
private:
	bool FPaintingClientArea;
	tagSIZE FMaximumImageSize;
	bool __fastcall CanDrawGutter(void);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Controls::TCMHintShow &Message);
	HIDESBASE MESSAGE void __fastcall CMShowingchanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMPrint(Messages::TMessage &Message);
	
protected:
	DYNAMIC Tb2item::TTBViewClass __fastcall GetViewClass(void);
	virtual void __fastcall DoPopupShowingChanged(bool IsVisible);
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	
public:
	__fastcall virtual TSpTBXPopupWindow(Classes::TComponent* AOwner, const Tb2item::TTBView* AParentView, const Tb2item::TTBCustomItem* AItem, const bool ACustomizing);
	__fastcall virtual ~TSpTBXPopupWindow(void);
	__property tagSIZE MaximumImageSize = {read=FMaximumImageSize};
public:
	/* TCustomControl.Create */ inline __fastcall virtual TSpTBXPopupWindow(Classes::TComponent* AOwner) : Tb2item::TTBPopupWindow(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXPopupWindow(HWND ParentWindow) : Tb2item::TTBPopupWindow(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXPopupWindowView;
class PASCALIMPLEMENTATION TSpTBXPopupWindowView : public Tb2item::TTBPopupView
{
	typedef Tb2item::TTBPopupView inherited;
	
protected:
	virtual void __fastcall AutoSize(int AWidth, int AHeight);
	
public:
	void __fastcall SetIsToolbar(const bool Value);
	
__published:
	__property IsToolbar;
public:
	/* TTBView.Create */ inline __fastcall virtual TSpTBXPopupWindowView(Classes::TComponent* AOwner, Tb2item::TTBView* AParentView, Tb2item::TTBCustomItem* AParentItem, Controls::TWinControl* AWindow, bool AIsToolbar, bool ACustomizing, bool AUsePriorityList) : Tb2item::TTBPopupView(AOwner, AParentView, AParentItem, AWindow, AIsToolbar, ACustomizing, AUsePriorityList) { }
	/* TTBView.Destroy */ inline __fastcall virtual ~TSpTBXPopupWindowView(void) { }
	
};


class DELPHICLASS TSpTBXChevronItem;
class PASCALIMPLEMENTATION TSpTBXChevronItem : public Tb2toolbar::TTBChevronItem
{
	typedef Tb2toolbar::TTBChevronItem inherited;
	
protected:
	virtual Tb2item::TTBPopupWindowClass __fastcall GetPopupWindowClass(void);
	
public:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
public:
	/* TTBChevronItem.Create */ inline __fastcall virtual TSpTBXChevronItem(Classes::TComponent* AOwner) : Tb2toolbar::TTBChevronItem(AOwner) { }
	
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXChevronItem(void) { }
	
};


class DELPHICLASS TSpTBXChevronItemViewer;
class PASCALIMPLEMENTATION TSpTBXChevronItemViewer : public Tb2item::TTBItemViewer
{
	typedef Tb2item::TTBItemViewer inherited;
	
protected:
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	
public:
	virtual Graphics::TColor __fastcall GetTextColor(Sptbxskins::TSpTBXSkinStatesType State);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXChevronItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXChevronItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXChevronPopupWindow;
class PASCALIMPLEMENTATION TSpTBXChevronPopupWindow : public TSpTBXPopupWindow
{
	typedef TSpTBXPopupWindow inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall CMColorChanged(Messages::TMessage &Message);
public:
	/* TSpTBXPopupWindow.CreatePopupWindow */ inline __fastcall virtual TSpTBXChevronPopupWindow(Classes::TComponent* AOwner, const Tb2item::TTBView* AParentView, const Tb2item::TTBCustomItem* AItem, const bool ACustomizing) : TSpTBXPopupWindow(AOwner, AParentView, AItem, ACustomizing) { }
	/* TSpTBXPopupWindow.Destroy */ inline __fastcall virtual ~TSpTBXChevronPopupWindow(void) { }
	
public:
	/* TCustomControl.Create */ inline __fastcall virtual TSpTBXChevronPopupWindow(Classes::TComponent* AOwner) : TSpTBXPopupWindow(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXChevronPopupWindow(HWND ParentWindow) : TSpTBXPopupWindow(ParentWindow) { }
	
};


__interface ISpTBXPopupMenu;
typedef System::DelphiInterface<ISpTBXPopupMenu> _di_ISpTBXPopupMenu;
__interface  INTERFACE_UUID("{C576A225-6E42-49F6-96E5-712510C5D85C}") ISpTBXPopupMenu  : public System::IInterface 
{
	
public:
	virtual bool __fastcall InternalPopup(int X, int Y, bool ForceFocus, Controls::TControl* PopupControl = (Controls::TControl*)(0x0)) = 0 ;
};

class DELPHICLASS TSpTBXPopupMenu;
class PASCALIMPLEMENTATION TSpTBXPopupMenu : public Tb2item::TTBPopupMenu
{
	typedef Tb2item::TTBPopupMenu inherited;
	
private:
	Tb2item::TTBCustomItem* FClickedItem;
	bool FReturnClickedItemOnly;
	bool FToolBoxPopup;
	TSpTBXPopupEvent __fastcall GetOnInitPopup();
	void __fastcall SetOnInitPopup(const TSpTBXPopupEvent Value);
	Classes::TNotifyEvent __fastcall GetOnClosePopup();
	void __fastcall SetOnClosePopup(const Classes::TNotifyEvent Value);
	
protected:
	virtual bool __fastcall InternalPopup(int X, int Y, bool ForceFocus, Controls::TControl* PopupControl = (Controls::TControl*)(0x0));
	DYNAMIC Tb2item::TTBRootItemClass __fastcall GetRootItemClass(void);
	
public:
	virtual void __fastcall Popup(int X, int Y);
	HIDESBASE virtual Tb2item::TTBCustomItem* __fastcall PopupEx(int X, int Y, Controls::TControl* PopupControl = (Controls::TControl*)(0x0), bool ReturnClickedItemOnly = false);
	
__published:
	__property bool ToolBoxPopup = {read=FToolBoxPopup, write=FToolBoxPopup, default=0};
	__property TSpTBXPopupEvent OnInitPopup = {read=GetOnInitPopup, write=SetOnInitPopup};
	__property Classes::TNotifyEvent OnClosePopup = {read=GetOnClosePopup, write=SetOnClosePopup};
public:
	/* TTBPopupMenu.Create */ inline __fastcall virtual TSpTBXPopupMenu(Classes::TComponent* AOwner) : Tb2item::TTBPopupMenu(AOwner) { }
	/* TTBPopupMenu.Destroy */ inline __fastcall virtual ~TSpTBXPopupMenu(void) { }
	
private:
	void *__ISpTBXPopupMenu;	/* ISpTBXPopupMenu */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_ISpTBXPopupMenu()
	{
		_di_ISpTBXPopupMenu intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ISpTBXPopupMenu*(void) { return (ISpTBXPopupMenu*)&__ISpTBXPopupMenu; }
	#endif
	
};


class DELPHICLASS TSpTBXCompoundItemsControl;
class PASCALIMPLEMENTATION TSpTBXCompoundItemsControl : public TSpTBXCustomControl
{
	typedef TSpTBXCustomControl inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	void __fastcall DockRequestDock(System::TObject* Sender, Tb2dock::TTBCustomDockableWindow* Bar, bool &Accept);
	Tb2item::TTBRootItem* __fastcall GetRootItems(void);
	TSpTBXToolbarView* __fastcall GetView(void);
	Imglist::TCustomImageList* __fastcall GetImages(void);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	TSpTBXDock* FDock;
	TSpTBXToolbar* FToolbar;
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual TSpTBXDockClass __fastcall GetDockClass(void);
	virtual TSpTBXToolbarClass __fastcall GetToolbarClass(void);
	virtual Tb2item::TTBCustomItem* __fastcall GetItems(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall SetName(const Classes::TComponentName Value);
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	
public:
	__fastcall virtual TSpTBXCompoundItemsControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCompoundItemsControl(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual void __fastcall InvalidateBackground(bool InvalidateChildren = true);
	__property TSpTBXToolbarView* View = {read=GetView};
	
__published:
	__property Tb2item::TTBRootItem* Items = {read=GetRootItems};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCompoundItemsControl(HWND ParentWindow) : TSpTBXCustomControl(ParentWindow) { }
	
private:
	void *__ITBItems;	/* Tb2item::ITBItems */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Tb2item::_di_ITBItems()
	{
		Tb2item::_di_ITBItems intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ITBItems*(void) { return (ITBItems*)&__ITBItems; }
	#endif
	
};


class DELPHICLASS TSpTBXCompoundBar;
class PASCALIMPLEMENTATION TSpTBXCompoundBar : public TSpTBXCompoundItemsControl
{
	typedef TSpTBXCompoundItemsControl inherited;
	
private:
	TSpTBXDrawEvent FOnDrawDockBackground;
	void __fastcall DrawDockBackground(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	void __fastcall DrawToolbarBackground(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	void __fastcall DockResize(System::TObject* Sender);
	
protected:
	virtual void __fastcall DoDrawDockBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	__property TSpTBXDrawEvent OnDrawDockBackground = {read=FOnDrawDockBackground, write=FOnDrawDockBackground};
	
public:
	__fastcall virtual TSpTBXCompoundBar(Classes::TComponent* AOwner);
public:
	/* TSpTBXCompoundItemsControl.Destroy */ inline __fastcall virtual ~TSpTBXCompoundBar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCompoundBar(HWND ParentWindow) : TSpTBXCompoundItemsControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXButtonOptions;
class PASCALIMPLEMENTATION TSpTBXButtonOptions : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Tb2item::TTBGroupItem* FEditableItems;
	TSpTBXItem* FCloseButton;
	TSpTBXItem* FMinimizeButton;
	TSpTBXItem* FMaximizeButton;
	TSpTBXRightAlignSpacerItem* FRightAlignSpacer;
	int FCaptionImageIndex;
	int FCloseImageIndex;
	int FMinimizeImageIndex;
	int FMaximizeImageIndex;
	int FRestoreImageIndex;
	System::WideString FCaptionLabel;
	bool FCaption;
	bool FClose;
	bool FMinimize;
	bool FMaximize;
	bool FButtonBorders;
	int FTitleBarMaxSize;
	void __fastcall SetCaptionImageIndex(int Value);
	void __fastcall SetCloseImageIndex(int Value);
	void __fastcall SetCaptionLabel(const System::WideString Value);
	void __fastcall SetMaximizeImageIndex(int Value);
	void __fastcall SetRestoreImageIndex(int Value);
	void __fastcall SetMinimizeImageIndex(int Value);
	void __fastcall SetCaption(const bool Value);
	void __fastcall SetClose(const bool Value);
	void __fastcall SetMaximize(const bool Value);
	void __fastcall SetMinimize(const bool Value);
	void __fastcall SetTitleBarMaxSize(const int Value);
	
protected:
	Controls::TWinControl* FParentControl;
	TSpTBXToolbar* FToolbar;
	virtual void __fastcall ButtonsDrawImage(System::TObject* Sender, Graphics::TCanvas* ACanvas, Sptbxskins::TSpTBXSkinStatesType State, const TSpTBXPaintStage PaintStage, Imglist::TCustomImageList* &AImageList, int &AImageIndex, Types::TRect &ARect, bool &PaintDefault);
	virtual void __fastcall ButtonsDrawItem(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall ButtonsClick(System::TObject* Sender) = 0 ;
	virtual void __fastcall CreateButtons(void);
	virtual void __fastcall UpdateButtonsVisibility(void);
	virtual void __fastcall SetupButton(TSpTBXCustomItem* B);
	virtual bool __fastcall Restoring(TSpTBXCustomItem* B) = 0 ;
	
public:
	__fastcall virtual TSpTBXButtonOptions(Controls::TWinControl* AParent);
	virtual void __fastcall SetupButtonIcon(TSpTBXCustomItem* B);
	void __fastcall MoveItemToTheLeft(Tb2item::TTBCustomItem* B);
	__property Tb2item::TTBGroupItem* EditableItems = {read=FEditableItems};
	__property TSpTBXRightAlignSpacerItem* RightAlignSpacer = {read=FRightAlignSpacer};
	__property TSpTBXItem* MinimizeButton = {read=FMinimizeButton};
	__property TSpTBXItem* MaximizeButton = {read=FMaximizeButton};
	__property TSpTBXItem* CloseButton = {read=FCloseButton};
	__property System::WideString CaptionLabel = {read=FCaptionLabel, write=SetCaptionLabel};
	
__published:
	__property bool ButtonBorders = {read=FButtonBorders, write=FButtonBorders, default=1};
	__property bool Caption = {read=FCaption, write=SetCaption, default=1};
	__property bool Close = {read=FClose, write=SetClose, default=1};
	__property bool Minimize = {read=FMinimize, write=SetMinimize, default=1};
	__property bool Maximize = {read=FMaximize, write=SetMaximize, default=1};
	__property int CaptionImageIndex = {read=FCaptionImageIndex, write=SetCaptionImageIndex, default=-1};
	__property int CloseImageIndex = {read=FCloseImageIndex, write=SetCloseImageIndex, default=-1};
	__property int MinimizeImageIndex = {read=FMinimizeImageIndex, write=SetMinimizeImageIndex, default=-1};
	__property int MaximizeImageIndex = {read=FMaximizeImageIndex, write=SetMaximizeImageIndex, default=-1};
	__property int RestoreImageIndex = {read=FRestoreImageIndex, write=SetRestoreImageIndex, default=-1};
	__property int TitleBarMaxSize = {read=FTitleBarMaxSize, write=SetTitleBarMaxSize, default=21};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSpTBXButtonOptions(void) { }
	
};


class DELPHICLASS TSpTBXStatusToolbar;
class PASCALIMPLEMENTATION TSpTBXStatusToolbar : public TSpTBXToolbar
{
	typedef TSpTBXToolbar inherited;
	
private:
	bool FSizeGrip;
	Sptbxskins::TSpTBXSkinType FSkinType;
	void __fastcall SetSizeGrip(const bool Value);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	
protected:
	Forms::TCustomForm* FParentForm;
	bool __fastcall IsPointInGrip(const Types::TPoint &P);
	virtual Graphics::TColor __fastcall GetItemsTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	virtual int __fastcall GetRightAlignMargin(void);
	Forms::TWindowState __fastcall GetParentFormWindowState(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	HIDESBASE MESSAGE void __fastcall WMNCLButtonDown(Messages::TWMNCHitMessage &Message);
	
public:
	__fastcall virtual TSpTBXStatusToolbar(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXStatusToolbar(void);
	Types::TRect __fastcall GetGripRect();
	bool __fastcall NeedsSeparatorRepaint(void);
	
__published:
	__property bool SizeGrip = {read=FSizeGrip, write=SetSizeGrip, default=1};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXStatusToolbar(HWND ParentWindow) : TSpTBXToolbar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomStatusBar;
class PASCALIMPLEMENTATION TSpTBXCustomStatusBar : public TSpTBXCompoundBar
{
	typedef TSpTBXCompoundBar inherited;
	
private:
	bool __fastcall GetSizeGrip(void);
	void __fastcall SetSizeGrip(const bool Value);
	TSpTBXStatusToolbar* __fastcall GetStatusToolbar(void);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	Forms::TWindowState FPrevState;
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	virtual void __fastcall DoDrawDockBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DrawSeparators(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &AGripRect);
	virtual TSpTBXToolbarClass __fastcall GetToolbarClass(void);
	__property Align = {default=2};
	__property bool SizeGrip = {read=GetSizeGrip, write=SetSizeGrip, default=1};
	
public:
	__fastcall virtual TSpTBXCustomStatusBar(Classes::TComponent* AOwner);
	__property TSpTBXStatusToolbar* Toolbar = {read=GetStatusToolbar};
public:
	/* TSpTBXCompoundItemsControl.Destroy */ inline __fastcall virtual ~TSpTBXCustomStatusBar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomStatusBar(HWND ParentWindow) : TSpTBXCompoundBar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXStatusBar;
class PASCALIMPLEMENTATION TSpTBXStatusBar : public TSpTBXCustomStatusBar
{
	typedef TSpTBXCustomStatusBar inherited;
	
__published:
	__property Align = {default=2};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentColor = {default=1};
	__property ParentBiDiMode = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Visible = {default=1};
	__property OnCanResize;
	__property OnContextPopup;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnResize;
	__property OnStartDock;
	__property OnStartDrag;
	__property Images;
	__property SizeGrip = {default=1};
	__property SkinType = {default=2};
	__property OnDrawDockBackground;
public:
	/* TSpTBXCustomStatusBar.Create */ inline __fastcall virtual TSpTBXStatusBar(Classes::TComponent* AOwner) : TSpTBXCustomStatusBar(AOwner) { }
	
public:
	/* TSpTBXCompoundItemsControl.Destroy */ inline __fastcall virtual ~TSpTBXStatusBar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXStatusBar(HWND ParentWindow) : TSpTBXCustomStatusBar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTitleToolbar;
class DELPHICLASS TSpTBXCustomTitleBar;
class PASCALIMPLEMENTATION TSpTBXTitleToolbar : public TSpTBXToolbar
{
	typedef TSpTBXToolbar inherited;
	
protected:
	virtual Graphics::TColor __fastcall GetItemsTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	TSpTBXCustomTitleBar* __fastcall GetTitleBar(void);
	virtual int __fastcall GetRightAlignMargin(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
public:
	/* TSpTBXToolbar.Create */ inline __fastcall virtual TSpTBXTitleToolbar(Classes::TComponent* AOwner) : TSpTBXToolbar(AOwner) { }
	/* TSpTBXToolbar.Destroy */ inline __fastcall virtual ~TSpTBXTitleToolbar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTitleToolbar(HWND ParentWindow) : TSpTBXToolbar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTitleBarButtonOptions;
class PASCALIMPLEMENTATION TSpTBXTitleBarButtonOptions : public TSpTBXButtonOptions
{
	typedef TSpTBXButtonOptions inherited;
	
private:
	bool FSystemMenu;
	TSpTBXSystemMenuItem* FSystemButton;
	void __fastcall SetSystemMenu(const bool Value);
	
protected:
	TSpTBXCustomTitleBar* FTitleBar;
	virtual void __fastcall ButtonsDrawItem(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall ButtonsClick(System::TObject* Sender);
	virtual void __fastcall CreateButtons(void);
	virtual bool __fastcall Restoring(TSpTBXCustomItem* B);
	
public:
	__fastcall virtual TSpTBXTitleBarButtonOptions(Controls::TWinControl* AParent);
	__property TSpTBXSystemMenuItem* SystemButton = {read=FSystemButton};
	
__published:
	__property bool SystemMenu = {read=FSystemMenu, write=SetSystemMenu, default=1};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSpTBXTitleBarButtonOptions(void) { }
	
};


class PASCALIMPLEMENTATION TSpTBXCustomTitleBar : public TSpTBXCompoundBar
{
	typedef TSpTBXCompoundBar inherited;
	
private:
	bool FActive;
	bool FFixedSize;
	bool FFullScreenMaximize;
	bool FMouseActive;
	TSpTBXTitleBarButtonOptions* FOptions;
	void *FOldAppWndProc;
	void *FNewAppWndProc;
	TSpTBXDrawEvent FOnDrawBackground;
	TSpTBXPopupEvent FOnSystemMenuPopup;
	Classes::TWndMethod FOldParentFormWndProc;
	void __fastcall AppWndProc(Messages::TMessage &Msg);
	void __fastcall NewParentFormWndProc(Messages::TMessage &Message);
	void __fastcall SetActive(const bool Value);
	void __fastcall SetMouseActive(const bool Value);
	void __fastcall SetFullScreenMaximize(const bool Value);
	Forms::TWindowState __fastcall GetWindowState(void);
	void __fastcall SetWindowState(const Forms::TWindowState Value);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	HIDESBASE MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	
protected:
	Forms::TCustomForm* FParentForm;
	virtual void __fastcall Loaded(void);
	Types::TPoint __fastcall GetFloatingBorderSize();
	virtual Tb2item::TTBCustomItem* __fastcall GetItems(void);
	virtual TSpTBXToolbarClass __fastcall GetToolbarClass(void);
	void __fastcall ChangeTitleBarState(bool Activate);
	void __fastcall UpdateSkinMetrics(void);
	virtual void __fastcall DoDrawDockBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	void __fastcall GetSizeCursor(const Types::TPoint &MousePos, int &SizeCursor, int &SizeCode);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	__property bool Active = {read=FActive, write=SetActive, default=1};
	__property Align = {default=5};
	__property bool FixedSize = {read=FFixedSize, write=FFixedSize, default=0};
	__property bool FullScreenMaximize = {read=FFullScreenMaximize, write=SetFullScreenMaximize, default=0};
	__property TSpTBXTitleBarButtonOptions* Options = {read=FOptions, write=FOptions};
	__property Forms::TWindowState WindowState = {read=GetWindowState, write=SetWindowState, nodefault};
	__property TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	__property TSpTBXPopupEvent OnSystemMenuPopup = {read=FOnSystemMenuPopup, write=FOnSystemMenuPopup};
	
public:
	__fastcall virtual TSpTBXCustomTitleBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomTitleBar(void);
	Types::TRect __fastcall GetClientAreaRect();
	bool __fastcall IsActive(void);
	__property bool MouseActive = {read=FMouseActive, write=SetMouseActive, default=1};
	__property TSpTBXToolbar* Toolbar = {read=FToolbar};
	
__published:
	__property Caption;
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomTitleBar(HWND ParentWindow) : TSpTBXCompoundBar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTitleBar;
class PASCALIMPLEMENTATION TSpTBXTitleBar : public TSpTBXCustomTitleBar
{
	typedef TSpTBXCustomTitleBar inherited;
	
__published:
	__property Align = {default=5};
	__property Anchors = {default=3};
	__property Color = {default=-16777211};
	__property BiDiMode;
	__property Constraints;
	__property DockSite = {default=0};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentColor = {default=1};
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
	__property Active = {default=1};
	__property FixedSize = {default=0};
	__property FullScreenMaximize = {default=0};
	__property Images;
	__property Options;
	__property OnDrawBackground;
	__property OnDrawDockBackground;
	__property OnSystemMenuPopup;
public:
	/* TSpTBXCustomTitleBar.Create */ inline __fastcall virtual TSpTBXTitleBar(Classes::TComponent* AOwner) : TSpTBXCustomTitleBar(AOwner) { }
	/* TSpTBXCustomTitleBar.Destroy */ inline __fastcall virtual ~TSpTBXTitleBar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTitleBar(HWND ParentWindow) : TSpTBXCustomTitleBar(ParentWindow) { }
	
};


class DELPHICLASS TBitmapHint;
class PASCALIMPLEMENTATION TBitmapHint : public Controls::THintWindow
{
	typedef Controls::THintWindow inherited;
	
private:
	Graphics::TBitmap* FHintBitmap;
	bool FActivating;
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall Paint(void);
	
public:
	__property bool Activating = {read=FActivating, nodefault};
	virtual void __fastcall ActivateHint(const Types::TRect &Rect, const System::UnicodeString AHint);
	virtual void __fastcall ActivateHintData(const Types::TRect &Rect, const System::UnicodeString AHint, void * AData);
public:
	/* THintWindow.Create */ inline __fastcall virtual TBitmapHint(Classes::TComponent* AOwner) : Controls::THintWindow(AOwner) { }
	
public:
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TBitmapHint(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TBitmapHint(HWND ParentWindow) : Controls::THintWindow(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word C_SpTBXRadioGroupIndex = 0x22b8;
static const Word CM_SPPOPUPCLOSE = 0xb457;
#define rvSpTBXDisplayMode L"DisplayMode"
static const ShortInt CPDefaultCols = 0x8;
static const ShortInt CPDefaultRows = 0x5;
extern PACKAGE Graphics::TFont* SmCaptionFont;
extern PACKAGE Graphics::TBitmap* SpStockHintBitmap;
extern PACKAGE Controls::TImageList* MDIButtonsImgList;
extern PACKAGE Controls::THintWindowClass SpTBXHintWindowClass;
static const ShortInt DefaultToolbarBorderSize = 0x2;
static const ShortInt crSpTBXNewHandPoint = 0x64;
static const ShortInt crSpTBXCustomization = 0x65;
static const ShortInt crSpTBXCustomizationCancel = 0x66;
extern PACKAGE void __fastcall SpFillItemInfo(Graphics::TCanvas* ACanvas, Tb2item::TTBItemViewer* IV, /* out */ Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
extern PACKAGE Types::TRect __fastcall SpGetBoundsRect(Tb2item::TTBItemViewer* IV, Tb2item::TTBRootItem* Root);
extern PACKAGE void __fastcall SpGetAllItems(Tb2item::TTBCustomItem* AParentItem, Classes::TStringList* ItemsList, bool ClearFirst = true);
extern PACKAGE tagSIZE __fastcall SpGetMenuMaximumImageSize(Tb2item::TTBView* View);
extern PACKAGE Tb2item::TTBItemViewer* __fastcall SpGetItemViewerFromPoint(Tb2item::TTBRootItem* Root, Tb2item::TTBView* View, const Types::TPoint &P, bool ProcessGroupItems = true);
extern PACKAGE Tb2item::TTBItemViewer* __fastcall SpGetNextItemSameEdge(Tb2item::TTBView* View, Tb2item::TTBItemViewer* IV, bool GoForward, TSpTBXSearchItemViewerType SearchType);
extern PACKAGE TSpTBXItemViewer* __fastcall SpGetFirstRightAlignSpacer(Tb2item::TTBView* View);
extern PACKAGE TSpTBXItemViewer* __fastcall SpGetRightAlignedItems(Tb2item::TTBView* View, Classes::TList* RightAlignedList, bool IsRotated, /* out */ int &VisibleTotalWidth, /* out */ int &RightAlignedTotalWidth);
extern PACKAGE void __fastcall SpInvalidateItem(Tb2item::TTBView* View, Tb2item::TTBCustomItem* Item);
extern PACKAGE Tb2item::TTBItemViewer* __fastcall SpFindItemViewer(Tb2item::TTBView* View, Tb2item::TTBCustomItem* Item);
extern PACKAGE Tb2item::TTBControlItem* __fastcall SpFindControlItem(Tb2item::TTBCustomItem* Item, Controls::TControl* Ctl, bool Recurse = true);
extern PACKAGE void __fastcall SpGetDropPosItemViewer(Tb2item::TTBRootItem* Root, Tb2item::TTBView* View, const Types::TPoint &P, /* out */ Tb2item::TTBItemViewer* &DestIV, /* out */ int &DestItemPos, /* out */ Types::TRect &DropMark)/* overload */;
extern PACKAGE void __fastcall SpGetDropPosItemViewer(Tb2item::TTBRootItem* Root, Tb2item::TTBView* View, const Types::TPoint &P, int SourceItemPos, /* out */ Tb2item::TTBItemViewer* &DestIV, /* out */ int &DestItemPos)/* overload */;
extern PACKAGE int __fastcall SpGetDragHandleSize(Tb2dock::TTBCustomDockableWindow* Toolbar);
extern PACKAGE bool __fastcall SpIsVerticalToolbar(Tb2dock::TTBCustomDockableWindow* Toolbar);
extern PACKAGE bool __fastcall SpIsDockUsingBitmap(Tb2dock::TTBDock* Dock);
extern PACKAGE void __fastcall SpDrawXPMenuItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
extern PACKAGE void __fastcall SpDrawXPMenuSeparator(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool MenuItemStyle, bool Vertical);
extern PACKAGE void __fastcall SpDrawXPMenuItemImage(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo, Imglist::TCustomImageList* ImageList, int ImageIndex);
extern PACKAGE void __fastcall SpDrawXPMenuPopupWindow(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &OpenIVRect, bool DrawGutter, int ImageSize, Sptbxskins::TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPStatusBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Types::TRect &AGripRect, Sptbxskins::TSpTBXSkinType SkinType, bool UsingOfficeTheme);
extern PACKAGE void __fastcall SpDrawXPTitleBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool DrawBorders = true);
extern PACKAGE void __fastcall SpDrawXPTitleBarBody(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, const Types::TPoint &BorderSize, bool DrawBody = true);
extern PACKAGE void __fastcall SpDrawXPDock(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Sptbxskins::TSpTBXSkinType SkinType, bool Vertical = false);
extern PACKAGE void __fastcall SpDrawXPToolbar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Sptbxskins::TSpTBXSkinType SkinType, bool Docked, bool Floating, bool Vertical, bool PaintSkinBackground, bool PaintBorders, Sptbxskins::TSpTBXSkinComponentsType SkinComponent = (Sptbxskins::TSpTBXSkinComponentsType)(0xe))/* overload */;
extern PACKAGE void __fastcall SpDrawXPToolbar(Tb2dock::TTBCustomDockableWindow* W, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool PaintOnNCArea, bool PaintBorders = true, Sptbxskins::TSpTBXSkinComponentsType SkinComponent = (Sptbxskins::TSpTBXSkinComponentsType)(0xe))/* overload */;
extern PACKAGE void __fastcall SpDrawXPToolbarGrip(Tb2dock::TTBCustomDockableWindow* W, Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
extern PACKAGE Types::TPoint __fastcall SpCalcPopupPosition(const int X, const int Y, const int Width, const int Height, Controls::TControl* PopupControl = (Controls::TControl*)(0x0), bool IsVertical = false);
extern PACKAGE System::WideString __fastcall SpHMenuGetCaption(HMENU Menu, int Index);
extern PACKAGE bool __fastcall SpHMenuToTBMenuItem(HMENU Menu, Tb2item::TTBCustomItem* ParentItem);
extern PACKAGE int __fastcall SpShowSystemPopupMenu(Forms::TCustomForm* ParentForm, const Types::TPoint &ScreenPos, bool DoDefault = true);
extern PACKAGE bool __fastcall SpFillSystemSpTBXPopup(Forms::TCustomForm* ParentForm, Tb2item::TTBCustomItem* ParentItem, bool ShowSize, bool ShowMinimize, bool ShowMaximize, bool ShowClose, Classes::TNotifyEvent ClickEvent = 0x0);
extern PACKAGE int __fastcall SpShowSystemSpTBXPopupMenu(Forms::TCustomForm* ParentForm, const Types::TPoint &ScreenPos, bool ShowSize, bool ShowMinimize, bool ShowMaximize, bool ShowClose, TSpTBXPopupEvent PopupEvent, bool DoDefault = true);
extern PACKAGE void __fastcall SpActivateDwmNC(Controls::TWinControl* WinControl, bool Activate);
extern PACKAGE bool __fastcall SpCanFocus(Controls::TWinControl* WinControl);
extern PACKAGE bool __fastcall SpIsFocused(Controls::TWinControl* WinControl, /* out */ Controls::TWinControl* &FocusedChild);
extern PACKAGE Controls::TWinControl* __fastcall SpFocusFirstChild(Controls::TWinControl* WinControl);
extern PACKAGE int __fastcall SpFindControl(Controls::TWinControl* Parent, Controls::TControl* Child);
extern PACKAGE Controls::TWinControl* __fastcall SpFindParent(Controls::TControl* Control, System::TClass ParentClass);
extern PACKAGE bool __fastcall SpHasBorders(Controls::TWinControl* WinControl);
extern PACKAGE Forms::TWindowState __fastcall SpGetFormWindowState(Forms::TCustomForm* F, /* out */ Types::TRect &RestoreBoundsRect);
extern PACKAGE void __fastcall SpSetFormWindowState(Forms::TCustomForm* F, Forms::TWindowState WindowState, const Types::TRect &RestoreBoundsRect);
extern PACKAGE bool __fastcall SpGetTaskBar(/* out */ unsigned &State, /* out */ unsigned &Edge, /* out */ Types::TRect &Bounds);
extern PACKAGE void __fastcall SpRecalcNCArea(Controls::TWinControl* WinControl);
extern PACKAGE void __fastcall SpCustomizeAllToolbars(Classes::TComponent* AParentComponent, bool Reset);
extern PACKAGE void __fastcall SpBeginUpdateAllToolbars(Classes::TComponent* AParentComponent);
extern PACKAGE void __fastcall SpEndUpdateAllToolbars(Classes::TComponent* AParentComponent);
extern PACKAGE void __fastcall SpPersistent_AfterInherited_DefineProperties(Classes::TFiler* Filer, Classes::TPersistent* Instance);

}	/* namespace Sptbxitem */
using namespace Sptbxitem;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxitemHPP
