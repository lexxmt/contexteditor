// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2anim.pas' rev: 20.00

#ifndef Tb2animHPP
#define Tb2animHPP

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

//-- user supplied -----------------------------------------------------------

namespace Tb2anim
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum Tb2anim__1 { tbadLeft, tbadRight, tbadDown, tbadUp };
#pragma option pop

typedef Set<Tb2anim__1, tbadLeft, tbadUp>  TTBAnimationDirection;

//-- var, const, procedure ---------------------------------------------------
static const Word WM_TB2K_ANIMATIONENDED = 0x956;
extern PACKAGE bool __fastcall TBIsAnimationInProgress(void);
extern PACKAGE void __fastcall TBEndAnimation(const HWND Wnd);
extern PACKAGE void __fastcall TBStartAnimation(const HWND AWnd, const bool ABlend, const TTBAnimationDirection ADirection);
extern PACKAGE void __fastcall TBUpdateAnimation(void);

}	/* namespace Tb2anim */
using namespace Tb2anim;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2animHPP
