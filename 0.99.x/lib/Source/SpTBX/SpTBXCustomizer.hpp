// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxcustomizer.pas' rev: 20.00

#ifndef SptbxcustomizerHPP
#define SptbxcustomizerHPP

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
#include <Variants.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Inifiles.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxeditors.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxcustomizer
{
//-- type declarations -------------------------------------------------------
typedef Classes::TStringList* TTntStringList;

class DELPHICLASS TShortCutsProcessor;
class PASCALIMPLEMENTATION TShortCutsProcessor : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	bool FActive;
	
public:
	__fastcall virtual TShortCutsProcessor(void);
	__fastcall virtual ~TShortCutsProcessor(void);
	bool __fastcall MainWindowHook(Messages::TMessage &Message);
	__property bool Active = {read=FActive, write=FActive, nodefault};
};


class DELPHICLASS TSpTBXMenuBarShortcuts;
class PASCALIMPLEMENTATION TSpTBXMenuBarShortcuts : public Classes::TStringList
{
	typedef Classes::TStringList inherited;
	
private:
	System::UnicodeString FMenuBarName;
	
public:
	__property System::UnicodeString MenuBarName = {read=FMenuBarName, write=FMenuBarName};
public:
	/* TStringList.Create */ inline __fastcall TSpTBXMenuBarShortcuts(void)/* overload */ : Classes::TStringList() { }
	/* TStringList.Destroy */ inline __fastcall virtual ~TSpTBXMenuBarShortcuts(void) { }
	
};


class DELPHICLASS TSpTBXCustomCustomizeForm;
class DELPHICLASS TSpTBXCustomizer;
class PASCALIMPLEMENTATION TSpTBXCustomCustomizeForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
private:
	bool FEmbedded;
	
protected:
	TSpTBXCustomizer* FCustomizer;
	Classes::TStringList* FToolbarList;
	Classes::TStringList* FItemList;
	Classes::TStringList* FShortcutList;
	Classes::TStringList* FSeparatorList;
	Classes::TStringList* FBlankSeparatorList;
	virtual void __fastcall DoFillCommands(Classes::TStringList* ToolbarList, Classes::TStringList* ItemList, Classes::TStringList* ShortcutsList) = 0 ;
	DYNAMIC void __fastcall DoShow(void);
	DYNAMIC void __fastcall DoClose(Forms::TCloseAction &Action);
	virtual void __fastcall DoIconOptionsChange(bool UseSmallImages);
	virtual void __fastcall DoSkinChange(void);
	void __fastcall FillCommands(void);
	DYNAMIC void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	
public:
	__fastcall TSpTBXCustomCustomizeForm(TSpTBXCustomizer* AOwner, Controls::TWinControl* EmbeddedParent);
	__fastcall virtual ~TSpTBXCustomCustomizeForm(void);
	__property TSpTBXCustomizer* Customizer = {read=FCustomizer};
	__property bool Embedded = {read=FEmbedded, nodefault};
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSpTBXCustomCustomizeForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomCustomizeForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


typedef TMetaClass* TSpTBXCustomizeFormClass;

typedef void __fastcall (__closure *TSpTBXGetCustomizeFormClassEvent)(System::TObject* Sender, TSpTBXCustomizeFormClass &CustomizeFormClass);

typedef void __fastcall (__closure *TSpTBXExtraOptionsEvent)(System::TObject* Sender, Classes::TStringList* ExtraOptions);

typedef void __fastcall (__closure *TSpTBXLayoutExtraOptionsEvent)(System::TObject* Sender, System::UnicodeString LayoutName, Classes::TStringList* ExtraOptions);

typedef void __fastcall (__closure *TSpTBXIconOptionsChangeEvent)(System::TObject* Sender, Tb2toolbar::TTBCustomToolbar* Toolbar, bool UseSmallImages);

typedef void __fastcall (__closure *TSpTBXAcceptItemEvent)(System::TObject* Sender, Tb2item::TTBCustomItem* AItem, bool &Accept);

class PASCALIMPLEMENTATION TSpTBXCustomizer : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::TStringList* FLayouts;
	Classes::TStringList* FResetState;
	bool FBlankSeparators;
	Tb2item::TTBRootItem* FItems;
	TSpTBXCustomCustomizeForm* FCustomizeForm;
	Tb2toolbar::TTBCustomToolbar* FMenuBar;
	bool FShowing;
	bool FSaveFormState;
	Classes::TNotifyEvent FOnShow;
	Classes::TNotifyEvent FOnClose;
	TSpTBXGetCustomizeFormClassEvent FOnGetCustomizeForm;
	TSpTBXExtraOptionsEvent FOnLoad;
	TSpTBXExtraOptionsEvent FOnSave;
	TSpTBXLayoutExtraOptionsEvent FOnLayoutLoad;
	TSpTBXLayoutExtraOptionsEvent FOnLayoutSave;
	TSpTBXAcceptItemEvent FOnGetShortcutsList;
	TSpTBXIconOptionsChangeEvent FOnIconOptionsChange;
	Classes::TNotifyEvent FOnSkinChange;
	Tb2item::TTBCustomItem* __fastcall GetItems(void);
	Imglist::TCustomImageList* __fastcall GetImages(void);
	void __fastcall SetImages(Imglist::TCustomImageList* Value);
	void __fastcall SetMenuBar(const Tb2toolbar::TTBCustomToolbar* Value);
	void __fastcall SaveResetState(TSpTBXMenuBarShortcuts* ShortcutsList);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual bool __fastcall DoGetShortcutsList(Tb2item::TTBCustomItem* AItem);
	virtual void __fastcall DoIconOptionsChange(Tb2toolbar::TTBCustomToolbar* Toolbar, bool UseSmallImages);
	virtual void __fastcall DoLoad(Classes::TStringList* ExtraOptions);
	virtual void __fastcall DoSave(Classes::TStringList* ExtraOptions);
	virtual void __fastcall DoLayoutLoad(System::UnicodeString LayoutName, Classes::TStringList* ExtraOptions);
	virtual void __fastcall DoLayoutSave(System::UnicodeString LayoutName, Classes::TStringList* ExtraOptions);
	virtual void __fastcall DoSkinChange(void);
	DYNAMIC void __fastcall GetChildren(Classes::TGetChildProc Proc, Classes::TComponent* Root);
	virtual TSpTBXCustomizeFormClass __fastcall GetCustomizeFormClass(void);
	void __fastcall GetShortcutList(Classes::TStringList* ShortcutsList);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall SetupForm(void);
	DYNAMIC void __fastcall ValidateContainer(Classes::TComponent* AComponent);
	
public:
	__fastcall virtual TSpTBXCustomizer(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomizer(void);
	void __fastcall Show(void);
	void __fastcall ShowEmbedded(Controls::TWinControl* AParent = (Controls::TWinControl*)(0x0));
	void __fastcall Close(void);
	void __fastcall Load(Inifiles::TCustomIniFile* IniFile, bool LoadLastLayout = true)/* overload */;
	void __fastcall Load(Classes::TStrings* OptionsList, bool LoadLastLayout = true)/* overload */;
	void __fastcall Load(const System::UnicodeString Filename, bool LoadLastLayout = true)/* overload */;
	void __fastcall Load(const unsigned RootKey, System::UnicodeString BaseRegistryKey, bool LoadLastLayout = true)/* overload */;
	void __fastcall Save(Inifiles::TCustomIniFile* IniFile)/* overload */;
	void __fastcall Save(Classes::TStrings* OptionsList)/* overload */;
	void __fastcall Save(const System::UnicodeString Filename)/* overload */;
	void __fastcall Save(const unsigned RootKey, System::UnicodeString BaseRegistryKey)/* overload */;
	void __fastcall Reset(void);
	void __fastcall LoadLayout(Inifiles::TCustomIniFile* IniFile, System::UnicodeString LayoutName)/* overload */;
	void __fastcall LoadLayout(Classes::TStrings* OptionsList, System::UnicodeString LayoutName)/* overload */;
	void __fastcall LoadLayout(const System::UnicodeString Filename, const System::UnicodeString LayoutName)/* overload */;
	void __fastcall LoadLayout(const unsigned RootKey, System::UnicodeString BaseRegistryKey, System::UnicodeString LayoutName)/* overload */;
	void __fastcall SaveLayout(Inifiles::TCustomIniFile* IniFile, System::UnicodeString LayoutName)/* overload */;
	void __fastcall SaveLayout(Classes::TStrings* OptionsList, System::UnicodeString LayoutName)/* overload */;
	void __fastcall SaveLayout(const System::UnicodeString Filename, const System::UnicodeString LayoutName)/* overload */;
	void __fastcall SaveLayout(const unsigned RootKey, System::UnicodeString BaseRegistryKey, System::UnicodeString LayoutName)/* overload */;
	bool __fastcall DeleteLayout(Inifiles::TCustomIniFile* IniFile, System::UnicodeString LayoutName)/* overload */;
	bool __fastcall DeleteLayout(Classes::TStrings* OptionsList, System::UnicodeString LayoutName)/* overload */;
	bool __fastcall DeleteLayout(const System::UnicodeString Filename, const System::UnicodeString LayoutName)/* overload */;
	bool __fastcall DeleteLayout(const unsigned RootKey, System::UnicodeString BaseRegistryKey, System::UnicodeString LayoutName)/* overload */;
	__property TSpTBXCustomCustomizeForm* CustomizeForm = {read=FCustomizeForm};
	__property Classes::TStringList* Layouts = {read=FLayouts};
	__property bool Showing = {read=FShowing, nodefault};
	
__published:
	__property bool BlankSeparators = {read=FBlankSeparators, write=FBlankSeparators, default=0};
	__property Imglist::TCustomImageList* Images = {read=GetImages, write=SetImages};
	__property Tb2item::TTBRootItem* Items = {read=FItems};
	__property Tb2toolbar::TTBCustomToolbar* MenuBar = {read=FMenuBar, write=SetMenuBar};
	__property bool SaveFormState = {read=FSaveFormState, write=FSaveFormState, default=1};
	__property Classes::TNotifyEvent OnShow = {read=FOnShow, write=FOnShow};
	__property Classes::TNotifyEvent OnClose = {read=FOnClose, write=FOnClose};
	__property TSpTBXGetCustomizeFormClassEvent OnGetCustomizeForm = {read=FOnGetCustomizeForm, write=FOnGetCustomizeForm};
	__property TSpTBXAcceptItemEvent OnGetShortcutsList = {read=FOnGetShortcutsList, write=FOnGetShortcutsList};
	__property TSpTBXExtraOptionsEvent OnLoad = {read=FOnLoad, write=FOnLoad};
	__property TSpTBXExtraOptionsEvent OnSave = {read=FOnSave, write=FOnSave};
	__property TSpTBXLayoutExtraOptionsEvent OnLayoutLoad = {read=FOnLayoutLoad, write=FOnLayoutLoad};
	__property TSpTBXLayoutExtraOptionsEvent OnLayoutSave = {read=FOnLayoutSave, write=FOnLayoutSave};
	__property TSpTBXIconOptionsChangeEvent OnIconOptionsChange = {read=FOnIconOptionsChange, write=FOnIconOptionsChange};
	__property Classes::TNotifyEvent OnSkinChange = {read=FOnSkinChange, write=FOnSkinChange};
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


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall SpIniEraseSection(Inifiles::TCustomIniFile* IniFile, System::UnicodeString Section, bool EraseKeysOnly);
extern PACKAGE void __fastcall SpIniSaveStringList(Inifiles::TCustomIniFile* IniFile, System::UnicodeString Section, Classes::TStringList* L);
extern PACKAGE void __fastcall SpIniLoadStringList(Inifiles::TCustomIniFile* IniFile, System::UnicodeString Section, Classes::TStringList* L);
extern PACKAGE void __fastcall SpRegSaveStringList(Classes::TStringList* L, const unsigned RootKey, const System::UnicodeString BaseRegistryKey);
extern PACKAGE void __fastcall SpRegLoadStringList(Classes::TStringList* L, const unsigned RootKey, const System::UnicodeString BaseRegistryKey);
extern PACKAGE void __fastcall SpLoadFormState(Forms::TCustomForm* Form, Classes::TStrings* OptionsList);
extern PACKAGE void __fastcall SpSaveFormState(Forms::TCustomForm* Form, Classes::TStrings* OptionsList);
extern PACKAGE void __fastcall SpLoadLayoutList(Inifiles::TCustomIniFile* IniFile, Classes::TStringList* L)/* overload */;
extern PACKAGE void __fastcall SpSaveLayout(const Classes::TComponent* OwnerComponent, Inifiles::TCustomIniFile* IniFile, System::UnicodeString LayoutName, Classes::TStringList* ExtraOptions = (Classes::TStringList*)(0x0));
extern PACKAGE void __fastcall SpLoadLayout(const Classes::TComponent* OwnerComponent, Inifiles::TCustomIniFile* IniFile, System::UnicodeString LayoutName, Classes::TStringList* ExtraOptions = (Classes::TStringList*)(0x0));
extern PACKAGE void __fastcall SpSaveItems(const Classes::TComponent* OwnerComponent, Inifiles::TCustomIniFile* IniFile, TSpTBXMenuBarShortcuts* ShortcutsList = (TSpTBXMenuBarShortcuts*)(0x0), Classes::TStringList* ExtraOptions = (Classes::TStringList*)(0x0))/* overload */;
extern PACKAGE void __fastcall SpLoadItems(const Classes::TComponent* OwnerComponent, Inifiles::TCustomIniFile* IniFile, TSpTBXMenuBarShortcuts* ShortcutsList = (TSpTBXMenuBarShortcuts*)(0x0), Classes::TStringList* ExtraOptions = (Classes::TStringList*)(0x0))/* overload */;
extern PACKAGE System::WideString __fastcall SpCustomizerGetWideCaption(Tb2item::TTBCustomItem* Item);
extern PACKAGE Sptbxitem::TSpTBXSeparatorItem* __fastcall SpCreateUniqueSeparator(bool Blank);

}	/* namespace Sptbxcustomizer */
using namespace Sptbxcustomizer;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxcustomizerHPP
