// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2toolwindow.pas' rev: 20.00

#ifndef Tb2toolwindowHPP
#define Tb2toolwindowHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2toolwindow
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TTBToolWindow;
class PASCALIMPLEMENTATION TTBToolWindow : public Tb2dock::TTBCustomDockableWindow
{
	typedef Tb2dock::TTBCustomDockableWindow inherited;
	
private:
	int FMinClientWidth;
	int FMinClientHeight;
	int FMaxClientWidth;
	int FMaxClientHeight;
	int FBarHeight;
	int FBarWidth;
	Types::TPoint __fastcall CalcSize(Tb2dock::TTBDock* ADock);
	int __fastcall GetClientAreaWidth(void);
	void __fastcall SetClientAreaWidth(int Value);
	int __fastcall GetClientAreaHeight(void);
	void __fastcall SetClientAreaHeight(int Value);
	void __fastcall SetClientAreaSize(int AWidth, int AHeight);
	
protected:
	virtual Types::TPoint __fastcall DoArrange(bool CanMoveControls, Tb2dock::TTBDockType PreviousDockType, bool NewFloating, Tb2dock::TTBDock* NewDock);
	virtual void __fastcall GetBaseSize(Types::TPoint &ASize);
	virtual void __fastcall GetMinMaxSize(int &AMinClientWidth, int &AMinClientHeight, int &AMaxClientWidth, int &AMaxClientHeight);
	virtual void __fastcall Paint(void);
	virtual void __fastcall SizeChanging(const int AWidth, const int AHeight);
	
public:
	__fastcall virtual TTBToolWindow(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall ReadPositionData(const Tb2dock::TTBReadPositionData &Data);
	DYNAMIC void __fastcall WritePositionData(const Tb2dock::TTBWritePositionData &Data);
	
__published:
	__property ActivateParent = {default=1};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BorderStyle = {default=1};
	__property Caption;
	__property Color = {default=-16777201};
	__property CloseButton = {default=1};
	__property CloseButtonWhenDocked = {default=0};
	__property int ClientAreaHeight = {read=GetClientAreaHeight, write=SetClientAreaHeight, nodefault};
	__property int ClientAreaWidth = {read=GetClientAreaWidth, write=SetClientAreaWidth, nodefault};
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
	__property int MaxClientHeight = {read=FMaxClientHeight, write=FMaxClientHeight, default=0};
	__property int MaxClientWidth = {read=FMaxClientWidth, write=FMaxClientWidth, default=0};
	__property int MinClientHeight = {read=FMinClientHeight, write=FMinClientHeight, default=32};
	__property int MinClientWidth = {read=FMinClientWidth, write=FMinClientWidth, default=32};
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
public:
	/* TTBCustomDockableWindow.Destroy */ inline __fastcall virtual ~TTBToolWindow(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TTBToolWindow(HWND ParentWindow) : Tb2dock::TTBCustomDockableWindow(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Tb2toolwindow */
using namespace Tb2toolwindow;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2toolwindowHPP
