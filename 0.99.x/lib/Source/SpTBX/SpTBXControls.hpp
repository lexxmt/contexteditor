// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxcontrols.pas' rev: 20.00

#ifndef SptbxcontrolsHPP
#define SptbxcontrolsHPP

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
#include <Extctrls.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxcontrols
{
//-- type declarations -------------------------------------------------------
typedef Classes::TStrings* TTntStrings;

#pragma option push -b-
enum TSpTBXPanelBorder { pbrRaised, pbrDoubleRaised, pbrSunken, pbrDoubleSunken, pbrBumped, pbrEtched, pbrFramed };
#pragma option pop

#pragma option push -b-
enum TSpTBXProgressCaption { pctNone, pctDefault, pctPercentage, pctProgress };
#pragma option pop

#pragma option push -b-
enum TSpTBXTickMark { tmxBottomRight, tmxTopLeft, tmxBoth, tmxCenter };
#pragma option pop

typedef void __fastcall (__closure *TSpTBXCanResizeEvent)(System::TObject* Sender, int &NewSize, bool &Accept);

class DELPHICLASS TSpTBXCustomPanel;
class PASCALIMPLEMENTATION TSpTBXCustomPanel : public Sptbxitem::TSpTBXCustomControl
{
	typedef Sptbxitem::TSpTBXCustomControl inherited;
	
private:
	bool FBorders;
	TSpTBXPanelBorder FBorderType;
	bool FTBXStyleBackground;
	Sptbxskins::TSpTBXSkinType FSkinType;
	Sptbxitem::TSpTBXDrawEvent FOnDrawBackground;
	void __fastcall SetBorders(const bool Value);
	void __fastcall SetBorderType(const TSpTBXPanelBorder Value);
	void __fastcall SetTBXStyleBackground(const bool Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	MESSAGE void __fastcall CMSpTBXControlsInvalidate(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TMessage &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanged(Messages::TWMWindowPosMsg &Message);
	
protected:
	Graphics::TBitmap* FBackground;
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall DrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	__property bool Borders = {read=FBorders, write=SetBorders, default=1};
	__property TSpTBXPanelBorder BorderType = {read=FBorderType, write=SetBorderType, default=5};
	__property ParentColor = {default=0};
	__property bool TBXStyleBackground = {read=FTBXStyleBackground, write=SetTBXStyleBackground, default=0};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	
public:
	__fastcall virtual TSpTBXCustomPanel(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomPanel(void);
	virtual void __fastcall InvalidateBackground(bool InvalidateChildren = true);
	
__published:
	__property Caption;
	__property Hint;
	__property Color = {default=536870911};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomPanel(HWND ParentWindow) : Sptbxitem::TSpTBXCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXPanel;
class PASCALIMPLEMENTATION TSpTBXPanel : public TSpTBXCustomPanel
{
	typedef TSpTBXCustomPanel inherited;
	
private:
	bool FHotTracking;
	bool FHotTrack;
	bool FChildFocused;
	void __fastcall SetHotTrack(const bool Value);
	void __fastcall SetHotTracking(const bool Value);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFocusChanged(Controls::TCMFocusChanged &Message);
	
protected:
	virtual void __fastcall DrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	
public:
	__property bool HotTracking = {read=FHotTracking, nodefault};
	
__published:
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoSize = {default=0};
	__property BiDiMode;
	__property Constraints;
	__property UseDockManager = {default=0};
	__property DockSite = {default=0};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property Visible = {default=1};
	__property OnCanResize;
	__property OnClick;
	__property OnConstrainedResize;
	__property OnContextPopup;
	__property OnDockDrop;
	__property OnDockOver;
	__property OnDblClick;
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
	__property Borders = {default=1};
	__property BorderType = {default=5};
	__property bool HotTrack = {read=FHotTrack, write=SetHotTrack, default=0};
	__property TBXStyleBackground = {default=0};
	__property OnDrawBackground;
public:
	/* TSpTBXCustomPanel.Create */ inline __fastcall virtual TSpTBXPanel(Classes::TComponent* AOwner) : TSpTBXCustomPanel(AOwner) { }
	/* TSpTBXCustomPanel.Destroy */ inline __fastcall virtual ~TSpTBXPanel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXPanel(HWND ParentWindow) : TSpTBXCustomPanel(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomGroupBox;
class PASCALIMPLEMENTATION TSpTBXCustomGroupBox : public TSpTBXCustomPanel
{
	typedef TSpTBXCustomPanel inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual void __fastcall DrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	
public:
	__fastcall virtual TSpTBXCustomGroupBox(Classes::TComponent* AOwner);
public:
	/* TSpTBXCustomPanel.Destroy */ inline __fastcall virtual ~TSpTBXCustomGroupBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomGroupBox(HWND ParentWindow) : TSpTBXCustomPanel(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXGroupBox;
class PASCALIMPLEMENTATION TSpTBXGroupBox : public TSpTBXCustomGroupBox
{
	typedef TSpTBXCustomGroupBox inherited;
	
__published:
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property UseDockManager = {default=0};
	__property DockSite = {default=0};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property Visible = {default=1};
	__property OnCanResize;
	__property OnClick;
	__property OnConstrainedResize;
	__property OnContextPopup;
	__property OnDockDrop;
	__property OnDockOver;
	__property OnDblClick;
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
	__property Borders = {default=1};
	__property BorderType = {default=5};
	__property TBXStyleBackground = {default=0};
	__property OnDrawBackground;
public:
	/* TSpTBXCustomGroupBox.Create */ inline __fastcall virtual TSpTBXGroupBox(Classes::TComponent* AOwner) : TSpTBXCustomGroupBox(AOwner) { }
	
public:
	/* TSpTBXCustomPanel.Destroy */ inline __fastcall virtual ~TSpTBXGroupBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXGroupBox(HWND ParentWindow) : TSpTBXCustomGroupBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTextObjectActionLink;
class PASCALIMPLEMENTATION TSpTBXTextObjectActionLink : public Controls::TControlActionLink
{
	typedef Controls::TControlActionLink inherited;
	
public:
	/* TBasicActionLink.Create */ inline __fastcall virtual TSpTBXTextObjectActionLink(System::TObject* AClient) : Controls::TControlActionLink(AClient) { }
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TSpTBXTextObjectActionLink(void) { }
	
};


class DELPHICLASS TSpTBXTextObject;
class PASCALIMPLEMENTATION TSpTBXTextObject : public Sptbxitem::TSpTBXCustomControl
{
	typedef Sptbxitem::TSpTBXCustomControl inherited;
	
private:
	Classes::TAlignment FAlignment;
	Sptbxskins::TSpGlowDirection FCaptionGlow;
	Graphics::TColor FCaptionGlowColor;
	Sptbxskins::TSpTextRotationAngle FCaptionRoatationAngle;
	bool FChecked;
	bool FDisabledIconCorrection;
	bool FDrawPushedCaption;
	Sptbxskins::TSpGlyphLayout FGlyphLayout;
	Imglist::TCustomImageList* FImages;
	Imglist::TChangeLink* FImageChangeLink;
	Imglist::TImageIndex FImageIndex;
	System::WideString FLinkText;
	System::WideString FLinkTextParams;
	bool FMouseInControl;
	bool FPushed;
	Sptbxskins::TSpTBXSkinType FSkinType;
	bool FSpaceAsClick;
	bool FShowAccelChar;
	bool FUpdating;
	Sptbxitem::TTextWrapping FWrapping;
	Sptbxitem::TSpTBXDrawEvent FOnDraw;
	Sptbxitem::TSpTBXDrawTextEvent FOnDrawCaption;
	Sptbxitem::TSpTBXDrawHintEvent FOnDrawHint;
	Sptbxitem::TSpTBXGetImageIndexEvent FOnGetImageIndex;
	Classes::TNotifyEvent FOnMouseEnter;
	Classes::TNotifyEvent FOnMouseLeave;
	void __fastcall ReadLinkFont(Classes::TReader* Reader);
	void __fastcall ImageListChange(System::TObject* Sender);
	void __fastcall UpdateTracking(bool ForceMouseLeave = false);
	void __fastcall SetAlignment(const Classes::TAlignment Value);
	void __fastcall SetCaptionGlow(const Sptbxskins::TSpGlowDirection Value);
	void __fastcall SetCaptionGlowColor(const Graphics::TColor Value);
	void __fastcall SetCaptionRoatationAngle(const Sptbxskins::TSpTextRotationAngle Value);
	void __fastcall SetGlyphLayout(const Sptbxskins::TSpGlyphLayout Value);
	void __fastcall SetImageIndex(const Imglist::TImageIndex Value);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	void __fastcall SetShowAccelChar(bool Value);
	void __fastcall SetWrapping(Sptbxitem::TTextWrapping Value);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Controls::TCMHintShow &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	void __fastcall AdjustBounds(void);
	virtual void __fastcall DoDrawHint(Graphics::TBitmap* AHintBitmap, System::WideString &AHint, bool &PaintDefault);
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual int __fastcall DoDrawText(Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Flags);
	virtual void __fastcall DoGetImageIndex(Imglist::TCustomImageList* &AImageList, int &AImageIndex);
	virtual void __fastcall DoInternalGlyphDraw(Graphics::TCanvas* ACanvas, const Types::TRect &AGlyphRect);
	virtual Types::TRect __fastcall GetFocusRect(const Types::TRect &R, const Types::TRect &TextR, const Types::TRect &GlyphR);
	virtual Types::TRect __fastcall GetTextMargins();
	bool __fastcall IsImageIndexValid(void);
	virtual void __fastcall Paint(void);
	virtual bool __fastcall CanAutoSize(int &NewWidth, int &NewHeight);
	virtual void __fastcall DoAdjustBounds(int &NewWidth, int &NewHeight);
	virtual bool __fastcall GetFocused(void);
	virtual bool __fastcall GetPushed(void);
	virtual void __fastcall DoMouseEnter(void);
	virtual void __fastcall DoMouseLeave(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyUp(System::Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall ExecuteLink(void);
	DYNAMIC Controls::TControlActionLinkClass __fastcall GetActionLinkClass(void);
	virtual bool __fastcall GetChecked(void);
	virtual void __fastcall SetChecked(bool Value);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
	__property AutoSize = {default=1};
	__property bool Checked = {read=GetChecked, write=SetChecked, default=0};
	__property Sptbxskins::TSpGlowDirection CaptionGlow = {read=FCaptionGlow, write=SetCaptionGlow, default=0};
	__property Graphics::TColor CaptionGlowColor = {read=FCaptionGlowColor, write=SetCaptionGlowColor, default=65535};
	__property Sptbxskins::TSpTextRotationAngle CaptionRoatationAngle = {read=FCaptionRoatationAngle, write=SetCaptionRoatationAngle, default=0};
	__property bool DrawPushedCaption = {read=FDrawPushedCaption, write=FDrawPushedCaption, default=0};
	__property bool DisabledIconCorrection = {read=FDisabledIconCorrection, write=FDisabledIconCorrection, default=1};
	__property Sptbxskins::TSpGlyphLayout GlyphLayout = {read=FGlyphLayout, write=SetGlyphLayout, default=0};
	__property Imglist::TCustomImageList* Images = {read=FImages, write=SetImages};
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property System::WideString LinkText = {read=FLinkText, write=FLinkText};
	__property System::WideString LinkTextParams = {read=FLinkTextParams, write=FLinkTextParams};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property bool ShowAccelChar = {read=FShowAccelChar, write=SetShowAccelChar, default=1};
	__property bool SpaceAsClick = {read=FSpaceAsClick, write=FSpaceAsClick, default=0};
	__property Sptbxitem::TTextWrapping Wrapping = {read=FWrapping, write=SetWrapping, default=0};
	__property Sptbxitem::TSpTBXDrawEvent OnDraw = {read=FOnDraw, write=FOnDraw};
	__property Sptbxitem::TSpTBXDrawTextEvent OnDrawCaption = {read=FOnDrawCaption, write=FOnDrawCaption};
	__property Sptbxitem::TSpTBXDrawHintEvent OnDrawHint = {read=FOnDrawHint, write=FOnDrawHint};
	__property Sptbxitem::TSpTBXGetImageIndexEvent OnGetImageIndex = {read=FOnGetImageIndex, write=FOnGetImageIndex};
	__property Classes::TNotifyEvent OnMouseEnter = {read=FOnMouseEnter, write=FOnMouseEnter};
	__property Classes::TNotifyEvent OnMouseLeave = {read=FOnMouseLeave, write=FOnMouseLeave};
	__property TabStop = {default=1};
	__property ParentColor = {default=0};
	
public:
	__fastcall virtual TSpTBXTextObject(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXTextObject(void);
	DYNAMIC bool __fastcall CanFocus(void);
	DYNAMIC void __fastcall Click(void);
	DYNAMIC Classes::TAlignment __fastcall GetControlsAlignment(void);
	virtual void __fastcall GetSize(/* out */ Types::TRect &TotalR, /* out */ Types::TRect &TextR, /* out */ Types::TRect &GlyphR);
	unsigned __fastcall GetTextFlags(void);
	virtual tagSIZE __fastcall GetGlyphSize();
	__property bool MouseInControl = {read=FMouseInControl, nodefault};
	__property bool Pushed = {read=GetPushed, nodefault};
	
__published:
	__property Caption;
	__property Hint;
	__property Color = {default=536870911};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTextObject(HWND ParentWindow) : Sptbxitem::TSpTBXCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomLabel;
class PASCALIMPLEMENTATION TSpTBXCustomLabel : public TSpTBXTextObject
{
	typedef TSpTBXTextObject inherited;
	
private:
	Controls::TWinControl* FFocusControl;
	bool FUnderline;
	Graphics::TColor FUnderlineColor;
	void __fastcall SetFocusControl(const Controls::TWinControl* Value);
	void __fastcall SetUnderline(const bool Value);
	void __fastcall SetUnderlineColor(const Graphics::TColor Value);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	
protected:
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	__property Controls::TWinControl* FocusControl = {read=FFocusControl, write=SetFocusControl};
	__property bool Underline = {read=FUnderline, write=SetUnderline, default=0};
	__property Graphics::TColor UnderlineColor = {read=FUnderlineColor, write=SetUnderlineColor, default=-16777200};
	
public:
	__fastcall virtual TSpTBXCustomLabel(Classes::TComponent* AOwner);
	virtual void __fastcall GetSize(/* out */ Types::TRect &TotalR, /* out */ Types::TRect &TextR, /* out */ Types::TRect &GlyphR);
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXCustomLabel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomLabel(HWND ParentWindow) : TSpTBXTextObject(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXLabel;
class PASCALIMPLEMENTATION TSpTBXLabel : public TSpTBXCustomLabel
{
	typedef TSpTBXCustomLabel inherited;
	
__published:
	__property Action;
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoSize = {default=1};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowAccelChar = {default=1};
	__property ShowHint;
	__property Visible = {default=1};
	__property Wrapping = {default=0};
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
	__property Alignment = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property FocusControl;
	__property GlyphLayout = {default=0};
	__property Images;
	__property ImageIndex = {default=-1};
	__property LinkText;
	__property LinkTextParams;
	__property SkinType = {default=2};
	__property Underline = {default=0};
	__property UnderlineColor = {default=-16777200};
	__property OnDraw;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnGetImageIndex;
public:
	/* TSpTBXCustomLabel.Create */ inline __fastcall virtual TSpTBXLabel(Classes::TComponent* AOwner) : TSpTBXCustomLabel(AOwner) { }
	
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXLabel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXLabel(HWND ParentWindow) : TSpTBXCustomLabel(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXButtonControl;
class PASCALIMPLEMENTATION TSpTBXButtonControl : public TSpTBXTextObject
{
	typedef TSpTBXTextObject inherited;
	
private:
	int FGroupIndex;
	bool FStateChanged;
	void __fastcall UpdateExclusive(void);
	void __fastcall SetGroupIndex(const int Value);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	MESSAGE void __fastcall CMSPGroupIndexUpdate(Messages::TMessage &Message);
	
protected:
	virtual bool __fastcall CanUpdateExclusive(void);
	virtual void __fastcall SetChecked(bool Value);
	__property int GroupIndex = {read=FGroupIndex, write=SetGroupIndex, default=0};
	__property bool StateChanged = {read=FStateChanged, write=FStateChanged, nodefault};
	
public:
	__fastcall virtual TSpTBXButtonControl(Classes::TComponent* AOwner);
	DYNAMIC bool __fastcall CanFocus(void);
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXButtonControl(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXButtonControl(HWND ParentWindow) : TSpTBXTextObject(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomCheckButton;
class PASCALIMPLEMENTATION TSpTBXCustomCheckButton : public TSpTBXButtonControl
{
	typedef TSpTBXButtonControl inherited;
	
protected:
	virtual void __fastcall Toggle(void);
	
public:
	virtual tagSIZE __fastcall GetGlyphSize();
	virtual void __fastcall GetSize(/* out */ Types::TRect &TotalR, /* out */ Types::TRect &TextR, /* out */ Types::TRect &GlyphR);
public:
	/* TSpTBXButtonControl.Create */ inline __fastcall virtual TSpTBXCustomCheckButton(Classes::TComponent* AOwner) : TSpTBXButtonControl(AOwner) { }
	
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXCustomCheckButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomCheckButton(HWND ParentWindow) : TSpTBXButtonControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomCheckBox;
class PASCALIMPLEMENTATION TSpTBXCustomCheckBox : public TSpTBXCustomCheckButton
{
	typedef TSpTBXCustomCheckButton inherited;
	
private:
	bool FAllowGrayed;
	Stdctrls::TCheckBoxState FState;
	void __fastcall SetState(const Stdctrls::TCheckBoxState Value);
	
protected:
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	virtual void __fastcall DoInternalGlyphDraw(Graphics::TCanvas* ACanvas, const Types::TRect &AGlyphRect);
	virtual bool __fastcall GetChecked(void);
	virtual void __fastcall SetChecked(bool Value);
	virtual void __fastcall Toggle(void);
	__property bool AllowGrayed = {read=FAllowGrayed, write=FAllowGrayed, default=0};
	__property Stdctrls::TCheckBoxState State = {read=FState, write=SetState, default=0};
	
public:
	__fastcall virtual TSpTBXCustomCheckBox(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall Click(void);
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXCustomCheckBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomCheckBox(HWND ParentWindow) : TSpTBXCustomCheckButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCheckBox;
class PASCALIMPLEMENTATION TSpTBXCheckBox : public TSpTBXCustomCheckBox
{
	typedef TSpTBXCustomCheckBox inherited;
	
__published:
	__property Action;
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoSize = {default=1};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowAccelChar = {default=1};
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Visible = {default=1};
	__property Wrapping = {default=0};
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
	__property Alignment = {default=0};
	__property AllowGrayed = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Checked = {default=0};
	__property State = {default=0};
	__property SkinType = {default=2};
	__property OnDraw;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnGetImageIndex;
public:
	/* TSpTBXCustomCheckBox.Create */ inline __fastcall virtual TSpTBXCheckBox(Classes::TComponent* AOwner) : TSpTBXCustomCheckBox(AOwner) { }
	
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXCheckBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCheckBox(HWND ParentWindow) : TSpTBXCustomCheckBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomRadioButton;
class PASCALIMPLEMENTATION TSpTBXCustomRadioButton : public TSpTBXCustomCheckButton
{
	typedef TSpTBXCustomCheckButton inherited;
	
private:
	HIDESBASE MESSAGE void __fastcall CMFocusChanged(Controls::TCMFocusChanged &Message);
	
protected:
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	virtual bool __fastcall CanUpdateExclusive(void);
	virtual void __fastcall DoInternalGlyphDraw(Graphics::TCanvas* ACanvas, const Types::TRect &AGlyphRect);
	virtual void __fastcall SetChecked(bool Value);
	virtual void __fastcall Toggle(void);
	__property TabStop = {default=0};
	
public:
	__fastcall virtual TSpTBXCustomRadioButton(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall Click(void);
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXCustomRadioButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomRadioButton(HWND ParentWindow) : TSpTBXCustomCheckButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXRadioButton;
class PASCALIMPLEMENTATION TSpTBXRadioButton : public TSpTBXCustomRadioButton
{
	typedef TSpTBXCustomRadioButton inherited;
	
__published:
	__property Action;
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoSize = {default=1};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowAccelChar = {default=1};
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property Visible = {default=1};
	__property Wrapping = {default=0};
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
	__property Alignment = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Checked = {default=0};
	__property GroupIndex = {default=0};
	__property SkinType = {default=2};
	__property OnDraw;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnGetImageIndex;
public:
	/* TSpTBXCustomRadioButton.Create */ inline __fastcall virtual TSpTBXRadioButton(Classes::TComponent* AOwner) : TSpTBXCustomRadioButton(AOwner) { }
	
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXRadioButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXRadioButton(HWND ParentWindow) : TSpTBXCustomRadioButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomRadioGroup;
class PASCALIMPLEMENTATION TSpTBXCustomRadioGroup : public TSpTBXCustomGroupBox
{
	typedef TSpTBXCustomGroupBox inherited;
	
private:
	Classes::TList* FButtons;
	Classes::TStrings* FItems;
	int FItemIndex;
	int FColumns;
	bool FReading;
	bool FUpdating;
	TSpTBXRadioButton* __fastcall GetButtons(int Index);
	void __fastcall ArrangeButtons(void);
	void __fastcall ButtonClick(System::TObject* Sender);
	void __fastcall ItemsChange(System::TObject* Sender);
	void __fastcall SetButtonCount(int Value);
	void __fastcall SetColumns(int Value);
	void __fastcall SetItemIndex(int Value);
	void __fastcall SetItems(Classes::TStrings* Value);
	void __fastcall UpdateButtons(void);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall ReadState(Classes::TReader* Reader);
	__property int Columns = {read=FColumns, write=SetColumns, default=1};
	__property int ItemIndex = {read=FItemIndex, write=SetItemIndex, default=-1};
	__property Classes::TStrings* Items = {read=FItems, write=SetItems};
	
public:
	__fastcall virtual TSpTBXCustomRadioGroup(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomRadioGroup(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	DYNAMIC void __fastcall FlipChildren(bool AllLevels);
	virtual void __fastcall InvalidateBackground(bool InvalidateChildren = true);
	virtual void __fastcall SetFocus(void);
	__property TSpTBXRadioButton* Buttons[int Index] = {read=GetButtons};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomRadioGroup(HWND ParentWindow) : TSpTBXCustomGroupBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXRadioGroup;
class PASCALIMPLEMENTATION TSpTBXRadioGroup : public TSpTBXCustomRadioGroup
{
	typedef TSpTBXCustomRadioGroup inherited;
	
__published:
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property UseDockManager = {default=0};
	__property DockSite = {default=0};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property Visible = {default=1};
	__property OnCanResize;
	__property OnClick;
	__property OnConstrainedResize;
	__property OnContextPopup;
	__property OnDockDrop;
	__property OnDockOver;
	__property OnDblClick;
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
	__property Borders = {default=1};
	__property BorderType = {default=5};
	__property TBXStyleBackground = {default=0};
	__property OnDrawBackground;
	__property Columns = {default=1};
	__property ItemIndex = {default=-1};
	__property Items;
public:
	/* TSpTBXCustomRadioGroup.Create */ inline __fastcall virtual TSpTBXRadioGroup(Classes::TComponent* AOwner) : TSpTBXCustomRadioGroup(AOwner) { }
	/* TSpTBXCustomRadioGroup.Destroy */ inline __fastcall virtual ~TSpTBXRadioGroup(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXRadioGroup(HWND ParentWindow) : TSpTBXCustomRadioGroup(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomButton;
class PASCALIMPLEMENTATION TSpTBXCustomButton : public TSpTBXButtonControl
{
	typedef TSpTBXButtonControl inherited;
	
private:
	Graphics::TBitmap* FBitmap;
	bool FBitmapTransparent;
	bool FActive;
	bool FCancel;
	bool FDefault;
	bool FDropDownArrow;
	Menus::TPopupMenu* FDropDownMenu;
	bool FDropDownMenuVisible;
	bool FFlat;
	Controls::TModalResult FModalResult;
	bool FRepeating;
	Extctrls::TTimer* FRepeatTimer;
	void __fastcall BitmapChanged(System::TObject* Sender);
	void __fastcall RepeatTimerHandler(System::TObject* Sender);
	void __fastcall SetBitmap(const Graphics::TBitmap* Value);
	void __fastcall SetDefault(const bool Value);
	void __fastcall SetDropDownArrow(const bool Value);
	void __fastcall SetDropdownMenu(Menus::TPopupMenu* Value);
	void __fastcall SetFlat(const bool Value);
	HIDESBASE MESSAGE void __fastcall CMDialogKey(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall CMFocusChanged(Controls::TCMFocusChanged &Message);
	MESSAGE void __fastcall CMSPPopupClose(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TWMNoParams &Message);
	
protected:
	Controls::TControl* FPopupControl;
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	bool __fastcall BitmapValid(void);
	virtual bool __fastcall DoDrawDropDownArrow(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual bool __fastcall GetFocused(void);
	virtual Types::TRect __fastcall GetFocusRect(const Types::TRect &R, const Types::TRect &TextR, const Types::TRect &GlyphR);
	virtual Menus::TPopupMenu* __fastcall GetInternalDropDownMenu(void);
	virtual bool __fastcall GetPushed(void);
	virtual Types::TRect __fastcall GetTextMargins();
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	__property Alignment = {default=2};
	__property Graphics::TBitmap* Bitmap = {read=FBitmap, write=SetBitmap};
	__property bool BitmapTransparent = {read=FBitmapTransparent, write=FBitmapTransparent, default=1};
	__property DrawPushedCaption = {default=1};
	__property bool Cancel = {read=FCancel, write=FCancel, default=0};
	__property bool Default = {read=FDefault, write=SetDefault, default=0};
	__property bool DropDownArrow = {read=FDropDownArrow, write=SetDropDownArrow, default=1};
	__property Menus::TPopupMenu* DropDownMenu = {read=FDropDownMenu, write=SetDropdownMenu};
	__property bool Flat = {read=FFlat, write=SetFlat, default=0};
	__property Controls::TModalResult ModalResult = {read=FModalResult, write=FModalResult, default=0};
	__property bool Repeating = {read=FRepeating, write=FRepeating, default=0};
	
public:
	__fastcall virtual TSpTBXCustomButton(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomButton(void);
	DYNAMIC void __fastcall Click(void);
	Types::TRect __fastcall GetSkinStateRect();
	bool __fastcall IsDroppedDown(void);
	virtual void __fastcall StopRepeat(void);
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomButton(HWND ParentWindow) : TSpTBXButtonControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXButton;
class PASCALIMPLEMENTATION TSpTBXButton : public TSpTBXCustomButton
{
	typedef TSpTBXCustomButton inherited;
	
__published:
	__property Action;
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowAccelChar = {default=1};
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Visible = {default=1};
	__property Wrapping = {default=0};
	__property OnClick;
	__property OnContextPopup;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
	__property Alignment = {default=2};
	__property Bitmap;
	__property BitmapTransparent = {default=1};
	__property Cancel = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Checked = {default=0};
	__property Default = {default=0};
	__property DrawPushedCaption = {default=1};
	__property DropDownArrow = {default=1};
	__property DropDownMenu;
	__property Flat = {default=0};
	__property GlyphLayout = {default=0};
	__property GroupIndex = {default=0};
	__property Images;
	__property ImageIndex = {default=-1};
	__property LinkText;
	__property LinkTextParams;
	__property ModalResult = {default=0};
	__property SkinType = {default=2};
	__property Repeating = {default=0};
	__property OnDraw;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnGetImageIndex;
public:
	/* TSpTBXCustomButton.Create */ inline __fastcall virtual TSpTBXButton(Classes::TComponent* AOwner) : TSpTBXCustomButton(AOwner) { }
	/* TSpTBXCustomButton.Destroy */ inline __fastcall virtual ~TSpTBXButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXButton(HWND ParentWindow) : TSpTBXCustomButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomSpeedButton;
class PASCALIMPLEMENTATION TSpTBXCustomSpeedButton : public TSpTBXCustomButton
{
	typedef TSpTBXCustomButton inherited;
	
public:
	__fastcall virtual TSpTBXCustomSpeedButton(Classes::TComponent* AOwner);
	DYNAMIC bool __fastcall CanFocus(void);
	DYNAMIC void __fastcall Click(void);
public:
	/* TSpTBXCustomButton.Destroy */ inline __fastcall virtual ~TSpTBXCustomSpeedButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomSpeedButton(HWND ParentWindow) : TSpTBXCustomButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXSpeedButton;
class PASCALIMPLEMENTATION TSpTBXSpeedButton : public TSpTBXCustomSpeedButton
{
	typedef TSpTBXCustomSpeedButton inherited;
	
__published:
	__property Action;
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Color = {default=536870911};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowAccelChar = {default=1};
	__property ShowHint;
	__property Visible = {default=1};
	__property Wrapping = {default=0};
	__property OnClick;
	__property OnContextPopup;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
	__property Alignment = {default=2};
	__property Bitmap;
	__property BitmapTransparent = {default=1};
	__property Cancel = {default=0};
	__property CaptionGlow = {default=0};
	__property CaptionGlowColor = {default=65535};
	__property Checked = {default=0};
	__property Default = {default=0};
	__property DrawPushedCaption = {default=1};
	__property DropDownArrow = {default=1};
	__property DropDownMenu;
	__property Flat = {default=0};
	__property GlyphLayout = {default=0};
	__property GroupIndex = {default=0};
	__property Images;
	__property ImageIndex = {default=-1};
	__property LinkText;
	__property LinkTextParams;
	__property SkinType = {default=2};
	__property Repeating = {default=0};
	__property OnDraw;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnGetImageIndex;
public:
	/* TSpTBXCustomSpeedButton.Create */ inline __fastcall virtual TSpTBXSpeedButton(Classes::TComponent* AOwner) : TSpTBXCustomSpeedButton(AOwner) { }
	
public:
	/* TSpTBXCustomButton.Destroy */ inline __fastcall virtual ~TSpTBXSpeedButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXSpeedButton(HWND ParentWindow) : TSpTBXCustomSpeedButton(ParentWindow) { }
	
};


typedef void __fastcall (__closure *TSpTBXProgressBarChangeEvent)(System::TObject* Sender, int NewPosition);

class DELPHICLASS TSpTBXCustomProgressBar;
class PASCALIMPLEMENTATION TSpTBXCustomProgressBar : public TSpTBXTextObject
{
	typedef TSpTBXTextObject inherited;
	
private:
	int FMin;
	int FMax;
	int FPosition;
	bool FProgressVisible;
	bool FSmooth;
	bool FVertical;
	TSpTBXProgressCaption FCaptionType;
	TSpTBXProgressBarChangeEvent FOnProgressChange;
	void __fastcall SetMax(const int Value);
	void __fastcall SetMin(const int Value);
	void __fastcall SetPosition(int Value);
	void __fastcall SetSmooth(const bool Value);
	void __fastcall SetVertical(const bool Value);
	void __fastcall SetCaptionType(const TSpTBXProgressCaption Value);
	void __fastcall SetProgressVisible(const bool Value);
	
protected:
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual void __fastcall DoProgressChange(void);
	virtual Types::TRect __fastcall GetTextMargins();
	__property Alignment = {default=2};
	__property CaptionGlow = {default=1};
	__property TSpTBXProgressCaption CaptionType = {read=FCaptionType, write=SetCaptionType, default=2};
	__property int Max = {read=FMax, write=SetMax, default=100};
	__property int Min = {read=FMin, write=SetMin, default=0};
	__property int Position = {read=FPosition, write=SetPosition, default=0};
	__property bool ProgressVisible = {read=FProgressVisible, write=SetProgressVisible, default=1};
	__property bool Smooth = {read=FSmooth, write=SetSmooth, default=0};
	__property bool Vertical = {read=FVertical, write=SetVertical, default=0};
	__property TSpTBXProgressBarChangeEvent OnProgressChange = {read=FOnProgressChange, write=FOnProgressChange};
	
public:
	__fastcall virtual TSpTBXCustomProgressBar(Classes::TComponent* AOwner);
	void __fastcall StepIt(int Delta = 0x1);
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXCustomProgressBar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomProgressBar(HWND ParentWindow) : TSpTBXTextObject(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXProgressBar;
class PASCALIMPLEMENTATION TSpTBXProgressBar : public TSpTBXCustomProgressBar
{
	typedef TSpTBXCustomProgressBar inherited;
	
__published:
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property Color = {default=536870911};
	__property Constraints;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Visible = {default=1};
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
	__property OnStartDrag;
	__property Alignment = {default=2};
	__property CaptionGlow = {default=1};
	__property CaptionGlowColor = {default=65535};
	__property CaptionType = {default=2};
	__property Max = {default=100};
	__property Min = {default=0};
	__property Position = {default=0};
	__property Smooth = {default=0};
	__property Vertical = {default=0};
	__property SkinType = {default=2};
	__property OnDraw;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnProgressChange;
public:
	/* TSpTBXCustomProgressBar.Create */ inline __fastcall virtual TSpTBXProgressBar(Classes::TComponent* AOwner) : TSpTBXCustomProgressBar(AOwner) { }
	
public:
	/* TSpTBXTextObject.Destroy */ inline __fastcall virtual ~TSpTBXProgressBar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXProgressBar(HWND ParentWindow) : TSpTBXCustomProgressBar(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXTrackBar;
class PASCALIMPLEMENTATION TSpTBXTrackBar : public Comctrls::TTrackBar
{
	typedef Comctrls::TTrackBar inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	TSpTBXTickMark FTickMarks;
	Sptbxitem::TSpTBXDrawEvent FOnDrawChannel;
	Sptbxitem::TSpTBXDrawPosEvent FOnDrawChannelTicks;
	Sptbxitem::TSpTBXDrawEvent FOnDrawThumb;
	bool FCanDrawChannelSelection;
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	HIDESBASE void __fastcall SetTickMarks(const TSpTBXTickMark Value);
	MESSAGE void __fastcall CMSpTBXControlsInvalidate(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkGnd(Messages::TMessage &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual bool __fastcall DoDrawChannel(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual bool __fastcall DoDrawChannelTicks(Graphics::TCanvas* ACanvas, int X, int Y);
	virtual bool __fastcall DoDrawThumb(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual void __fastcall DrawTicks(Graphics::TCanvas* ACanvas);
	
public:
	__fastcall virtual TSpTBXTrackBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXTrackBar(void);
	Types::TRect __fastcall ChannelRect();
	bool __fastcall MouseInThumb(void);
	void __fastcall InvalidateBackground(void);
	
__published:
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property TSpTBXTickMark TickMarks = {read=FTickMarks, write=SetTickMarks, default=0};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawChannel = {read=FOnDrawChannel, write=FOnDrawChannel};
	__property Sptbxitem::TSpTBXDrawPosEvent OnDrawChannelTicks = {read=FOnDrawChannelTicks, write=FOnDrawChannelTicks};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawThumb = {read=FOnDrawThumb, write=FOnDrawThumb};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXTrackBar(HWND ParentWindow) : Comctrls::TTrackBar(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const ShortInt ConstStatesCount = 0x4;
static const Word ConstInitRepeatPause = 0x190;
static const ShortInt ConstRepeatPause = 0x64;
static const Word CM_SPGROUPINDEXUPDATE = 0xb8ae;
static const Word CM_SPTBXCONTROLSINVALIDATE = 0xbd05;
extern PACKAGE void __fastcall SpDrawXPPanel(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool TBXStyleBackground, Sptbxskins::TSpTBXSkinType SkinType, TSpTBXPanelBorder Border);
extern PACKAGE void __fastcall SpDrawXPPanelBorder(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TSpTBXPanelBorder Border);
extern PACKAGE void __fastcall SpDrawXPGroupBox(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, System::WideString ACaption, unsigned TextFlags, bool Enabled, bool TBXStyleBackground, Sptbxskins::TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPProgressBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int Min, int Max, int Position, Graphics::TBitmap* Back, Graphics::TBitmap* Fore)/* overload */;
extern PACKAGE int __fastcall SpDrawXPProgressBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Vertical, bool Smooth, bool DrawProgress, int Min, int Max, int Position, Sptbxskins::TSpTBXSkinType SkinType)/* overload */;
extern PACKAGE void __fastcall SpDrawXPTrackBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, unsigned Part, bool Vertical, bool Pushed, bool ChannelSelection, TSpTBXTickMark TickMark, int Min, int Max, int SelStart, int SelEnd, Sptbxskins::TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpInvalidateSpTBXControl(Controls::TWinControl* AControl, bool InvalidateChildren, bool OnlySpTBXControls);

}	/* namespace Sptbxcontrols */
using namespace Sptbxcontrols;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxcontrolsHPP
