{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at 
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Initial Developer of the Original Code is Michael Elsdörfer.
All Rights Reserved.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: TidyOpaqueTypes.pas,v 1.1 2004/06/25 14:38:39 miracle2k Exp $

You may retrieve the latest version of this file at the LibTidy Hompage,
located at http://www.elsdoerfer.net/delphi/

Known Issues:
-----------------------------------------------------------------------------}

unit TidyOpaqueTypes;

interface

uses Windows,
     TidyEnums;

type
  TidyDoc = Pointer;
  TidyIterator = Pointer;  
  TidyOption = Pointer;
  TidyNode = ^TTidyNode;
  TidyAttr = ^TTidyAttr;
  Dict = ^TDict;
  TidyBuffer = ^TTidyBuffer;
  TidyReportFilter = ^TTidyReportFilter;

  TTidyAttr = record
    next:  TidyAttr;
    attrDef:  Dict;
    asp:  TidyNode;
    php:  TidyNode;
    delim:  LongInt;
    name:   PChar;
    value:  PChar;
  end;

  TTidyNode =  record
    parent:  TidyNode;    { tree structure }
    prev:  TidyNode;      { previous sibling }
    next:  TidyNode;      { next sibling }
    content: TidyNode;    { first child }
    last: TidyNode;       { last node in the document }
    attributes: TidyAttr; { linked list of attributes }
    was: Dict;            { old tag when it was changed }
    tag: Dict;            { tag's dictionary definition }
    element: PChar;       { name (null for text nodes) }
    start:  UInt;         { start of span onto text array }
    _end:  UInt;          { end of span onto text array }
    _type:  UInt;         { TextNode, StartTag, EndTag etc. }
    line:  UInt;          { current line of document }
    column:  UInt;        { current column of document }
    closed: Bool;         { true if closed by explicit end tag }
    implicit: Bool;       { true if inferred }
    linebreak: Bool;      { true if followed by a line break }
  end;

  TDict = record
    id: TidyTagId;
    name: PChar;
    versions: UInt;
    model: UInt;
    parser: Pointer;
    chkattrs: Pointer;
    next: Dict;
  end;

  TTidyBuffer = record
    bp: PChar;
    size : UInt;
    allocated : UInt;
    next : UInt;
  end;

  TTidyReportFilter = function (Doc: TidyDoc;
                                Lvl: TidyReportLevel;
                                Line, Col: UInt;
                                Msg: PChar): Bool; cdecl;

implementation

end.
