// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxcolorpickerform.pas' rev: 20.00

#ifndef SptbxcolorpickerformHPP
#define SptbxcolorpickerformHPP

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
#include <Actnlist.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Tb2dock.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2extitems.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit
#include <Sptbxeditors.hpp>	// Pascal unit
#include <Sptbxformpopupmenu.hpp>	// Pascal unit
#include <Sptbxexteditors.hpp>	// Pascal unit
#include <Sptbxtabs.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxcolorpickerform
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSpTBXColorPickerDragObject;
class PASCALIMPLEMENTATION TSpTBXColorPickerDragObject : public Controls::TDragControlObject
{
	typedef Controls::TDragControlObject inherited;
	
protected:
	virtual Controls::TCursor __fastcall GetDragCursor(bool Accepted, int X, int Y);
public:
	/* TBaseDragControlObject.Create */ inline __fastcall virtual TSpTBXColorPickerDragObject(Controls::TControl* AControl) : Controls::TDragControlObject(AControl) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TSpTBXColorPickerDragObject(void) { }
	
};


class DELPHICLASS TSpTBXColorEditPopupMenu;
class PASCALIMPLEMENTATION TSpTBXColorEditPopupMenu : public Sptbxformpopupmenu::TSpTBXFormPopupMenu
{
	typedef Sptbxformpopupmenu::TSpTBXFormPopupMenu inherited;
	
protected:
	virtual void __fastcall DoGetPopupFormClass(Forms::TCustomFormClass &AFormClass);
	virtual bool __fastcall InternalPopup(int X, int Y, bool ForceFocus, Controls::TControl* PopupControl = (Controls::TControl*)(0x0));
	
public:
	__fastcall virtual TSpTBXColorEditPopupMenu(Classes::TComponent* AOwner);
public:
	/* TSpTBXFormPopupMenu.Destroy */ inline __fastcall virtual ~TSpTBXColorEditPopupMenu(void) { }
	
};


class DELPHICLASS TSpTBXColorPickerForm;
class PASCALIMPLEMENTATION TSpTBXColorPickerForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TTimer* Timer1;
	Extctrls::TImage* imgColorPicker;
	Sptbxtabs::TSpTBXTabControl* SpTBXTabControl1;
	Sptbxtabs::TSpTBXTabItem* SpTBXTabItem1;
	Sptbxtabs::TSpTBXTabSheet* SpTBXTabSheet1;
	Sptbxtabs::TSpTBXTabItem* SpTBXTabItem2;
	Sptbxtabs::TSpTBXTabSheet* SpTBXTabSheet2;
	Extctrls::TImage* imgPalette;
	Sptbxcontrols::TSpTBXSpeedButton* btnColorPicker;
	Sptbxtabs::TSpTBXTabItem* SpTBXTabItem3;
	Sptbxtabs::TSpTBXTabSheet* SpTBXTabSheet3;
	Controls::TImageList* ImageList1;
	Sptbxexteditors::TSpTBXColorListBox* SpTBXColorListBox1;
	Dialogs::TColorDialog* ColorDialog1;
	Sptbxcontrols::TSpTBXPanel* SpTBXPanel1;
	Sptbxcontrols::TSpTBXSpeedButton* btnColorNone;
	Sptbxcontrols::TSpTBXSpeedButton* btnColorDialog;
	Sptbxcontrols::TSpTBXSpeedButton* btnColor;
	Sptbxcontrols::TSpTBXLabel* btnLabel;
	void __fastcall Timer1Timer(System::TObject* Sender);
	void __fastcall imgPaletteMouseMove(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	void __fastcall btnColorPickerStartDrag(System::TObject* Sender, Controls::TDragObject* &DragObject);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall btnColorPickerEndDrag(System::TObject* Sender, System::TObject* Target, int X, int Y);
	void __fastcall FormResize(System::TObject* Sender);
	void __fastcall imgPaletteMouseUp(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall SpTBXTabControl1ActiveTabChange(System::TObject* Sender, int TabIndex);
	void __fastcall SpTBXColorListBox1Click(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall btnColorDraw(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	void __fastcall btnColorNoneClick(System::TObject* Sender);
	void __fastcall btnColorNoneMouseEnter(System::TObject* Sender);
	void __fastcall btnColorDialogClick(System::TObject* Sender);
	void __fastcall btnColorDialogMouseEnter(System::TObject* Sender);
	void __fastcall btnColorDialogDraw(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	void __fastcall SpTBXPanel1DrawBackground(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	
protected:
	Graphics::TColor FSelectedColor;
	TSpTBXColorPickerDragObject* FColorPickerDragObject;
	void __fastcall CenterImages(void);
	
public:
	Graphics::TColor __fastcall GetSelectedColor(void);
	void __fastcall SetSelectedColor(Graphics::TColor AColor);
	void __fastcall UpdateColorLabel(Graphics::TColor AColor, int AButtonType = 0xffffffff);
	__property Graphics::TColor SelectedColor = {read=FSelectedColor, write=FSelectedColor, nodefault};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TSpTBXColorPickerForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TSpTBXColorPickerForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TSpTBXColorPickerForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXColorPickerForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const ShortInt crSpTBXEyeDropper = 0x67;
extern PACKAGE System::ResourceString _SSpTBXTransparentColor;
#define Sptbxcolorpickerform_SSpTBXTransparentColor System::LoadResourceString(&Sptbxcolorpickerform::_SSpTBXTransparentColor)
extern PACKAGE System::ResourceString _SSpTBXColorPicker;
#define Sptbxcolorpickerform_SSpTBXColorPicker System::LoadResourceString(&Sptbxcolorpickerform::_SSpTBXColorPicker)
extern PACKAGE void __fastcall SpScreenShot(const Types::TRect &SourceR, Graphics::TCanvas* DestCanvas, const Types::TRect &DestR);
extern PACKAGE void __fastcall SpScreenShotMagnify(Graphics::TCanvas* DestCanvas, const Types::TRect &DestR, bool DrawCrosshair, /* out */ Graphics::TColor &CenterColor, double ZoomFactor = 2.000000E+02);

}	/* namespace Sptbxcolorpickerform */
using namespace Sptbxcolorpickerform;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxcolorpickerformHPP
