// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2mdi.pas' rev: 20.00

#ifndef Tb2mdiHPP
#define Tb2mdiHPP

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
#include <Menus.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2mdi
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TTBMDIHandler;
class DELPHICLASS TTBMDIButtonsItem;
class DELPHICLASS TTBMDISystemMenuItem;
class PASCALIMPLEMENTATION TTBMDIHandler : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	TTBMDIButtonsItem* FButtonsItem;
	TTBMDISystemMenuItem* FSystemMenuItem;
	Tb2toolbar::TTBCustomToolbar* FToolbar;
	void __fastcall SetToolbar(Tb2toolbar::TTBCustomToolbar* Value);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TTBMDIHandler(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBMDIHandler(void);
	
__published:
	__property Tb2toolbar::TTBCustomToolbar* Toolbar = {read=FToolbar, write=SetToolbar};
};


class DELPHICLASS TTBMDIWindowItem;
class PASCALIMPLEMENTATION TTBMDIWindowItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	Forms::TForm* FForm;
	Classes::TNotifyEvent FOnUpdate;
	Menus::TMenuItem* FWindowMenu;
	void __fastcall ItemClick(System::TObject* Sender);
	void __fastcall SetForm(Forms::TForm* AForm);
	
protected:
	virtual void __fastcall EnabledChanged(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TTBMDIWindowItem(Classes::TComponent* AOwner);
	virtual void __fastcall InitiateAction(void);
	
__published:
	__property Enabled = {default=1};
	__property Classes::TNotifyEvent OnUpdate = {read=FOnUpdate, write=FOnUpdate};
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBMDIWindowItem(void) { }
	
};


class PASCALIMPLEMENTATION TTBMDISystemMenuItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	Controls::TImageList* FImageList;
	void __fastcall CommandClick(System::TObject* Sender);
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	
public:
	__fastcall virtual TTBMDISystemMenuItem(Classes::TComponent* AOwner);
	virtual void __fastcall Click(void);
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBMDISystemMenuItem(void) { }
	
};


class DELPHICLASS TTBMDISystemMenuItemViewer;
class PASCALIMPLEMENTATION TTBMDISystemMenuItemViewer : public Tb2item::TTBItemViewer
{
	typedef Tb2item::TTBItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TTBMDISystemMenuItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TTBMDISystemMenuItemViewer(void) { }
	
};


#pragma option push -b-
enum TTBMDIButtonType { tbmbMinimize, tbmbRestore, tbmbClose };
#pragma option pop

class DELPHICLASS TTBMDIButtonItem;
class PASCALIMPLEMENTATION TTBMDIButtonItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	TTBMDIButtonType FButtonType;
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	
public:
	__fastcall virtual TTBMDIButtonItem(Classes::TComponent* AOwner);
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBMDIButtonItem(void) { }
	
};


class DELPHICLASS TTBMDIButtonItemViewer;
class PASCALIMPLEMENTATION TTBMDIButtonItemViewer : public Tb2item::TTBItemViewer
{
	typedef Tb2item::TTBItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TTBMDIButtonItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TTBMDIButtonItemViewer(void) { }
	
};


class DELPHICLASS TTBMDISepItem;
class PASCALIMPLEMENTATION TTBMDISepItem : public Tb2item::TTBSeparatorItem
{
	typedef Tb2item::TTBSeparatorItem inherited;
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
public:
	/* TTBSeparatorItem.Create */ inline __fastcall virtual TTBMDISepItem(Classes::TComponent* AOwner) : Tb2item::TTBSeparatorItem(AOwner) { }
	
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBMDISepItem(void) { }
	
};


class DELPHICLASS TTBMDISepItemViewer;
class PASCALIMPLEMENTATION TTBMDISepItemViewer : public Tb2item::TTBSeparatorItemViewer
{
	typedef Tb2item::TTBSeparatorItemViewer inherited;
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TTBMDISepItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBSeparatorItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TTBMDISepItemViewer(void) { }
	
};


class PASCALIMPLEMENTATION TTBMDIButtonsItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	TTBMDIButtonItem* FMinimizeItem;
	TTBMDIButtonItem* FRestoreItem;
	TTBMDIButtonItem* FCloseItem;
	TTBMDISepItem* FSep1;
	TTBMDISepItem* FSep2;
	void __fastcall InvalidateSystemMenuItem(void);
	void __fastcall ItemClick(System::TObject* Sender);
	void __fastcall UpdateState(HWND W, bool Maximized);
	
public:
	__fastcall virtual TTBMDIButtonsItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBMDIButtonsItem(void);
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Tb2mdi */
using namespace Tb2mdi;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2mdiHPP
