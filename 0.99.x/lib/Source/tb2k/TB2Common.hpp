// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Tb2common.pas' rev: 20.00

#ifndef Tb2commonHPP
#define Tb2commonHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Tb2common
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (*THandleWMPrintNCPaintProc)(HWND Wnd, HDC DC, System::TObject* AppData);

typedef void __fastcall (__closure *TPaintHandlerProc)(Messages::TWMPaint &Message);

typedef void * TListItemType;

typedef int ClipToLongint;

//-- var, const, procedure ---------------------------------------------------
static const ShortInt PopupMenuWindowNCSize = 0x3;
static const int DT_HIDEPREFIX = 0x100000;
extern PACKAGE bool __fastcall ApplicationIsActive(void);
extern PACKAGE void __fastcall HandleWMPrint(const HWND Wnd, Messages::TMessage &Message, const THandleWMPrintNCPaintProc NCPaintFunc, const System::TObject* AppData);
extern PACKAGE void __fastcall HandleWMPrintClient(const TPaintHandlerProc PaintHandlerProc, const Messages::TMessage &Message);
extern PACKAGE int __fastcall GetTextHeight(const HDC DC);
extern PACKAGE System::UnicodeString __fastcall StripAccelChars(const System::UnicodeString S);
extern PACKAGE System::UnicodeString __fastcall EscapeAmpersands(const System::UnicodeString S);
extern PACKAGE System::UnicodeString __fastcall StripTrailingPunctuation(const System::UnicodeString S);
extern PACKAGE int __fastcall GetTextWidth(const HDC DC, System::UnicodeString S, const bool Prefix);
extern PACKAGE void __fastcall ProcessPaintMessages(void);
extern PACKAGE void __fastcall RemoveMessages(const int AMin, const int AMax);
extern PACKAGE void __fastcall SelectNCUpdateRgn(HWND Wnd, HDC DC, HRGN Rgn);
extern PACKAGE bool __fastcall AddToList(Classes::TList* &List, System::TObject* Item);
extern PACKAGE bool __fastcall AddToFrontOfList(Classes::TList* &List, System::TObject* Item);
extern PACKAGE void __fastcall RemoveFromList(Classes::TList* &List, System::TObject* Item);
extern PACKAGE int __fastcall GetMenuShowDelay(void);
extern PACKAGE bool __fastcall AreFlatMenusEnabled(void);
extern PACKAGE bool __fastcall AreKeyboardCuesEnabled(void);
extern PACKAGE HBITMAP __fastcall CreateMonoBitmap(const int AWidth, const int AHeight, System::Byte const *ABits, const int ABits_Size);
extern PACKAGE HBRUSH __fastcall CreateHalftoneBrush(void);
extern PACKAGE void __fastcall DrawHalftoneInvertRect(const HDC DC, const Types::TRect &NewRect, const Types::TRect &OldRect, const tagSIZE &NewSize, const tagSIZE &OldSize);
extern PACKAGE bool __fastcall IsFillRectWithGradientAvailable(void);
extern PACKAGE void __fastcall FillRectWithGradient(const HDC DC, const Types::TRect &R, const unsigned StartColor, const unsigned EndColor, const bool HorizontalDirection);
extern PACKAGE void __fastcall DrawSmallWindowCaption(const HWND Wnd, const HDC DC, const Types::TRect &ARect, const System::UnicodeString AText, const bool AActive);
extern PACKAGE void __fastcall DoubleBufferedRepaint(const HWND Wnd);
extern PACKAGE bool __fastcall MethodsEqual(const System::TMethod &M1, const System::TMethod &M2);
extern PACKAGE Types::TRect __fastcall GetRectOfPrimaryMonitor(const bool WorkArea);
extern PACKAGE bool __fastcall UsingMultipleMonitors(void);
extern PACKAGE Types::TRect __fastcall GetRectOfMonitorContainingRect(const Types::TRect &R, const bool WorkArea);
extern PACKAGE Types::TRect __fastcall GetRectOfMonitorContainingPoint(const Types::TPoint &P, const bool WorkArea);
extern PACKAGE Types::TRect __fastcall GetRectOfMonitorContainingWindow(const HWND W, const bool WorkArea);
extern PACKAGE void __fastcall InitTrackMouseEvent(void);
extern PACKAGE bool __fastcall CallTrackMouseEvent(const HWND Wnd, const unsigned Flags);
extern PACKAGE void __fastcall CallLockSetForegroundWindow(const bool ALock);
extern PACKAGE int __fastcall DrawTextStr(const HDC DC, const System::UnicodeString AText, Types::TRect &ARect, const unsigned AFormat);
extern PACKAGE BOOL __fastcall GetTextExtentPoint32Str(const HDC DC, const System::UnicodeString AText, /* out */ tagSIZE &ASize);
extern PACKAGE BOOL __fastcall TextOutStr(const HDC DC, const int X, const int Y, const System::UnicodeString AText);
extern PACKAGE HFONT __fastcall CreateRotatedFont(HDC DC);
extern PACKAGE void __fastcall DrawRotatedText(const HDC DC, System::UnicodeString AText, const Types::TRect &ARect, const unsigned AFormat);
extern PACKAGE bool __fastcall NeedToPlaySound(const System::UnicodeString Alias);
extern PACKAGE void __fastcall PlaySystemSound(const System::UnicodeString Alias);
extern PACKAGE int __fastcall Max(int A, int B);
extern PACKAGE int __fastcall Min(int A, int B);
extern PACKAGE System::WideChar __fastcall FindAccelChar(const System::UnicodeString S);
extern PACKAGE bool __fastcall IsWindowsXP(void);
extern PACKAGE unsigned __fastcall GetInputLocaleCodePage(void);
extern PACKAGE Types::TPoint __fastcall GetMessagePosAsPoint();
extern PACKAGE bool __fastcall GetSystemNonClientMetrics(tagNONCLIENTMETRICSW &Metrics);
extern PACKAGE BOOL __fastcall GetSystemParametersInfoBool(const unsigned Param, const BOOL Default);
extern PACKAGE System::WideChar __fastcall CharToLower(const System::WideChar C);

}	/* namespace Tb2common */
using namespace Tb2common;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Tb2commonHPP
