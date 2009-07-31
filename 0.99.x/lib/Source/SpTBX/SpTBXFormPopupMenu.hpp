// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxformpopupmenu.pas' rev: 20.00

#ifndef SptbxformpopupmenuHPP
#define SptbxformpopupmenuHPP

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
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2anim.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxformpopupmenu
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TSpTBXPopupAnimationType { patNone, patSlide, patFade };
#pragma option pop

#pragma option push -b-
enum TSpTBXPopupBorderStyleType { pbsFrame, pbsSizeable, pbsSizeableBottom, pbsSizeableRightBottom };
#pragma option pop

struct TSpTBXPopupFormState
{
	
public:
	Forms::TCustomForm* PopupForm;
	Forms::TFormBorderStyle BorderStyle;
	Types::TRect BoundsRect;
};


typedef void __fastcall (__closure *TSpTBXRollDownEvent)(System::TObject* Sender, int &FormWidth, int &FormHeight);

typedef void __fastcall (__closure *TSpTBXRollUpEvent)(System::TObject* Sender, bool Selected);

typedef void __fastcall (__closure *TSpTBXGetFormClassEvent)(System::TObject* Sender, Forms::TCustomFormClass &AFormClass);

class DELPHICLASS TSpTBXPopupSizeGrip;
class DELPHICLASS TSpTBXCustomWrapperPopupForm;
class PASCALIMPLEMENTATION TSpTBXPopupSizeGrip : public Controls::TWinControl
{
	typedef Controls::TWinControl inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	Sptbxitem::TSpTBXDrawEvent FOnDrawBackground;
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	
protected:
	TSpTBXCustomWrapperPopupForm* FPopupForm;
	void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	
public:
	__fastcall virtual TSpTBXPopupSizeGrip(Classes::TComponent* AOwner);
	Types::TRect __fastcall GetGripRect();
	Types::TRect __fastcall GetGripSizerRect();
	bool __fastcall IsScreenPointInGrip(const Types::TPoint &P);
	
__published:
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=FSkinType, default=2};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXPopupSizeGrip(HWND ParentWindow) : Controls::TWinControl(ParentWindow) { }
	/* TWinControl.Destroy */ inline __fastcall virtual ~TSpTBXPopupSizeGrip(void) { }
	
};


