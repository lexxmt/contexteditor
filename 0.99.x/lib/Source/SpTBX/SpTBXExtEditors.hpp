// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxexteditors.pas' rev: 20.00

#ifndef SptbxexteditorsHPP
#define SptbxexteditorsHPP

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
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxeditors.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxexteditors
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TSpTBXColorListBoxStyle { clbsStandardColors, clbsSystemColors, clbsIncludeNone, clbsIncludeDefault, clbsCustomColor, clbsPrettyNames, clbsNoneAsTransparent };
#pragma option pop

typedef Set<TSpTBXColorListBoxStyle, clbsStandardColors, clbsNoneAsTransparent>  TSpTBXColorListBoxStyles;

class DELPHICLASS TSpTBXColorEditButton;
class PASCALIMPLEMENTATION TSpTBXColorEditButton : public Sptbxeditors::TSpTBXEditButton
{
	typedef Sptbxeditors::TSpTBXEditButton inherited;
	
private:
	Graphics::TColor FSelectedColor;
	void __fastcall SetSelectedColor(const Graphics::TColor Value);
	
protected:
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual Menus::TPopupMenu* __fastcall GetInternalDropDownMenu(void);
	
public:
	__property Graphics::TColor SelectedColor = {read=FSelectedColor, write=SetSelectedColor, nodefault};
public:
	/* TSpTBXEditButton.Create */ inline __fastcall virtual TSpTBXColorEditButton(Classes::TComponent* AOwner) : Sptbxeditors::TSpTBXEditButton(AOwner) { }
	
public:
	/* TSpTBXCustomButton.Destroy */ inline __fastcall virtual ~TSpTBXColorEditButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXColorEditButton(HWND ParentWindow) : Sptbxeditors::TSpTBXEditButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXColorEdit;
class PASCALIMPLEMENTATION TSpTBXColorEdit : public Sptbxeditors::TSpTBXEdit
{
	typedef Sptbxeditors::TSpTBXEdit inherited;
	
private:
	TSpTBXColorEditButton* FColorButton;
	Sptbxskins::TSpTBXColorTextType FSelectedFormat;
	Classes::TNotifyEvent FOnSelectedColorChanged;
	Graphics::TColor __fastcall GetSelectedColor(void);
	void __fastcall SetSelectedColor(const Graphics::TColor Value);
	void __fastcall SetSelectedFormat(const Sptbxskins::TSpTBXColorTextType Value);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Message);
	
protected:
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall DoSelectedColorChanged(void);
	void __fastcall UpdateTextFromValue(void);
	void __fastcall UpdateValueFromText(bool RevertWhenInvalid = true);
	
public:
	__fastcall virtual TSpTBXColorEdit(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXColorEdit(void);
	__property TSpTBXColorEditButton* ColorButton = {read=FColorButton};
	
__published:
	__property Text = {stored=false};
	__property Graphics::TColor SelectedColor = {read=GetSelectedColor, write=SetSelectedColor, nodefault};
	__property Sptbxskins::TSpTBXColorTextType SelectedFormat = {read=FSelectedFormat, write=SetSelectedFormat, default=2};
	__property Classes::TNotifyEvent OnSelectedColorChanged = {read=FOnSelectedColorChanged, write=FOnSelectedColorChanged};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXColorEdit(HWND ParentWindow) : Sptbxeditors::TSpTBXEdit(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXFontComboBoxPreview;
class PASCALIMPLEMENTATION TSpTBXFontComboBoxPreview : public Controls::TCustomControl
{
	typedef Controls::TCustomControl inherited;
	
private:
	Extctrls::TPanel* FPreviewPanel;
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	
public:
	__fastcall virtual TSpTBXFontComboBoxPreview(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXFontComboBoxPreview(void);
	__property Extctrls::TPanel* PreviewPanel = {read=FPreviewPanel};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXFontComboBoxPreview(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXFontComboBox;
class PASCALIMPLEMENTATION TSpTBXFontComboBox : public Sptbxeditors::TSpTBXComboBox
{
	typedef Sptbxeditors::TSpTBXComboBox inherited;
	
private:
	bool FFontPreview;
	bool FFontNamePreview;
	int FMaxMRUItems;
	int FMRUCount;
	TSpTBXFontComboBoxPreview* FPreviewWindow;
	Graphics::TFontName FSelectedFont;
	Sptbxeditors::TSpTBXEditGetTextEvent FOnFontPreview;
	void __fastcall UpdateSelectedFont(bool AddMRU);
	void __fastcall SetFontNamePreview(const bool Value);
	void __fastcall SetSelectedFont(const Graphics::TFontName Value);
	void __fastcall SetMaxMRUItems(int Value);
	void __fastcall SetFontPreview(const bool Value);
	
protected:
	virtual void __fastcall CreateWnd(void);
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall CloseUp(void);
	DYNAMIC void __fastcall DropDown(void);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	
public:
	__fastcall virtual TSpTBXFontComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXFontComboBox(void);
	__property int MRUCount = {read=FMRUCount, nodefault};
	
__published:
	__property Items = {stored=false};
	__property AutoItemHeight = {default=0};
	__property bool FontPreview = {read=FFontPreview, write=SetFontPreview, default=1};
	__property bool FontNamePreview = {read=FFontNamePreview, write=SetFontNamePreview, default=1};
	__property int MaxMRUItems = {read=FMaxMRUItems, write=SetMaxMRUItems, default=5};
	__property Graphics::TFontName SelectedFont = {read=FSelectedFont, write=SetSelectedFont};
	__property Sptbxeditors::TSpTBXEditGetTextEvent OnFontPreview = {read=FOnFontPreview, write=FOnFontPreview};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXFontComboBox(HWND ParentWindow) : Sptbxeditors::TSpTBXComboBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXColorListBox;
class PASCALIMPLEMENTATION TSpTBXColorListBox : public Sptbxeditors::TSpTBXListBox
{
	typedef Sptbxeditors::TSpTBXListBox inherited;
	
private:
	bool FItems;
	bool FNeedToPopulate;
	Graphics::TColor FSelectedColor;
	TSpTBXColorListBoxStyles FStyle;
	void __fastcall ColorCallBack(const System::UnicodeString AName);
	System::UnicodeString __fastcall GetColorName(int Index);
	Graphics::TColor __fastcall GetColor(int Index);
	HIDESBASE Graphics::TColor __fastcall GetSelected(void);
	HIDESBASE void __fastcall SetSelected(const Graphics::TColor Value);
	HIDESBASE void __fastcall SetStyle(const TSpTBXColorListBoxStyles Value);
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall DblClick(void);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	virtual void __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	bool __fastcall PickCustomColor(void);
	void __fastcall PopulateList(void);
	
public:
	__fastcall virtual TSpTBXColorListBox(Classes::TComponent* AOwner);
	void __fastcall AddColor(Graphics::TColor AColor, System::UnicodeString AColorName);
	int __fastcall ColorCount(void);
	__property Graphics::TColor Colors[int Index] = {read=GetColor};
	__property System::UnicodeString ColorNames[int Index] = {read=GetColorName};
	
__published:
	__property bool Items = {read=FItems, nodefault};
	__property Graphics::TColor Selected = {read=GetSelected, write=SetSelected, default=0};
	__property TSpTBXColorListBoxStyles Style = {read=FStyle, write=SetStyle, default=67};
public:
	/* TSpTBXListBox.Destroy */ inline __fastcall virtual ~TSpTBXColorListBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXColorListBox(HWND ParentWindow) : Sptbxeditors::TSpTBXListBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE Controls::TImageList* FontGlyphImgList;
extern PACKAGE void __fastcall SpFillFontNames(Classes::TStrings* ADest);
extern PACKAGE void __fastcall SpCalcMaxDropDownWidth(Sptbxeditors::TSpTBXComboBox* Combo);
extern PACKAGE void __fastcall SpDrawCheckeredBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
extern PACKAGE void __fastcall SpDrawColorDropDownButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Pushed, Graphics::TColor AColor, bool CheckeredBkgndWhenTransparent = true);

}	/* namespace Sptbxexteditors */
using namespace Sptbxexteditors;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxexteditorsHPP
