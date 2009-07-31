// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Mpcommonwizardtemplates.pas' rev: 20.00

#ifndef MpcommonwizardtemplatesHPP
#define MpcommonwizardtemplatesHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mpcommonwizardtemplates
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
#define FILE_FORM_TEMPLATE_DELPHI L"unit %ModuleIdent;                                        "\
	"        \r\n                                              "\
	"                    \r\ninterface                         "\
	"                                \r\n                      "\
	"                                            \r\n          "\
	"                                                        \r"\
	"\nuses                                                    "\
	"          \r\n  %IncludeList                              "\
	"                      \r\n                                "\
	"                                  \r\ntype                "\
	"                                              \r\n  T%Form"\
	"Ident= class(T%AncestorIdent)                             "\
	"\r\n  private                                             "\
	"            \r\n    { Private declarations }              "\
	"                        \r\n  public                      "\
	"                                    \r\n    { Public decla"\
	"rations }                                       \r\n  end;"\
	"                                                          "\
	"  \r\n                                                    "\
	"              \r\nvar                                     "\
	"                          \r\n  %FormIdent: T%FormIdent;  "\
	"                                      \r\n                "\
	"                                                  \r\nimpl"\
	"ementation                                                "\
	"    \r\n                                                  "\
	"               \r\n{$R *.dfm}                             "\
	"                           \r\n                           "\
	"                                       \r\n               "\
	"                                                   \r\nend"\
	".                                                         "\
	"     "
#define FILE_FORM_TEMPLATE_BCB L"//--------------------------------------------------------"\
	"--------\r\n%IncludeList                                  "\
	"                    \r\n#pragma hdrstop                   "\
	"                                \r\n                      "\
	"                                            \r\n#include \""\
	"%ModuleIdent.h\"                                         \r"\
	"\n//------------------------------------------------------"\
	"----------\r\n#pragma package(smart_init)                 "\
	"                      \r\n#pragma resource \"*.dfm\"      "\
	"                                    \r\nT%FormIdent *%Form"\
	"Ident;                                          \r\n//----"\
	"----------------------------------------------------------"\
	"--\r\n__fastcall T%FormIdent::T%FormIdent(TComponent* Owne"\
	"r)            \r\n    : T%AncestorIdent(Owner)            "\
	"                          \r\n{                           "\
	"                                      \r\n}               "\
	"                                                  \r\n//--"\
	"----------------------------------------------------------"\
	"----"

}	/* namespace Mpcommonwizardtemplates */
using namespace Mpcommonwizardtemplates;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// MpcommonwizardtemplatesHPP
