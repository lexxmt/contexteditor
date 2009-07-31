// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxcustomizerform.pas' rev: 20.00

#ifndef SptbxcustomizerformHPP
#define SptbxcustomizerformHPP

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
#include <Comctrls.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Checklst.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit
#include <Sptbxeditors.hpp>	// Pascal unit
#include <Sptbxtabs.hpp>	// Pascal unit
#include <Sptbxcustomizer.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxcustomizerform
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSpTBXCustomizeForm;
class PASCALIMPLEMENTATION TSpTBXCustomizeForm : public Sptbxcustomizer::TSpTBXCustomCustomizeForm
{
	typedef Sptbxcustomizer::TSpTBXCustomCustomizeForm inherited;
	
__published:
	Sptbxtabs::TSpTBXTabControl* SpTBXTabControl1;
	Sptbxtabs::TSpTBXTabItem* tabCommands;
	Sptbxtabs::TSpTBXTabSheet* SpTBXTabSheet1;
	Sptbxtabs::TSpTBXTabItem* tabToolbars;
	Sptbxtabs::TSpTBXTabSheet* SpTBXTabSheet2;
	Sptbxtabs::TSpTBXTabItem* tabShortcuts;
	Sptbxtabs::TSpTBXTabSheet* SpTBXTabSheet3;
	Sptbxcontrols::TSpTBXButton* CloseButton;
	Sptbxcontrols::TSpTBXLabel* SpTBXLabel1;
	Sptbxcontrols::TSpTBXLabel* SpTBXLabel3;
	Comctrls::THotKey* HotKey1;
	Sptbxcontrols::TSpTBXButton* ChangeShortcut;
	Sptbxcontrols::TSpTBXLabel* SpTBXLabel4;
	Sptbxcontrols::TSpTBXPanel* SpTBXPanel5;
	Extctrls::TPanel* Panel1;
	Sptbxeditors::TSpTBXComboBox* cbSkins;
	Sptbxcontrols::TSpTBXLabel* cbIconLabel;
	Sptbxeditors::TSpTBXComboBox* cbText;
	Sptbxeditors::TSpTBXComboBox* cbIcon;
	Sptbxcontrols::TSpTBXLabel* cbTextLabel;
	Sptbxcontrols::TSpTBXGroupBox* SpTBXGroupBox1;
	Sptbxcontrols::TSpTBXButton* ResetButton;
	Sptbxcontrols::TSpTBXCheckBox* checkVisible;
	Sptbxcontrols::TSpTBXGroupBox* SpTBXGroupBox2;
	Sptbxeditors::TSpTBXCheckListBox* lbToolbars;
	Sptbxeditors::TSpTBXListBox* lbCommands;
	Sptbxeditors::TSpTBXListBox* lbShortcuts;
	Sptbxcontrols::TSpTBXPanel* ClosePanel;
	void __fastcall lbCommandsStartDrag(System::TObject* Sender, Controls::TDragObject* &DragObject);
	void __fastcall lbCommandsDragOver(System::TObject* Sender, System::TObject* Source, int X, int Y, Controls::TDragState State, bool &Accept);
	void __fastcall lbCommandsDragDrop(System::TObject* Sender, System::TObject* Source, int X, int Y);
	void __fastcall lbToolbarsClickCheck(System::TObject* Sender);
	void __fastcall CloseButtonClick(System::TObject* Sender);
	void __fastcall FormKeyDown(System::TObject* Sender, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall lbCommandsEndDrag(System::TObject* Sender, System::TObject* Target, int X, int Y);
	void __fastcall lbShortcutsClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall cbSkinsClick(System::TObject* Sender);
	void __fastcall checkVisibleClick(System::TObject* Sender);
	void __fastcall cbTextClick(System::TObject* Sender);
	void __fastcall lbToolbarsClick(System::TObject* Sender);
	void __fastcall ChangeShortcutClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall ResetButtonClick(System::TObject* Sender);
	void __fastcall lbCommandsDrawItem(System::TObject* Sender, Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	void __fastcall lbShortcutsDrawItem(System::TObject* Sender, Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	
protected:
	virtual void __fastcall DoFillCommands(Classes::TStringList* ToolbarList, Classes::TStringList* ItemList, Classes::TStringList* ShortcutsList);
	virtual void __fastcall DoSkinChange(void);
public:
	/* TSpTBXCustomCustomizeForm.Create */ inline __fastcall TSpTBXCustomizeForm(Sptbxcustomizer::TSpTBXCustomizer* AOwner, Controls::TWinControl* EmbeddedParent) : Sptbxcustomizer::TSpTBXCustomCustomizeForm(AOwner, EmbeddedParent) { }
	/* TSpTBXCustomCustomizeForm.Destroy */ inline __fastcall virtual ~TSpTBXCustomizeForm(void) { }
	
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSpTBXCustomizeForm(Classes::TComponent* AOwner, int Dummy) : Sptbxcustomizer::TSpTBXCustomCustomizeForm(AOwner, Dummy) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomizeForm(HWND ParentWindow) : Sptbxcustomizer::TSpTBXCustomCustomizeForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::ResourceString _SSpTBXCustomizerFormChangeShortcut;
#define Sptbxcustomizerform_SSpTBXCustomizerFormChangeShortcut System::LoadResourceString(&Sptbxcustomizerform::_SSpTBXCustomizerFormChangeShortcut)
extern PACKAGE System::ResourceString _SSpTBXCustomizerFormChangeShortcutTitle;
#define Sptbxcustomizerform_SSpTBXCustomizerFormChangeShortcutTitle System::LoadResourceString(&Sptbxcustomizerform::_SSpTBXCustomizerFormChangeShortcutTitle)
extern PACKAGE System::ResourceString _SSpTBXCustomizerFormSeparator;
#define Sptbxcustomizerform_SSpTBXCustomizerFormSeparator System::LoadResourceString(&Sptbxcustomizerform::_SSpTBXCustomizerFormSeparator)
extern PACKAGE System::ResourceString _SSpTBXCustomizerFormBlankSeparator;
#define Sptbxcustomizerform_SSpTBXCustomizerFormBlankSeparator System::LoadResourceString(&Sptbxcustomizerform::_SSpTBXCustomizerFormBlankSeparator)

}	/* namespace Sptbxcustomizerform */
using namespace Sptbxcustomizerform;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxcustomizerformHPP
