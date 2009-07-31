// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxskins.pas' rev: 20.00

#ifndef SptbxskinsHPP
#define SptbxskinsHPP

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
#include <Stdctrls.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Inifiles.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxskins
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TSpTBXSkinType { sknNone, sknWindows, sknSkin };
#pragma option pop

#pragma option push -b-
enum TSpTBXLunaScheme { lusBlue, lusMetallic, lusGreen, lusUnknown };
#pragma option pop

#pragma option push -b-
enum TSpTBXSkinComponentsType { skncDock, skncDockablePanel, skncDockablePanelTitleBar, skncGutter, skncMenuBar, skncOpenToolbarItem, skncPanel, skncPopup, skncSeparator, skncSplitter, skncStatusBar, skncStatusBarGrip, skncTabBackground, skncTabToolbar, skncToolbar, skncToolbarGrip, skncWindow, skncWindowTitleBar, skncMenuBarItem, skncMenuItem, skncToolbarItem, skncButton, skncCheckBox, skncEditButton, skncEditFrame, skncHeader, skncLabel, skncListItem, skncProgressBar, skncRadioButton, skncTab, skncTrackBar, skncTrackBarButton };
#pragma option pop

#pragma option push -b-
enum TSpTBXSkinStatesType { sknsNormal, sknsDisabled, sknsHotTrack, sknsPushed, sknsChecked, sknsCheckedAndHotTrack };
#pragma option pop

typedef Set<TSpTBXSkinStatesType, sknsNormal, sknsCheckedAndHotTrack>  TSpTBXSkinStatesSet;

#pragma option push -b-
enum TSpTBXSkinPartsType { sknpBody, sknpBorders, sknpText };
#pragma option pop

struct TSpTBXSkinComponentsIdentEntry
{
	
public:
	System::UnicodeString Name;
	TSpTBXSkinStatesSet States;
};


typedef StaticArray<TSpTBXSkinComponentsIdentEntry, 33> Sptbxskins__1;

typedef StaticArray<System::UnicodeString, 6> Sptbxskins__2;

typedef StaticArray<System::UnicodeString, 6> Sptbxskins__3;

#pragma option push -b-
enum TSpTextRotationAngle { tra0, tra90, tra270 };
#pragma option pop

struct TSpTBXTextInfo
{
	
public:
	System::WideString Text;
	TSpTextRotationAngle TextAngle;
	unsigned TextFlags;
	tagSIZE TextSize;
	bool IsCaptionShown;
	bool IsTextRotated;
};


#pragma option push -b-
enum TSpGlyphLayout { ghlGlyphLeft, ghlGlyphTop };
#pragma option pop

#pragma option push -b-
enum TSpGlowDirection { gldNone, gldAll, gldTopLeft, gldBottomRight };
#pragma option pop

#pragma option push -b-
enum TSpTBXComboPart { cpNone, cpCombo, cpSplitLeft, cpSplitRight };
#pragma option pop

struct TSpTBXMenuItemMarginsInfo
{
	
public:
	Types::TRect Margins;
	int GutterSize;
	int LeftCaptionMargin;
	int RightCaptionMargin;
	int ImageTextSpace;
};


struct TSpTBXMenuItemInfo
{
	
public:
	bool Enabled;
	bool HotTrack;
	bool Pushed;
	bool Checked;
	bool HasArrow;
	bool ImageShown;
	bool ImageOrCheckShown;
	tagSIZE ImageSize;
	tagSIZE RightImageSize;
	bool IsDesigning;
	bool IsOnMenuBar;
	bool IsOnToolbox;
	bool IsOpen;
	bool IsSplit;
	bool IsSunkenCaption;
	bool IsVertical;
	TSpTBXMenuItemMarginsInfo MenuMargins;
	TSpTBXComboPart ComboPart;
	Types::TRect ComboRect;
	TSpTBXSkinStatesType ComboState;
	bool ToolbarStyle;
	TSpTBXSkinStatesType State;
	TSpTBXSkinType SkinType;
};


#pragma option push -b-
enum TSpTBXColorTextType { cttDefault, cttHTML, cttIdentAndHTML };
#pragma option pop

class DELPHICLASS TSpTBXSkinOptionEntry;
class PASCALIMPLEMENTATION TSpTBXSkinOptionEntry : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	int FSkinType;
	Graphics::TColor FColor1;
	Graphics::TColor FColor2;
	Graphics::TColor FColor3;
	Graphics::TColor FColor4;
	
protected:
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
	
public:
	__fastcall virtual TSpTBXSkinOptionEntry(void);
	void __fastcall Fill(int ASkinType, Graphics::TColor AColor1, Graphics::TColor AColor2, Graphics::TColor AColor3, Graphics::TColor AColor4);
	void __fastcall ReadFromString(System::UnicodeString S);
	System::UnicodeString __fastcall WriteToString();
	bool __fastcall IsEmpty(void);
	bool __fastcall IsEqual(TSpTBXSkinOptionEntry* AOptionEntry);
	void __fastcall Reset(void);
	
__published:
	__property int SkinType = {read=FSkinType, write=FSkinType, nodefault};
	__property Graphics::TColor Color1 = {read=FColor1, write=FColor1, nodefault};
	__property Graphics::TColor Color2 = {read=FColor2, write=FColor2, nodefault};
	__property Graphics::TColor Color3 = {read=FColor3, write=FColor3, nodefault};
	__property Graphics::TColor Color4 = {read=FColor4, write=FColor4, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSpTBXSkinOptionEntry(void) { }
	
};


class DELPHICLASS TSpTBXSkinOptionCategory;
class PASCALIMPLEMENTATION TSpTBXSkinOptionCategory : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	TSpTBXSkinOptionEntry* FBody;
	TSpTBXSkinOptionEntry* FBorders;
	Graphics::TColor FTextColor;
	
protected:
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
	
public:
	__fastcall virtual TSpTBXSkinOptionCategory(void);
	__fastcall virtual ~TSpTBXSkinOptionCategory(void);
	bool __fastcall IsEmpty(void);
	void __fastcall Reset(void);
	void __fastcall LoadFromIni(Inifiles::TMemIniFile* MemIni, System::UnicodeString Section, System::UnicodeString Ident);
	void __fastcall SaveToIni(Inifiles::TMemIniFile* MemIni, System::UnicodeString Section, System::UnicodeString Ident);
	
__published:
	__property TSpTBXSkinOptionEntry* Body = {read=FBody, write=FBody};
	__property TSpTBXSkinOptionEntry* Borders = {read=FBorders, write=FBorders};
	__property Graphics::TColor TextColor = {read=FTextColor, write=FTextColor, nodefault};
};


class DELPHICLASS TSpTBXSkinOptions;
class PASCALIMPLEMENTATION TSpTBXSkinOptions : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FColorBtnFace;
	StaticArray<StaticArray<TSpTBXSkinOptionCategory*, 6>, 33> FOptions;
	bool FOfficeIcons;
	bool FOfficeMenuSeparator;
	bool FOfficeStatusBar;
	int FFloatingWindowBorderSize;
	System::UnicodeString FSkinName;
	bool __fastcall GetOfficeIcons(void);
	bool __fastcall GetOfficeMenuSeparator(void);
	bool __fastcall GetOfficePopup(void);
	bool __fastcall GetOfficeStatusBar(void);
	int __fastcall GetFloatingWindowBorderSize(void);
	void __fastcall SetFloatingWindowBorderSize(const int Value);
	
protected:
	virtual void __fastcall AssignTo(Classes::TPersistent* Dest);
	virtual void __fastcall FillOptions(void);
	void __fastcall BroadcastChanges(void);
	
public:
	__fastcall virtual TSpTBXSkinOptions(void);
	__fastcall virtual ~TSpTBXSkinOptions(void);
	void __fastcall CopyOptions(TSpTBXSkinComponentsType AComponent, TSpTBXSkinComponentsType ToComponent);
	TSpTBXSkinOptionCategory* __fastcall Options(TSpTBXSkinComponentsType Component, TSpTBXSkinStatesType State)/* overload */;
	TSpTBXSkinOptionCategory* __fastcall Options(TSpTBXSkinComponentsType Component)/* overload */;
	void __fastcall LoadFromFile(System::WideString Filename);
	virtual void __fastcall LoadFromStrings(Classes::TStrings* L);
	void __fastcall SaveToFile(System::WideString Filename);
	virtual void __fastcall SaveToStrings(Classes::TStrings* L);
	virtual void __fastcall SaveToMemIni(Inifiles::TMemIniFile* MemIni);
	void __fastcall Reset(bool ForceResetSkinProperties = true);
	virtual void __fastcall GetDropDownArrowSize(/* out */ int &DropDownArrowSize, /* out */ int &DropDownArrowMargin, /* out */ int &SplitBtnArrowSize);
	virtual void __fastcall GetMenuItemMargins(Graphics::TCanvas* ACanvas, int ImgSize, /* out */ TSpTBXMenuItemMarginsInfo &MarginsInfo);
	TSpTBXSkinStatesType __fastcall GetState(bool Enabled, bool Pushed, bool HotTrack, bool Checked);
	virtual Graphics::TColor __fastcall GetTextColor(TSpTBXSkinComponentsType Component, TSpTBXSkinStatesType State, TSpTBXSkinType SkinType = (TSpTBXSkinType)(0x2));
	virtual void __fastcall PaintBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TSpTBXSkinComponentsType Component, TSpTBXSkinStatesType State, bool Background, bool Borders, bool Vertical = false, Controls::TAnchors ForceRectBorders = Controls::TAnchors() );
	virtual void __fastcall PaintMenuCheckMark(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Checked, bool Grayed, bool MenuItemStyle, TSpTBXSkinStatesType State);
	virtual void __fastcall PaintMenuRadioMark(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Checked, bool MenuItemStyle, TSpTBXSkinStatesType State);
	virtual void __fastcall PaintWindowFrame(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool IsActive, bool DrawBody, int BorderSize = 0x4);
	__property int FloatingWindowBorderSize = {read=GetFloatingWindowBorderSize, write=SetFloatingWindowBorderSize, nodefault};
	__property bool OfficeMenuSeparator = {read=GetOfficeMenuSeparator, write=FOfficeMenuSeparator, nodefault};
	__property bool OfficePopup = {read=GetOfficePopup, nodefault};
	__property bool OfficeStatusBar = {read=GetOfficeStatusBar, write=FOfficeStatusBar, nodefault};
	__property bool OfficeIcons = {read=GetOfficeIcons, write=FOfficeIcons, nodefault};
	__property Graphics::TColor ColorBtnFace = {read=FColorBtnFace, write=FColorBtnFace, nodefault};
	__property System::UnicodeString SkinName = {read=FSkinName, write=FSkinName};
};


typedef TMetaClass* TSpTBXSkinOptionsClass;

class DELPHICLASS TSpTBXSkinsListEntry;
class PASCALIMPLEMENTATION TSpTBXSkinsListEntry : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	TSpTBXSkinOptionsClass SkinClass;
	Classes::TStringList* SkinStrings;
	__fastcall virtual ~TSpTBXSkinsListEntry(void);
public:
	/* TObject.Create */ inline __fastcall TSpTBXSkinsListEntry(void) : System::TObject() { }
	
};


class DELPHICLASS TSpTBXSkinsList;
class PASCALIMPLEMENTATION TSpTBXSkinsList : public Classes::TStringList
{
	typedef Classes::TStringList inherited;
	
private:
	TSpTBXSkinsListEntry* __fastcall GetSkinOption(int Index);
	
public:
	virtual void __fastcall Delete(int Index);
	__fastcall virtual ~TSpTBXSkinsList(void);
	int __fastcall AddSkin(System::UnicodeString SkinName, TSpTBXSkinOptionsClass SkinClass)/* overload */;
	int __fastcall AddSkin(Classes::TStrings* SkinOptions)/* overload */;
	int __fastcall AddSkinFromFile(System::WideString Filename);
	void __fastcall AddSkinsFromFolder(System::WideString Folder);
	void __fastcall GetSkinNames(Classes::TStrings* SkinNames);
	__property TSpTBXSkinsListEntry* SkinOptions[int Index] = {read=GetSkinOption};
public:
	/* TStringList.Create */ inline __fastcall TSpTBXSkinsList(void)/* overload */ : Classes::TStringList() { }
	
};


class DELPHICLASS TSpTBXSkinManager;
class PASCALIMPLEMENTATION TSpTBXSkinManager : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	TSpTBXSkinOptions* FCurrentSkin;
	Classes::TList* FNotifies;
	TSpTBXSkinsList* FSkinsList;
	Classes::TNotifyEvent FOnSkinChange;
	void __fastcall Broadcast(void);
	System::UnicodeString __fastcall GetCurrentSkinName();
	
public:
	__fastcall virtual TSpTBXSkinManager(void);
	__fastcall virtual ~TSpTBXSkinManager(void);
	TSpTBXSkinType __fastcall GetSkinType(void);
	bool __fastcall IsDefaultSkin(void);
	bool __fastcall IsXPThemesEnabled(void);
	void __fastcall AddSkinNotification(System::TObject* AObject);
	void __fastcall RemoveSkinNotification(System::TObject* AObject);
	void __fastcall BroadcastSkinNotification(void);
	void __fastcall LoadFromFile(System::WideString Filename);
	void __fastcall SaveToFile(System::WideString Filename);
	void __fastcall SetToDefaultSkin(void);
	void __fastcall SetSkin(System::UnicodeString SkinName);
	void __fastcall ChangeControlSkinType(Controls::TWinControl* Control, TSpTBXSkinType SkinType, bool Recursive = true);
	__property TSpTBXSkinOptions* CurrentSkin = {read=FCurrentSkin};
	__property System::UnicodeString CurrentSkinName = {read=GetCurrentSkinName};
	__property TSpTBXSkinsList* SkinsList = {read=FSkinsList};
	__property Classes::TNotifyEvent OnSkinChange = {read=FOnSkinChange, write=FOnSkinChange};
};


class DELPHICLASS TSpTBXSkinSwitcher;
class PASCALIMPLEMENTATION TSpTBXSkinSwitcher : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Classes::TNotifyEvent FOnSkinChange;
	System::UnicodeString __fastcall GetSkin();
	void __fastcall SetSkin(const System::UnicodeString Value);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
public:
	__fastcall virtual TSpTBXSkinSwitcher(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXSkinSwitcher(void);
	
__published:
	__property System::UnicodeString Skin = {read=GetSkin, write=SetSkin};
	__property Classes::TNotifyEvent OnSkinChange = {read=FOnSkinChange, write=FOnSkinChange};
};


typedef BOOL __stdcall (*TSpPrintWindow)(HWND Hnd, HDC HdcBlt, unsigned nFlags);

//-- var, const, procedure ---------------------------------------------------
static const Word WM_SPSKINCHANGE = 0x87d7;
static const ShortInt MENU_POPUPBACKGROUND = 0x9;
static const ShortInt MENU_POPUPBORDERS = 0xa;
static const ShortInt MENU_POPUPCHECK = 0xb;
static const ShortInt MENU_POPUPCHECKBACKGROUND = 0xc;
static const ShortInt MENU_POPUPGUTTER = 0xd;
static const ShortInt MENU_POPUPITEM = 0xe;
static const ShortInt MENU_POPUPSEPARATOR = 0xf;
static const ShortInt MPI_NORMAL = 0x1;
static const ShortInt MPI_HOT = 0x2;
static const ShortInt MPI_DISABLED = 0x3;
static const ShortInt MPI_DISABLEDHOT = 0x4;
static const ShortInt MCB_DISABLED = 0x1;
static const ShortInt MCB_NORMAL = 0x2;
static const ShortInt MCB_BITMAP = 0x3;
static const ShortInt MC_CHECKMARKNORMAL = 0x1;
static const ShortInt MC_CHECKMARKDISABLED = 0x2;
static const ShortInt MC_BULLETNORMAL = 0x3;
static const ShortInt MC_BULLETDISABLED = 0x4;
extern PACKAGE Set<TSpTBXSkinComponentsType, skncDock, skncTrackBarButton>  SpTBXSkinMultiStateComponents;
#define CSpTBXSkinAllStates (Set<TSpTBXSkinStatesType, sknsNormal, sknsCheckedAndHotTrack> () << sknsNormal << sknsDisabled << sknsHotTrack << sknsPushed << sknsChecked << sknsCheckedAndHotTrack )
extern PACKAGE Sptbxskins__1 CSpTBXSkinComponents;
extern PACKAGE Sptbxskins__2 SSpTBXSkinStatesString;
extern PACKAGE Sptbxskins__3 SSpTBXSkinDisplayStatesString;
extern PACKAGE Graphics::TBitmap* StockBitmap;
extern PACKAGE TSpPrintWindow SpPrintWindow;
extern PACKAGE TSpTBXSkinManager* __fastcall SkinManager(void);
extern PACKAGE TSpTBXSkinOptions* __fastcall CurrentSkin(void);
extern PACKAGE TSpTBXSkinType __fastcall SpTBXSkinType(TSpTBXSkinType T);
extern PACKAGE TSpTBXLunaScheme __fastcall SpGetLunaScheme(void);
extern PACKAGE void __fastcall SpDrawParentBackground(Controls::TControl* Control, HDC DC, const Types::TRect &R);
extern PACKAGE HFONT __fastcall SpCreateRotatedFont(HDC DC, int Orientation = 0xa8c);
extern PACKAGE int __fastcall SpDrawRotatedText(const HDC DC, System::WideString AText, Types::TRect &ARect, const unsigned AFormat, TSpTextRotationAngle RotationAngle = (TSpTextRotationAngle)(0x2));
extern PACKAGE int __fastcall SpCalcXPText(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, System::WideString Caption, Classes::TAlignment CaptionAlignment, unsigned Flags, const tagSIZE &GlyphSize, const tagSIZE &RightGlyphSize, TSpGlyphLayout Layout, bool PushedCaption, /* out */ Types::TRect &ACaptionRect, /* out */ Types::TRect &AGlyphRect, /* out */ Types::TRect &ARightGlyphRect, TSpTextRotationAngle RotationAngle = (TSpTextRotationAngle)(0x0));
extern PACKAGE int __fastcall SpDrawXPText(Graphics::TCanvas* ACanvas, System::WideString Caption, Types::TRect &ARect, unsigned Flags, TSpGlowDirection CaptionGlow = (TSpGlowDirection)(0x0), Graphics::TColor CaptionGlowColor = (Graphics::TColor)(0xffff), TSpTextRotationAngle RotationAngle = (TSpTextRotationAngle)(0x0))/* overload */;
extern PACKAGE int __fastcall SpDrawXPText(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, System::WideString Caption, TSpGlowDirection CaptionGlow, Graphics::TColor CaptionGlowColor, Classes::TAlignment CaptionAlignment, unsigned Flags, const tagSIZE &GlyphSize, TSpGlyphLayout Layout, bool PushedCaption, /* out */ Types::TRect &ACaptionRect, /* out */ Types::TRect &AGlyphRect, TSpTextRotationAngle RotationAngle = (TSpTextRotationAngle)(0x0))/* overload */;
extern PACKAGE int __fastcall SpDrawXPText(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, System::WideString Caption, TSpGlowDirection CaptionGlow, Graphics::TColor CaptionGlowColor, Classes::TAlignment CaptionAlignment, unsigned Flags, Imglist::TCustomImageList* IL, int ImageIndex, TSpGlyphLayout Layout, bool Enabled, bool PushedCaption, bool DisabledIconCorrection, /* out */ Types::TRect &ACaptionRect, /* out */ Types::TRect &AGlyphRect, TSpTextRotationAngle RotationAngle = (TSpTextRotationAngle)(0x0))/* overload */;
extern PACKAGE tagSIZE __fastcall SpGetTextSize(HDC DC, System::WideString WS, bool NoPrefix);
extern PACKAGE int __fastcall SpGetControlTextHeight(Controls::TControl* AControl, Graphics::TFont* AFont);
extern PACKAGE tagSIZE __fastcall SpGetControlTextSize(Controls::TControl* AControl, Graphics::TFont* AFont, System::WideString WS);
extern PACKAGE bool __fastcall SpSameText(System::WideString W1, System::WideString W2);
extern PACKAGE System::WideString __fastcall SpStripAccelChars(System::WideString S);
extern PACKAGE System::WideString __fastcall SpStripShortcut(System::WideString S);
extern PACKAGE System::WideString __fastcall SpStripTrailingPunctuation(System::WideString S);
extern PACKAGE System::UnicodeString __fastcall SpRectToString(const Types::TRect &R);
extern PACKAGE bool __fastcall SpStringToRect(System::UnicodeString S, /* out */ Types::TRect &R);
extern PACKAGE System::UnicodeString __fastcall SpColorToHTML(const Graphics::TColor Color);
extern PACKAGE System::UnicodeString __fastcall SpColorToString(const Graphics::TColor Color, TSpTBXColorTextType TextType = (TSpTBXColorTextType)(0x0));
extern PACKAGE bool __fastcall SpStringToColor(System::UnicodeString S, /* out */ Graphics::TColor &Color);
extern PACKAGE void __fastcall SpGetRGB(Graphics::TColor Color, /* out */ int &R, /* out */ int &G, /* out */ int &B);
extern PACKAGE Graphics::TColor __fastcall SpRGBToColor(int R, int G, int B);
extern PACKAGE Graphics::TColor __fastcall SpLighten(Graphics::TColor Color, int Amount);
extern PACKAGE Graphics::TColor __fastcall SpBlendColors(Graphics::TColor TargetColor, Graphics::TColor BaseColor, int Percent);
extern PACKAGE Graphics::TColor __fastcall SpMixColors(Graphics::TColor TargetColor, Graphics::TColor BaseColor, System::Byte Amount);
extern PACKAGE Types::TRect __fastcall SpCenterRect(const Types::TRect &Parent, int ChildWidth, int ChildHeight)/* overload */;
extern PACKAGE Types::TRect __fastcall SpCenterRect(const Types::TRect &Parent, const Types::TRect &Child)/* overload */;
extern PACKAGE Types::TRect __fastcall SpCenterRectHoriz(const Types::TRect &Parent, int ChildWidth);
extern PACKAGE Types::TRect __fastcall SpCenterRectVert(const Types::TRect &Parent, int ChildHeight);
extern PACKAGE void __fastcall SpFillRect(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor BrushColor, Graphics::TColor PenColor = (Graphics::TColor)(0x1fffffff));
extern PACKAGE void __fastcall SpDrawLine(Graphics::TCanvas* ACanvas, int X1, int Y1, int X2, int Y2, Graphics::TColor Color);
extern PACKAGE void __fastcall SpDrawRectangle(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int CornerSize, Graphics::TColor ColorL, Graphics::TColor ColorT, Graphics::TColor ColorR, Graphics::TColor ColorB, Graphics::TColor InternalColorL, Graphics::TColor InternalColorT, Graphics::TColor InternalColorR, Graphics::TColor InternalColorB, Controls::TAnchors ForceRectBorders = Controls::TAnchors() )/* overload */;
extern PACKAGE void __fastcall SpDrawRectangle(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int CornerSize, Graphics::TColor ColorTL, Graphics::TColor ColorBR, Graphics::TColor ColorTLInternal = (Graphics::TColor)(0x1fffffff), Graphics::TColor ColorBRInternal = (Graphics::TColor)(0x1fffffff), Controls::TAnchors ForceRectBorders = Controls::TAnchors() )/* overload */;
extern PACKAGE void __fastcall SpAlphaBlend(HDC SrcDC, HDC DstDC, const Types::TRect &SrcR, const Types::TRect &DstR, System::Byte Alpha, bool SrcHasAlphaChannel = false);
extern PACKAGE void __fastcall SpPaintTo(Controls::TWinControl* WinControl, Graphics::TCanvas* ACanvas, int X, int Y);
extern PACKAGE void __fastcall SpDrawIconShadow(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Imglist::TCustomImageList* ImageList, int ImageIndex);
extern PACKAGE void __fastcall SpDrawImageList(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Imglist::TCustomImageList* ImageList, int ImageIndex, bool Enabled, bool DisabledIconCorrection);
extern PACKAGE void __fastcall SpGradient(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int StartPos, int EndPos, int ChunkSize, Graphics::TColor C1, Graphics::TColor C2, const bool Vertical);
extern PACKAGE void __fastcall SpGradientFill(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Graphics::TColor C1, const Graphics::TColor C2, const bool Vertical);
extern PACKAGE void __fastcall SpGradientFillMirror(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Graphics::TColor C1, const Graphics::TColor C2, const Graphics::TColor C3, const Graphics::TColor C4, const bool Vertical);
extern PACKAGE void __fastcall SpGradientFillMirrorTop(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Graphics::TColor C1, const Graphics::TColor C2, const Graphics::TColor C3, const Graphics::TColor C4, const bool Vertical);
extern PACKAGE void __fastcall SpGradientFillGlass(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Graphics::TColor C1, const Graphics::TColor C2, const Graphics::TColor C3, const Graphics::TColor C4, const bool Vertical);
extern PACKAGE void __fastcall SpDrawArrow(Graphics::TCanvas* ACanvas, int X, int Y, Graphics::TColor AColor, bool Vertical, bool Reverse, int Size);
extern PACKAGE void __fastcall SpDrawDropMark(Graphics::TCanvas* ACanvas, const Types::TRect &DropMark);
extern PACKAGE void __fastcall SpDrawFocusRect(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
extern PACKAGE void __fastcall SpDrawGlyphPattern(HDC DC, const Types::TRect &R, int Width, int Height, const void *PatternBits, Graphics::TColor PatternColor)/* overload */;
extern PACKAGE void __fastcall SpDrawGlyphPattern(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int PatternIndex, Graphics::TColor PatternColor)/* overload */;
extern PACKAGE void __fastcall SpDrawXPButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool Pushed, bool HotTrack, bool Checked, bool Focused, bool Defaulted, TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPCheckBoxGlyph(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, Stdctrls::TCheckBoxState State, bool HotTrack, bool Pushed, TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPRadioButtonGlyph(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool Checked, bool HotTrack, bool Pushed, TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPEditFrame(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool HotTrack, TSpTBXSkinType SkinType, bool ClipContent = false, bool AutoAdjust = false)/* overload */;
extern PACKAGE void __fastcall SpDrawXPEditFrame(Controls::TWinControl* AWinControl, bool HotTracking, TSpTBXSkinType SkinType, bool AutoAdjust = false, bool HideFrame = false)/* overload */;
extern PACKAGE void __fastcall SpDrawXPGrip(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, Graphics::TColor LoC, Graphics::TColor HiC);
extern PACKAGE void __fastcall SpDrawXPHeader(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool HotTrack, bool Pushed, TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPListItemBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool HotTrack, bool Pushed, bool Focused, TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpPaintSkinBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TSpTBXSkinOptionCategory* SkinOption, bool Vertical);
extern PACKAGE void __fastcall SpPaintSkinBorders(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TSpTBXSkinOptionCategory* SkinOption, Controls::TAnchors ForceRectBorders = Controls::TAnchors() );
extern PACKAGE bool __fastcall SpIsWinVista(void);
extern PACKAGE bool __fastcall SpGetDirectories(System::WideString Path, Classes::TStringList* L);

}	/* namespace Sptbxskins */
using namespace Sptbxskins;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxskinsHPP
