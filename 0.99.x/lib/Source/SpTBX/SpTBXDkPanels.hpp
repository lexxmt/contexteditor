// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxdkpanels.pas' rev: 20.00

#ifndef SptbxdkpanelsHPP
#define SptbxdkpanelsHPP

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
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Inifiles.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxdkpanels
{
//-- type declarations -------------------------------------------------------
struct TSpTBXDockStateRec
{
	
public:
	Forms::TWindowState DockedState;
	int RestoreSize;
};


#pragma option push -b-
enum TSpTBXDockPosition { dpxLeft, dpxTop, dpxRight, dpxBottom, dpxClient };
#pragma option pop

#pragma option push -b-
enum TSpTBXDPResizeType { dprtManualResize, dprtMinimizeOrRestore, dprtMinimizeOrRestoreTaskPaneStyle, dprtSplitResize };
#pragma option pop

typedef void __fastcall (__closure *TSpTBXWindowStateChangedEvent)(System::TObject* Sender, Forms::TWindowState AWindowState);

class DELPHICLASS TSpTBXCustomMultiDock;
class DELPHICLASS TSpTBXCustomSplitter;
class DELPHICLASS TSpTBXCustomDockablePanel;
class PASCALIMPLEMENTATION TSpTBXCustomMultiDock : public Tb2dock::TTBDock
{
	typedef Tb2dock::TTBDock inherited;
	
private:
	bool FAutoSplitterVisibility;
	bool FLimitToOneRow;
	TSpTBXCustomSplitter* FLastSplitter;
	TSpTBXDockPosition FPosition;
	bool FUpdatingLateralSize;
	Tb2dock::TTBInsertRemoveEvent FOnInsertRemoveBar;
	Tb2dock::TTBRequestDockEvent FOnRequestDock;
	void __fastcall UpdateDPLateralSize(int AWidth, int AHeight);
	HIDESBASE void __fastcall SetPosition(const TSpTBXDockPosition Value);
	void __fastcall SetLimitToOneRow(const bool Value);
	
protected:
	virtual void __fastcall AlignControls(Controls::TControl* AControl, Types::TRect &Rect);
	virtual void __fastcall DoInsertRemoveBar(System::TObject* Sender, bool Inserting, Tb2dock::TTBCustomDockableWindow* Bar);
	virtual void __fastcall DoRequestDock(System::TObject* Sender, Tb2dock::TTBCustomDockableWindow* Bar, bool &Accept);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall ValidateInsert(Classes::TComponent* AComponent);
	void __fastcall InsertingOnEmptyDock(void);
	TSpTBXCustomSplitter* __fastcall GetAdjacentSplitter(int SpacingDelta = 0x1);
	
public:
	__fastcall virtual TSpTBXCustomMultiDock(Classes::TComponent* AOwner);
	bool __fastcall IsVertical(void);
	void __fastcall GetDockablePanelList(Classes::TList* DPList);
	void __fastcall GetDockablePanelDockIndex(Classes::TList* DPList, TSpTBXCustomDockablePanel* DP, /* out */ int &DPDockIndex);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	__property bool UpdatingLateralSize = {read=FUpdatingLateralSize, nodefault};
	
__published:
	__property bool LimitToOneRow = {read=FLimitToOneRow, write=SetLimitToOneRow, default=1};
	__property TSpTBXDockPosition Position = {read=FPosition, write=SetPosition, default=0};
	__property bool AutoSplitterVisibility = {read=FAutoSplitterVisibility, write=FAutoSplitterVisibility, default=1};
	__property Tb2dock::TTBInsertRemoveEvent OnInsertRemoveBar = {read=FOnInsertRemoveBar, write=FOnInsertRemoveBar};
	__property Tb2dock::TTBRequestDockEvent OnRequestDock = {read=FOnRequestDock, write=FOnRequestDock};
public:
	/* TTBDock.Destroy */ inline __fastcall virtual ~TSpTBXCustomMultiDock(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomMultiDock(HWND ParentWindow) : Tb2dock::TTBDock(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXMultiDock;
class PASCALIMPLEMENTATION TSpTBXMultiDock : public TSpTBXCustomMultiDock
{
	typedef TSpTBXCustomMultiDock inherited;
	
public:
	/* TSpTBXCustomMultiDock.Create */ inline __fastcall virtual TSpTBXMultiDock(Classes::TComponent* AOwner) : TSpTBXCustomMultiDock(AOwner) { }
	
public:
	/* TTBDock.Destroy */ inline __fastcall virtual ~TSpTBXMultiDock(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXMultiDock(HWND ParentWindow) : TSpTBXCustomMultiDock(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXDockablePanelButtonOptions;
class PASCALIMPLEMENTATION TSpTBXDockablePanelButtonOptions : public Sptbxitem::TSpTBXButtonOptions
{
	typedef Sptbxitem::TSpTBXButtonOptions inherited;
	
private:
	bool FTaskPaneStyleResize;
	
protected:
	TSpTBXCustomDockablePanel* FDockablePanel;
	virtual void __fastcall ButtonsClick(System::TObject* Sender);
	virtual void __fastcall CreateButtons(void);
	virtual bool __fastcall Restoring(Sptbxitem::TSpTBXCustomItem* B);
	virtual void __fastcall SetupButton(Sptbxitem::TSpTBXCustomItem* B);
	
public:
	__fastcall virtual TSpTBXDockablePanelButtonOptions(Controls::TWinControl* AParent);
	
__published:
	__property Maximize = {default=0};
	__property Minimize = {default=0};
	__property bool TaskPaneStyleResize = {read=FTaskPaneStyleResize, write=FTaskPaneStyleResize, default=0};
	__property TitleBarMaxSize = {default=19};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSpTBXDockablePanelButtonOptions(void) { }
	
};


class DELPHICLASS TSpTBXDockablePanelToolbar;
class PASCALIMPLEMENTATION TSpTBXDockablePanelToolbar : public Sptbxitem::TSpTBXToolbar
{
	typedef Sptbxitem::TSpTBXToolbar inherited;
	
protected:
	virtual bool __fastcall CanItemClick(Tb2item::TTBCustomItem* Item, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual Graphics::TColor __fastcall GetItemsTextColor(Sptbxskins::TSpTBXSkinStatesType State);
	virtual int __fastcall GetRightAlignMargin(void);
	
public:
	__fastcall virtual TSpTBXDockablePanelToolbar(Classes::TComponent* AOwner);
	TSpTBXCustomDockablePanel* __fastcall GetParentDockablePanel(void);
public:
	/* TSpTBXToolbar.Destroy */ inline __fastcall virtual ~TSpTBXDockablePanelToolbar(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXDockablePanelToolbar(HWND ParentWindow) : Sptbxitem::TSpTBXToolbar(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TSpTBXCustomDockablePanel : public Sptbxitem::TSpTBXCustomToolWindow
{
	typedef Sptbxitem::TSpTBXCustomToolWindow inherited;
	
private:
	int FDefaultDockedSize;
	bool FFixedDockedSize;
	int FFloatingClientHeight;
	int FFloatingClientWidth;
	bool FIsDockedMoving;
	tagSIZE FLoadedBarSize;
	int FLoadedDockPos;
	Forms::TWindowState FLoadedState;
	bool FManualSizing;
	TSpTBXDockablePanelButtonOptions* FOptions;
	bool FShowCaption;
	bool FShowCaptionWhenDocked;
	Sptbxitem::TSpTBXDrawEvent FOnDrawCaptionPanel;
	TSpTBXWindowStateChangedEvent FOnWindowStateChanged;
	bool FShowVerticalCaption;
	bool __fastcall CanSplitResize(Tb2dock::TTBDockPosition EdgePosition);
	void __fastcall DockRequestDock(System::TObject* Sender, Tb2dock::TTBCustomDockableWindow* Bar, bool &Accept);
	void __fastcall DockResize(System::TObject* Sender);
	bool __fastcall InternalMaximize(bool Restore);
	void __fastcall UpdateTitleBarRotation(void);
	Types::TPoint __fastcall GetCaptionPanelSize();
	int __fastcall GetEffectiveHeight(void);
	int __fastcall GetEffectiveWidth(void);
	int __fastcall GetFloatingClientHeight(void);
	int __fastcall GetFloatingClientWidth(void);
	Imglist::TCustomImageList* __fastcall GetImages(void);
	Tb2item::TTBCustomItem* __fastcall GetItems(void);
	Tb2item::TTBRootItem* __fastcall GetRootItems(void);
	Sptbxitem::TSpTBXToolbar* __fastcall GetToolbar(void);
	Tb2toolbar::TTBToolbarView* __fastcall GetView(void);
	void __fastcall SetDefaultDockedSize(int Value);
	void __fastcall SetEffectiveHeight(const int Value);
	void __fastcall SetEffectiveWidth(const int Value);
	void __fastcall SetFloatingClientHeight(const int Value);
	void __fastcall SetFloatingClientWidth(const int Value);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	HIDESBASE void __fastcall SetShowCaption(const bool Value);
	void __fastcall SetShowCaptionWhenDocked(const bool Value);
	void __fastcall SetShowVerticalCaption(const bool Value);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	HIDESBASE MESSAGE void __fastcall WMNCLButtonDown(Messages::TWMNCHitMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	
protected:
	Extctrls::TPanel* FPanel;
	Sptbxitem::TSpTBXDock* FToolbarDock;
	TSpTBXDockablePanelToolbar* FToolbar;
	TSpTBXDockStateRec FState;
	Classes::TList* FDockForms;
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall SetParent(Controls::TWinControl* AParent);
	DYNAMIC void __fastcall ValidateContainer(Classes::TComponent* AComponent);
	void __fastcall BeginDockedMoving(void);
	void __fastcall BeginSplitResizing(int HitTest);
	virtual void __fastcall ConstrainedResize(int &MinWidth, int &MinHeight, int &MaxWidth, int &MaxHeight);
	virtual void __fastcall DoWindowStateChanged(Forms::TWindowState AWindowState);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall Resize(void);
	virtual void __fastcall DoDrawCaptionPanel(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DockDrawBackground(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall ToolbarDrawBackground(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall InternalDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool PaintOnNCArea, bool PaintBorders = true);
	__property int DefaultDockedSize = {read=FDefaultDockedSize, write=SetDefaultDockedSize, default=0};
	__property bool FixedDockedSize = {read=FFixedDockedSize, write=FFixedDockedSize, default=0};
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
	__property Tb2item::TTBRootItem* Items = {read=GetRootItems};
	__property TSpTBXDockablePanelButtonOptions* Options = {read=FOptions, write=FOptions};
	__property bool ShowCaption = {read=FShowCaption, write=SetShowCaption, default=1};
	__property bool ShowCaptionWhenDocked = {read=FShowCaptionWhenDocked, write=SetShowCaptionWhenDocked, default=1};
	__property bool ShowVerticalCaption = {read=FShowVerticalCaption, write=SetShowVerticalCaption, default=0};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawCaptionPanel = {read=FOnDrawCaptionPanel, write=FOnDrawCaptionPanel};
	__property TSpTBXWindowStateChangedEvent OnWindowStateChanged = {read=FOnWindowStateChanged, write=FOnWindowStateChanged};
	
public:
	__fastcall virtual TSpTBXCustomDockablePanel(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomDockablePanel(void);
	HIDESBASE void __fastcall AddDockForm(const Forms::TCustomForm* Form);
	HIDESBASE void __fastcall RemoveDockForm(const Forms::TCustomForm* Form);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	DYNAMIC void __fastcall DoneReadingPositionData(const Tb2dock::TTBReadPositionData &Data);
	DYNAMIC void __fastcall ReadPositionData(const Tb2dock::TTBReadPositionData &Data);
	DYNAMIC void __fastcall WritePositionData(const Tb2dock::TTBWritePositionData &Data);
	virtual void __fastcall InvalidateBackground(bool InvalidateChildren = true);
	bool __fastcall IsVerticalTitleBar(void);
	virtual bool __fastcall Maximize(void);
	bool __fastcall Maximized(void);
	virtual bool __fastcall Minimize(void);
	bool __fastcall Minimized(void);
	virtual bool __fastcall Restore(void);
	bool __fastcall SizeToggle(bool ToMaximize);
	__property Types::TPoint CaptionPanelSize = {read=GetCaptionPanelSize};
	__property int EffectiveWidth = {read=GetEffectiveWidth, write=SetEffectiveWidth, nodefault};
	__property int EffectiveHeight = {read=GetEffectiveHeight, write=SetEffectiveHeight, nodefault};
	__property int FloatingClientHeight = {read=GetFloatingClientHeight, write=SetFloatingClientHeight, nodefault};
	__property int FloatingClientWidth = {read=GetFloatingClientWidth, write=SetFloatingClientWidth, nodefault};
	__property Sptbxitem::TSpTBXToolbar* Toolbar = {read=GetToolbar};
	__property Tb2toolbar::TTBToolbarView* View = {read=GetView};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomDockablePanel(HWND ParentWindow) : Sptbxitem::TSpTBXCustomToolWindow(ParentWindow) { }
	
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


class DELPHICLASS TSpTBXDockablePanel;
class PASCALIMPLEMENTATION TSpTBXDockablePanel : public TSpTBXCustomDockablePanel
{
	typedef TSpTBXCustomDockablePanel inherited;
	
__published:
	__property ActivateParent = {default=1};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property CurrentDock;
	__property DefaultDock;
	__property DockableTo = {default=15};
	__property DockMode = {default=0};
	__property DockPos = {default=-1};
	__property DockRow = {default=0};
	__property FloatingMode = {default=0};
	__property Font;
	__property HideWhenInactive = {default=1};
	__property LastDock;
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property Resizable = {default=1};
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property UseLastDock = {default=1};
	__property Visible = {default=1};
	__property Height = {stored=true};
	__property Width = {stored=true};
	__property OnClose;
	__property OnCloseQuery;
	__property OnContextPopup;
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
	__property DefaultDockedSize = {default=0};
	__property FixedDockedSize = {default=0};
	__property Images;
	__property Items;
	__property Options;
	__property ShowCaption = {default=1};
	__property ShowCaptionWhenDocked = {default=1};
	__property ShowVerticalCaption = {default=0};
	__property OnDrawCaptionPanel;
	__property OnWindowStateChanged;
public:
	/* TSpTBXCustomDockablePanel.Create */ inline __fastcall virtual TSpTBXDockablePanel(Classes::TComponent* AOwner) : TSpTBXCustomDockablePanel(AOwner) { }
	/* TSpTBXCustomDockablePanel.Destroy */ inline __fastcall virtual ~TSpTBXDockablePanel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXDockablePanel(HWND ParentWindow) : TSpTBXCustomDockablePanel(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TSpTBXCustomSplitter : public Controls::TCustomControl
{
	typedef Controls::TCustomControl inherited;
	
private:
	bool FAutoCalcMaxSize;
	int FGripSize;
	bool FGripHotTrack;
	Controls::TControl* FMouseSplitControl;
	Controls::TWinControl* FMouseActiveControl;
	Graphics::TBrush* FMouseBrush;
	Types::TPoint FMouseDownPos;
	int FMousePrevSplitControlSize;
	bool FMouseDownOnGrip;
	bool FMouseOverGrip;
	HDC FMouseLineDC;
	bool FMouseLineVisible;
	HBRUSH FMousePrevBrush;
	bool FMoving;
	int FMinSize;
	int FMaxSize;
	int FNewSize;
	int FOldSize;
	Controls::TKeyEvent FOldKeyDown;
	Extctrls::TResizeStyle FResizeStyle;
	Sptbxskins::TSpTBXSkinType FSkinType;
	int FSplitLinePaintingPos;
	Sptbxitem::TSpTBXDrawEvent FOnDrawBackground;
	Sptbxcontrols::TSpTBXCanResizeEvent FOnMoving;
	Classes::TNotifyEvent FOnMoved;
	Types::TRect __fastcall GetGripRect();
	bool __fastcall GetMinimized(void);
	void __fastcall SetGripSize(const int Value);
	void __fastcall SetMinSize(const int Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	void __fastcall UpdateControlSize(Controls::TControl* SplitControl);
	void __fastcall MouseCalcSplitSize(int X, int Y, int &NewSize, int &Split);
	void __fastcall MouseAllocateLineDC(void);
	void __fastcall MouseReleaseLineDC(void);
	void __fastcall MouseDrawLine(void);
	void __fastcall MouseFocusKeyDown(System::TObject* Sender, System::Word &Key, Classes::TShiftState Shift);
	Controls::TControl* __fastcall ValidateSplitControl(void);
	HIDESBASE MESSAGE void __fastcall CMMouseleave(Messages::TMessage &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	int FRestorePos;
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoMoved(void);
	virtual bool __fastcall DoMoving(int &NewSize);
	bool __fastcall IsVertical(void);
	DYNAMIC void __fastcall MouseStopSizing(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	virtual void __fastcall RequestAlign(void);
	__property bool AutoCalcMaxSize = {read=FAutoCalcMaxSize, write=FAutoCalcMaxSize, default=1};
	__property int GripSize = {read=FGripSize, write=SetGripSize, default=50};
	__property bool GripHotTrack = {read=FGripHotTrack, write=FGripHotTrack, default=1};
	__property int MinSize = {read=FMinSize, write=SetMinSize, default=0};
	__property Extctrls::TResizeStyle ResizeStyle = {read=FResizeStyle, write=FResizeStyle, default=2};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	__property Sptbxcontrols::TSpTBXCanResizeEvent OnMoving = {read=FOnMoving, write=FOnMoving};
	__property Classes::TNotifyEvent OnMoved = {read=FOnMoved, write=FOnMoved};
	
public:
	__fastcall virtual TSpTBXCustomSplitter(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomSplitter(void);
	void __fastcall ChangeSplitControlSize(int NewControlSize);
	void __fastcall InvalidateGrip(void);
	void __fastcall Minimize(void);
	void __fastcall Restore(void);
	void __fastcall Toggle(void);
	__property Types::TRect GripRect = {read=GetGripRect};
	__property bool Minimized = {read=GetMinimized, nodefault};
	__property bool MouseOverGrip = {read=FMouseOverGrip, nodefault};
	__property bool Moving = {read=FMoving, nodefault};
	
__published:
	__property Align = {default=3};
	__property Width = {default=5};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomSplitter(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXSplitter;
class PASCALIMPLEMENTATION TSpTBXSplitter : public TSpTBXCustomSplitter
{
	typedef TSpTBXCustomSplitter inherited;
	
__published:
	__property Align = {default=3};
	__property Color = {default=-16777211};
	__property Constraints;
	__property ParentColor = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Visible = {default=1};
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property AutoCalcMaxSize = {default=1};
	__property GripSize = {default=50};
	__property MinSize = {default=0};
	__property ResizeStyle = {default=2};
	__property SkinType = {default=2};
	__property OnDrawBackground;
	__property OnMoving;
	__property OnMoved;
public:
	/* TSpTBXCustomSplitter.Create */ inline __fastcall virtual TSpTBXSplitter(Classes::TComponent* AOwner) : TSpTBXCustomSplitter(AOwner) { }
	/* TSpTBXCustomSplitter.Destroy */ inline __fastcall virtual ~TSpTBXSplitter(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXSplitter(HWND ParentWindow) : TSpTBXCustomSplitter(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall SpDrawXPDockablePanelTitleBar(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool Vertical);
extern PACKAGE void __fastcall SpDrawXPDockablePanelBody(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool IsFloating);
extern PACKAGE void __fastcall SpTBRegLoadPositions(const Classes::TComponent* OwnerComponent, const unsigned RootKey, const System::UnicodeString BaseRegistryKey);
extern PACKAGE void __fastcall SpTBRegSavePositions(const Classes::TComponent* OwnerComponent, const unsigned RootKey, const System::UnicodeString BaseRegistryKey);
extern PACKAGE void __fastcall SpTBIniLoadPositions(const Classes::TComponent* OwnerComponent, const Inifiles::TCustomIniFile* IniFile, const System::UnicodeString SectionNamePrefix)/* overload */;
extern PACKAGE void __fastcall SpTBIniSavePositions(const Classes::TComponent* OwnerComponent, const Inifiles::TCustomIniFile* IniFile, const System::UnicodeString SectionNamePrefix)/* overload */;
extern PACKAGE void __fastcall SpTBIniLoadPositions(const Classes::TComponent* OwnerComponent, const System::UnicodeString Filename, const System::UnicodeString SectionNamePrefix)/* overload */;
extern PACKAGE void __fastcall SpTBIniSavePositions(const Classes::TComponent* OwnerComponent, const System::UnicodeString Filename, const System::UnicodeString SectionNamePrefix)/* overload */;

}	/* namespace Sptbxdkpanels */
using namespace Sptbxdkpanels;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxdkpanelsHPP
