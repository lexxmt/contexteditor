// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpcommonwizardhelpers.pas' rev: 20.00

#ifndef MpcommonwizardhelpersHPP
#define MpcommonwizardhelpersHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Toolsapi.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Treeintf.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Typinfo.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Mpcommonwizardtemplates.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpcommonwizardhelpers
{
//-- type declarations -------------------------------------------------------
typedef StaticArray<System::UnicodeString, 8> Mpcommonwizardhelpers__1;

typedef StaticArray<System::UnicodeString, 1> Mpcommonwizardhelpers__2;

class DELPHICLASS TCommonOTAFile;
class PASCALIMPLEMENTATION TCommonOTAFile : public Toolsapi::TOTAFile
{
	typedef Toolsapi::TOTAFile inherited;
	
private:
	System::UnicodeString FAncestorIdent;
	System::UnicodeString FFormIdent;
	System::UnicodeString FModuleIdent;
	Classes::TStringList* FUsesIdent;
	
public:
	__property System::UnicodeString AncestorIdent = {read=FAncestorIdent, write=FAncestorIdent};
	__property System::UnicodeString FormIdent = {read=FFormIdent, write=FFormIdent};
	__property System::UnicodeString ModuleIdent = {read=FModuleIdent, write=FModuleIdent};
	__property Classes::TStringList* IncludeIdent = {read=FUsesIdent, write=FUsesIdent};
public:
	/* TOTAFile.Create */ inline __fastcall TCommonOTAFile(const System::UnicodeString StringCode, const System::TDateTime Age) : Toolsapi::TOTAFile(StringCode, Age) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonOTAFile(void) { }
	
private:
	void *__IOTAFile;	/* Toolsapi::IOTAFile */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAFile()
	{
		Toolsapi::_di_IOTAFile intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAFile*(void) { return (IOTAFile*)&__IOTAFile; }
	#endif
	
};


class DELPHICLASS TCommonOTAFileForm;
class PASCALIMPLEMENTATION TCommonOTAFileForm : public TCommonOTAFile
{
	typedef TCommonOTAFile inherited;
	
public:
	virtual System::UnicodeString __fastcall GetSource();
public:
	/* TOTAFile.Create */ inline __fastcall TCommonOTAFileForm(const System::UnicodeString StringCode, const System::TDateTime Age) : TCommonOTAFile(StringCode, Age) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonOTAFileForm(void) { }
	
private:
	void *__IOTAFile;	/* Toolsapi::IOTAFile */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAFile()
	{
		Toolsapi::_di_IOTAFile intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAFile*(void) { return (IOTAFile*)&__IOTAFile; }
	#endif
	
};


class DELPHICLASS TCommonWizardModuleCreator;
class PASCALIMPLEMENTATION TCommonWizardModuleCreator : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	System::UnicodeString FAncestorName;
	System::UnicodeString FFormName;
	bool FMainForm;
	bool FShowForm;
	bool FShowSource;
	Classes::TStringList* FUsesIdent;
	bool __fastcall GetIsDelphi(void);
	
public:
	__fastcall virtual TCommonWizardModuleCreator(void);
	__fastcall virtual ~TCommonWizardModuleCreator(void);
	virtual void __fastcall InitializeCreator(void);
	virtual System::UnicodeString __fastcall GetCreatorType();
	virtual bool __fastcall GetExisting(void);
	virtual System::UnicodeString __fastcall GetFileSystem();
	virtual Toolsapi::_di_IOTAModule __fastcall GetOwner();
	virtual bool __fastcall GetUnnamed(void);
	virtual System::UnicodeString __fastcall GetAncestorName();
	virtual System::UnicodeString __fastcall GetImplFileName();
	virtual System::UnicodeString __fastcall GetIntfFileName();
	virtual System::UnicodeString __fastcall GetFormName();
	virtual bool __fastcall GetMainForm(void);
	virtual bool __fastcall GetShowForm(void);
	virtual bool __fastcall GetShowSource(void);
	virtual Toolsapi::_di_IOTAFile __fastcall NewFormFile(const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
	virtual Toolsapi::_di_IOTAFile __fastcall NewImplSource(const System::UnicodeString ModuleIdent, const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
	virtual Toolsapi::_di_IOTAFile __fastcall NewIntfSource(const System::UnicodeString ModuleIdent, const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
	virtual void __fastcall FormCreated(const Toolsapi::_di_IOTAFormEditor FormEditor);
	void __fastcall LoadDefaultBuilderIncludeStrings(bool ClearFirst);
	void __fastcall LoadDefaultDelphiUsesStrings(bool ClearFirst);
	__property System::UnicodeString CreatorType = {read=GetCreatorType};
	__property bool Existing = {read=GetExisting, nodefault};
	__property System::UnicodeString FileSystem = {read=GetFileSystem};
	__property Toolsapi::_di_IOTAModule Owner = {read=GetOwner};
	__property bool Unnamed = {read=GetUnnamed, nodefault};
	__property System::UnicodeString AncestorName = {read=GetAncestorName, write=FAncestorName};
	__property System::UnicodeString FormName = {read=GetFormName, write=FFormName};
	__property System::UnicodeString ImplFileName = {read=GetImplFileName};
	__property System::UnicodeString IntfFileName = {read=GetIntfFileName};
	__property bool IsDelphi = {read=GetIsDelphi, nodefault};
	__property bool MainForm = {read=GetMainForm, write=FMainForm, nodefault};
	__property bool ShowForm = {read=GetShowForm, write=FShowForm, nodefault};
	__property bool ShowSource = {read=GetShowSource, write=FShowSource, nodefault};
	__property Classes::TStringList* IncludeIdent = {read=FUsesIdent, write=FUsesIdent};
private:
	void *__IOTAModuleCreator;	/* Toolsapi::IOTAModuleCreator */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAModuleCreator()
	{
		Toolsapi::_di_IOTAModuleCreator intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAModuleCreator*(void) { return (IOTAModuleCreator*)&__IOTAModuleCreator; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTACreator()
	{
		Toolsapi::_di_IOTACreator intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTACreator*(void) { return (IOTACreator*)&__IOTAModuleCreator; }
	#endif
	
};


typedef TMetaClass* TCommonWizardModuleCreatorClass;

class DELPHICLASS TCommonWizardEmptyUnitCreator;
class PASCALIMPLEMENTATION TCommonWizardEmptyUnitCreator : public TCommonWizardModuleCreator
{
	typedef TCommonWizardModuleCreator inherited;
	
public:
	virtual System::UnicodeString __fastcall GetCreatorType();
public:
	/* TCommonWizardModuleCreator.Create */ inline __fastcall virtual TCommonWizardEmptyUnitCreator(void) : TCommonWizardModuleCreator() { }
	/* TCommonWizardModuleCreator.Destroy */ inline __fastcall virtual ~TCommonWizardEmptyUnitCreator(void) { }
	
};


class DELPHICLASS TCommonWizardEmptyFormCreator;
class PASCALIMPLEMENTATION TCommonWizardEmptyFormCreator : public TCommonWizardModuleCreator
{
	typedef TCommonWizardModuleCreator inherited;
	
public:
	virtual System::UnicodeString __fastcall GetCreatorType();
	virtual Toolsapi::_di_IOTAFile __fastcall NewImplSource(const System::UnicodeString ModuleIdent, const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
public:
	/* TCommonWizardModuleCreator.Create */ inline __fastcall virtual TCommonWizardEmptyFormCreator(void) : TCommonWizardModuleCreator() { }
	/* TCommonWizardModuleCreator.Destroy */ inline __fastcall virtual ~TCommonWizardEmptyFormCreator(void) { }
	
};


class DELPHICLASS TCommonWizardEmptyTextCreator;
class PASCALIMPLEMENTATION TCommonWizardEmptyTextCreator : public TCommonWizardModuleCreator
{
	typedef TCommonWizardModuleCreator inherited;
	
public:
	virtual System::UnicodeString __fastcall GetCreatorType();
public:
	/* TCommonWizardModuleCreator.Create */ inline __fastcall virtual TCommonWizardEmptyTextCreator(void) : TCommonWizardModuleCreator() { }
	/* TCommonWizardModuleCreator.Destroy */ inline __fastcall virtual ~TCommonWizardEmptyTextCreator(void) { }
	
};


class DELPHICLASS TCommonWizardNotifierObject;
class PASCALIMPLEMENTATION TCommonWizardNotifierObject : public Toolsapi::TNotifierObject
{
	typedef Toolsapi::TNotifierObject inherited;
	
private:
	System::UnicodeString FAuthor;
	System::UnicodeString FCaption;
	System::UnicodeString FComment;
	System::UnicodeString FGlyphResourceID;
	System::UnicodeString FPage;
	Toolsapi::TWizardState FState;
	System::UnicodeString FUniqueID;
	Toolsapi::_di_IOTAGalleryCategory FGalleryCategory;
	
protected:
	virtual System::UnicodeString __fastcall GetGlpyhResourceID();
	
public:
	__fastcall TCommonWizardNotifierObject(void);
	virtual void __fastcall InitializeWizard(void);
	virtual System::UnicodeString __fastcall GetIDString();
	virtual System::UnicodeString __fastcall GetName();
	Toolsapi::TWizardState __fastcall GetState(void);
	virtual void __fastcall Execute(void);
	System::UnicodeString __fastcall GetAuthor();
	virtual System::UnicodeString __fastcall GetComment();
	virtual System::UnicodeString __fastcall GetPage();
	unsigned __fastcall GetGlyph(void);
	System::UnicodeString __fastcall GetDesigner();
	virtual Toolsapi::_di_IOTAGalleryCategory __fastcall GetGalleryCategory();
	virtual System::UnicodeString __fastcall GetPersonality(void) = 0 ;
	__property System::UnicodeString Designer = {read=GetDesigner};
	__property System::UnicodeString Personality = {read=GetPersonality};
	__property System::UnicodeString Author = {read=GetAuthor, write=FAuthor};
	__property System::UnicodeString Caption = {read=GetName, write=FCaption};
	__property System::UnicodeString Comment = {read=GetComment, write=FComment};
	__property Toolsapi::_di_IOTAGalleryCategory GalleryCategory = {read=GetGalleryCategory, write=FGalleryCategory};
	__property System::UnicodeString GlyphResourceID = {read=GetIDString, write=FGlyphResourceID};
	__property System::UnicodeString Page = {read=GetPage, write=FPage};
	__property Toolsapi::TWizardState State = {read=GetState, write=FState, nodefault};
	__property System::UnicodeString UniqueID = {read=GetIDString, write=FUniqueID};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonWizardNotifierObject(void) { }
	
private:
	void *__IOTAProjectWizard;	/* Toolsapi::IOTAProjectWizard */
	void *__IOTARepositoryWizard80;	/* Toolsapi::IOTARepositoryWizard80 */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAProjectWizard()
	{
		Toolsapi::_di_IOTAProjectWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAProjectWizard*(void) { return (IOTAProjectWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard()
	{
		Toolsapi::_di_IOTARepositoryWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard*(void) { return (IOTARepositoryWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAWizard()
	{
		Toolsapi::_di_IOTAWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAWizard*(void) { return (IOTAWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard80()
	{
		Toolsapi::_di_IOTARepositoryWizard80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard80*(void) { return (IOTARepositoryWizard80*)&__IOTARepositoryWizard80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard60()
	{
		Toolsapi::_di_IOTARepositoryWizard60 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard60*(void) { return (IOTARepositoryWizard60*)&__IOTARepositoryWizard80; }
	#endif
	
};


class DELPHICLASS TCommonWizardModuleCreate;
class PASCALIMPLEMENTATION TCommonWizardModuleCreate : public TCommonWizardNotifierObject
{
	typedef TCommonWizardNotifierObject inherited;
	
private:
	TCommonWizardModuleCreatorClass FCreatorClass;
	
public:
	virtual void __fastcall Execute(void);
	__property TCommonWizardModuleCreatorClass CreatorClass = {read=FCreatorClass, write=FCreatorClass};
public:
	/* TCommonWizardNotifierObject.Create */ inline __fastcall TCommonWizardModuleCreate(void) : TCommonWizardNotifierObject() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonWizardModuleCreate(void) { }
	
private:
	void *__IOTAProjectWizard;	/* Toolsapi::IOTAProjectWizard */
	void *__IOTARepositoryWizard80;	/* Toolsapi::IOTARepositoryWizard80 */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAProjectWizard()
	{
		Toolsapi::_di_IOTAProjectWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAProjectWizard*(void) { return (IOTAProjectWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard()
	{
		Toolsapi::_di_IOTARepositoryWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard*(void) { return (IOTARepositoryWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAWizard()
	{
		Toolsapi::_di_IOTAWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAWizard*(void) { return (IOTAWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard80()
	{
		Toolsapi::_di_IOTARepositoryWizard80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard80*(void) { return (IOTARepositoryWizard80*)&__IOTARepositoryWizard80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard60()
	{
		Toolsapi::_di_IOTARepositoryWizard60 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard60*(void) { return (IOTARepositoryWizard60*)&__IOTARepositoryWizard80; }
	#endif
	
};


class DELPHICLASS TCommonWizardDelphiForm;
class PASCALIMPLEMENTATION TCommonWizardDelphiForm : public TCommonWizardModuleCreate
{
	typedef TCommonWizardModuleCreate inherited;
	
public:
	virtual System::UnicodeString __fastcall GetPersonality();
public:
	/* TCommonWizardNotifierObject.Create */ inline __fastcall TCommonWizardDelphiForm(void) : TCommonWizardModuleCreate() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonWizardDelphiForm(void) { }
	
private:
	void *__IOTAProjectWizard;	/* Toolsapi::IOTAProjectWizard */
	void *__IOTARepositoryWizard80;	/* Toolsapi::IOTARepositoryWizard80 */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAProjectWizard()
	{
		Toolsapi::_di_IOTAProjectWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAProjectWizard*(void) { return (IOTAProjectWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard()
	{
		Toolsapi::_di_IOTARepositoryWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard*(void) { return (IOTARepositoryWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAWizard()
	{
		Toolsapi::_di_IOTAWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAWizard*(void) { return (IOTAWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard80()
	{
		Toolsapi::_di_IOTARepositoryWizard80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard80*(void) { return (IOTARepositoryWizard80*)&__IOTARepositoryWizard80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard60()
	{
		Toolsapi::_di_IOTARepositoryWizard60 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard60*(void) { return (IOTARepositoryWizard60*)&__IOTARepositoryWizard80; }
	#endif
	
};


class DELPHICLASS TCommonWizardBuilderForm;
class PASCALIMPLEMENTATION TCommonWizardBuilderForm : public TCommonWizardDelphiForm
{
	typedef TCommonWizardDelphiForm inherited;
	
public:
	virtual System::UnicodeString __fastcall GetPersonality();
public:
	/* TCommonWizardNotifierObject.Create */ inline __fastcall TCommonWizardBuilderForm(void) : TCommonWizardDelphiForm() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TCommonWizardBuilderForm(void) { }
	
private:
	void *__IOTAProjectWizard;	/* Toolsapi::IOTAProjectWizard */
	void *__IOTARepositoryWizard80;	/* Toolsapi::IOTARepositoryWizard80 */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAProjectWizard()
	{
		Toolsapi::_di_IOTAProjectWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAProjectWizard*(void) { return (IOTAProjectWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard()
	{
		Toolsapi::_di_IOTARepositoryWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard*(void) { return (IOTARepositoryWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAWizard()
	{
		Toolsapi::_di_IOTAWizard intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAWizard*(void) { return (IOTAWizard*)&__IOTAProjectWizard; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard80()
	{
		Toolsapi::_di_IOTARepositoryWizard80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard80*(void) { return (IOTARepositoryWizard80*)&__IOTARepositoryWizard80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTARepositoryWizard60()
	{
		Toolsapi::_di_IOTARepositoryWizard60 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTARepositoryWizard60*(void) { return (IOTARepositoryWizard60*)&__IOTARepositoryWizard80; }
	#endif
	
};


class DELPHICLASS TPersistentHack;
class PASCALIMPLEMENTATION TPersistentHack : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPersistentHack(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPersistentHack(void) : Classes::TPersistent() { }
	
};


class DELPHICLASS TCommonImageIndexProperty;
class PASCALIMPLEMENTATION TCommonImageIndexProperty : public Designeditors::TIntegerProperty
{
	typedef Designeditors::TIntegerProperty inherited;
	
private:
	Imglist::TCustomImageList* __fastcall GetImageList(void);
	Imglist::TCustomImageList* __fastcall GetImageListAt(int ComponentIndex);
	
protected:
	virtual bool __fastcall ExtractImageList(Classes::TPersistent* Inst, /* out */ Imglist::TCustomImageList* &ImageList);
	__property Imglist::TCustomImageList* ImageList = {read=GetImageList};
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
	virtual System::UnicodeString __fastcall GetValue();
	virtual void __fastcall SetValue(const System::UnicodeString Value)/* overload */;
	void __fastcall ListMeasureWidth(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, int &AWidth);
	void __fastcall ListMeasureHeight(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, int &AHeight);
	void __fastcall ListDrawValue(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	void __fastcall PropDrawName(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	void __fastcall PropDrawValue(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TCommonImageIndexProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TIntegerProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TCommonImageIndexProperty(void) { }
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  SetValue(const System::WideString Value){ Designeditors::TPropertyEditor::SetValue(Value); }
	
private:
	void *__ICustomPropertyListDrawing;	/* Vcleditors::ICustomPropertyListDrawing */
	void *__ICustomPropertyDrawing;	/* Vcleditors::ICustomPropertyDrawing */
	
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
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyDrawing()
	{
		Vcleditors::_di_ICustomPropertyDrawing intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyDrawing*(void) { return (ICustomPropertyDrawing*)&__ICustomPropertyDrawing; }
	#endif
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Mpcommonwizardhelpers__1 DELPHI_USES_UNITS;
extern PACKAGE Mpcommonwizardhelpers__2 BUIDLER_INCLUDE;
extern PACKAGE Toolsapi::_di_IOTAProjectGroup __fastcall GetCurrentProjectGroup();
extern PACKAGE Toolsapi::_di_IOTAProject __fastcall GetCurrentProject();
extern PACKAGE Toolsapi::_di_IOTAGalleryCategory __fastcall AddDelphiCategory(System::UnicodeString CategoryID, System::UnicodeString CategoryCaption);
extern PACKAGE Toolsapi::_di_IOTAGalleryCategory __fastcall AddBuilderCategory(System::UnicodeString CategoryID, System::UnicodeString CategoryCaption);
extern PACKAGE void __fastcall RemoveCategory(Toolsapi::_di_IOTAGalleryCategory Category);
extern PACKAGE bool __fastcall IsDelphiPersonality(void);

}	/* namespace Mpcommonwizardhelpers */
using namespace Mpcommonwizardhelpers;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpcommonwizardhelpersHPP
