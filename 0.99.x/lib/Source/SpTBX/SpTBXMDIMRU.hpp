// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxmdimru.pas' rev: 20.00

#ifndef SptbxmdimruHPP
#define SptbxmdimruHPP

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
#include <Inifiles.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxmdimru
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TSpTBXMRUListClickEvent)(System::TObject* Sender, const System::WideString Filename);

class DELPHICLASS TSpTBXMDIHandler;
class DELPHICLASS TSpTBXMDIButtonsItem;
class PASCALIMPLEMENTATION TSpTBXMDIHandler : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	TSpTBXMDIButtonsItem* FButtonsItem;
	Sptbxitem::TSpTBXSystemMenuItem* FSystemMenuItem;
	Tb2toolbar::TTBCustomToolbar* FToolbar;
	void __fastcall SetToolbar(Tb2toolbar::TTBCustomToolbar* Value);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TSpTBXMDIHandler(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXMDIHandler(void);
	
__published:
	__property Tb2toolbar::TTBCustomToolbar* Toolbar = {read=FToolbar, write=SetToolbar};
};


class PASCALIMPLEMENTATION TSpTBXMDIButtonsItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	Sptbxitem::TSpTBXItem* FMinimizeItem;
	Sptbxitem::TSpTBXItem* FRestoreItem;
	Sptbxitem::TSpTBXItem* FCloseItem;
	void __fastcall InvalidateSystemMenuItem(void);
	void __fastcall ItemClick(System::TObject* Sender);
	void __fastcall UpdateState(HWND W, bool Maximized);
	
public:
	__fastcall virtual TSpTBXMDIButtonsItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXMDIButtonsItem(void);
};


class DELPHICLASS TSpTBXMDIWindowItem;
class PASCALIMPLEMENTATION TSpTBXMDIWindowItem : public Tb2item::TTBCustomItem
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
	__fastcall virtual TSpTBXMDIWindowItem(Classes::TComponent* AOwner);
	virtual void __fastcall InitiateAction(void);
	
__published:
	__property Enabled = {default=1};
	__property Classes::TNotifyEvent OnUpdate = {read=FOnUpdate, write=FOnUpdate};
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXMDIWindowItem(void) { }
	
};


class DELPHICLASS TSpTBXMRUListItem;
class PASCALIMPLEMENTATION TSpTBXMRUListItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	int FMaxItems;
	TSpTBXMRUListClickEvent FOnClick;
	bool FHidePathExtension;
	void __fastcall ClickHandler(System::TObject* Sender);
	void __fastcall SetHidePathExtension(const bool Value);
	void __fastcall SetMaxItems(const int Value);
	
public:
	__fastcall virtual TSpTBXMRUListItem(Classes::TComponent* AOwner);
	void __fastcall GetMRUFilenames(Classes::TStrings* MRUFilenames);
	int __fastcall IndexOfMRU(System::WideString Filename);
	int __fastcall MRUAdd(System::WideString Filename);
	bool __fastcall MRUClick(System::WideString Filename);
	void __fastcall MRURemove(System::WideString Filename);
	void __fastcall MRUUpdateCaptions(void);
	void __fastcall LoadFromIni(Inifiles::TCustomIniFile* Ini, const System::UnicodeString Section);
	void __fastcall SaveToIni(Inifiles::TCustomIniFile* Ini, const System::UnicodeString Section);
	
__published:
	__property bool HidePathExtension = {read=FHidePathExtension, write=SetHidePathExtension, default=1};
	__property int MaxItems = {read=FMaxItems, write=SetMaxItems, default=4};
	__property TSpTBXMRUListClickEvent OnClick = {read=FOnClick, write=FOnClick};
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXMRUListItem(void) { }
	
};


class DELPHICLASS TSpTBXMRUItem;
class PASCALIMPLEMENTATION TSpTBXMRUItem : public Sptbxitem::TSpTBXCustomItem
{
	typedef Sptbxitem::TSpTBXCustomItem inherited;
	
private:
	System::WideString FMRUString;
	
public:
	__property System::WideString MRUString = {read=FMRUString, write=FMRUString};
public:
	/* TSpTBXCustomItem.Create */ inline __fastcall virtual TSpTBXMRUItem(Classes::TComponent* AOwner) : Sptbxitem::TSpTBXCustomItem(AOwner) { }
	/* TSpTBXCustomItem.Destroy */ inline __fastcall virtual ~TSpTBXMRUItem(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Sptbxmdimru */
using namespace Sptbxmdimru;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxmdimruHPP
