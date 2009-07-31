// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpcommonutilities.pas' rev: 20.00

#ifndef MpcommonutilitiesHPP
#define MpcommonutilitiesHPP

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
#include <Math.hpp>	// Pascal unit
#include <Activex.hpp>	// Pascal unit
#include <Shlobj.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Rtlconsts.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Comobj.hpp>	// Pascal unit
#include <Commctrl.hpp>	// Pascal unit
#include <Mpshelltypes.hpp>	// Pascal unit
#include <Mpresources.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpcommonutilities
{
//-- type declarations -------------------------------------------------------
typedef DynamicArray<System::WideChar> TCommonWideCharArray;

typedef DynamicArray<System::WideChar *> TCommonPWideCharArray;

typedef DynamicArray<System::WideString> TCommonWideStringDynArray;

typedef DynamicArray<int> TCommonIntegerDynArray;

#pragma option push -b-
enum TCommonDropEffect { cdeNone, cdeCopy, cdeMove, cdeLink, cdeScroll };
#pragma option pop

typedef Set<TCommonDropEffect, cdeNone, cdeScroll>  TCommonDropEffects;

#pragma option push -b-
enum TCommonOLEDragResult { cdrDrop, cdrCancel, cdrError };
#pragma option pop

#pragma option push -b-
enum TCommonKeyState { cksControl, cksLButton, cksMButton, cksRButton, cksShift, cksAlt, cksButton };
#pragma option pop

typedef Set<TCommonKeyState, cksControl, cksButton>  TCommonKeyStates;

#pragma option push -b-
enum TCommonMouseButton { cmbNone, cmbLeft, cmbRight, cmbMiddle };
#pragma option pop

#pragma option push -b-
enum TCommonVAlignment { cvaTop, cvaBottom, cvaCenter };
#pragma option pop

#pragma option push -b-
enum TCommonDrawTextWFlag { dtSingleLine, dtLeft, dtRight, dtCenter, dtTop, dtBottom, dtVCenter, dtCalcRect, dtCalcRectAdjR, dtCalcRectAlign, dtEndEllipsis, dtWordBreak, dtUserBreakChars, dtRTLReading, dtNoClip };
#pragma option pop

typedef Set<TCommonDrawTextWFlag, dtSingleLine, dtNoClip>  TCommonDrawTextWFlags;

#pragma option push -b-
enum TCommonBlendMode { cbmConstantAlpha, cbmPerPixelAlpha, cbmMasterAlpha, cbmConstantAlphaAndColor };
#pragma option pop

#pragma option push -b-
enum TShortenStringEllipsis { sseEnd, sseFront, sseMiddle, sseFilePathMiddle };
#pragma option pop

struct TCommonRGB
{
	
public:
	double R;
	double G;
	double B;
};


struct TCommonHLS
{
	
public:
	double H;
	double L;
	double S;
};


#pragma option push -b-
enum TDrawWindowButtonType { dwbtMinimize, dwbtMaximize, dwbtRestore, dwbtClose };
#pragma option pop

#pragma option push -b-
enum Mpcommonutilities__1 { enseMsgShowErrors, enseMsgRegSvr };
#pragma option pop

typedef Set<Mpcommonutilities__1, enseMsgShowErrors, enseMsgRegSvr>  TEasyNSERegMessages;

//-- var, const, procedure ---------------------------------------------------
static const System::WideChar WideNull = (System::WideChar)(0x0);
static const System::WideChar WideCR = (System::WideChar)(0xd);
static const System::WideChar WideLF = (System::WideChar)(0xa);
static const System::WideChar WideLineSeparator = (System::WideChar)(0x7ec);
static const System::WideChar WideSpace = (System::WideChar)(0x20);
static const System::WideChar WidePeriod = (System::WideChar)(0x2e);
#define Shlwapi L"shlwapi.dll"
extern PACKAGE bool Wow64Enabled;
extern PACKAGE System::WideString SEasyNSEMsg_Caption;
extern PACKAGE System::WideString SEasyNSEMsg_CannotRegister;
extern PACKAGE System::WideString SEasyNSEMsg_CannotUnRegister;
extern PACKAGE System::WideString SEasyNSEMsg_CannotFindRegSvr;
extern PACKAGE System::WideString SEasyNSEMsg_CannotFindDLL;
extern PACKAGE unsigned __stdcall (*GetDriveTypeW_MP)(System::WideChar * lpRootPathName);
extern PACKAGE int __stdcall (*DrawTextW_MP)(HDC hDC, System::WideChar * lpString, int nCount, Types::TRect &lpRect, unsigned uFormat);
extern PACKAGE unsigned __stdcall (*SHGetFileInfoW_MP)(System::WideChar * pszPath, unsigned dwFileAttributes, _SHFILEINFOW &psfi, unsigned cbFileInfo, unsigned uFlags);
extern PACKAGE unsigned __stdcall (*CreateFileW_MP)(System::WideChar * lpFileName, unsigned dwDesiredAccess, unsigned dwShareMode, Windows::PSecurityAttributes lpSecurityAttributes, unsigned dwCreationDisposition, unsigned dwFlagsAndAttributes, unsigned hTemplateFile);
extern PACKAGE HRESULT __stdcall (*SHGetDataFromIDListW_MP)(_di_IShellFolder psf, Shlobj::PItemIDList pidl, int nFormat, void * ptr, int cb);
extern PACKAGE unsigned __stdcall (*FindFirstFileW_MP)(System::WideChar * lpFileName, _WIN32_FIND_DATAW &lpFindFileData);
extern PACKAGE BOOL __stdcall (*FindNextFileW_MP)(unsigned hFindFile, _WIN32_FIND_DATAW &lpFindFileData);
extern PACKAGE BOOL __stdcall (*GetDiskFreeSpaceW_MP)(System::WideChar * lpRootPathName, unsigned &lpSectorsPerCluster, unsigned &lpBytesPerSector, unsigned &lpNumberOfFreeClusters, unsigned &lpTotalNumberOfClusters);
extern PACKAGE unsigned __stdcall (*GetCurrentDirectoryW_MP)(unsigned nBufferLength, System::WideChar * lpBuffer);
extern PACKAGE unsigned __stdcall (*GetTempPathW_MP)(unsigned nBufferLength, System::WideChar * lpBuffer);
extern PACKAGE BOOL __stdcall (*AllowSetForegroundWindow_MP)(unsigned dwProcessID);
extern PACKAGE int __stdcall (*lstrcmpiW_MP)(System::WideChar * lpString1, System::WideChar * lpString2);
extern PACKAGE int __stdcall (*lstrcmpW_MP)(System::WideChar * lpString1, System::WideChar * lpString2);
extern PACKAGE System::WideChar * __stdcall (*lstrcpynW_MP)(System::WideChar * lpString1, System::WideChar * lpString2, int iMaxLength);
extern PACKAGE System::WideChar * __stdcall (*lstrcpyW_MP)(System::WideChar * lpString1, System::WideChar * lpString2);
extern PACKAGE unsigned __stdcall (*CharLowerBuffW_MP)(System::WideChar * lpsz, unsigned cchLength);
extern PACKAGE unsigned __stdcall (*CharUpperBuffW_MP)(System::WideChar * lpsz, unsigned cchLength);
extern PACKAGE BOOL __stdcall (*CreateDirectoryW_MP)(System::WideChar * lpPathName, Windows::PSecurityAttributes lpSecurityAttributes);
extern PACKAGE unsigned __stdcall (*GetFullPathNameW_MP)(System::WideChar * lpFileName, unsigned nBufferLength, System::WideChar * lpBuffer, System::WideChar * &lpFilePart);
extern PACKAGE BOOL __stdcall (*ShellExecuteExW_MP)(Shellapi::PShellExecuteInfoW lpExecInfo);
extern PACKAGE unsigned __stdcall (*GetModuleFileNameW_MP)(unsigned hModule, System::WideChar * lpFilename, unsigned nSize);
extern PACKAGE unsigned __stdcall (*ShellExecuteW_MP)(HWND hWnd, System::WideChar * Operation, System::WideChar * FileName, System::WideChar * Parameters, System::WideChar * Directory, int ShowCmd);
extern PACKAGE unsigned __stdcall (*FindFirstChangeNotificationW_MP)(System::WideChar * lpPathName, BOOL bWatchSubtree, unsigned dwNotifyFilter);
extern PACKAGE BOOL __stdcall (*GetCharABCWidthsW_MP)(HDC DC, unsigned FirstChar, unsigned LastChar, const void *ABCStructs);
extern PACKAGE unsigned __stdcall (*GetFileAttributesW_MP)(System::WideChar * lpFileName);
extern PACKAGE unsigned __stdcall (*GetShortPathNameW_MP)(System::WideChar * lpszLongPath, System::WideChar * lpszShortPath, unsigned cchBuffer);
extern PACKAGE unsigned __stdcall (*GetSystemDirectoryW_MP)(System::WideChar * lpBuffer, unsigned uSize);
extern PACKAGE unsigned __stdcall (*GetWindowsDirectoryW_MP)(System::WideChar * lpBuffer, unsigned uSize);
extern PACKAGE BOOL __stdcall (*SetWindowTextW_MP)(HWND hWnd, System::WideChar * lpString);
extern PACKAGE HRESULT __stdcall (*SHMultiFileProperties_MP)(_di_IDataObject pdtobj, unsigned dwFlags);
extern PACKAGE HRESULT __stdcall (*SHDoDragDrop_MP)(HWND wnd, _di_IDataObject dtObj, _di_IDropSource dsrc, unsigned OKEffect, int &Effect);
extern PACKAGE BOOL __stdcall (*GetDiskFreeSpaceExA_MP)(char * lpDirectoryName, void *lpFreeBytesAvailableToCaller, void *lpTotalNumberOfBytes, Windows::PLargeInteger lpTotalNumberOfFreeBytes);
extern PACKAGE BOOL __stdcall (*GetDiskFreeSpaceExW_MP)(System::WideChar * lpDirectoryName, void *lpFreeBytesAvailableToCaller, void *lpTotalNumberOfBytes, Windows::PLargeInteger lpTotalNumberOfFreeBytes);
extern PACKAGE int __stdcall (*GetNumberFormatW_MP)(unsigned Locale, unsigned dwFlags, System::WideChar * lpValue, Windows::PNumberFmtW lpFormat, System::WideChar * lpNumberStr, int cchNumber);
extern PACKAGE HRESULT __stdcall (*CDefFolderMenu_Create2_MP)(Shlobj::PItemIDList pidlFolder, HWND wnd, unsigned cidl, Shlobj::PItemIDList &apidl, _di_IShellFolder psf, Mpshelltypes::TFNDFMCallback lpfn, unsigned nKeys, Windows::PHKEY ahkeyClsKeys, Mpshelltypes::_di_IContextMenu &ppcm);
extern PACKAGE HRESULT __stdcall (*CDefFolderMenu_Create_MP)(Shlobj::PItemIDList pidlFolder);
extern PACKAGE int __stdcall (*RegOpenKeyW_MP)(HKEY hKey, System::WideChar * lpSubKey, HKEY &phkResult);
extern PACKAGE int __stdcall (*RegOpenKeyExW_MP)(HKEY hKey, System::WideChar * lpSubKey, unsigned ulOptions, unsigned samDesired, HKEY &phkResult);
extern PACKAGE int __stdcall (*RegQueryValueW_MP)(HKEY hKey, System::WideChar * lpSubKey, System::WideChar * lpValue, int &lpcbValue);
extern PACKAGE BOOL __stdcall (*WritePrivateProfileStringW_MP)(System::WideChar * lpAppName, System::WideChar * lpKeyName, System::WideChar * lpString, System::WideChar * lpFileName);
extern PACKAGE unsigned __stdcall (*GetPrivateProfileStringW_MP)(System::WideChar * lpAppName, System::WideChar * lpKeyName, System::WideChar * lpDefault, System::WideChar * lpReturnedString, unsigned nSize, System::WideChar * lpFileName);
extern PACKAGE BOOL __stdcall (*TryEnterCriticalSection_MP)(_RTL_CRITICAL_SECTION &lpCriticalSection);
extern PACKAGE HFONT __stdcall (*CreateFontIndirectW_MP)(const tagLOGFONTW &p1);
extern PACKAGE int __stdcall (*SendMessageW_MP)(HWND hWnd, unsigned Msg, int wParam, int lParam);
extern PACKAGE BOOL __stdcall (*InsertMenuItemW_MP)(HMENU p1, unsigned p2, BOOL p3, const tagMENUITEMINFOW &p4);
extern PACKAGE BOOL __stdcall (*SetFileAttributesW_MP)(System::WideChar * lpFileName, unsigned dwFileAttributes);
extern PACKAGE BOOL __stdcall (*SystemParametersInfoW_MP)(unsigned uiAction, unsigned uiParam, void * pvParam, unsigned fWinIni);
extern PACKAGE Shlobj::PItemIDList __stdcall (*SHBrowseForFolderW_MP)(_browseinfoW &lpbi);
extern PACKAGE BOOL __stdcall (*SHGetPathFromIDListW_MP)(Shlobj::PItemIDList pidl, System::WideChar * pszPath);
extern PACKAGE int __stdcall (*SHFileOperationW_MP)(const _SHFILEOPSTRUCTW &lpFileOp);
extern PACKAGE BOOL __stdcall (*PathMatchSpecA_MP)(const char * pszFileParam, const char * pszSpec);
extern PACKAGE BOOL __stdcall (*PathMatchSpecW_MP)(const System::WideChar * pszFileParam, const System::WideChar * pszSpec);
extern PACKAGE BOOL __stdcall (*CreateProcessW_MP)(System::WideChar * lpApplicationName, System::WideChar * lpCommandLine, Windows::PSecurityAttributes lpProcessAttributes, Windows::PSecurityAttributes lpThreadAttributes, BOOL bInheritHandles, unsigned dwCreationFlags, void * lpEnvironment, System::WideChar * lpCurrentDirectory, const Windows::_STARTUPINFOW &lpStartupInfo, _PROCESS_INFORMATION &lpProcessInformation);
extern PACKAGE BOOL __stdcall (*DeleteVolumeMountPoint_MP)(char * lpszVolumeMountPoint);
extern PACKAGE BOOL __stdcall (*GetVolumeNameForVolumeMountPoint_MP)(char * lpszVolumeMountPoint, char * lpszVolumeName, unsigned cchBufferLength);
extern PACKAGE BOOL __stdcall (*GetVolumePathName_MP)(char * lpszFileName, System::WideChar * lpszVolumePathName, unsigned cchBufferLength);
extern PACKAGE BOOL __fastcall (*SetVolumeMountPoint_MP)(char * lpszVolumeMountPoint, char * lpszVolumeName);
extern PACKAGE unsigned __stdcall (*FindFirstVolume_MP)(System::WideChar * lpszVolumeName, unsigned cchBufferLength);
extern PACKAGE BOOL __stdcall (*FindNextVolume_MP)(unsigned hFindVolume, System::WideChar * lpszVolumeName, unsigned cchBufferLength);
extern PACKAGE BOOL __stdcall (*FindVolumeClose_MP)(unsigned hFindVolume);
extern PACKAGE unsigned __stdcall (*FindFirstVolumeMountPoint_MP)(System::WideChar * lpszRootPathName, System::WideChar * lpszVolumeMountPoint, unsigned cchBufferLength);
extern PACKAGE BOOL __stdcall (*FindNextVolumeMountPoint_MP)(unsigned hFindVolumeMountPoint, System::WideChar * lpszVolumeMountPoint, unsigned cchBufferLength);
extern PACKAGE BOOL __stdcall (*FindVolumeMountPointClose_MP)(unsigned hFindVolumeMountPoint);
extern PACKAGE HRESULT __stdcall (*SHGetKnownFolderPath_MP)(const GUID &rfid, unsigned dwFlags, unsigned hToken, /* out */ System::WideChar * &ppszPath);
extern PACKAGE unsigned __stdcall (*FindFirstFileExW_MP)(System::WideChar * lpFileName, unsigned fInfoLevelId, _WIN32_FIND_DATAW &lpFindFileData, unsigned fSearchOp, void * lpSearchFilter, unsigned dwAdditionalFlags);
extern PACKAGE unsigned __stdcall (*FindFirstFileExA_MP)(char * lpFileName, unsigned fInfoLevelId, _WIN32_FIND_DATAA &lpFindFileData, unsigned fSearchOp, void * lpSearchFilter, unsigned dwAdditionalFlags);
extern PACKAGE unsigned __stdcall (*ExpandEnvironmentStringsW_MP)(System::WideChar * lpSrc, System::WideChar * lpDst, unsigned nSize);
extern PACKAGE BOOL __stdcall (*ExpandEnvironmentStringsForUserW_MP)(unsigned hToken, System::WideChar * lpSrc, System::WideChar * lpDst, unsigned nSize);
extern PACKAGE BOOL __stdcall (*ExpandEnvironmentStringsForUserA_MP)(unsigned hToken, char * lpSrc, char * lpDst, unsigned nSize);
extern PACKAGE BOOL __stdcall (*TrackMouseEvent_MP)(tagTRACKMOUSEEVENT &EventTrack);
extern PACKAGE BOOL __stdcall (*CopyFileW_MP)(System::WideChar * lpExistingFileName, System::WideChar * lpNewFileName, BOOL bFailIfExists);
extern PACKAGE BOOL __stdcall (*Wow64RevertWow64FsRedirection_MP)(void * OldValue);
extern PACKAGE BOOL __stdcall (*Wow64DisableWow64FsRedirection_MP)(void * &OldValue);
extern PACKAGE bool __stdcall (*Wow64EnableWow64FsRedirection_MP)(bool Wow64FsEnableDirection);
extern PACKAGE bool SumFolderAbort;
extern PACKAGE unsigned __fastcall ShiftStateToKeys(Classes::TShiftState Keys);
extern PACKAGE System::WideString __fastcall ShiftStateToStr(Classes::TShiftState Keys);
extern PACKAGE bool __fastcall ExecShellEx(const System::WideString Cmd, const System::WideString Params, const System::WideString Dir, int ShowCmd, bool DoWait, bool WaitForDDE = false, bool WaitForIdleInput = false);
extern PACKAGE bool __fastcall RegUnregNSE(const System::WideString AFileName, bool DoRegister, TEasyNSERegMessages AMessages = (TEasyNSERegMessages() << enseMsgShowErrors ));
extern PACKAGE bool __fastcall RegisterNSE(const System::WideString AFileName, TEasyNSERegMessages AMessages = (TEasyNSERegMessages() << enseMsgShowErrors ));
extern PACKAGE bool __fastcall UnregisterNSE(const System::WideString AFileName, TEasyNSERegMessages AMessages = (TEasyNSERegMessages() << enseMsgShowErrors ));
extern PACKAGE void __fastcall MakeFindDataW(const _WIN32_FIND_DATAA &FindFileDataA, _WIN32_FIND_DATAW &FindFileDataW);
extern PACKAGE bool __fastcall WideDirectoryExists(const System::WideString Name);
extern PACKAGE bool __fastcall WideDeleteDirEx(const System::WideString DirName);
extern PACKAGE bool __fastcall WideCreateDir(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideExcludeTrailingBackslash(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideExpandEnviromentString(System::WideString EnviromentString);
extern PACKAGE System::WideString __fastcall WideExpandEnviromentStringForUser(System::WideString EnviromentString);
extern PACKAGE System::WideString __fastcall WideExtractFilePath(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideExtractFileName(System::WideString Path);
extern PACKAGE bool __fastcall WideFileExists(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideExtractFileDir(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideExtractFileDrive(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideExtractFileExt(System::WideString Path);
extern PACKAGE unsigned __fastcall WideFindFirstFileEx(System::WideString FileName, _WIN32_FIND_DATAW &lpFindFileData, System::WideString Mask, bool CaseSensitive);
extern PACKAGE bool __fastcall WideFindFirstFileExExists(void);
extern PACKAGE void __fastcall FixFormFont(Graphics::TFont* AFont);
extern PACKAGE bool __fastcall WideForceDirectories(const System::WideString FileName);
extern PACKAGE void __fastcall FillGradient(int X1, int Y1, int X2, int Y2, Graphics::TColor fStartColor, Graphics::TColor fStopColor, int StartPoint, int EndPoint, Graphics::TCanvas* fDrawCanvas);
extern PACKAGE System::WideString __fastcall DropEffectToStr(unsigned DropEffect);
extern PACKAGE bool __fastcall EqualWndMethod(Classes::TWndMethod A, Classes::TWndMethod B);
extern PACKAGE System::WideChar * __fastcall FindRootToken(const System::WideString Path);
extern PACKAGE Graphics::TBitmap* __fastcall FlipReverseCopyRect(const bool Flip, const bool Reverse, const Graphics::TBitmap* Bitmap)/* overload */;
extern PACKAGE void __fastcall FlipReverseCopyRect(const bool Flip, const bool Reverse, const Types::TRect &R, const Graphics::TCanvas* Canvas)/* overload */;
extern PACKAGE bool __fastcall FileExistsW(const System::WideString FileName);
extern PACKAGE bool __fastcall IsMappedDrivePath(const System::WideString Path);
extern PACKAGE unsigned __fastcall FindUniqueMenuID(HMENU AMenu);
extern PACKAGE int __fastcall AddContextMenuItem(HMENU Menu, System::WideString ACaption, int Index, unsigned MenuID = (unsigned)(0xffff), unsigned hSubMenu = (unsigned)(0x0), bool Enabled = true, bool Checked = false, bool Default = false);
extern PACKAGE void __fastcall ShadowBlendBits(Graphics::TBitmap* Bits, Graphics::TColor BackGndColor);
extern PACKAGE System::WideChar * __fastcall WideStrMove(System::WideChar * Dest, System::WideChar * Source, unsigned Count);
extern PACKAGE System::WideChar * __fastcall WideStrRScan(System::WideChar * Str, System::WideChar Chr);
extern PACKAGE System::WideChar * __fastcall WideStrScan(System::WideChar * Str, System::WideChar Chr);
extern PACKAGE System::WideString __fastcall WideUpperCase(const System::WideString S);
extern PACKAGE unsigned __fastcall CommonLoadLibrary(System::AnsiString LibraryName);
extern PACKAGE bool __fastcall CommonUnloadLibrary(System::AnsiString LibraryName);
extern PACKAGE void __fastcall CommonUnloadAllLibraries(void);
extern PACKAGE void __fastcall DrawWindowButton(Graphics::TCanvas* Canvas, const Types::TPoint &Pos, int Size, TDrawWindowButtonType ButtonType);
extern PACKAGE void __fastcall DrawRadioButton(Graphics::TCanvas* Canvas, const Types::TPoint &Pos, int Size, Graphics::TColor clBackground, Graphics::TColor clHotBkGnd, Graphics::TColor clLeftOuter, Graphics::TColor clRightOuter, Graphics::TColor clLeftInner, Graphics::TColor clRightInner, bool Checked, bool Enabled, bool Hot);
extern PACKAGE void __fastcall DrawCheckBox(Graphics::TCanvas* Canvas, const Types::TPoint &Pos, int Size, Graphics::TColor clBackground, Graphics::TColor clHotBkGnd, Graphics::TColor clLeftOuter, Graphics::TColor clRightOuter, Graphics::TColor clLeftInner, Graphics::TColor clRightInner, bool Checked, bool Enabled, bool Hot);
extern PACKAGE Types::TRect __fastcall CheckBounds(int Size, System::WideChar Character = (System::WideChar)(0x67));
extern PACKAGE bool __fastcall HasMMX(void);
extern PACKAGE void __fastcall ConvertBitmapEx(Graphics::TBitmap* Image32, Graphics::TBitmap* &OutImage, const Graphics::TColor BackGndColor);
extern PACKAGE void __fastcall AlphaBlend(HDC Source, HDC Destination, const Types::TRect &R, const Types::TPoint &Target, TCommonBlendMode Mode, int ConstantAlpha, int Bias);
extern PACKAGE int __fastcall DrawTextWEx(HDC DC, System::WideString Text, Types::TRect &lpRect, TCommonDrawTextWFlags Flags, int MaxLineCount);
extern PACKAGE void * __fastcall CreateStub(void * ObjectPtr, void * MethodPtr);
extern PACKAGE void __fastcall DisposeStub(void * Stub);
extern PACKAGE void __fastcall CreateProcessMP(System::WideString ExeFile, System::WideString Parameters, System::WideString InitalDir);
extern PACKAGE Types::TRect __fastcall DiffRectHorz(const Types::TRect &Rect1, const Types::TRect &Rect2);
extern PACKAGE Types::TRect __fastcall DiffRectVert(const Types::TRect &Rect1, const Types::TRect &Rect2);
extern PACKAGE Types::TRect __fastcall AbsRect(const Types::TRect &ARect);
extern PACKAGE Types::TRect __fastcall CenterRectInRect(const Types::TRect &OuterRect, const Types::TRect &InnerRect);
extern PACKAGE Types::TRect __fastcall CenterRectHorz(const Types::TRect &OuterRect, const Types::TRect &InnerRect);
extern PACKAGE Types::TRect __fastcall CenterRectVert(const Types::TRect &OuterRect, const Types::TRect &InnerRect);
extern PACKAGE bool __fastcall CommonSupports(const System::_di_IInterface Instance, const GUID &IID, /* out */ void *Intf)/* overload */;
extern PACKAGE bool __fastcall CommonSupports(const System::TObject* Instance, const GUID &IID, /* out */ void *Intf)/* overload */;
extern PACKAGE bool __fastcall CommonSupports(const System::_di_IInterface Instance, const GUID &IID)/* overload */;
extern PACKAGE bool __fastcall CommonSupports(const System::TObject* Instance, const GUID &IID)/* overload */;
extern PACKAGE void __fastcall CopyToNullBufferA(System::WideString S, char * Buffer, unsigned CharCount);
extern PACKAGE void __fastcall CopyToNullBufferW(System::WideString S, System::WideChar * Buffer, unsigned CharCount);
extern PACKAGE void __fastcall MinMax(int &A, int &B);
extern PACKAGE bool __fastcall IsRectProper(const Types::TRect &Rect);
extern PACKAGE System::WideString __fastcall AddCommas(System::WideString NumberString);
extern PACKAGE bool __fastcall AsyncLeftButtonDown(void);
extern PACKAGE bool __fastcall AsyncRightButtonDown(void);
extern PACKAGE bool __fastcall AsyncMiddleButtonDown(void);
extern PACKAGE bool __fastcall AsyncControlDown(void);
extern PACKAGE bool __fastcall AsyncShiftDown(void);
extern PACKAGE __int64 __fastcall CalcuateFolderSize(System::WideString FolderPath, bool Recurse);
extern PACKAGE Shlobj::PItemIDList __fastcall GetMyDocumentsVirtualFolder(void);
extern PACKAGE void __fastcall WideInsert(System::WideString Source, System::WideString &S, int Index);
extern PACKAGE System::WideString __fastcall WideGetCurrentDir();
extern PACKAGE System::WideString __fastcall WideGetTempDir();
extern PACKAGE System::WideString __fastcall WideIncludeTrailingBackslash(System::WideString Path);
extern PACKAGE int __fastcall WideIncrementalSearch(System::WideString CompareStr, System::WideString Mask);
extern PACKAGE System::WideString __fastcall WideIntToStr(int Value);
extern PACKAGE bool __fastcall WideIsDrive(System::WideString Drive);
extern PACKAGE bool __fastcall WideIsFloppy(System::WideString FileFolder);
extern PACKAGE bool __fastcall IsAnyMouseButtonDown(void);
extern PACKAGE bool __fastcall IsFTPPath(System::WideString Path);
extern PACKAGE System::WideString __fastcall WideNewFolderName(System::WideString ParentFolder, System::WideString SuggestedFolderName = L"");
extern PACKAGE bool __fastcall WidePathMatchSpec(System::WideString Path, System::WideString Mask);
extern PACKAGE bool __fastcall WidePathMatchSpecExists(void);
extern PACKAGE bool __fastcall WideIsPathDelimiter(const System::WideString S, int Index);
extern PACKAGE bool __fastcall IsTextTrueType(HDC DC)/* overload */;
extern PACKAGE bool __fastcall IsTextTrueType(Graphics::TCanvas* Canvas)/* overload */;
extern PACKAGE bool __fastcall IsUNCPath(const System::WideString Path);
extern PACKAGE bool __fastcall IsUNCPathSyntax(const System::WideString Path);
extern PACKAGE System::WideString __fastcall StrRetToStr(const _STRRET &StrRet, Shlobj::PItemIDList APIDL);
extern PACKAGE System::WideString __fastcall SystemDirectory();
extern PACKAGE HFONT __fastcall SysMenuFont(void);
extern PACKAGE int __fastcall SysMenuHeight(void);
extern PACKAGE tagSIZE __fastcall TextExtentW(System::WideString Text, Graphics::TFont* Font)/* overload */;
extern PACKAGE tagSIZE __fastcall TextExtentW(System::WideString Text, Graphics::TCanvas* Canvas)/* overload */;
extern PACKAGE tagSIZE __fastcall TextExtentW(System::WideChar * Text, Graphics::TCanvas* Canvas)/* overload */;
extern PACKAGE tagSIZE __fastcall TextExtentW(System::WideChar * Text, HDC DC)/* overload */;
extern PACKAGE tagSIZE __fastcall TextTrueExtentsW(System::WideString Text, HDC DC);
extern PACKAGE System::WideString __fastcall UniqueFileName(const System::WideString AFilePath);
extern PACKAGE bool __fastcall TNTConditionallyDefined(void);
extern PACKAGE bool __fastcall UnicodeStringLists(void);
extern PACKAGE System::WideString __fastcall UniqueDirName(const System::WideString ADirPath);
extern PACKAGE System::WideString __fastcall WideStripExt(System::WideString AFile);
extern PACKAGE System::WideString __fastcall WideStripRemoteComputer(const System::WideString UNCPath);
extern PACKAGE System::WideString __fastcall WideStripTrailingBackslash(const System::WideString S, bool Force = false);
extern PACKAGE System::WideString __fastcall WideStripLeadingBackslash(const System::WideString S);
extern PACKAGE System::WideString __fastcall WideStringReplace(const System::WideString S, const System::WideString OldPattern, const System::WideString NewPattern, Sysutils::TReplaceFlags Flags, bool WholeWord = false);
extern PACKAGE unsigned __fastcall WideShellExecute(HWND hWnd, System::WideString Operation, System::WideString FileName, System::WideString Parameters, System::WideString Directory, int ShowCmd = 0x1);
extern PACKAGE void __fastcall WideShowMessage(HWND Window, System::WideString ACaption, System::WideString AMessage);
extern PACKAGE System::WideString __fastcall WideLowerCase(const System::WideString Str);
extern PACKAGE int __fastcall WideMessageBox(HWND Window, const System::WideString ACaption, const System::WideString AMessage, int uType);
extern PACKAGE System::WideString __fastcall IncludeTrailingBackslashW(const System::WideString S);
extern PACKAGE bool __fastcall DiskInDrive(char C);
extern PACKAGE int __fastcall WideStrIComp(System::WideChar * Str1, System::WideChar * Str2);
extern PACKAGE System::WideChar * __fastcall StrRScanW(System::WideChar * Str, System::WideChar Chr);
extern PACKAGE int __fastcall WideStrComp(System::WideChar * Str1, System::WideChar * Str2);
extern PACKAGE System::WideChar * __fastcall WideStrLower(System::WideChar * Str);
extern PACKAGE void __fastcall WideStrLCopy(System::WideChar * Str1, System::WideChar * Str2, int Count);
extern PACKAGE System::WideString __fastcall ShortenStringEx(HDC DC, const System::WideString S, int Width, bool RTL, TShortenStringEllipsis EllipsisPlacement);
extern PACKAGE System::WideString __fastcall WindowsDirectory();
extern PACKAGE System::WideString __fastcall ModuleFileName(bool PathOnly = true);
extern PACKAGE System::WideString __fastcall PIDLToPath(Shlobj::PItemIDList PIDL);
extern PACKAGE System::WideString __fastcall ShortFileName(const System::WideString FileName);
extern PACKAGE System::WideString __fastcall ShortPath(const System::WideString Path);
extern PACKAGE void __fastcall LoadWideString(Classes::TStream* S, System::WideString &Str);
extern PACKAGE bool __fastcall UsesAlphaChannel(Graphics::TBitmap* Image32);
extern PACKAGE void __fastcall SaveWideString(Classes::TStream* S, System::WideString Str);
extern PACKAGE System::WideChar * __fastcall WideStrPos(System::WideChar * Str, System::WideChar * SubStr);
extern PACKAGE Types::TRect __fastcall ProperRect(const Types::TRect &Rect);
extern PACKAGE bool __fastcall DragDetectPlus(HWND Handle, const Types::TPoint &Pt);
extern PACKAGE void __fastcall FillWideChar(void *Dest, int count, System::WideChar Value);
extern PACKAGE void __fastcall FreeMemAndNil(void * &P);
extern PACKAGE bool __fastcall IsRectNull(const Types::TRect &ARect);
extern PACKAGE bool __fastcall IsUnicode(void);
extern PACKAGE bool __fastcall IsWinNT(void);
extern PACKAGE bool __fastcall IsWin2000(void);
extern PACKAGE bool __fastcall IsWin95_SR1(void);
extern PACKAGE bool __fastcall IsWinME(void);
extern PACKAGE bool __fastcall IsWinNT4(void);
extern PACKAGE bool __fastcall IsWinXP(void);
extern PACKAGE bool __fastcall IsWinXPOrUp(void);
extern PACKAGE bool __fastcall IsWinVista(void);
extern PACKAGE bool __fastcall IsWinVistaOrUp(void);
extern PACKAGE int __fastcall RectHeight(const Types::TRect &R);
extern PACKAGE System::UnicodeString __fastcall RectToStr(const Types::TRect &R);
extern PACKAGE Types::TRect __fastcall RectToSquare(const Types::TRect &R);
extern PACKAGE int __fastcall RectWidth(const Types::TRect &R);
extern PACKAGE bool __fastcall ContainsRect(const Types::TRect &OuterRect, const Types::TRect &InnerRect);
extern PACKAGE Classes::TShiftState __fastcall KeyDataToShiftState(int KeyData);
extern PACKAGE TCommonDropEffect __fastcall DropEffectToDropEffectState(int Effect);
extern PACKAGE int __fastcall DropEffectStateToDropEffect(TCommonDropEffect Effect);
extern PACKAGE TCommonDropEffects __fastcall DropEffectToDropEffectStates(int Effect);
extern PACKAGE int __fastcall DropEffectStatesToDropEffect(TCommonDropEffects Effect);
extern PACKAGE TCommonKeyStates __fastcall KeyToKeyStates(System::Word Keys);
extern PACKAGE TCommonMouseButton __fastcall KeyStatesToMouseButton(System::Word Keys);
extern PACKAGE unsigned __fastcall KeyStatesToKey(TCommonKeyStates Keys);
extern PACKAGE TCommonDropEffect __fastcall KeyStateToDropEffect(TCommonKeyStates Keys);
extern PACKAGE TCommonMouseButton __fastcall KeyStateToMouseButton(TCommonKeyStates KeyState);
extern PACKAGE BOOL __stdcall FileIconInit(BOOL FullInit);
extern PACKAGE HRESULT __stdcall SHGetImageList(int iImageList, const GUID &RefID, /* out */ void *ppvOut);
extern PACKAGE tagSIZE __fastcall Size(int cx, int cy);
extern PACKAGE System::WideString __fastcall ShortenTextW(HDC DC, System::WideString TextToShorten, int MaxSize);
extern PACKAGE int __fastcall SplitTextW(HDC DC, System::WideString TextToSplit, int MaxWidth, TCommonWideCharArray &Buffer, int MaxSplits);
extern PACKAGE System::WideString __fastcall VariantToCaption(const System::Variant &V);
extern PACKAGE System::WideChar * __fastcall StrCopyW(System::WideChar * Dest, System::WideChar * Source);
extern PACKAGE TCommonRGB __fastcall BrightenColor(const TCommonRGB &RGB, double Amount);
extern PACKAGE TCommonRGB __fastcall DarkenColor(const TCommonRGB &RGB, double Amount);
extern PACKAGE TCommonHLS __fastcall RGBToHLS(const TCommonRGB &RGB);
extern PACKAGE TCommonRGB __fastcall HLSToRGB(const TCommonHLS &HLS);
extern PACKAGE TCommonRGB __fastcall MakeTRBG(Graphics::TColor Color);
extern PACKAGE Graphics::TColor __fastcall MakeTColor(const TCommonRGB &RGB);
extern PACKAGE unsigned __fastcall MakeColorRef(const TCommonRGB &RGB, double Gamma = 1.000000E+00);
extern PACKAGE void __fastcall GammaCorrection(TCommonRGB &RGB, double Gamma);
extern PACKAGE bool __fastcall MakeSafeColor(TCommonRGB &RGB);
extern PACKAGE bool __fastcall UpsideDownDIB(Graphics::TBitmap* Bits);
extern PACKAGE void __fastcall ActivateTopLevelWindow(HWND Child);

}	/* namespace Mpcommonutilities */
using namespace Mpcommonutilities;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpcommonutilitiesHPP
