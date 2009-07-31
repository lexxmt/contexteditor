// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2mru.pas' rev: 20.00

#ifndef Tb2mruHPP
#define Tb2mruHPP

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
#include <Tb2item.hpp>	// Pascal unit
#include <Inifiles.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2mru
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TTBMRUListClickEvent)(System::TObject* Sender, const System::UnicodeString Filename);

class DELPHICLASS TTBMRUList;
class PASCALIMPLEMENTATION TTBMRUList : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	bool FAddFullPath;
	Tb2item::TTBCustomItem* FContainer;
	bool FHidePathExtension;
	Classes::TStrings* FList;
	int FMaxItems;
	Classes::TNotifyEvent FOnChange;
	TTBMRUListClickEvent FOnClick;
	System::UnicodeString FPrefix;
	void __fastcall ClickHandler(System::TObject* Sender);
	void __fastcall SetHidePathExtension(bool Value);
	void __fastcall SetList(Classes::TStrings* Value);
	void __fastcall SetMaxItems(int Value);
	
protected:
	__property Tb2item::TTBCustomItem* Container = {read=FContainer};
	virtual Tb2item::TTBCustomItemClass __fastcall GetItemClass(void);
	virtual void __fastcall SetItemCaptions(void);
	
public:
	__fastcall virtual TTBMRUList(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBMRUList(void);
	void __fastcall Add(System::UnicodeString Filename);
	HIDESBASE void __fastcall Remove(const System::UnicodeString Filename);
	void __fastcall LoadFromIni(Inifiles::TCustomIniFile* Ini, const System::UnicodeString Section);
	void __fastcall LoadFromRegIni(Registry::TRegIniFile* Ini, const System::UnicodeString Section);
	void __fastcall SaveToIni(Inifiles::TCustomIniFile* Ini, const System::UnicodeString Section);
	void __fastcall SaveToRegIni(Registry::TRegIniFile* Ini, const System::UnicodeString Section);
	
__published:
	__property bool AddFullPath = {read=FAddFullPath, write=FAddFullPath, default=1};
	__property bool HidePathExtension = {read=FHidePathExtension, write=SetHidePathExtension, default=1};
	__property int MaxItems = {read=FMaxItems, write=SetMaxItems, default=4};
	__property Classes::TStrings* Items = {read=FList, write=SetList};
	__property TTBMRUListClickEvent OnClick = {read=FOnClick, write=FOnClick};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property System::UnicodeString Prefix = {read=FPrefix, write=FPrefix};
};


class DELPHICLASS TTBMRUListItem;
class PASCALIMPLEMENTATION TTBMRUListItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	TTBMRUList* FMRUList;
	void __fastcall SetMRUList(TTBMRUList* Value);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	__fastcall virtual TTBMRUListItem(Classes::TComponent* AOwner);
	
__published:
	__property TTBMRUList* MRUList = {read=FMRUList, write=SetMRUList};
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBMRUListItem(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Tb2mru */
using namespace Tb2mru;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2mruHPP
