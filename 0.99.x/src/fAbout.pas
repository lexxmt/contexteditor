// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit fAbout;

interface

uses
  Classes, Controls, Forms, Windows, Messages, Graphics, StdCtrls, ExtCtrls,
  uMultiLanguage, MainInstance, uCommon;
                              
type
  TfmAbout = class(TForm)
    Label1: TLabel;
    btnClose: TButton;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    procedure InstanceFileOpenNotify(var Msg: tMessage); message wmMainInstanceOpenFile;
  public
  end;

implementation

uses fMain, ShellAPI; {$R *.dfm}

procedure TfmAbout.InstanceFileOpenNotify(var Msg: tMessage);
begin
  fmMain.InstanceFileOpenNotify(Msg);
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.Label8Click(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', PChar((Sender as TLabel).Caption), '', '', SW_SHOWDEFAULT);
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.Label9Click(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', 'http://synedit.sourceforge.net', '', '', SW_SHOWDEFAULT);
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.Label10Click(Sender: TObject);
begin
    ShellExecute(Handle, 'OPEN', 'http://www.jrsoftware.org', '', '', SW_SHOWDEFAULT);
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.MouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Style := (Sender as TLabel).Font.Style + [fsUnderline]
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.MouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Style := (Sender as TLabel).Font.Style - [fsUnderline]
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.btnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmAbout.FormShow(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF, Name);
end;
//------------------------------------------------------------------------------------------
end.
