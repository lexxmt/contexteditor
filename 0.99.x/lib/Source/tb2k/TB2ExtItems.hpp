// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2extitems.pas' rev: 20.00

#ifndef Tb2extitemsHPP
#define Tb2extitemsHPP

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
#include <Commctrl.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2extitems
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TTBEditItemOption { tboUseEditWhenVertical };
#pragma option pop

typedef Set<TTBEditItemOption, tboUseEditWhenVertical, tboUseEditWhenVertical>  TTBEditItemOptions;

typedef void __fastcall (__closure *TTBAcceptTextEvent)(System::TObject* Sender, System::UnicodeString &NewText, bool &Accept);

class DELPHICLASS TTBEditItem;
class DELPHICLASS TTBEditItemViewer;
typedef void __fastcall (__closure *TTBBeginEditEvent)(TTBEditItem* Sender, TTBEditItemViewer* Viewer, Stdctrls::TEdit* EditControl);

class DELPHICLASS TTBEditAction;
class PASCALIMPLEMENTATION TTBEditAction : public Actnlist::TAction
{
	typedef Actnlist::TAction inherited;
	
private:
	TTBEditItemOptions FEditOptions;
	System::UnicodeString FEditCaption;
	int FEditWidth;
	TTBAcceptTextEvent FOnAcceptText;
	System::UnicodeString FText;
	void __fastcall SetEditCaption(System::UnicodeString Value);
	void __fastcall SetEditOptions(TTBEditItemOptions Value);
	void __fastcall SetEditWidth(int Value);
	void __fastcall SetOnAcceptText(TTBAcceptTextEvent Value);
	void __fastcall SetText(System::UnicodeString Value);
	
public:
	__fastcall virtual TTBEditAction(Classes::TComponent* AOwner);
	
__published:
	__property System::UnicodeString EditCaption = {read=FEditCaption, write=SetEditCaption};
	__property TTBEditItemOptions EditOptions = {read=FEditOptions, write=SetEditOptions, default=0};
	__property int EditWidth = {read=FEditWidth, write=SetEditWidth, default=64};
	__property System::UnicodeString Text = {read=FText, write=SetText};
	__property TTBAcceptTextEvent OnAcceptText = {read=FOnAcceptText, write=SetOnAcceptText};
public:
	/* TCustomAction.Destroy */ inline __fastcall virtual ~TTBEditAction(void) { }
	
};


class DELPHICLASS TTBEditItemActionLink;
class PASCALIMPLEMENTATION TTBEditItemActionLink : public Tb2item::TTBCustomItemActionLink
{
	typedef Tb2item::TTBCustomItemActionLink inherited;
	
protected:
	virtual void __fastcall AssignClient(System::TObject* AClient);
	virtual bool __fastcall IsEditCaptionLinked(void);
	virtual bool __fastcall IsEditOptionsLinked(void);
	virtual bool __fastcall IsEditWidthLinked(void);
	virtual bool __fastcall IsOnAcceptTextLinked(void);
	virtual bool __fastcall IsTextLinked(void);
	virtual void __fastcall SetEditCaption(const System::UnicodeString Value);
	virtual void __fastcall SetEditOptions(TTBEditItemOptions Value);
	virtual void __fastcall SetEditWidth(const int Value);
	virtual void __fastcall SetOnAcceptText(TTBAcceptTextEvent Value);
	virtual void __fastcall SetText(const System::UnicodeString Value);
public:
	/* TBasicActionLink.Create */ inline __fastcall virtual TTBEditItemActionLink(System::TObject* AClient) : Tb2item::TTBCustomItemActionLink(AClient) { }
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TTBEditItemActionLink(void) { }
	
};


class PASCALIMPLEMENTATION TTBEditItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	Stdctrls::TEditCharCase FCharCase;
	System::UnicodeString FEditCaption;
	TTBEditItemOptions FEditOptions;
	int FEditWidth;
	int FMaxLength;
	TTBAcceptTextEvent FOnAcceptText;
	TTBBeginEditEvent FOnBeginEdit;
	System::UnicodeString FText;
	bool __fastcall IsEditCaptionStored(void);
	bool __fastcall IsEditOptionsStored(void);
	bool __fastcall IsEditWidthStored(void);
	bool __fastcall IsTextStored(void);
	void __fastcall SetCharCase(Stdctrls::TEditCharCase Value);
	void __fastcall SetEditCaption(System::UnicodeString Value);
	void __fastcall SetEditOptions(TTBEditItemOptions Value);
	void __fastcall SetEditWidth(int Value);
	void __fastcall SetMaxLength(int Value);
	void __fastcall SetText(System::UnicodeString Value);
	
protected:
	DYNAMIC void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	virtual void __fastcall DoBeginEdit(TTBEditItemViewer* Viewer);
	DYNAMIC Tb2item::TTBCustomItemActionLinkClass __fastcall GetActionLinkClass(void);
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	virtual bool __fastcall NeedToRecreateViewer(Tb2item::TTBItemViewer* AViewer);
	
public:
	__fastcall virtual TTBEditItem(Classes::TComponent* AOwner);
	HIDESBASE void __fastcall Clear(void);
	virtual void __fastcall Click(void);
	
__published:
	__property Action;
	__property AutoCheck = {default=0};
	__property Caption;
	__property Stdctrls::TEditCharCase CharCase = {read=FCharCase, write=SetCharCase, default=0};
	__property Checked = {default=0};
	__property DisplayMode = {default=0};
	__property System::UnicodeString EditCaption = {read=FEditCaption, write=SetEditCaption, stored=IsEditCaptionStored};
	__property TTBEditItemOptions EditOptions = {read=FEditOptions, write=SetEditOptions, stored=IsEditOptionsStored, nodefault};
	__property int EditWidth = {read=FEditWidth, write=SetEditWidth, stored=IsEditWidthStored, nodefault};
	__property int MaxLength = {read=FMaxLength, write=SetMaxLength, default=0};
	__property Enabled = {default=1};
	__property GroupIndex = {default=0};
	__property HelpContext = {default=0};
	__property Hint;
	__property ImageIndex = {default=-1};
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property RadioItem = {default=0};
	__property ShortCut = {default=0};
	__property System::UnicodeString Text = {read=FText, write=SetText, stored=IsTextStored};
	__property Visible = {default=1};
	__property TTBAcceptTextEvent OnAcceptText = {read=FOnAcceptText, write=FOnAcceptText};
	__property TTBBeginEditEvent OnBeginEdit = {read=FOnBeginEdit, write=FOnBeginEdit};
	__property OnClick;
	__property OnSelect;
public:
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBEditItem(void) { }
	
};


class PASCALIMPLEMENTATION TTBEditItemViewer : public Tb2item::TTBItemViewer
{
	typedef Tb2item::TTBItemViewer inherited;
	
private:
	#pragma option push -b-
	enum _TTBEditItemViewer__1 { ecsContinueLoop, ecsAccept, ecsClose };
	#pragma option pop
	
	
private:
	Stdctrls::TEdit* FEditControl;
	Set<_TTBEditItemViewer__1, ecsContinueLoop, ecsClose>  FEditControlStatus;
	bool __fastcall EditLoop(const HWND CapHandle);
	void __fastcall EditWndProc(Messages::TMessage &Message);
	void __fastcall MouseBeginEdit(void);
	
protected:
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	DYNAMIC bool __fastcall CaptionShown(void);
	virtual bool __fastcall DoExecute(void);
	virtual int __fastcall GetAccRole(void);
	virtual bool __fastcall GetAccValue(System::WideString &Value);
	virtual System::UnicodeString __fastcall GetCaptionText();
	virtual void __fastcall GetCursor(const Types::TPoint &Pt, HICON &ACursor);
	virtual void __fastcall GetEditRect(Types::TRect &R);
	virtual void __fastcall MouseDown(Classes::TShiftState Shift, int X, int Y, bool &MouseDownOnMenu);
	virtual void __fastcall MouseUp(int X, int Y, bool MouseWasDownOnMenu);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	virtual bool __fastcall UsesSameWidth(void);
	
public:
	__property Stdctrls::TEdit* EditControl = {read=FEditControl};
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TTBEditItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Tb2item::TTBItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TTBEditItemViewer(void) { }
	
};


class DELPHICLASS TTBVisibilityToggleItem;
class PASCALIMPLEMENTATION TTBVisibilityToggleItem : public Tb2item::TTBCustomItem
{
	typedef Tb2item::TTBCustomItem inherited;
	
private:
	Controls::TControl* FControl;
	void __fastcall SetControl(Controls::TControl* Value);
	void __fastcall UpdateProps(void);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	
public:
	virtual void __fastcall Click(void);
	virtual void __fastcall InitiateAction(void);
	
__published:
	__property Caption;
	__property Controls::TControl* Control = {read=FControl, write=SetControl};
	__property DisplayMode = {default=0};
	__property Enabled = {default=1};
	__property HelpContext = {default=0};
	__property Hint;
	__property ImageIndex = {default=-1};
	__property Images;
	__property InheritOptions = {default=1};
	__property MaskOptions = {default=0};
	__property Options = {default=0};
	__property ShortCut = {default=0};
	__property Visible = {default=1};
	__property OnClick;
	__property OnSelect;
public:
	/* TTBCustomItem.Create */ inline __fastcall virtual TTBVisibilityToggleItem(Classes::TComponent* AOwner) : Tb2item::TTBCustomItem(AOwner) { }
	/* TTBCustomItem.Destroy */ inline __fastcall virtual ~TTBVisibilityToggleItem(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define EditItemDefaultEditOptions EMPTYSET
static const ShortInt EditItemDefaultEditWidth = 0x40;

}	/* namespace Tb2extitems */
using namespace Tb2extitems;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2extitemsHPP
