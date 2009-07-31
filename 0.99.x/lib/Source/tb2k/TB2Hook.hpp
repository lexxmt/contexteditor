// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2hook.pas' rev: 20.00

#ifndef Tb2hookHPP
#define Tb2hookHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2hook
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum THookProcCode { hpSendActivate, hpSendActivateApp, hpSendWindowPosChanged, hpPreDestroy, hpGetMessage };
#pragma option pop

typedef Set<THookProcCode, hpSendActivate, hpGetMessage>  THookProcCodes;

typedef void __fastcall (*THookProc)(THookProcCode Code, HWND Wnd, int WParam, int LParam);

//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall InstallHookProc(System::TObject* AUser, THookProc AProc, THookProcCodes ACodes);
extern PACKAGE void __fastcall UninstallHookProc(System::TObject* AUser, THookProc AProc);

}	/* namespace Tb2hook */
using namespace Tb2hook;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2hookHPP
