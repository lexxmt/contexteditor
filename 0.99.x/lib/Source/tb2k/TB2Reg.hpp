// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2reg.pas' rev: 20.00

#ifndef Tb2regHPP
#define Tb2regHPP

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
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2toolwindow.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2extitems.hpp>	// Pascal unit
#include <Tb2mru.hpp>	// Pascal unit
#include <Tb2mdi.hpp>	// Pascal unit
#include <Tb2dsgnitemeditor.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2reg
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall TBRegisterClasses(Classes::TPersistentClass const *AClasses, const int AClasses_Size);
extern PACKAGE void __fastcall Register(void);

}	/* namespace Tb2reg */
using namespace Tb2reg;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2regHPP
