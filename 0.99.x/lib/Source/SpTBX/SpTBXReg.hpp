// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxreg.pas' rev: 20.00

#ifndef SptbxregHPP
#define SptbxregHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Tb2reg.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2dsgnitemeditor.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxtabs.hpp>	// Pascal unit
#include <Sptbxdkpanels.hpp>	// Pascal unit
#include <Sptbxformpopupmenu.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit
#include <Sptbxeditors.hpp>	// Pascal unit
#include <Sptbxexteditors.hpp>	// Pascal unit
#include <Sptbxcustomizer.hpp>	// Pascal unit
#include <Sptbxmdimru.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxreg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSpTBXItemsEditor;
class PASCALIMPLEMENTATION TSpTBXItemsEditor : public Tb2dsgnitemeditor::TTBItemsEditor
{
	typedef Tb2dsgnitemeditor::TTBItemsEditor inherited;
	
public:
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TSpTBXItemsEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Tb2dsgnitemeditor::TTBItemsEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSpTBXItemsEditor(void) { }
	
};


class DELPHICLASS TSpTBXImageIndexEditor;
class PASCALIMPLEMENTATION TSpTBXImageIndexEditor : public Designeditors::TIntegerProperty
{
	typedef Designeditors::TIntegerProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
	virtual Imglist::TCustomImageList* __fastcall GetImageListAt(int Index);
	void __fastcall ListMeasureHeight(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, int &AHeight);
	void __fastcall ListMeasureWidth(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, int &AWidth);
	void __fastcall ListDrawValue(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TSpTBXImageIndexEditor(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TIntegerProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TSpTBXImageIndexEditor(void) { }
	
private:
	void *__ICustomPropertyListDrawing;	/* Vcleditors::ICustomPropertyListDrawing */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyListDrawing()
	{
		Vcleditors::_di_ICustomPropertyListDrawing intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyListDrawing*(void) { return (ICustomPropertyListDrawing*)&__ICustomPropertyListDrawing; }
	#endif
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall Register(void);

}	/* namespace Sptbxreg */
using namespace Sptbxreg;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxregHPP
