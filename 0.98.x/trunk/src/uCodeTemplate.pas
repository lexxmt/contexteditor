// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uCodeTemplate;

interface

{$I ConTEXT.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ConTEXTSynEdit, SynEdit, StdCtrls, SynEditHighlighter, Math, uCommon,
  ComCtrls, fCodeTemplateEdit, SynEditAutoComplete, uMultiLanguage;

type
  TTemplate = record
                Changed :boolean;
                Name    :string;
                Code    :TStringList;
                HL      :TSynCustomHighlighter;
              end;

  pTTemplate = ^TTemplate;

type
  TfmCodeTemplate = class(TForm)
    memo: TConTEXTSynEdit;
    labHighlighter: TLabel;
    cbHL: TComboBox;
    lvSh: TListView;
    labTemplate: TLabel;
    labCode: TLabel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbHLChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvShSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure memoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    OldCurrTemplate :pTTemplate;

    procedure Init;
    procedure Done;
    procedure ApplyEditorOptions(HL:TSynCustomHighLighter);

    procedure ClearForm;
    procedure TplToForm(tpl:pTTemplate);
    procedure FormToTpl(tpl:pTTemplate);
    function  CurrTemplate:pTTemplate;
    procedure SelectItem(n:integer);
  public
    ActiveHighlighter  :pointer;
  end;

function  CreateCodeTemplate(HL:pTHighlighter):TSynAutoComplete;
procedure AddMemoToList(memo:TSynEdit);
procedure RemoveMemoFromList(memo:TSynEdit);
procedure DestroyAllTemplates;

implementation

{$R *.DFM}

const
  CTPL_EXT = '.ctpl';        // ConTEXT Template
  CTPL_DIR = 'Template\';


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Static functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
function GetTemplateFileName(LanguageName:string):string;
const
  INVALID_CHARS = [':',';','/','|','\','*'];
var
  i :integer;
begin
  for i:=1 to Length(LanguageName) do
    if (LanguageName[i] in INVALID_CHARS) then
      LanguageName[i]:='_';

  result:=ApplicationDir+CTPL_DIR+LanguageName+CTPL_EXT;
end;
//------------------------------------------------------------------------------------------
procedure CT_LoadFromFile(CT:TSynAutoComplete; fname:string);
begin
  if FileExists(fname) then begin
    try
      CT.AutoCompleteList.LoadFromFile(fname);
    except
    end;
  end;
end;
//------------------------------------------------------------------------------------------
function CreateCodeTemplate(HL:pTHighlighter):TSynAutoComplete;
var
  fname :string;
begin
  result:=nil;
  if not Assigned(HL) then EXIT;

  if not Assigned(HL^.CT) then begin
    fname:=GetTemplateFileName(HL^.name);

    HL^.CT:=TSynAutoComplete.Create(Application);

    if FileExists(fname) then
      CT_LoadFromFile(HL^.CT,fname);
  end;

  result:=HL^.CT;
end;
//------------------------------------------------------------------------------------------
procedure AddMemoToList(memo:TSynEdit);
var
  CT :TSynAutoComplete;
  HL :pTHighlighter;
begin
  RemoveMemoFromList(memo);

  HL:=GetHighlighterRec(memo.Highlighter);
  if Assigned(HL) then begin
    CT:=CreateCodeTemplate(HL);
    if Assigned(CT) then 
      CT.AddEditor(memo);
  end;
end;
//------------------------------------------------------------------------------------------
procedure RemoveMemoFromList(memo:TSynEdit);
var
  i :integer;
begin
  for i:=0 to HIGHLIGHTERS_COUNT-1 do begin
    if Assigned(Highlighters[i].CT) then begin
      Highlighters[i].CT.RemoveEditor(memo);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure DestroyAllTemplates;
var
  i  :integer;
begin
  for i:=0 to HIGHLIGHTERS_COUNT-1 do begin
    if Assigned(Highlighters[i].CT) then begin
      Highlighters[i].CT.Free;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure ReloadTemplate(HL:TSynCustomHighlighter);
var
  pHL :pTHighlighter;
begin
  pHL:=GetHighlighterRec(HL);

  if (Assigned(pHL) and Assigned(pHL^.CT)) then
    CT_LoadFromFile(pHL^.CT, GetTemplateFileName(pHL^.name));
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Functions
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.Init;
var
  i    :integer;
  tpl  :pTTemplate;
begin
  for i:=0 to HIGHLIGHTERS_COUNT-1 do begin
    tpl:=AllocMem(SizeOf(TTemplate));
    tpl^.Code:=TStringList.Create;
    tpl^.Name:=HighLighters[i].Name;
    tpl^.HL:=HighLighters[i].HL;

    if FileExists(GetTemplateFileName(tpl^.Name)) then
      try
        tpl.Code.LoadFromFile(GetTemplateFileName(tpl^.Name));
      except
      end;

    cbHL.Items.AddObject(tpl^.Name,pointer(tpl));
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.Done;
var
  i    :integer;
  tpl  :pTTemplate;
begin
  for i:=0 to cbHL.Items.Count-1 do begin
    tpl:=pTTemplate(cbHL.Items.Objects[i]);
    if Assigned(tpl) then begin
      tpl.Code.Free;
      FreeMem(tpl);
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.ApplyEditorOptions(HL:TSynCustomHighLighter);
begin
  memo.Highlighter:=HL;

  memo.BeginUpdate;

  try
    with EditorCfg do begin
      memo.Options:=Options;
      memo.ExtraLineSpacing:=ExtraLineSpacing;
      memo.InsertCaret:=InsertCaret;
      memo.OverwriteCaret:=OverwriteCaret;
      memo.Font.Name:=FontName;
      memo.Font.Size:=FontSize;

      memo.TabWidth:=EditorCfg.BlockIndent;

      if Assigned(HL) then begin
        memo.SelectedColor.Foreground:=HL.Attribute[FindAttrIndex(ATTR_SELECTION_STR,HL)].Foreground;
        memo.SelectedColor.Background:=HL.Attribute[FindAttrIndex(ATTR_SELECTION_STR,HL)].Background;
        memo.RightEdgeColor:=HL.Attribute[FindAttrIndex(ATTR_RIGHTEDGE_STR,HL)].Foreground;
      end;
    end;
  finally
    memo.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.ClearForm;
var
  i :integer;
begin
  lvSh.Items.BeginUpdate;

  try
    for i:=0 to lvSh.Items.Count-1 do
      TStringList(lvSh.Items[i].Data).Free;

    lvSh.Items.Clear;
    memo.Lines.Clear;
    memo.Modified:=FALSE;
  finally
    lvSh.Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.TplToForm(tpl:pTTemplate);
var
  n       :integer;
  ss      :TStringList;
  ShName  :string;
  ShDescr :string;
  s       :string;
  divpos  :integer;

  procedure AddSh(Name,Descr:string; Code:TStringList);
  begin
    with lvSh.Items.Add do begin
      Caption:=Name;
      SubItems.Add(Descr);
      Data:=Code;
    end;
  end;

begin
  ClearForm;
  if not Assigned(tpl) then EXIT;

  n:=0;
  while (n<tpl.Code.Count) do begin
    ShName:='';
    ShDescr:='';
    s:=tpl.Code[n];
    if (Length(s)>0) then begin
      if (s[1]='[') then begin
        divpos:=Pos('|',s);
        if (divpos>0) then begin
          ShName:=Trim(Copy(s,2,divpos-2));

          ShDescr:=Trim(Copy(s,divpos+1,Length(s)));
          while (Length(ShDescr)>0) and (ShDescr[Length(ShDescr)] in [']',' ',#09]) do
            SetLength(ShDescr,Length(ShDescr)-1);

          inc(n);
          ss:=TStringList.Create;
          // linije
          while (n<tpl.Code.Count) do begin
            s:=tpl.Code[n];
            if (Length(s)>0) and (s[1]='[') then begin
              AddSh(ShName,ShDescr,ss);
              dec(n);
              BREAK;
            end else begin
              ss.Add(s);
              inc(n);
              if (n=tpl.Code.Count) then begin
                AddSh(ShName,ShDescr,ss);
              end;
            end;
          end;
        end;
      end;
    end;

    inc(n);
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.FormToTpl(tpl:pTTemplate);
var
  i,ii  :integer;
  ss    :TStringList;
begin
  if not Assigned(tpl) then EXIT;

  tpl.Code.Clear;

  if Assigned(lvSh.Selected) then
    TStringList(lvSh.Selected.Data).Assign(memo.Lines);

  if memo.Modified then
    tpl^.Changed:=TRUE;

  for i:=0 to lvSh.Items.Count-1 do begin
    tpl.Code.Add(Format('[%s | %s]',[lvSh.Items[i].Caption,lvSh.Items[i].SubItems[0]]));
    ss:=TStringList(lvSh.Items[i].Data);

    // obriši prazne retke na kraju
    for ii:=0 to ss.Count-1 do
      ss[ii]:=TrimRight(ss[ii]);

    while (ss.Count>0) and (Length(ss[ss.Count-1])=0) do
      ss.Delete(ss.Count-1);

    tpl.Code.AddStrings(ss);
    tpl.Code.Add('');
  end;
end;
//------------------------------------------------------------------------------------------
function TfmCodeTemplate.CurrTemplate:pTTemplate;
begin
  result:=pTTemplate(cbHL.Items.Objects[cbHL.ItemIndex]);
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.SelectItem(n:integer);
begin
  n:=Max(n,0);
  n:=Min(n,lvSh.Items.Count-1);

  if (n>-1) and Assigned(lvSh.Items[n]) then begin
    lvSh.SetFocus;
    lvSh.Selected:=lvSh.Items[n];
    lvSh.ItemFocused:=lvSh.Selected;
    lvSh.Selected.MakeVisible(FALSE);
  end;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                    Buttons
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.btnAddClick(Sender: TObject);
var
  fm   :TfmCodeTemplateEdit;
begin
  Application.CreateForm(TfmCodeTemplateEdit, fm);
  fm.ShowModal;

  if (fm.modal_result=mrOK) and (Length(fm.ShShortcut)>0) then begin
    with lvSh.Items.Add do begin
      Caption:=fm.ShShortcut;
      SubItems.Add(fm.ShDescr);
      Data:=TStringList.Create;
      SelectItem(Index);
      memo.SetFocus;
    end;

    CurrTemplate^.Changed:=TRUE;
  end;

  fm.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.btnEditClick(Sender: TObject);
var
  fm   :TfmCodeTemplateEdit;
begin
  if not Assigned(lvSh.Selected) then EXIT;

  Application.CreateForm(TfmCodeTemplateEdit, fm);

  fm.ShShortcut:=lvSh.Selected.Caption;
  fm.ShDescr:=lvSh.Selected.SubItems[0];
  fm.ShowModal;

  if (fm.modal_result=mrOK) and (Length(fm.ShShortcut)>0) then begin
    with lvSh.Selected do begin
      Caption:=fm.ShShortcut;
      SubItems[0]:=fm.ShDescr;
      SelectItem(Index);
    end;

    CurrTemplate^.Changed:=TRUE;
  end;

  fm.Free;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.btnDeleteClick(Sender: TObject);
var
  n :integer;
begin
  if not Assigned(lvSh.Selected) then EXIT;

  n:=lvSh.Selected.Index;
  TStringList(lvSh.Selected.Data).Free;
  lvSh.Selected.Delete;

  CurrTemplate^.Changed:=TRUE;

  SelectItem(n);
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.btnOKClick(Sender: TObject);
var
  i     :integer;
  tpl   :pTTemplate;
  fname :string;
begin
  FormToTpl(CurrTemplate);

  // save templates
  for i:=0 to cbHL.Items.Count-1 do begin
    tpl:=pTTemplate(cbHL.Items.Objects[i]);
    if Assigned(tpl) and (tpl^.Changed) then begin
      try
        fname:=GetTemplateFileName(tpl^.Name);
        tpl.Code.SaveToFile(fname);
        ReloadTemplate(tpl^.HL);
      except
        DlgErrorSaveFile(fname);
      end;
    end;
  end;

  Close;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.btnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                      Events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.cbHLChange(Sender: TObject);
var
  tpl :pTTemplate;
begin
  FormToTpl(OldCurrTemplate);

  tpl:=CurrTemplate;

  ApplyEditorOptions(tpl^.HL);
  TplToForm(tpl);

  OldCurrTemplate:=tpl;

  if (lvSh.Items.Count>0) then
    lvSh.Selected:=lvSh.Items[0];
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.lvShSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  memo.Lines.BeginUpdate;

  try
    memo.Lines.Clear;
    if Selected then begin
      memo.Lines.AddStrings(TStringList(Item.Data));
      memo.Tag:=integer(Item.Data);
    end;
  finally
    memo.Lines.EndUpdate;
  end;

  memo.Modified:=FALSE;
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.memoChange(Sender: TObject);
begin
  if not Assigned(lvSh.Selected) then EXIT;

  TStringList(lvSh.Selected.Data).Assign(memo.Lines);
  CurrTemplate^.Changed:=TRUE;
end;
//------------------------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////////////////////
//                                  Form events
////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.FormCreate(Sender: TObject);
begin
  mlApplyLanguageToForm(SELF,Name);
  lvSh.Columns[0].Caption:=mlStr(ML_CODETEMPLATE_LV_NAME,'Name');
  lvSh.Columns[1].Caption:=mlStr(ML_CODETEMPLATE_LV_DESCR,'Description');
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.FormShow(Sender: TObject);
var
  i   :integer;
begin
  Init;

  // selektiraj aktivni highlighter
  cbHL.ItemIndex:=0;
  i:=0;
  while (i<HIGHLIGHTERS_COUNT) do begin
    if (ActiveHighlighter=HighLighters[i].HL) then begin
      cbHL.ItemIndex:=i;
      BREAK;
    end;
    inc(i);
  end;

  OldCurrTemplate:=nil;

  cbHLChange(SELF);
  ////////////////

  SelectItem(0);
end;
//------------------------------------------------------------------------------------------
procedure TfmCodeTemplate.FormDestroy(Sender: TObject);
begin
  ClearForm;
  Done;
end;
//------------------------------------------------------------------------------------------
end.

