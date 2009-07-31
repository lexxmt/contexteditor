// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxdefaultskins.pas' rev: 20.00

#ifndef SptbxdefaultskinsHPP
#define SptbxdefaultskinsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxdefaultskins
{
//-- type declarations -------------------------------------------------------
typedef StaticArray<Graphics::TColor, 4> TSpTBXAluminumColors;

class DELPHICLASS TSpTBXAluminumSkin;
class PASCALIMPLEMENTATION TSpTBXAluminumSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
private:
	void __fastcall SetDefaultColorScheme(const Sptbxskins::TSpTBXLunaScheme Value);
	
protected:
	TSpTBXAluminumColors FColors;
	Sptbxskins::TSpTBXLunaScheme FDefaultColorScheme;
	Graphics::TColor FLightMetalColor;
	Graphics::TColor FDarkMetalColor;
	int FRoughness;
	virtual void __fastcall FillColors(void);
	virtual void __fastcall FillOptions(void);
	virtual Graphics::TColor __fastcall GetBrushMetalColor(Sptbxskins::TSpTBXSkinComponentsType Component, Sptbxskins::TSpTBXSkinStatesType State);
	
public:
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Sptbxskins::TSpTBXSkinComponentsType Component, Sptbxskins::TSpTBXSkinStatesType State, bool Background, bool Borders, bool Vertical = false, Controls::TAnchors ForceRectBorders = Controls::TAnchors() );
	__fastcall virtual TSpTBXAluminumSkin(void);
	__fastcall virtual ~TSpTBXAluminumSkin(void);
	__property Graphics::TColor LightMetalColor = {read=FLightMetalColor, write=FLightMetalColor, nodefault};
	__property Graphics::TColor DarkMetalColor = {read=FDarkMetalColor, write=FDarkMetalColor, nodefault};
	__property Sptbxskins::TSpTBXLunaScheme DefaultColorScheme = {read=FDefaultColorScheme, write=SetDefaultColorScheme, default=3};
};


class DELPHICLASS TSpTBXAthenSkin;
class PASCALIMPLEMENTATION TSpTBXAthenSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXAthenSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXAthenSkin(void) { }
	
};


class DELPHICLASS TSpTBXDreamSkin;
class PASCALIMPLEMENTATION TSpTBXDreamSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXDreamSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXDreamSkin(void) { }
	
};


class DELPHICLASS TSpTBXEosSkin;
class PASCALIMPLEMENTATION TSpTBXEosSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXEosSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXEosSkin(void) { }
	
};


class DELPHICLASS TSpTBXHumanSkin;
class PASCALIMPLEMENTATION TSpTBXHumanSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
	
public:
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Sptbxskins::TSpTBXSkinComponentsType Component, Sptbxskins::TSpTBXSkinStatesType State, bool Background, bool Borders, bool Vertical = false, Controls::TAnchors ForceRectBorders = Controls::TAnchors() );
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXHumanSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXHumanSkin(void) { }
	
};


class DELPHICLASS TSpTBXLeopardSkin;
class PASCALIMPLEMENTATION TSpTBXLeopardSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
	
public:
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Sptbxskins::TSpTBXSkinComponentsType Component, Sptbxskins::TSpTBXSkinStatesType State, bool Background, bool Borders, bool Vertical = false, Controls::TAnchors ForceRectBorders = Controls::TAnchors() );
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXLeopardSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXLeopardSkin(void) { }
	
};


class DELPHICLASS TSpTBXXitoSkin;
class PASCALIMPLEMENTATION TSpTBXXitoSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXXitoSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXXitoSkin(void) { }
	
};


class DELPHICLASS TSpTBXOfficeXPSkin;
class PASCALIMPLEMENTATION TSpTBXOfficeXPSkin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	virtual void __fastcall FillOptions(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXOfficeXPSkin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXOfficeXPSkin(void) { }
	
};


typedef StaticArray<Graphics::TColor, 23> TSpTBXOffice2003Colors;

class DELPHICLASS TSpTBXOffice2003Skin;
class PASCALIMPLEMENTATION TSpTBXOffice2003Skin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
private:
	void __fastcall SetDefaultColorScheme(const Sptbxskins::TSpTBXLunaScheme Value);
	
protected:
	TSpTBXOffice2003Colors FColors;
	Sptbxskins::TSpTBXLunaScheme FDefaultColorScheme;
	virtual void __fastcall FillColors(void);
	virtual void __fastcall FillOptions(void);
	
public:
	__fastcall virtual TSpTBXOffice2003Skin(void);
	__property Sptbxskins::TSpTBXLunaScheme DefaultColorScheme = {read=FDefaultColorScheme, write=SetDefaultColorScheme, default=3};
public:
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXOffice2003Skin(void) { }
	
};


typedef StaticArray<Graphics::TColor, 18> TSpTBXOffice2007Colors;

class DELPHICLASS TSpTBXOffice2007Skin;
class PASCALIMPLEMENTATION TSpTBXOffice2007Skin : public Sptbxskins::TSpTBXSkinOptions
{
	typedef Sptbxskins::TSpTBXSkinOptions inherited;
	
protected:
	TSpTBXOffice2007Colors FColors;
	virtual void __fastcall FillColors(void) = 0 ;
	virtual void __fastcall FillOptions(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXOffice2007Skin(void) : Sptbxskins::TSpTBXSkinOptions() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXOffice2007Skin(void) { }
	
};


class DELPHICLASS TSpTBXOffice2007BlueSkin;
class PASCALIMPLEMENTATION TSpTBXOffice2007BlueSkin : public TSpTBXOffice2007Skin
{
	typedef TSpTBXOffice2007Skin inherited;
	
protected:
	virtual void __fastcall FillColors(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXOffice2007BlueSkin(void) : TSpTBXOffice2007Skin() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXOffice2007BlueSkin(void) { }
	
};


class DELPHICLASS TSpTBXOffice2007BlackSkin;
class PASCALIMPLEMENTATION TSpTBXOffice2007BlackSkin : public TSpTBXOffice2007Skin
{
	typedef TSpTBXOffice2007Skin inherited;
	
protected:
	virtual void __fastcall FillColors(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXOffice2007BlackSkin(void) : TSpTBXOffice2007Skin() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXOffice2007BlackSkin(void) { }
	
};


class DELPHICLASS TSpTBXOffice2007SilverSkin;
class PASCALIMPLEMENTATION TSpTBXOffice2007SilverSkin : public TSpTBXOffice2007Skin
{
	typedef TSpTBXOffice2007Skin inherited;
	
protected:
	virtual void __fastcall FillColors(void);
public:
	/* TSpTBXSkinOptions.Create */ inline __fastcall virtual TSpTBXOffice2007SilverSkin(void) : TSpTBXOffice2007Skin() { }
	/* TSpTBXSkinOptions.Destroy */ inline __fastcall virtual ~TSpTBXOffice2007SilverSkin(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Sptbxdefaultskins */
using namespace Sptbxdefaultskins;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxdefaultskinsHPP
