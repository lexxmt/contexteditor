// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpdataobject.pas' rev: 20.00

#ifndef MpdataobjectHPP
#define MpdataobjectHPP

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
#include <Activex.hpp>	// Pascal unit
#include <Shlobj.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Mpshelltypes.hpp>	// Pascal unit
#include <Mpcommonutilities.hpp>	// Pascal unit
#include <Mpcommonobjects.hpp>	// Pascal unit
#include <Axctrls.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpdataobject
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TPerformedDropEffect { effectNone, effectCopy, effectMove, effectLink };
#pragma option pop

typedef TPerformedDropEffect *PPerformedDropEffect;

typedef DynamicArray<tagFORMATETC> TFormatEtcArray;

struct TDataObjectInfo
{
	
public:
	tagFORMATETC FormatEtc;
	tagSTGMEDIUM StgMedium;
	bool OwnedByDataObject;
};


typedef DynamicArray<TDataObjectInfo> TDataObjectInfoArray;

typedef StaticArray<tagFORMATETC, 256> TeltArray;

class DELPHICLASS TCommonEnumFormatEtc;
class PASCALIMPLEMENTATION TCommonEnumFormatEtc : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	int FInternalIndex;
	TFormatEtcArray FFormats;
	
protected:
	HRESULT __stdcall Next(int celt, /* out */ void *elt, System::PLongint pceltFetched);
	HRESULT __stdcall Skip(int celt);
	HRESULT __stdcall Reset(void);
	HRESULT __stdcall Clone(/* out */ _di_IEnumFORMATETC &Enum);
	__property int InternalIndex = {read=FInternalIndex, write=FInternalIndex, nodefault};
	
public:
	__fastcall TCommonEnumFormatEtc(void);
	__fastcall virtual ~TCommonEnumFormatEtc(void);
	void __fastcall SetFormatLength(int Size);
	__property TFormatEtcArray Formats = {read=FFormats, write=FFormats};
private:
	void *__IEnumFORMATETC;	/* IEnumFORMATETC */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_IEnumFORMATETC()
	{
		_di_IEnumFORMATETC intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IEnumFORMATETC*(void) { return (IEnumFORMATETC*)&__IEnumFORMATETC; }
	#endif
	
};


__interface ICommonDataObject;
typedef System::DelphiInterface<ICommonDataObject> _di_ICommonDataObject;
__interface  INTERFACE_UUID("{F8B3EE47-C6C1-4FE3-9D94-757AA35DC038}") ICommonDataObject  : public IDataObject 
{
	
public:
	virtual bool __fastcall AssignDragImage(Graphics::TBitmap* Image, const Types::TPoint &HotSpot, Graphics::TColor TransparentColor) = 0 ;
	virtual bool __fastcall SaveGlobalBlock(System::Word Format, void * MemoryBlock, int MemoryBlockSize) = 0 ;
	virtual bool __fastcall LoadGlobalBlock(System::Word Format, void * &MemoryBlock) = 0 ;
};

typedef void __fastcall (__closure *TGetDataEvent)(System::TObject* Sender, const tagFORMATETC &FormatEtcIn, tagSTGMEDIUM &Medium, bool &Handled);

typedef void __fastcall (__closure *TQueryGetDataEvent)(System::TObject* Sender, const tagFORMATETC &FormatEtcIn, bool &FormatAvailable, bool &Handled);

class DELPHICLASS TCommonDataObject;
class PASCALIMPLEMENTATION TCommonDataObject : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	int FRefCount;
	bool FReferenceCounted;
	
protected:
	_di_IDataAdviseHolder FAdviseHolder;
	TDataObjectInfoArray FFormats;
	TGetDataEvent FOnGetData;
	TQueryGetDataEvent FOnQueryGetData;
	HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	System::_di_IInterface __fastcall CanonicalIUnknown(System::_di_IInterface TestUnknown);
	virtual HRESULT __stdcall DAdvise(const tagFORMATETC &formatetc, int advf, const _di_IAdviseSink advSink, /* out */ int &dwConnection);
	virtual HRESULT __stdcall DUnadvise(int dwConnection);
	virtual HRESULT __stdcall EnumDAdvise(/* out */ _di_IEnumSTATDATA &enumAdvise);
	virtual HRESULT __stdcall EnumFormatEtc(int dwDirection, /* out */ _di_IEnumFORMATETC &enumFormatEtc);
	bool __fastcall EqualFormatEtc(const tagFORMATETC &FormatEtc1, const tagFORMATETC &FormatEtc2);
	int __fastcall FindFormatEtc(const tagFORMATETC &TestFormatEtc);
	virtual HRESULT __stdcall GetCanonicalFormatEtc(const tagFORMATETC &formatetc, /* out */ tagFORMATETC &formatetcOut);
	virtual HRESULT __stdcall GetData(const tagFORMATETC &FormatEtcIn, /* out */ tagSTGMEDIUM &Medium);
	virtual HRESULT __stdcall GetDataHere(const tagFORMATETC &formatetc, /* out */ tagSTGMEDIUM &medium);
	unsigned __fastcall HGlobalClone(unsigned HGlobal);
	virtual HRESULT __stdcall QueryGetData(const tagFORMATETC &formatetc);
	virtual HRESULT __stdcall SetData(const tagFORMATETC &formatetc, tagSTGMEDIUM &medium, BOOL fRelease);
	virtual void __fastcall DoGetCustomFormats(int dwDirection, TFormatEtcArray &Formats);
	virtual void __fastcall DoOnGetData(const tagFORMATETC &FormatEtcIn, tagSTGMEDIUM &Medium, bool &Handled);
	virtual void __fastcall DoOnQueryGetData(const tagFORMATETC &FormatEtcIn, bool &FormatAvailable, bool &Handled);
	HRESULT __fastcall RetrieveOwnedStgMedium(const tagFORMATETC &Format, tagSTGMEDIUM &StgMedium);
	HRESULT __fastcall StgMediumIncRef(const tagSTGMEDIUM &InStgMedium, tagSTGMEDIUM &OutStgMedium, bool CopyInMedium);
	System::TObject* __fastcall GetObj(void);
	__property _di_IDataAdviseHolder AdviseHolder = {read=FAdviseHolder};
	__property TDataObjectInfoArray Formats = {read=FFormats, write=FFormats};
	__property System::TObject* Obj = {read=GetObj};
	__property int RefCount = {read=FRefCount, nodefault};
	
public:
	__fastcall TCommonDataObject(bool IsReferenceCounted);
	__fastcall virtual ~TCommonDataObject(void);
	virtual void __fastcall AfterConstruction(void);
	virtual void __fastcall BeforeDestruction(void);
	__classmethod virtual System::TObject* __fastcall NewInstance();
	bool __fastcall AssignDragImage(Graphics::TBitmap* Image, const Types::TPoint &HotSpot, Graphics::TColor TransparentColor);
	virtual bool __fastcall GetUserData(const tagFORMATETC &Format, tagSTGMEDIUM &StgMedium);
	bool __fastcall LoadGlobalBlock(System::Word Format, void * &MemoryBlock);
	bool __fastcall SaveGlobalBlock(System::Word Format, void * MemoryBlock, int MemoryBlockSize);
	__property bool ReferenceCounted = {read=FReferenceCounted, write=FReferenceCounted, nodefault};
	__property TGetDataEvent OnGetData = {read=FOnGetData, write=FOnGetData};
	__property TQueryGetDataEvent OnQueryGetData = {read=FOnQueryGetData, write=FOnQueryGetData};
private:
	void *__ICommonExtractObj;	/* Mpcommonobjects::ICommonExtractObj */
	void *__ICommonDataObject;	/* ICommonDataObject */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Mpcommonobjects::_di_ICommonExtractObj()
	{
		Mpcommonobjects::_di_ICommonExtractObj intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICommonExtractObj*(void) { return (ICommonExtractObj*)&__ICommonExtractObj; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_ICommonDataObject()
	{
		_di_ICommonDataObject intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICommonDataObject*(void) { return (ICommonDataObject*)&__ICommonDataObject; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_IDataObject()
	{
		_di_IDataObject intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IDataObject*(void) { return (IDataObject*)&__ICommonDataObject; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator System::_di_IInterface()
	{
		System::_di_IInterface intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IInterface*(void) { return (IInterface*)&__ICommonExtractObj; }
	#endif
	
};


class DELPHICLASS TCommonClipboardFormat;
class PASCALIMPLEMENTATION TCommonClipboardFormat : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	virtual tagFORMATETC __fastcall GetFormatEtc();
	virtual bool __fastcall LoadFromClipboard(void);
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject) = 0 ;
	virtual bool __fastcall SaveToClipboard(void);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject) = 0 ;
public:
	/* TObject.Create */ inline __fastcall TCommonClipboardFormat(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonClipboardFormat(void) { }
	
};


class DELPHICLASS TCommonStreamClipFormat;
class PASCALIMPLEMENTATION TCommonStreamClipFormat : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
public:
	virtual tagFORMATETC __fastcall GetFormatEtc();
	virtual bool __fastcall LoadFromClipboard(void);
	HIDESBASE bool __fastcall LoadFromDataObject(_di_IDataObject DataObject, Mpcommonobjects::TCommonStream* CoolStream);
	virtual bool __fastcall SaveToClipboard(void);
	HIDESBASE bool __fastcall SaveToDataObject(_di_IDataObject DataObject, Mpcommonobjects::TCommonStream* CoolStream);
public:
	/* TObject.Create */ inline __fastcall TCommonStreamClipFormat(void) : TCommonClipboardFormat() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonStreamClipFormat(void) { }
	
};


typedef DynamicArray<_FILEDESCRIPTORA> TDescriptorAArray;

typedef DynamicArray<_FILEDESCRIPTORW> TDescriptorWArray;

class DELPHICLASS TFileGroupDescriptorA;
class PASCALIMPLEMENTATION TFileGroupDescriptorA : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
private:
	Classes::TStream* FStream;
	int __fastcall GetDescriptorCount(void);
	_FILEDESCRIPTORA __fastcall GetFileDescriptorA(int Index);
	void __fastcall SetFileDescriptor(int Index, const _FILEDESCRIPTORA &Value);
	
protected:
	TDescriptorAArray FFileDescriptors;
	__property Classes::TStream* Stream = {read=FStream, write=FStream};
	
public:
	__fastcall virtual ~TFileGroupDescriptorA(void);
	void __fastcall AddFileDescriptor(const _FILEDESCRIPTORA &FileDescriptor);
	void __fastcall DeleteFileDescriptor(int Index);
	virtual tagFORMATETC __fastcall GetFormatEtc();
	_FILEDESCRIPTORA __fastcall FillDescriptor(System::AnsiString FileName);
	Classes::TStream* __fastcall GetFileStream(const _di_IDataObject DataObject, int FileIndex);
	void __fastcall LoadFileGroupDestriptor(Shlobj::PFileGroupDescriptorA FileGroupDiscriptor);
	virtual bool __fastcall LoadFromClipboard(void);
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject);
	virtual bool __fastcall SaveToClipboard(void);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject);
	__property int DescriptorCount = {read=GetDescriptorCount, nodefault};
	__property _FILEDESCRIPTORA FileDescriptor[int Index] = {read=GetFileDescriptorA, write=SetFileDescriptor};
public:
	/* TObject.Create */ inline __fastcall TFileGroupDescriptorA(void) : TCommonClipboardFormat() { }
	
};


class DELPHICLASS TFileGroupDescriptorW;
class PASCALIMPLEMENTATION TFileGroupDescriptorW : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
private:
	Classes::TStream* FStream;
	int __fastcall GetDescriptorCount(void);
	_FILEDESCRIPTORW __fastcall GetFileDescriptorW(int Index);
	void __fastcall SetFileDescriptor(int Index, const _FILEDESCRIPTORW &Value);
	
protected:
	TDescriptorWArray FFileDescriptors;
	__property Classes::TStream* Stream = {read=FStream, write=FStream};
	
public:
	__fastcall virtual ~TFileGroupDescriptorW(void);
	void __fastcall AddFileDescriptor(const _FILEDESCRIPTORW &FileDescriptor);
	void __fastcall DeleteFileDescriptor(int Index);
	_FILEDESCRIPTORW __fastcall FillDescriptor(System::WideString FileName);
	Classes::TStream* __fastcall GetFileStream(const _di_IDataObject DataObject, int FileIndex);
	virtual tagFORMATETC __fastcall GetFormatEtc();
	void __fastcall LoadFileGroupDestriptor(Shlobj::PFileGroupDescriptorW FileGroupDiscriptor);
	virtual bool __fastcall LoadFromClipboard(void);
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject);
	virtual bool __fastcall SaveToClipboard(void);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject);
	__property int DescriptorCount = {read=GetDescriptorCount, nodefault};
	__property _FILEDESCRIPTORW FileDescriptor[int Index] = {read=GetFileDescriptorW, write=SetFileDescriptor};
public:
	/* TObject.Create */ inline __fastcall TFileGroupDescriptorW(void) : TCommonClipboardFormat() { }
	
};


class DELPHICLASS TCommonHDrop;
class PASCALIMPLEMENTATION TCommonHDrop : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
private:
	void __fastcall SetDropFiles(const Shlobj::PDropFiles Value);
	unsigned __fastcall GetHDropStruct(void);
	
protected:
	_DROPFILES *FDropFiles;
	int FStructureSize;
	int FFileCount;
	void __fastcall AllocStructure(int Size);
	int __fastcall CalculateDropFileStructureSizeA(Shlobj::PDropFiles Value);
	int __fastcall CalculateDropFileStructureSizeW(Shlobj::PDropFiles Value);
	int __fastcall FileCountA(void);
	int __fastcall FileCountW(void);
	System::UnicodeString __fastcall FileNameA(int Index);
	System::WideString __fastcall FileNameW(int Index);
	void __fastcall FreeStructure(void);
	
public:
	__fastcall virtual ~TCommonHDrop(void);
	bool __fastcall AssignFromClipboard(void);
	virtual bool __fastcall LoadFromClipboard(void);
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject);
	int __fastcall FileCount(void);
	System::WideString __fastcall FileName(int Index);
	virtual tagFORMATETC __fastcall GetFormatEtc();
	void __fastcall AssignFilesA(Classes::TStringList* FileList);
	void __fastcall FileNamesA(Classes::TStrings* FileList);
	__property unsigned HDropStruct = {read=GetHDropStruct, nodefault};
	virtual bool __fastcall SaveToClipboard(void);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject);
	__property int StructureSize = {read=FStructureSize, nodefault};
	__property Shlobj::PDropFiles DropFiles = {read=FDropFiles, write=SetDropFiles};
public:
	/* TObject.Create */ inline __fastcall TCommonHDrop(void) : TCommonClipboardFormat() { }
	
};


class DELPHICLASS TCommonShellIDList;
class PASCALIMPLEMENTATION TCommonShellIDList : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
private:
	_IDA *FCIDA;
	int __fastcall GetCIDASize(void);
	Shlobj::PItemIDList __fastcall InternalChildPIDL(int Index);
	Shlobj::PItemIDList __fastcall InternalParentPIDL(void);
	void __fastcall SetCIDA(const Shlobj::PIDA Value);
	
public:
	Shlobj::PItemIDList __fastcall AbsolutePIDL(int Index);
	void __fastcall AbsolutePIDLs(Mpcommonobjects::TCommonPIDLList* APIDLList);
	void __fastcall AssignPIDLs(Mpcommonobjects::TCommonPIDLList* APIDLList);
	__fastcall virtual ~TCommonShellIDList(void);
	virtual tagFORMATETC __fastcall GetFormatEtc();
	virtual bool __fastcall LoadFromClipboard(void);
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject);
	Shlobj::PItemIDList __fastcall ParentPIDL(void);
	int __fastcall PIDLCount(void);
	Shlobj::PItemIDList __fastcall RelativePIDL(int Index);
	void __fastcall RelativePIDLs(Mpcommonobjects::TCommonPIDLList* APIDLList);
	virtual bool __fastcall SaveToClipboard(void);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject);
	__property Shlobj::PIDA CIDA = {read=FCIDA, write=SetCIDA};
	__property int CIDASize = {read=GetCIDASize, nodefault};
public:
	/* TObject.Create */ inline __fastcall TCommonShellIDList(void) : TCommonClipboardFormat() { }
	
};


class DELPHICLASS TCommonLogicalPerformedDropEffect;
class PASCALIMPLEMENTATION TCommonLogicalPerformedDropEffect : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
private:
	TPerformedDropEffect FAction;
	
public:
	virtual tagFORMATETC __fastcall GetFormatEtc();
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject);
	__property TPerformedDropEffect Action = {read=FAction, write=FAction, nodefault};
public:
	/* TObject.Create */ inline __fastcall TCommonLogicalPerformedDropEffect(void) : TCommonClipboardFormat() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonLogicalPerformedDropEffect(void) { }
	
};


class DELPHICLASS TCommonPreferredDropEffect;
class PASCALIMPLEMENTATION TCommonPreferredDropEffect : public TCommonLogicalPerformedDropEffect
{
	typedef TCommonLogicalPerformedDropEffect inherited;
	
public:
	virtual tagFORMATETC __fastcall GetFormatEtc();
public:
	/* TObject.Create */ inline __fastcall TCommonPreferredDropEffect(void) : TCommonLogicalPerformedDropEffect() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonPreferredDropEffect(void) { }
	
};


class DELPHICLASS TCommonInShellDragLoop;
class PASCALIMPLEMENTATION TCommonInShellDragLoop : public TCommonClipboardFormat
{
	typedef TCommonClipboardFormat inherited;
	
private:
	unsigned FData;
	
public:
	virtual tagFORMATETC __fastcall GetFormatEtc();
	virtual bool __fastcall LoadFromDataObject(_di_IDataObject DataObject);
	virtual bool __fastcall SaveToDataObject(_di_IDataObject DataObject);
	__property unsigned Data = {read=FData, write=FData, nodefault};
public:
	/* TObject.Create */ inline __fastcall TCommonInShellDragLoop(void) : TCommonClipboardFormat() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonInShellDragLoop(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define CFSTR_LOGICALPERFORMEDDROPEFFECT L"Logical Performed DropEffect"
#define CFSTR_PREFERREDDROPEFFECT L"Preferred DropEffect"
#define CFSTR_PERFORMEDDROPEFFECT L"Performed DropEffect"
#define CFSTR_PASTESUCCEEDED L"Paste Succeeded"
#define CFSTR_INDRAGLOOP L"InShellDragLoop"
#define CFSTR_SHELLIDLISTOFFSET L"Shell Object Offsets"
static const ShortInt SIZE_SHELLDRAGLOOPDATA = 0x4;
extern PACKAGE System::Word CF_SHELLIDLIST;
extern PACKAGE System::Word CF_PERFORMEDDROPEFFECT;
extern PACKAGE System::Word CF_PASTESUCCEEDED;
extern PACKAGE System::Word CF_INDRAGLOOP;
extern PACKAGE System::Word CF_SHELLIDLISTOFFSET;
extern PACKAGE System::Word CF_LOGICALPERFORMEDDROPEFFECT;
extern PACKAGE System::Word CF_PREFERREDDROPEFFECT;
extern PACKAGE System::Word CF_FILECONTENTS;
extern PACKAGE System::Word CF_FILEDESCRIPTORA;
extern PACKAGE System::Word CF_FILEDESCRIPTORW;
extern PACKAGE bool __fastcall DataObjectContainsPIDL(Shlobj::PItemIDList APIDL, const _di_IDataObject DataObj);
extern PACKAGE bool __fastcall DataObjectSupportsShell(const _di_IDataObject DataObj);
extern PACKAGE tagFORMATETC __fastcall HDropFormat();
extern PACKAGE tagFORMATETC __fastcall ShellIDListFormat();
extern PACKAGE tagFORMATETC __fastcall FileDescriptorAFormat();
extern PACKAGE tagFORMATETC __fastcall FileDescriptorWFormat();
extern PACKAGE tagFORMATETC __fastcall FillFormatEtc(System::Word cfFormat, Activex::PDVTargetDevice ptd = (void *)(0x0), int dwAspect = 0x1, int lindex = 0xffffffff, int tymed = 0x1);

}	/* namespace Mpdataobject */
using namespace Mpdataobject;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpdataobjectHPP
