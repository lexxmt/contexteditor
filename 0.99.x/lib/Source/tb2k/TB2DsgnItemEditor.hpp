// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2dsgnitemeditor.pas' rev: 20.00

#ifndef Tb2dsgnitemeditorHPP
#define Tb2dsgnitemeditorHPP

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
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designwindows.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2dsgnitemeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TTBItemEditForm;
class PASCALIMPLEMENTATION TTBItemEditForm : public Designwindows::TDesignWindow
{
	typedef Designwindows::TDesignWindow inherited;
	
__published:
	Comctrls::TTreeView* TreeView;
	Comctrls::TListView* ListView;
	Extctrls::TSplitter* Splitter1;
	Tb2toolbar::TTBToolbar* Toolbar;
	Tb2item::TTBItem* NewSubmenuButton;
	Tb2item::TTBItem* NewItemButton;
	Tb2item::TTBItem* NewSepButton;
	Tb2item::TTBItem* DeleteButton;
	Tb2item::TTBSeparatorItem* TBSeparatorItem1;
	Tb2item::TTBPopupMenu* TBPopupMenu1;
	Tb2item::TTBItemContainer* TBItemContainer1;
	Tb2item::TTBSubmenuItem* ToolbarItems;
	Tb2item::TTBItem* CopyButton;
	Tb2item::TTBItem* CutButton;
	Tb2item::TTBItem* PasteButton;
	Tb2item::TTBSubmenuItem* MoreMenu;
	Tb2item::TTBSeparatorItem* TBSeparatorItem2;
	Tb2item::TTBSubmenuItem* TBSubmenuItem1;
	Tb2item::TTBItem* TConvertMenu;
	Tb2item::TTBSeparatorItem* TBSeparatorItem3;
	Tb2item::TTBItem* MoveUpButton;
	Tb2item::TTBItem* MoveDownButton;
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall TreeViewChange(System::TObject* Sender, Comctrls::TTreeNode* Node);
	void __fastcall NewSubmenuButtonClick(System::TObject* Sender);
	void __fastcall NewItemButtonClick(System::TObject* Sender);
	void __fastcall ListViewChange(System::TObject* Sender, Comctrls::TListItem* Item, Comctrls::TItemChange Change);
	void __fastcall DeleteButtonClick(System::TObject* Sender);
	void __fastcall NewSepButtonClick(System::TObject* Sender);
	void __fastcall ListViewDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall ListViewDragDrop(System::TObject* Sender, System::TObject* Source, int X, int Y);
	void __fastcall TreeViewEnter(System::TObject* Sender);
	void __fastcall TreeViewDragDrop(System::TObject* Sender, System::TObject* Source, int X, int Y);
	void __fastcall TreeViewDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall CopyButtonClick(System::TObject* Sender);
	void __fastcall ListViewKeyDown(System::TObject* Sender, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall CutButtonClick(System::TObject* Sender);
	void __fastcall PasteButtonClick(System::TObject* Sender);
	void __fastcall FormActivate(System::TObject* Sender);
	void __fastcall ListViewKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall ListViewDblClick(System::TObject* Sender);
	void __fastcall ListViewEnter(System::TObject* Sender);
	void __fastcall TreeViewKeyDown(System::TObject* Sender, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall TConvertMenuClick(System::TObject* Sender);
	void __fastcall TreeViewKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall MoveUpButtonClick(System::TObject* Sender);
	void __fastcall MoveDownButtonClick(System::TObject* Sender);
	
private:
	Classes::TComponent* FParentComponent;
	Tb2item::TTBCustomItem* FRootItem;
	Tb2item::TTBCustomItem* FSelParentItem;
	Classes::TList* FNotifyItemList;
	int FSettingSel;
	int FRebuildingTree;
	int FRebuildingList;
	Comctrls::TListItem* __fastcall AddListViewItem(const int Index, const Tb2item::TTBCustomItem* Item);
	MESSAGE void __fastcall CMDeferUpdate(Messages::TMessage &Message);
	void __fastcall Copy(void);
	void __fastcall CreateNewItem(const Tb2item::TTBCustomItemClass AClass);
	void __fastcall Cut(void);
	void __fastcall Delete(void);
	void __fastcall DeleteItem(const Tb2item::TTBCustomItem* Item);
	System::UnicodeString __fastcall GetItemTreeCaption(Tb2item::TTBCustomItem* AItem);
	void __fastcall GetSelItemList(const Classes::TList* AList);
	void __fastcall ItemNotification(Tb2item::TTBCustomItem* Ancestor, bool Relayed, Tb2item::TTBItemChangedAction Action, int Index, Tb2item::TTBCustomItem* Item);
	void __fastcall MoreItemClick(System::TObject* Sender);
	void __fastcall MoveItem(int CurIndex, int NewIndex);
	void __fastcall Paste(void);
	void __fastcall RebuildList(void);
	void __fastcall RebuildTree(void);
	void __fastcall SelectInObjectInspector(Classes::TList* AList);
	void __fastcall SetSelParentItem(Tb2item::TTBCustomItem* ASelParentItem);
	bool __fastcall TreeViewDragHandler(System::TObject* Sender, System::TObject* Source, int X, int Y, bool Drop);
	void __fastcall UnregisterAllNotifications(void);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual System::UnicodeString __fastcall UniqueName(Classes::TComponent* Component);
	
public:
	__fastcall virtual TTBItemEditForm(Classes::TComponent* AOwner);
	__fastcall virtual ~TTBItemEditForm(void);
	virtual bool __fastcall EditAction(Designintf::TEditAction Action);
	virtual Designintf::TEditState __fastcall GetEditState(void);
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TTBItemEditForm(Classes::TComponent* AOwner, int Dummy) : Designwindows::TDesignWindow(AOwner, Dummy) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TTBItemEditForm(HWND ParentWindow) : Designwindows::TDesignWindow(ParentWindow) { }
	
};


class DELPHICLASS TTBItemsEditor;
class PASCALIMPLEMENTATION TTBItemsEditor : public Designeditors::TDefaultEditor
{
	typedef Designeditors::TDefaultEditor inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TTBItemsEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TTBItemsEditor(void) { }
	
};


class DELPHICLASS TTBItemsPropertyEditor;
class PASCALIMPLEMENTATION TTBItemsPropertyEditor : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue();
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TTBItemsPropertyEditor(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TTBItemsPropertyEditor(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_DEFERUPDATE = 0x464;
extern PACKAGE void __fastcall TBRegisterItemClass(Tb2item::TTBCustomItemClass AClass, const System::UnicodeString ACaption, unsigned ResInstance);

}	/* namespace Tb2dsgnitemeditor */
using namespace Tb2dsgnitemeditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2dsgnitemeditorHPP