class DELPHICLASS TSpTBXFormPopupMenu;
class PASCALIMPLEMENTATION TSpTBXCustomWrapperPopupForm : public Forms::TCustomForm
{
	typedef Forms::TCustomForm inherited;
	
private:
	bool FHooksInstalled;
	Forms::TMessageEvent FOldAppOnMessage;
	Classes::TWndMethod FOldPopupControlWndProc;
	bool FShowShadows;
	TSpTBXPopupAnimationType FAnimation;
	Tb2anim::TTBAnimationDirection FAnimationDirection;
	TSpTBXPopupBorderStyleType FBorderStyle;
	Classes::TNotifyEvent FOnRollDown;
	TSpTBXRollUpEvent FOnRollUp;
	HIDESBASE void __fastcall SetBorderStyle(const TSpTBXPopupBorderStyleType Value);
	void __fastcall InstallHooks(void);
	void __fastcall UninstallHooks(void);
	HIDESBASE MESSAGE void __fastcall CMChildKey(Controls::TCMChildKey &Message);
	MESSAGE void __fastcall CMCancelMode(Controls::TCMCancelMode &Message);
	HIDESBASE MESSAGE void __fastcall WMActivate(Messages::TWMActivate &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Messages::TWMNCHitTest &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	MESSAGE void __fastcall WMPrint(Messages::TMessage &Message);
	MESSAGE void __fastcall WMSpTBXPopupInvalidate(Messages::TMessage &Message);
	MESSAGE void __fastcall WMSpTBXPopupRollUp(Messages::TMessage &Message);
	
protected:
	Controls::TControl* FPopupControl;
	TSpTBXFormPopupMenu* FFormPopupMenu;
	bool FPaintingClientArea;
	TSpTBXPopupSizeGrip* FSizeGrip;
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect) = 0 ;
	TSpTBXPopupAnimationType __fastcall GetSysAnimation(void);
	virtual void __fastcall AppOnMessageHook(tagMSG &Msg, bool &Handled);
	virtual void __fastcall PopupControlWindowProc(Messages::TMessage &Message);
	virtual void __fastcall DoRollDown(void);
	virtual void __fastcall DoRollUp(bool Selected);
	__property TSpTBXPopupAnimationType Animation = {read=FAnimation, write=FAnimation, nodefault};
	__property Tb2anim::TTBAnimationDirection AnimationDirection = {read=FAnimationDirection, write=FAnimationDirection, default=0};
	__property TSpTBXPopupBorderStyleType BorderStyle = {read=FBorderStyle, write=SetBorderStyle, default=0};
	__property bool ShowShadows = {read=FShowShadows, write=FShowShadows, default=1};
	__property Classes::TNotifyEvent OnRollDown = {read=FOnRollDown, write=FOnRollDown};
	__property TSpTBXRollUpEvent OnRollUp = {read=FOnRollUp, write=FOnRollUp};
	
public:
	__fastcall virtual TSpTBXCustomWrapperPopupForm(TSpTBXFormPopupMenu* AFormPopupMenu);
	__fastcall virtual ~TSpTBXCustomWrapperPopupForm(void);
	virtual void __fastcall RollDown(int X, int Y, int AWidth, int AHeight, bool FocusPopup = true)/* overload */;
	virtual void __fastcall RollDown(Controls::TControl* APopupControl, int AWidth, int AHeight, bool IsVertical = false, bool FocusPopup = true)/* overload */;
	virtual void __fastcall RollUp(bool Selected, bool FocusParentControl = true);
	__property TSpTBXFormPopupMenu* FormPopupMenu = {read=FFormPopupMenu};
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSpTBXCustomWrapperPopupForm(Classes::TComponent* AOwner, int Dummy) : Forms::TCustomForm(AOwner, Dummy) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomWrapperPopupForm(HWND ParentWindow) : Forms::TCustomForm(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXWrapperPopupForm;
class PASCALIMPLEMENTATION TSpTBXWrapperPopupForm : public TSpTBXCustomWrapperPopupForm
{
	typedef TSpTBXCustomWrapperPopupForm inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	HIDESBASE MESSAGE void __fastcall CMShowingChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	
protected:
	virtual void __fastcall DestroyWindowHandle(void);
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	
public:
	__fastcall virtual TSpTBXWrapperPopupForm(TSpTBXFormPopupMenu* AFormPopupMenu);
	__fastcall virtual ~TSpTBXWrapperPopupForm(void);
	
__published:
	__property Height;
	__property Width;
	__property BorderStyle = {default=0};
	__property ShowShadows = {default=1};
	__property OnRollDown;
	__property OnRollUp;
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSpTBXWrapperPopupForm(Classes::TComponent* AOwner, int Dummy) : TSpTBXCustomWrapperPopupForm(AOwner, Dummy) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXWrapperPopupForm(HWND ParentWindow) : TSpTBXCustomWrapperPopupForm(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TSpTBXFormPopupMenu : public Menus::TPopupMenu
{
	typedef Menus::TPopupMenu inherited;
	
private:
	Sptbxskins::TSpTBXSkinType FSkinType;
	Classes::TList* FNotifies;
	bool FItems;
	bool FPopupFocus;
	TSpTBXPopupFormState FPopupFormState;
	TSpTBXRollUpEvent FClosePopup;
	TSpTBXRollUpEvent FOnBeforeClosePopup;
	TSpTBXRollDownEvent FOnBeforePopup;
	TSpTBXGetFormClassEvent FOnGetPopupFormClass;
	TSpTBXPopupBorderStyleType __fastcall GetBorderStyle(void);
	bool __fastcall GetShowShadows(void);
	void __fastcall SetBorderStyle(const TSpTBXPopupBorderStyleType Value);
	void __fastcall SetShowShadows(const bool Value);
	void __fastcall SetPopupForm(const Forms::TCustomForm* Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	
protected:
	Forms::TCustomForm* FPopupForm;
	TSpTBXWrapperPopupForm* FWrapperForm;
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall BroadcastCloseMessage(bool Selected);
	virtual void __fastcall DoGetPopupFormClass(Forms::TCustomFormClass &AFormClass);
	virtual bool __fastcall InternalPopup(int X, int Y, bool ForceFocus, Controls::TControl* PopupControl = (Controls::TControl*)(0x0));
	virtual void __fastcall InternalClosePopup(System::TObject* Sender, bool Selected);
	
public:
	__fastcall virtual TSpTBXFormPopupMenu(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXFormPopupMenu(void);
	virtual void __fastcall Popup(int X, int Y);
	void __fastcall PopupEx(int X, int Y, bool ForceFocus)/* overload */;
	void __fastcall PopupEx(Controls::TControl* PopupControl, bool ForceFocus)/* overload */;
	void __fastcall AddCloseNotification(System::TObject* AObject);
	void __fastcall RemoveCloseNotification(System::TObject* AObject);
	void __fastcall ClosePopup(bool Selected);
	__property Forms::TCustomForm* PopupForm = {read=FPopupForm, write=SetPopupForm};
	
__published:
	__property bool Items = {read=FItems, nodefault};
	__property TSpTBXPopupBorderStyleType BorderStyle = {read=GetBorderStyle, write=SetBorderStyle, default=0};
	__property bool PopupFocus = {read=FPopupFocus, write=FPopupFocus, default=0};
	__property bool ShowShadows = {read=GetShowShadows, write=SetShowShadows, default=1};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property TSpTBXRollUpEvent OnClosePopup = {read=FClosePopup, write=FClosePopup};
	__property TSpTBXRollUpEvent OnBeforeClosePopup = {read=FOnBeforeClosePopup, write=FOnBeforeClosePopup};
	__property TSpTBXRollDownEvent OnBeforePopup = {read=FOnBeforePopup, write=FOnBeforePopup};
	__property TSpTBXGetFormClassEvent OnGetPopupFormClass = {read=FOnGetPopupFormClass, write=FOnGetPopupFormClass};
private:
	void *__ISpTBXPopupMenu;	/* Sptbxitem::ISpTBXPopupMenu */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Sptbxitem::_di_ISpTBXPopupMenu()
	{
		Sptbxitem::_di_ISpTBXPopupMenu intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ISpTBXPopupMenu*(void) { return (ISpTBXPopupMenu*)&__ISpTBXPopupMenu; }
	#endif
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word WM_SPTBX_POPUPINVALIDATE = 0x777;
static const Word WM_SPTBX_POPUPROLLUP = 0x778;
extern PACKAGE TSpTBXFormPopupMenu* ActiveFormPopupMenu;

}	/* namespace Sptbxformpopupmenu */
using namespace Sptbxformpopupmenu;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxformpopupmenuHPP
