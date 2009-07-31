// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2dsgnconverter.pas' rev: 20.00

#ifndef Tb2dsgnconverterHPP
#define Tb2dsgnconverterHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2dsgnconverter
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TTBConverterForm;
class PASCALIMPLEMENTATION TTBConverterForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TListBox* MessageList;
	Stdctrls::TButton* CloseButton;
	Stdctrls::TButton* CopyButton;
	void __fastcall CloseButtonClick(System::TObject* Sender);
	void __fastcall CopyButtonClick(System::TObject* Sender);
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TTBConverterForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TTBConverterForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TTBConverterForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TTBConverterForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall DoConvert(const Tb2item::TTBCustomItem* ParentItem, const Classes::TComponent* Owner);

}	/* namespace Tb2dsgnconverter */
using namespace Tb2dsgnconverter;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2dsgnconverterHPP
