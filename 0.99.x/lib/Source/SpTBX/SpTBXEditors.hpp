// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Sptbxeditors.pas' rev: 20.00

#ifndef SptbxeditorsHPP
#define SptbxeditorsHPP

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
#include <Checklst.hpp>	// Pascal unit
#include <Tb2toolbar.hpp>	// Pascal unit
#include <Tb2item.hpp>	// Pascal unit
#include <Tb2extitems.hpp>	// Pascal unit
#include <Sptbxskins.hpp>	// Pascal unit
#include <Sptbxitem.hpp>	// Pascal unit
#include <Sptbxcontrols.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Sptbxeditors
{
//-- type declarations -------------------------------------------------------
typedef Stdctrls::TComboBox* TTntComboBox;

typedef Stdctrls::TListBox* TTntListBox;

typedef Checklst::TCheckListBox* TTntCheckListBox;

#pragma option push -b-
enum TSpTBXSpinType { spnInteger, spnFloat, spnHex };
#pragma option pop

typedef void __fastcall (__closure *TSpTBXEditChangeEvent)(System::TObject* Sender, const System::WideString AText);

typedef void __fastcall (__closure *TSpTBXEditAcceptTextEvent)(System::TObject* Sender, System::WideString &NewText, bool &Accept);

typedef void __fastcall (__closure *TSpTBXEditGetTextEvent)(System::TObject* Sender, System::WideString &AText);

class DELPHICLASS TSpTBXEditItemViewer;
typedef void __fastcall (__closure *TSpTBXBeginEditEvent)(System::TObject* Sender, TSpTBXEditItemViewer* Viewer, Stdctrls::TCustomEdit* EditControl);

typedef void __fastcall (__closure *TSpTBXEditMessageEvent)(System::TObject* Sender, TSpTBXEditItemViewer* Viewer, Messages::TMessage &Message, bool &Handled);

typedef void __fastcall (__closure *TSpTBXDrawListItemEvent)(System::TObject* Sender, Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);

class DELPHICLASS TSpTBXEditButton;
class PASCALIMPLEMENTATION TSpTBXEditButton : public Sptbxcontrols::TSpTBXSpeedButton
{
	typedef Sptbxcontrols::TSpTBXSpeedButton inherited;
	
protected:
	virtual void __fastcall AdjustFont(Graphics::TFont* AFont);
	virtual bool __fastcall DoDrawDropDownArrow(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	bool __fastcall GetFrameHotTrack(void);
	
public:
	__fastcall virtual TSpTBXEditButton(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall Click(void);
public:
	/* TSpTBXCustomButton.Destroy */ inline __fastcall virtual ~TSpTBXEditButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXEditButton(HWND ParentWindow) : Sptbxcontrols::TSpTBXSpeedButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXSpinButton;
class PASCALIMPLEMENTATION TSpTBXSpinButton : public TSpTBXEditButton
{
	typedef TSpTBXEditButton inherited;
	
private:
	bool FUpPushed;
	bool FDownPushed;
	Classes::TNotifyEvent FOnUpClick;
	Classes::TNotifyEvent FOnDownClick;
	
protected:
	virtual bool __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage);
	virtual void __fastcall DoMouseLeave(void);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	__property Classes::TNotifyEvent OnUpClick = {read=FOnUpClick, write=FOnUpClick};
	__property Classes::TNotifyEvent OnDownClick = {read=FOnDownClick, write=FOnDownClick};
	
public:
	__fastcall virtual TSpTBXSpinButton(Classes::TComponent* AOwner);
	DYNAMIC void __fastcall Click(void);
	void __fastcall IsHotTracking(/* out */ bool &UpButton, /* out */ bool &DownButton, /* out */ bool &EditFrame);
	
__published:
	__property Repeating = {default=1};
public:
	/* TSpTBXCustomButton.Destroy */ inline __fastcall virtual ~TSpTBXSpinButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXSpinButton(HWND ParentWindow) : TSpTBXEditButton(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXUnicodeAdaptEdit;
class PASCALIMPLEMENTATION TSpTBXUnicodeAdaptEdit : public Stdctrls::TEdit
{
	typedef Stdctrls::TEdit inherited;
	
public:
	/* TCustomEdit.Create */ inline __fastcall virtual TSpTBXUnicodeAdaptEdit(Classes::TComponent* AOwner) : Stdctrls::TEdit(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXUnicodeAdaptEdit(HWND ParentWindow) : Stdctrls::TEdit(ParentWindow) { }
	/* TWinControl.Destroy */ inline __fastcall virtual ~TSpTBXUnicodeAdaptEdit(void) { }
	
};


class DELPHICLASS TSpTBXUnicodeEdit;
class PASCALIMPLEMENTATION TSpTBXUnicodeEdit : public TSpTBXUnicodeAdaptEdit
{
	typedef TSpTBXUnicodeAdaptEdit inherited;
	
private:
	Classes::TAlignment FAlignment;
	HIDESBASE void __fastcall SetAlignment(Classes::TAlignment Value);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall UpdateEditRect(void);
	
public:
	TSpTBXEditButton* __fastcall AddEditButton(bool RightAligned = true, int AWidth = 0xffffffff);
	bool __fastcall HasEditButton(void);
	
__published:
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
public:
	/* TCustomEdit.Create */ inline __fastcall virtual TSpTBXUnicodeEdit(Classes::TComponent* AOwner) : TSpTBXUnicodeAdaptEdit(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXUnicodeEdit(HWND ParentWindow) : TSpTBXUnicodeAdaptEdit(ParentWindow) { }
	/* TWinControl.Destroy */ inline __fastcall virtual ~TSpTBXUnicodeEdit(void) { }
	
};


class DELPHICLASS TSpTBXEdit;
class PASCALIMPLEMENTATION TSpTBXEdit : public TSpTBXUnicodeEdit
{
	typedef TSpTBXUnicodeEdit inherited;
	
private:
	Forms::TFormBorderStyle FBorderStyle;
	bool FHotTrack;
	Sptbxskins::TSpTBXSkinType FSkinType;
	bool FMouseInControl;
	HIDESBASE void __fastcall SetBorderStyle(const Forms::TBorderStyle Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMEnter(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
public:
	__fastcall virtual TSpTBXEdit(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXEdit(void);
	HIDESBASE void __fastcall InvalidateFrame(void);
	__property bool MouseInControl = {read=FMouseInControl, nodefault};
	
__published:
	__property Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, default=1};
	__property bool HotTrack = {read=FHotTrack, write=FHotTrack, default=1};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXEdit(HWND ParentWindow) : TSpTBXUnicodeEdit(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCustomButtonEdit;
class PASCALIMPLEMENTATION TSpTBXCustomButtonEdit : public TSpTBXEdit
{
	typedef TSpTBXEdit inherited;
	
private:
	TSpTBXEditButton* FEditButton;
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall SetName(const Classes::TComponentName Value);
	__property TSpTBXEditButton* EditButton = {read=FEditButton};
	
public:
	__fastcall virtual TSpTBXCustomButtonEdit(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCustomButtonEdit(void);
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCustomButtonEdit(HWND ParentWindow) : TSpTBXEdit(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXButtonEdit;
class PASCALIMPLEMENTATION TSpTBXButtonEdit : public TSpTBXCustomButtonEdit
{
	typedef TSpTBXCustomButtonEdit inherited;
	
__published:
	__property EditButton;
public:
	/* TSpTBXCustomButtonEdit.Create */ inline __fastcall virtual TSpTBXButtonEdit(Classes::TComponent* AOwner) : TSpTBXCustomButtonEdit(AOwner) { }
	/* TSpTBXCustomButtonEdit.Destroy */ inline __fastcall virtual ~TSpTBXButtonEdit(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXButtonEdit(HWND ParentWindow) : TSpTBXCustomButtonEdit(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXSpinEditOptions;
class PASCALIMPLEMENTATION TSpTBXSpinEditOptions : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	int FDecimal;
	System::Extended FIncrement;
	System::Extended FMinValue;
	System::Extended FMaxValue;
	System::Extended FValue;
	bool FValueSnap;
	TSpTBXSpinType FValueType;
	System::WideString FPrefix;
	System::WideString FPostfix;
	TSpTBXEditAcceptTextEvent FOnGetText;
	TSpTBXEditChangeEvent FOnSetText;
	Classes::TNotifyEvent FOnValueChanged;
	bool __fastcall IsIncrementStored(void);
	bool __fastcall IsMaxValueStored(void);
	bool __fastcall IsMinValueStored(void);
	bool __fastcall IsValueStored(void);
	void __fastcall SetDecimal(int NewDecimal);
	void __fastcall SetMaxValue(const System::Extended NewValue);
	void __fastcall SetMinValue(const System::Extended NewValue);
	void __fastcall SetValue(const System::Extended NewValue);
	void __fastcall SetValueType(TSpTBXSpinType NewType);
	void __fastcall SetPostfix(const System::WideString ValueString);
	void __fastcall SetPrefix(const System::WideString ValueString);
	__int64 __fastcall GetValueAsInteger(void);
	void __fastcall SetValueAsInteger(const __int64 NewValue);
	
protected:
	virtual void __fastcall DoValueChanged(void);
	void __fastcall UpdateTextFromValue(void);
	void __fastcall UpdateValueFromText(bool RevertWhenInvalid = true);
	__property TSpTBXEditAcceptTextEvent OnGetText = {read=FOnGetText, write=FOnGetText};
	__property TSpTBXEditChangeEvent OnSetText = {read=FOnSetText, write=FOnSetText};
	__property Classes::TNotifyEvent OnValueChanged = {read=FOnValueChanged, write=FOnValueChanged};
	
public:
	__fastcall virtual TSpTBXSpinEditOptions(void);
	void __fastcall ValueInc(void);
	void __fastcall ValueDec(void);
	__property __int64 ValueAsInteger = {read=GetValueAsInteger, write=SetValueAsInteger};
	
__published:
	__property int Decimal = {read=FDecimal, write=SetDecimal, default=2};
	__property System::Extended Increment = {read=FIncrement, write=FIncrement, stored=IsIncrementStored};
	__property System::Extended MaxValue = {read=FMaxValue, write=SetMaxValue, stored=IsMaxValueStored};
	__property System::Extended MinValue = {read=FMinValue, write=SetMinValue, stored=IsMinValueStored};
	__property System::WideString Postfix = {read=FPostfix, write=SetPostfix};
	__property System::WideString Prefix = {read=FPrefix, write=SetPrefix};
	__property System::Extended Value = {read=FValue, write=SetValue, stored=IsValueStored};
	__property bool ValueSnap = {read=FValueSnap, write=FValueSnap, default=1};
	__property TSpTBXSpinType ValueType = {read=FValueType, write=SetValueType, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSpTBXSpinEditOptions(void) { }
	
};


class DELPHICLASS TSpTBXSpinEdit;
class PASCALIMPLEMENTATION TSpTBXSpinEdit : public TSpTBXEdit
{
	typedef TSpTBXEdit inherited;
	
private:
	bool FExtendedAccept;
	TSpTBXSpinButton* FSpinButton;
	TSpTBXSpinEditOptions* FSpinOptions;
	void __fastcall SpinOptionsGetText(System::TObject* Sender, System::WideString &NewText, bool &Accept);
	void __fastcall SpinOptionsSetText(System::TObject* Sender, const System::WideString AText);
	System::Extended __fastcall GetValue(void);
	Classes::TNotifyEvent __fastcall GetValueChanged();
	void __fastcall SetValue(const System::Extended Value);
	void __fastcall SetValueChanged(const Classes::TNotifyEvent ValueChangedEvent);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Message);
	
protected:
	DYNAMIC void __fastcall Change(void);
	DYNAMIC void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpClick(System::TObject* Sender);
	virtual void __fastcall DownClick(System::TObject* Sender);
	
public:
	__fastcall virtual TSpTBXSpinEdit(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXSpinEdit(void);
	
__published:
	__property Alignment = {default=1};
	__property bool ExtendedAccept = {read=FExtendedAccept, write=FExtendedAccept, default=0};
	__property Text = {stored=false};
	__property TSpTBXSpinButton* SpinButton = {read=FSpinButton};
	__property TSpTBXSpinEditOptions* SpinOptions = {read=FSpinOptions, write=FSpinOptions};
	__property System::Extended Value = {read=GetValue, write=SetValue, stored=false};
	__property Classes::TNotifyEvent OnValueChanged = {read=GetValueChanged, write=SetValueChanged};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXSpinEdit(HWND ParentWindow) : TSpTBXEdit(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXComboBox;
class PASCALIMPLEMENTATION TSpTBXComboBox : public Stdctrls::TComboBox
{
	typedef Stdctrls::TComboBox inherited;
	
private:
	bool FAutoItemHeight;
	bool FFontChanging;
	bool FHotTrack;
	int FInternalItemHeight;
	bool FMouseInControl;
	bool FMouseInDropDownButton;
	Extctrls::TTimer* FMouseTimer;
	Sptbxskins::TSpTBXSkinType FSkinType;
	Sptbxitem::TSpTBXDrawEvent FOnDrawBackground;
	Stdctrls::TDrawItemEvent FOnDrawItemBackground;
	void __fastcall MouseTimerHandler(System::TObject* Sender);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	void __fastcall UpdateDropDownButton(void);
	HIDESBASE MESSAGE void __fastcall CMEnter(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CNMeasureItem(Messages::TWMMeasureItem &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	MESSAGE void __fastcall CMSPFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	HIDESBASE MESSAGE void __fastcall WMMouseMove(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMPaint(Messages::TWMPaint &Message);
	MESSAGE void __fastcall WMSetFont(Messages::TWMSetFont &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	DYNAMIC void __fastcall CloseUp(void);
	virtual void __fastcall DoDrawBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall DrawItemBackground(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall EditWndProc(Messages::TMessage &Message);
	virtual int __fastcall GetItemHt(void);
	virtual void __fastcall SetItemHeight(int Value);
	
public:
	__fastcall virtual TSpTBXComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXComboBox(void);
	Types::TRect __fastcall GetDropDownButtonRect();
	bool __fastcall GetMouseInDropDownButton(void);
	HIDESBASE void __fastcall InvalidateFrame(void);
	__property bool MouseInControl = {read=FMouseInControl, nodefault};
	
__published:
	__property bool AutoItemHeight = {read=FAutoItemHeight, write=FAutoItemHeight, default=1};
	__property bool HotTrack = {read=FHotTrack, write=FHotTrack, default=1};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property Sptbxitem::TSpTBXDrawEvent OnDrawBackground = {read=FOnDrawBackground, write=FOnDrawBackground};
	__property Stdctrls::TDrawItemEvent OnDrawItemBackground = {read=FOnDrawItemBackground, write=FOnDrawItemBackground};
	__property OnMouseMove;
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXComboBox(HWND ParentWindow) : Stdctrls::TComboBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXListBox;
class PASCALIMPLEMENTATION TSpTBXListBox : public Stdctrls::TListBox
{
	typedef Stdctrls::TListBox inherited;
	
private:
	bool FHotTracking;
	bool FHotTrack;
	Sptbxskins::TSpTBXSkinType FSkinType;
	bool FChildFocused;
	TSpTBXDrawListItemEvent FOnDrawItem;
	TSpTBXDrawListItemEvent FOnDrawItemBackground;
	void __fastcall SetHotTrack(const bool Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFocusChanged(Controls::TCMFocusChanged &Message);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawItemBackground(Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall DrawItemBackground(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	
public:
	__fastcall virtual TSpTBXListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXListBox(void);
	void __fastcall InvalidateBorders(void);
	__property bool HotTracking = {read=FHotTracking, nodefault};
	
__published:
	__property Style = {default=1};
	__property bool HotTrack = {read=FHotTrack, write=SetHotTrack, default=1};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property TSpTBXDrawListItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	__property TSpTBXDrawListItemEvent OnDrawItemBackground = {read=FOnDrawItemBackground, write=FOnDrawItemBackground};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXListBox(HWND ParentWindow) : Stdctrls::TListBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXCheckListBox;
class PASCALIMPLEMENTATION TSpTBXCheckListBox : public Checklst::TCheckListBox
{
	typedef Checklst::TCheckListBox inherited;
	
private:
	bool FHotTracking;
	bool FHotTrack;
	Sptbxskins::TSpTBXSkinType FSkinType;
	bool FChildFocused;
	TSpTBXDrawListItemEvent FOnDrawItem;
	TSpTBXDrawListItemEvent FOnDrawItemBackground;
	void __fastcall SetHotTrack(const bool Value);
	void __fastcall SetSkinType(const Sptbxskins::TSpTBXSkinType Value);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFocusChanged(Controls::TCMFocusChanged &Message);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	MESSAGE void __fastcall WMSpSkinChange(Messages::TMessage &Message);
	
protected:
	virtual void __fastcall DoDrawItem(Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DoDrawItemBackground(Graphics::TCanvas* ACanvas, Types::TRect &ARect, int Index, const Windows::TOwnerDrawState State, const Sptbxitem::TSpTBXPaintStage PaintStage, bool &PaintDefault);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall DrawItemBackground(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	
public:
	__fastcall virtual TSpTBXCheckListBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXCheckListBox(void);
	void __fastcall InvalidateBorders(void);
	__property bool HotTracking = {read=FHotTracking, nodefault};
	
__published:
	__property Style = {default=1};
	__property bool HotTrack = {read=FHotTrack, write=SetHotTrack, default=1};
	__property Sptbxskins::TSpTBXSkinType SkinType = {read=FSkinType, write=SetSkinType, default=2};
	__property TSpTBXDrawListItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	__property TSpTBXDrawListItemEvent OnDrawItemBackground = {read=FOnDrawItemBackground, write=FOnDrawItemBackground};
public:
	/* TWinControl.CreateParented */ inline __fastcall TSpTBXCheckListBox(HWND ParentWindow) : Checklst::TCheckListBox(ParentWindow) { }
	
};


class DELPHICLASS TSpTBXEditItem;
class PASCALIMPLEMENTATION TSpTBXEditItem : public Sptbxitem::TSpTBXCustomItem
{
	typedef Sptbxitem::TSpTBXCustomItem inherited;
	
private:
	System::WideString FEditCaption;
	Imglist::TImageIndex FEditImageIndex;
	System::WideString FText;
	bool FAllowVerticalEditor;
	Stdctrls::TEditCharCase FCharCase;
	Sptbxitem::TSpTBXFontSettings* FEditorFontSettings;
	bool FExtendedAccept;
	Sptbxitem::TSpTBXFontSettings* FFontSettings;
	int FMaxLength;
	System::WideChar FPasswordChar;
	bool FReadOnly;
	bool FShowImage;
	TSpTBXEditAcceptTextEvent FOnAcceptText;
	TSpTBXBeginEditEvent FOnBeginEdit;
	TSpTBXEditChangeEvent FOnChange;
	TSpTBXEditMessageEvent FOnEditMessage;
	HIDESBASE void __fastcall FontSettingsChanged(System::TObject* Sender);
	void __fastcall SetAllowVerticalEditor(const bool Value);
	void __fastcall SetCharCase(Stdctrls::TEditCharCase Value);
	void __fastcall SetEditCaption(const System::WideString Value);
	void __fastcall SetEditorFontSettings(const Sptbxitem::TSpTBXFontSettings* Value);
	void __fastcall SetMaxLength(int Value);
	void __fastcall SetPasswordChar(System::WideChar Value);
	void __fastcall SetShowImage(const bool Value);
	void __fastcall SetText(System::WideString Value);
	
protected:
	virtual bool __fastcall DoAcceptText(System::WideString &NewText);
	virtual bool __fastcall DoAutoComplete(System::WideString &AText);
	virtual void __fastcall DoBeginEdit(TSpTBXEditItemViewer* Viewer);
	virtual void __fastcall DoChange(const System::WideString AText);
	virtual void __fastcall DoTextChanging(const System::WideString OldText, System::WideString &NewText, int Reason);
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	virtual bool __fastcall NeedToRecreateViewer(Tb2item::TTBItemViewer* AViewer);
	virtual void __fastcall SetTextEx(System::WideString Value, int Reason);
	
public:
	bool __fastcall StartEditing(Tb2item::TTBView* AView);
	__fastcall virtual TSpTBXEditItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXEditItem(void);
	
__published:
	__property Action;
	__property Alignment = {default=0};
	__property Caption;
	__property CustomWidth = {default=64};
	__property CustomHeight = {default=-1};
	__property DisplayMode = {default=0};
	__property Enabled = {default=1};
	__property FontSettings;
	__property GroupIndex = {default=0};
	__property HelpContext = {default=0};
	__property Hint;
	__property ImageIndex = {default=-1};
	__property Images;
	__property ShortCut = {default=0};
	__property Visible = {default=1};
	__property OnClick;
	__property OnDrawCaption;
	__property OnDrawHint;
	__property OnDrawImage;
	__property OnDrawItem;
	__property OnSelect;
	__property System::WideString EditCaption = {read=FEditCaption, write=SetEditCaption};
	__property Imglist::TImageIndex EditImageIndex = {read=FEditImageIndex, write=FEditImageIndex, default=-1};
	__property System::WideString Text = {read=FText, write=SetText};
	__property bool AllowVerticalEditor = {read=FAllowVerticalEditor, write=SetAllowVerticalEditor, default=0};
	__property Stdctrls::TEditCharCase CharCase = {read=FCharCase, write=SetCharCase, default=0};
	__property Sptbxitem::TSpTBXFontSettings* EditorFontSettings = {read=FEditorFontSettings, write=SetEditorFontSettings};
	__property bool ExtendedAccept = {read=FExtendedAccept, write=FExtendedAccept, default=0};
	__property int MaxLength = {read=FMaxLength, write=SetMaxLength, default=0};
	__property System::WideChar PasswordChar = {read=FPasswordChar, write=SetPasswordChar, default=0};
	__property bool ReadOnly = {read=FReadOnly, write=FReadOnly, default=0};
	__property bool ShowImage = {read=FShowImage, write=SetShowImage, default=0};
	__property TSpTBXEditAcceptTextEvent OnAcceptText = {read=FOnAcceptText, write=FOnAcceptText};
	__property TSpTBXBeginEditEvent OnBeginEdit = {read=FOnBeginEdit, write=FOnBeginEdit};
	__property TSpTBXEditChangeEvent OnChange = {read=FOnChange, write=FOnChange};
	__property TSpTBXEditMessageEvent OnEditMessage = {read=FOnEditMessage, write=FOnEditMessage};
};


typedef TMetaClass* TEditClass;

class PASCALIMPLEMENTATION TSpTBXEditItemViewer : public Sptbxitem::TSpTBXItemViewer
{
	typedef Sptbxitem::TSpTBXItemViewer inherited;
	
private:
	#pragma option push -b-
	enum _TSpTBXEditItemViewer__1 { ecsContinueLoop, ecsAccept, ecsClose };
	#pragma option pop
	
	
private:
	bool __fastcall EditLoop(const HWND CapHandle);
	void __fastcall EditWndProc(Messages::TMessage &Message);
	System::WideString __fastcall GetEditControlText();
	void __fastcall GetEditHeight(const HDC DC, /* out */ int &EditHeight, /* out */ int &ExternalLeading);
	HIDESBASE TSpTBXEditItem* __fastcall GetItem(void);
	void __fastcall MouseBeginEdit(void);
	tagSIZE __fastcall MeasureEditCaption();
	int __fastcall MeasureTextHeight(void);
	
protected:
	Stdctrls::TCustomEdit* FEditControl;
	Set<_TSpTBXEditItemViewer__1, ecsContinueLoop, ecsClose>  FEditControlStatus;
	virtual void __fastcall CalcSize(const Graphics::TCanvas* Canvas, int &AWidth, int &AHeight);
	DYNAMIC bool __fastcall CaptionShown(void);
	virtual void __fastcall DoBeginEdit(void);
	virtual bool __fastcall DoExecute(void);
	virtual bool __fastcall HandleEditMessage(Messages::TMessage &Message);
	virtual int __fastcall GetAccRole(void);
	virtual bool __fastcall GetAccValue(System::WideString &Value);
	virtual void __fastcall GetCursor(const Types::TPoint &Pt, HICON &ACursor);
	virtual TEditClass __fastcall GetEditControlClass(void);
	virtual void __fastcall GetEditRect(Types::TRect &R);
	virtual bool __fastcall GetImageShown(void);
	virtual int __fastcall GetIndentBefore(void);
	virtual int __fastcall GetIndentAfter(void);
	virtual void __fastcall InternalDrawFrame(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	virtual void __fastcall InternalEditControlChange(System::TObject* Sender);
	virtual void __fastcall InternalEditControlExit(void);
	virtual void __fastcall MouseDown(Classes::TShiftState Shift, int X, int Y, bool &MouseDownOnMenu);
	virtual void __fastcall MouseUp(int X, int Y, bool MouseWasDownOnMenu);
	virtual void __fastcall Paint(const Graphics::TCanvas* Canvas, const Types::TRect &ClientAreaRect, bool IsSelected, bool IsPushed, bool UseDisabledShadow);
	virtual bool __fastcall ShowImage(void);
	virtual bool __fastcall UsesSameWidth(void);
	
public:
	virtual System::WideString __fastcall GetCaptionText();
	__property Stdctrls::TCustomEdit* EditControl = {read=FEditControl};
	__property TSpTBXEditItem* Item = {read=GetItem};
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXEditItemViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : Sptbxitem::TSpTBXItemViewer(AView, AItem, AGroupLevel) { }
	/* TTBItemViewer.Destroy */ inline __fastcall virtual ~TSpTBXEditItemViewer(void) { }
	
};


class DELPHICLASS TSpTBXSpinEditItem;
class PASCALIMPLEMENTATION TSpTBXSpinEditItem : public TSpTBXEditItem
{
	typedef TSpTBXEditItem inherited;
	
private:
	TSpTBXSpinEditOptions* FSpinOptions;
	void __fastcall SpinOptionsGetText(System::TObject* Sender, System::WideString &NewText, bool &Accept);
	void __fastcall SpinOptionsSetText(System::TObject* Sender, const System::WideString AText);
	System::Extended __fastcall GetValue(void);
	Classes::TNotifyEvent __fastcall GetValueChanged();
	void __fastcall SetValue(const System::Extended Value);
	void __fastcall SetValueChanged(const Classes::TNotifyEvent ValueChangedEvent);
	
protected:
	virtual Tb2item::TTBItemViewerClass __fastcall GetItemViewerClass(Tb2item::TTBView* AView);
	
public:
	__fastcall virtual TSpTBXSpinEditItem(Classes::TComponent* AOwner);
	__fastcall virtual ~TSpTBXSpinEditItem(void);
	
__published:
	__property Alignment = {default=1};
	__property Text = {stored=false};
	__property TSpTBXSpinEditOptions* SpinOptions = {read=FSpinOptions, write=FSpinOptions};
	__property System::Extended Value = {read=GetValue, write=SetValue, stored=false};
	__property Classes::TNotifyEvent OnValueChanged = {read=GetValueChanged, write=SetValueChanged};
};


class DELPHICLASS TSpTBXSpinEditViewer;
class PASCALIMPLEMENTATION TSpTBXSpinEditViewer : public TSpTBXEditItemViewer
{
	typedef TSpTBXEditItemViewer inherited;
	
private:
	bool FUpPushed;
	bool FDownPushed;
	Extctrls::TTimer* FTimer;
	void __fastcall TimerHandler(System::TObject* Sender);
	HIDESBASE TSpTBXSpinEditItem* __fastcall GetItem(void);
	
protected:
	virtual int __fastcall GetAccRole(void);
	virtual int __fastcall GetIndentAfter(void);
	virtual bool __fastcall HandleEditMessage(Messages::TMessage &Message);
	void __fastcall InvalidateButtons(void);
	virtual bool __fastcall IsPtInButtonPart(int X, int Y);
	virtual void __fastcall LosingCapture(void);
	virtual void __fastcall MouseDown(Classes::TShiftState Shift, int X, int Y, bool &MouseDownOnMenu);
	virtual void __fastcall MouseUp(int X, int Y, bool MouseWasDownOnMenu);
	virtual void __fastcall InternalDrawFrame(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, const Sptbxskins::TSpTBXMenuItemInfo &ItemInfo);
	virtual void __fastcall InternalEditControlChange(System::TObject* Sender);
	virtual void __fastcall InternalEditControlExit(void);
	
public:
	__fastcall virtual ~TSpTBXSpinEditViewer(void);
	__property TSpTBXSpinEditItem* Item = {read=GetItem};
public:
	/* TTBItemViewer.Create */ inline __fastcall virtual TSpTBXSpinEditViewer(Tb2item::TTBView* AView, Tb2item::TTBCustomItem* AItem, int AGroupLevel) : TSpTBXEditItemViewer(AView, AItem, AGroupLevel) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word CM_SPFONTCHANGED = 0xb8ad;
static const ShortInt tcrSetProperty = 0x0;
static const ShortInt tcrActionLink = 0x1;
static const ShortInt tcrEditControl = 0x2;
extern PACKAGE bool __fastcall SpFocusEditItem(Tb2item::TTBCustomItem* Item, Tb2item::TTBView* View);
extern PACKAGE bool __fastcall SpStartsTextW(const System::WideString ASubText, const System::WideString AText);
extern PACKAGE bool __fastcall SpCanEditFrameBeHotTracked(Forms::TBorderStyle BorderStyle, Sptbxskins::TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPEditButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool FrameHotTrack, bool HotTrack, bool Pushed, bool RightAligned);
extern PACKAGE void __fastcall SpDrawXPComboButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool FrameHotTrack, bool HotTrack, bool DroppedDown, bool RightAligned, Sptbxskins::TSpTBXSkinType SkinType);
extern PACKAGE void __fastcall SpDrawXPSpinButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Enabled, bool FrameHotTrack, bool UpHotTrack, bool DownHotTrack, bool UpPushed, bool DownPushed, bool RightAligned, Sptbxskins::TSpTBXSkinType SkinType);

}	/* namespace Sptbxeditors */
using namespace Sptbxeditors;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// SptbxeditorsHPP
