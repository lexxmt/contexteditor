// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2dsgnconvertoptions.pas' rev: 20.00

#ifndef Tb2dsgnconvertoptionsHPP
#define Tb2dsgnconvertoptionsHPP

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

//-- user supplied -----------------------------------------------------------

namespace Tb2dsgnconvertoptions
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TTBConvertOptionsForm;
class PASCALIMPLEMENTATION TTBConvertOptionsForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TComboBox* MenuCombo;
	Stdctrls::TLabel* Label1;
	Stdctrls::TButton* ConvertButton;
	Stdctrls::TButton* HelpButton;
	Stdctrls::TButton* Button1;
	void __fastcall HelpButtonClick(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TTBConvertOptionsForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TTBConvertOptionsForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TTBConvertOptionsForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TTBConvertOptionsForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Tb2dsgnconvertoptions */
using namespace Tb2dsgnconvertoptions;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2dsgnconvertoptionsHPP
