// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fBottomWindowContainer;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rmTabs3x, fBottomWindowPage, ActnList, fBottomWindowOutputConsole,
  uCommon, uCommonClass, fBottomWindowSearchResults, uSafeRegistry;

type
  TBottomWindowCurrentView = (bwNone, bwSearchResults, bwOutputConsole);

  TfmBottomWindowContainer = class(TForm)
    TabSet: TrmTabSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabSetChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
  private
    fOutputConsoleVisible: boolean;
    fmOutputConsole: TfmBottomWindowOutputConsole;
    fSearchResultsVisible: boolean;
    fmSearchResults: TfmBottomWindowSearchResults;

    fCurrentView: TBottomWindowCurrentView;

    procedure LoadSettings;
    procedure SaveSettings;
    procedure CreateBrowserPage(var fmPage: TfmBottomWindowPage; PageClass: TfmBottomWindowPageClass);
    procedure ShowBrowserPage(fmPage: TfmBottomWindowPage; Action: TAction; Visible: boolean);
    procedure RefreshTabIndex;

    procedure SetCurrentView(const Value: TBottomWindowCurrentView);
    procedure SetOutputConsoleVisible(const Value: boolean);
    procedure SetSearchResultsVisible(const Value: boolean);
  public
    procedure ClearSearchResults;

    property SearchResultsVisible: boolean read fSearchResultsVisible write SetSearchResultsVisible;
    property OutputConsoleVisible: boolean read fOutputConsoleVisible write SetOutputConsoleVisible;
    property CurrentView: TBottomWindowCurrentView read fCurrentView write SetCurrentView;
    property OutputConsole: TfmBottomWindowOutputConsole read fmOutputConsole;
    property SearchResults: TfmBottomWindowSearchResults read fmSearchResults;
  end;

var
  fmBottomWindowContainer: TfmBottomWindowContainer;

implementation

uses fMain;

{$R *.dfm}


////////////////////////////////////////////////////////////////////////////////////////////
//                                 Property functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.SetCurrentView(const Value: TBottomWindowCurrentView);
begin
  if (fCurrentView<>Value) then begin
    fCurrentView:=Value;

    OutputConsoleVisible:=(Value=bwOutputConsole);
    SearchResultsVisible:=(Value=bwSearchResults);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.SetOutputConsoleVisible(const Value: boolean);
begin
  if (fOutputConsoleVisible<>Value) then begin
    if Value then
      CreateBrowserPage(TfmBottomWindowPage(fmOutputConsole), TfmBottomWindowOutputConsole);

    ShowBrowserPage(fmOutputConsole, fmMain.acConsoleOutput, Value);
    fOutputConsoleVisible:=Value;
    RefreshTabIndex;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.SetSearchResultsVisible(const Value: boolean);
begin
  if (fSearchResultsVisible<>Value) then begin
    if Value then
      CreateBrowserPage(TfmBottomWindowPage(fmSearchResults), TfmBottomWindowSearchResults);

    ShowBrowserPage(fmSearchResults, fmMain.acSearchResults, Value);
    fSearchResultsVisible:=Value;
    RefreshTabIndex;
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.LoadSettings;
begin
  with TSafeRegistry.Create do
    try
      OpenKey(BOTTOM_WINDOW_OPTIONS_REG_KEY, FALSE);
      CurrentView:=TBottomWindowCurrentView(ReadInteger('CurrentView', ord(bwSearchResults)));
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.SaveSettings;
begin
  with TSafeRegistry.Create do
    try
      OpenKey(BOTTOM_WINDOW_OPTIONS_REG_KEY, TRUE);
      WriteInteger('CurrentView', ord(CurrentView));
    finally
      Free;
    end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.CreateBrowserPage(var fmPage: TfmBottomWindowPage; PageClass: TfmBottomWindowPageClass);
begin
  if not Assigned(fmPage) then begin
    fmPage:=PageClass.Create(SELF);
    fmPage.Parent:=SELF;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.ShowBrowserPage(fmPage: TfmBottomWindowPage; Action: TAction; Visible: boolean);
begin
  if Assigned(fmPage) then begin
    if Visible then begin
      fmPage.Show;
      fmPage.BringToFront;
      Action.Checked:=TRUE;
    end else begin
      fmPage.Hide;
      Action.Checked:=FALSE;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.RefreshTabIndex;
var
  n: integer;
begin
  n:=TabSet.Tabs.IndexOfObject(pointer(fCurrentView));

  if (n<>-1) then
    TabSet.TabIndex:=n;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.ClearSearchResults;
begin
  if Assigned(fmSearchResults) then
    fmSearchResults.ClearContents;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.TabSetChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  if (NewTab<>-1) then begin
    CurrentView:=TBottomWindowCurrentView(TabSet.Tabs.Objects[NewTab]);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.FormCreate(Sender: TObject);
begin
  TabSet.Tabs.AddObject(TfmBottomWindowSearchResults.GetDefaultCaption, pointer(bwSearchResults));
  TabSet.Tabs.AddObject(TfmBottomWindowOutputConsole.GetDefaultCaption, pointer(bwOutputConsole));

  LoadSettings;
end;
//------------------------------------------------------------------------------------------
procedure TfmBottomWindowContainer.FormDestroy(Sender: TObject);
begin
  if Assigned(fmSearchResults) then
    FreeAndNil(fmSearchResults);

  if Assigned(fmOutputConsole) then
    FreeAndNil(fmOutputConsole);

  SaveSettings;
end;
//------------------------------------------------------------------------------------------

end.
