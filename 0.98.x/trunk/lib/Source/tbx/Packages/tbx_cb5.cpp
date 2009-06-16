//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl50.bpi");
USEPACKAGE("TB2K_CB5.bpi");
USEUNIT("..\TBXSwitcher.pas");
USEUNIT("..\TBXMDI.pas");
USEUNIT("..\TBXDefaultTheme.pas");
USEUNIT("..\TBXStripesTheme.pas");
USEUNIT("..\TBXOfficeXPTheme.pas");
USEUNIT("..\TBX.pas");
USEUNIT("..\TBXUtils.pas");
USEUNIT("..\TBXExtItems.pas");
USEUNIT("..\TBXLists.pas");
USEUNIT("..\TBXUxThemes.pas");
USEUNIT("..\TBXDkPanels.pas");
USEUNIT("..\TBXStatusBars.pas");
USEUNIT("..\TBXThemes.pas");

//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
