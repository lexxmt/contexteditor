// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpthreadmanager.pas' rev: 20.00

#ifndef MpthreadmanagerHPP
#define MpthreadmanagerHPP

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
#include <Controls.hpp>	// Pascal unit
#include <Shlobj.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Activex.hpp>	// Pascal unit
#include <Mpshelltypes.hpp>	// Pascal unit
#include <Mpcommonobjects.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpthreadmanager
{
//-- type declarations -------------------------------------------------------
typedef ShortInt TCommonThreadPriority;

class DELPHICLASS TPIDLCallbackThreadRequest;
typedef void __fastcall (__closure *TNamespaceCallbackProc)(TPIDLCallbackThreadRequest* Request);

class DELPHICLASS TCommonThreadRequest;
#pragma pack(push,1)
struct TWMThreadRequest
{
	
public:
	unsigned Msg;
	int RequestID;
	TCommonThreadRequest* Request;
	int Result;
};
#pragma pack(pop)


#pragma option push -b-
enum TCommonThreadDirection { etdFirstInFirstOut, etdFirstInLastOut };
#pragma option pop

struct TThreadNameInfoA
{
	
public:
	unsigned FType;
	char *FName;
	unsigned FThreadID;
	unsigned FFlags;
};


class DELPHICLASS TCommonThread;
class PASCALIMPLEMENTATION TCommonThreadRequest : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	unsigned FID;
	TCommonThreadPriority FPriority;
	int FRefCount;
	int FTag;
	TCommonThread* FThread;
	Controls::TWinControl* FWindow;
	void *FItem;
	int FRemainingRequests;
	unsigned FCallbackWndMessage;
	
protected:
	__property int RefCount = {read=FRefCount, write=FRefCount, nodefault};
	
public:
	__fastcall virtual TCommonThreadRequest(void);
	__fastcall virtual ~TCommonThreadRequest(void);
	virtual bool __fastcall HandleRequest(void) = 0 ;
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall Prioritize(Classes::TList* RequestList);
	void __fastcall Release(void);
	__property unsigned CallbackWndMessage = {read=FCallbackWndMessage, write=FCallbackWndMessage, nodefault};
	__property void * Item = {read=FItem, write=FItem};
	__property unsigned ID = {read=FID, write=FID, nodefault};
	__property TCommonThreadPriority Priority = {read=FPriority, write=FPriority, default=50};
	__property int RemainingRequests = {read=FRemainingRequests, write=FRemainingRequests, nodefault};
	__property int Tag = {read=FTag, write=FTag, nodefault};
	__property TCommonThread* Thread = {read=FThread};
	__property Controls::TWinControl* Window = {read=FWindow, write=FWindow};
};


typedef TMetaClass* TCommonThreadRequestClass;

class DELPHICLASS TPIDLThreadRequest;
class PASCALIMPLEMENTATION TPIDLThreadRequest : public TCommonThreadRequest
{
	typedef TCommonThreadRequest inherited;
	
private:
	_ITEMIDLIST *FPIDL;
	
public:
	__fastcall virtual ~TPIDLThreadRequest(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property Shlobj::PItemIDList PIDL = {read=FPIDL, write=FPIDL};
public:
	/* TCommonThreadRequest.Create */ inline __fastcall virtual TPIDLThreadRequest(void) : TCommonThreadRequest() { }
	
};


class DELPHICLASS TShellIconThreadRequest;
class PASCALIMPLEMENTATION TShellIconThreadRequest : public TPIDLThreadRequest
{
	typedef TPIDLThreadRequest inherited;
	
private:
	int FImageIndex;
	bool FLarge;
	bool FOpen;
	int FOverlayIndex;
	
public:
	virtual bool __fastcall HandleRequest(void);
	__property int ImageIndex = {read=FImageIndex, nodefault};
	__property bool Large = {read=FLarge, write=FLarge, nodefault};
	__property bool Open = {read=FOpen, write=FOpen, nodefault};
	__property int OverlayIndex = {read=FOverlayIndex, write=FOverlayIndex, nodefault};
public:
	/* TPIDLThreadRequest.Destroy */ inline __fastcall virtual ~TShellIconThreadRequest(void) { }
	
public:
	/* TCommonThreadRequest.Create */ inline __fastcall virtual TShellIconThreadRequest(void) : TPIDLThreadRequest() { }
	
};


class PASCALIMPLEMENTATION TPIDLCallbackThreadRequest : public TPIDLThreadRequest
{
	typedef TPIDLThreadRequest inherited;
	
private:
	TNamespaceCallbackProc FCallbackProc;
	System::TObject* FTargetObject;
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TNamespaceCallbackProc CallbackProc = {read=FCallbackProc, write=FCallbackProc};
	__property System::TObject* TargetObject = {read=FTargetObject, write=FTargetObject};
public:
	/* TPIDLThreadRequest.Destroy */ inline __fastcall virtual ~TPIDLCallbackThreadRequest(void) { }
	
public:
	/* TCommonThreadRequest.Create */ inline __fastcall virtual TPIDLCallbackThreadRequest(void) : TPIDLThreadRequest() { }
	
};


class PASCALIMPLEMENTATION TCommonThread : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	bool FFreeOnTerminate;
	unsigned FHandle;
	bool FOLEInitialized;
	HWND FTargetWnd;
	unsigned FThreadID;
	void *FStub;
	bool FTerminated;
	bool FSuspended;
	unsigned FEvent;
	bool FCriticalSectionInitialized;
	_RTL_CRITICAL_SECTION FCriticalSection;
	int FRefCount;
	Classes::TThreadList* FRequestList;
	TCommonThreadDirection FDirection;
	bool FRunning;
	bool FRequestListLocked;
	Classes::TList* FTempListLock;
	Classes::TThreadPriority __fastcall GetPriority(void);
	void __fastcall SetPriority(const Classes::TThreadPriority Value);
	void __fastcall SetSuspended(const bool Value);
	void __stdcall ExecuteStub(void);
	_RTL_CRITICAL_SECTION __fastcall GetLock();
	unsigned __fastcall GetEvent(void);
	void __fastcall SetDirection(const TCommonThreadDirection Value);
	void __fastcall SetRequestListLocked(const bool Value);
	
protected:
	bool FFinished;
	void __fastcall AddRequest(TCommonThreadRequest* Request, bool DoSetEvent);
	virtual void __fastcall Execute(void) = 0 ;
	virtual void __fastcall FinalizeThread(void);
	virtual void __fastcall InitializeThread(void);
	__property bool CriticalSectionInitialized = {read=FCriticalSectionInitialized, write=FCriticalSectionInitialized, nodefault};
	__property unsigned Event = {read=GetEvent, nodefault};
	__property bool RequestListLocked = {read=FRequestListLocked, write=SetRequestListLocked, nodefault};
	__property void * Stub = {read=FStub, write=FStub};
	__property bool Terminated = {read=FTerminated, nodefault};
	
public:
	__fastcall virtual TCommonThread(bool CreateSuspended);
	__fastcall virtual ~TCommonThread(void);
	void __fastcall AddRef(void);
	void __fastcall FlushRequestList(void);
	void __fastcall ForceTerminate(void);
	void __fastcall LockThread(void);
	void __fastcall Release(void);
	void __fastcall Resume(void);
	virtual void __fastcall Terminate(void);
	void __fastcall TriggerEvent(void);
	void __fastcall UnlockThread(void);
	__property TCommonThreadDirection Direction = {read=FDirection, write=SetDirection, nodefault};
	__property bool Finished = {read=FFinished, nodefault};
	__property bool FreeOnTerminate = {read=FFreeOnTerminate, write=FFreeOnTerminate, nodefault};
	__property unsigned Handle = {read=FHandle, nodefault};
	__property _RTL_CRITICAL_SECTION Lock = {read=GetLock};
	__property bool OLEInitialized = {read=FOLEInitialized, nodefault};
	__property Classes::TThreadPriority Priority = {read=GetPriority, write=SetPriority, default=3};
	__property int RefCount = {read=FRefCount, write=FRefCount, nodefault};
	__property Classes::TThreadList* RequestList = {read=FRequestList, write=FRequestList};
	__property bool Running = {read=FRunning, nodefault};
	__property bool Suspended = {read=FSuspended, write=SetSuspended, nodefault};
	__property HWND TargetWnd = {read=FTargetWnd, write=FTargetWnd, nodefault};
	__property unsigned ThreadID = {read=FThreadID, nodefault};
};


typedef TMetaClass* TCommonBaseThreadClass;

class DELPHICLASS TCommonEventThread;
class PASCALIMPLEMENTATION TCommonEventThread : public TCommonThread
{
	typedef TCommonThread inherited;
	
private:
	unsigned FTargetWndNotifyMsg;
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	__fastcall virtual TCommonEventThread(bool CreateSuspended);
	__fastcall virtual ~TCommonEventThread(void);
	__property unsigned TargetWndNotifyMsg = {read=FTargetWndNotifyMsg, write=FTargetWndNotifyMsg, nodefault};
};


typedef TMetaClass* TCommonEventThreadClass;

class DELPHICLASS TCommonShellExecuteThread;
class PASCALIMPLEMENTATION TCommonShellExecuteThread : public TCommonThread
{
	typedef TCommonThread inherited;
	
private:
	System::WideString FlpClass;
	System::WideString FlpDirectory;
	System::WideString FlpFile;
	System::WideString FlpParameters;
	System::WideString FlpVerb;
	_ITEMIDLIST *FPIDL;
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	#pragma pack(push,1)
	_SHELLEXECUTEINFOA ShellExecuteInfoA;
	#pragma pack(pop)
	#pragma pack(push,1)
	_SHELLEXECUTEINFOW ShellExecuteInfoW;
	#pragma pack(pop)
	__fastcall virtual TCommonShellExecuteThread(bool CreateSuspended);
	__fastcall virtual ~TCommonShellExecuteThread(void);
	__property System::WideString lpClass = {read=FlpClass, write=FlpClass};
	__property System::WideString lpDirectory = {read=FlpDirectory, write=FlpDirectory};
	__property System::WideString lpFile = {read=FlpFile, write=FlpFile};
	__property System::WideString lpParameters = {read=FlpParameters, write=FlpParameters};
	__property System::WideString lpVerb = {read=FlpVerb, write=FlpVerb};
	__property Shlobj::PItemIDList PIDL = {read=FPIDL, write=FPIDL};
};


class DELPHICLASS TCommonCallbackEventThread;
class PASCALIMPLEMENTATION TCommonCallbackEventThread : public TCommonEventThread
{
	typedef TCommonEventThread inherited;
	
protected:
	virtual void __fastcall Execute(void);
public:
	/* TCommonEventThread.Create */ inline __fastcall virtual TCommonCallbackEventThread(bool CreateSuspended) : TCommonEventThread(CreateSuspended) { }
	/* TCommonEventThread.Destroy */ inline __fastcall virtual ~TCommonCallbackEventThread(void) { }
	
};


class DELPHICLASS TCommonThreadManager;
class PASCALIMPLEMENTATION TCommonThreadManager : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	System::AnsiString FAClassName;
	Classes::TThreadList* FControlList;
	void *FStub;
	HWND FFilterWindow;
	bool FEnabled;
	TCommonThread* __fastcall GetThread(void);
	HWND __fastcall GetFilterWindow(void);
	int __fastcall GetRequestCount(void);
	void __fastcall SetEnabled(const bool Value);
	
protected:
	TCommonThread* FThread;
	int __stdcall FilterWndProc(HWND Wnd, unsigned uMsg, int wParam, int lParam);
	virtual void __fastcall CreateThreadObject(void);
	int __fastcall FindControl(Controls::TWinControl* Window, Classes::TList* LockedList);
	virtual void __fastcall DispatchRequest(int lParam, int wParam);
	void __fastcall FreeThread(void);
	void __fastcall InternalUnRegisterControl(Controls::TWinControl* Window, Classes::TList* LockedControlList);
	void __fastcall RegisterFilterWindow(void);
	__property System::AnsiString AClassName = {read=FAClassName, write=FAClassName};
	__property Classes::TThreadList* ControlList = {read=FControlList, write=FControlList};
	__property HWND FilterWindow = {read=GetFilterWindow, write=FFilterWindow, nodefault};
	
public:
	__fastcall virtual TCommonThreadManager(Classes::TComponent* AOwner);
	__fastcall virtual ~TCommonThreadManager(void);
	void __fastcall AddRequest(TCommonThreadRequest* Request, bool DoSetEvent);
	void __fastcall FlushAllMessageCache(Controls::TWinControl* Window, void * Item = (void *)(0x0));
	void __fastcall FlushMessageCache(Controls::TWinControl* Window, unsigned RequestID, void * Item = (void *)(0x0));
	bool __fastcall RegisterControl(Controls::TWinControl* Window);
	void __fastcall UnRegisterAll(void);
	void __fastcall UnRegisterControl(Controls::TWinControl* Window);
	__property int RequestCount = {read=GetRequestCount, nodefault};
	__property TCommonThread* Thread = {read=GetThread};
	
__published:
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=0};
};


class DELPHICLASS TCallbackThreadManager;
class PASCALIMPLEMENTATION TCallbackThreadManager : public TCommonThreadManager
{
	typedef TCommonThreadManager inherited;
	
protected:
	virtual void __fastcall CreateThreadObject(void);
	virtual void __fastcall DispatchRequest(int lParam, int wParam);
	
public:
	HIDESBASE void __fastcall AddRequest(TPIDLCallbackThreadRequest* Request, bool DoSetEvent);
	void __fastcall FlushObjectCache(System::TObject* AnObject);
public:
	/* TCommonThreadManager.Create */ inline __fastcall virtual TCallbackThreadManager(Classes::TComponent* AOwner) : TCommonThreadManager(AOwner) { }
	/* TCommonThreadManager.Destroy */ inline __fastcall virtual ~TCallbackThreadManager(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define COMMONTHREADFILTERWNDCLASS L"clsEasyThreadFilter"
static const Byte COMMONTHREADSAFETYVALVE = 0xc8;
static const Word WM_COMMONTHREADCALLBACK = 0x8164;
static const Word WM_COMMONTHREADNOTIFIER = 0x8163;
static const ShortInt TID_START = 0x0;
static const ShortInt FORCE_KILL_THREAD_COUNT = 0xa;
static const Byte THREAD_SHUTDOWN_WAIT_DELAY = 0xc8;
extern PACKAGE TCommonThreadManager* __fastcall GlobalThreadManager(void);
extern PACKAGE TCallbackThreadManager* __fastcall GlobalCallbackThreadManager(void);

}	/* namespace Mpthreadmanager */
using namespace Mpthreadmanager;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpthreadmanagerHPP
