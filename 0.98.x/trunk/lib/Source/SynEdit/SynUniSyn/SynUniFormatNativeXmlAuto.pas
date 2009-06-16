{
@abstract(Provides automatic detecting format of highlighters and importing)
@authors(Vitalik [just_vitalik@yahoo.com])
@created(2006)
@lastmod(2006-06-30)
}

{$IFNDEF QSynUniFormatNativeXmlAuto}
unit SynUniFormatNativeXmlAuto;
{$ENDIF}

interface

uses
{$IFDEF SYN_CLX}
  QClasses,
  QGraphics,
  QSynUniFormat,
  QSynUniClasses,
  QSynUniRules,
  QSynUniHighlighter
{$ELSE}
  Classes,
  Graphics,
  //Variants,
  SynUniFormat,
  SynUniFormatNativeXml,
  SynUniClasses,
  SynUniRules,
  SynUniHighlighter,
{$ENDIF}
  SysUtils{ ,
  XMLIntf // DW } ;

type
  TSynUniFormatNativeXmlAuto = class(TSynUniFormat)
    class function ImportFromStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ExportToStream(AObject: TObject; AStream: TStream): Boolean; override;
    class function ImportFromFile(AObject: TObject; AFileName: string): Boolean; override;
    class function ExportToFile(AObject: TObject; AFileName: string): Boolean; override;
  end;

implementation

uses
  SynUniFormatNativeXml15,
  SynUniFormatNativeXml18,
  SynUniFormatNativeXml20;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXmlAuto.ImportFromStream(AObject: TObject; AStream: TStream): Boolean;
var
  Buffer: string;
const
  NumBytes = 32;
begin
  VerifyStream(AStream);
  
  SetLength(Buffer, NumBytes);
  AStream.Read(Buffer[1], NumBytes);
  AStream.Position := 0;
  if (Copy(Buffer, 1, 27) = '<UniHighlighter version="1.') or
     (Copy(Buffer, 1, 30) = '<SynUniHighlighter Version="1.') then
  begin // version 1.8  //ShowMessage('Trying load 1.8 version...');
    TSynUniFormatNativeXml18.ImportFromStream(AObject, AStream)
  end
  else if Copy(Buffer, 1, 16) = '<UniHighlighter>' then
  begin // versions 1.0 è 1.5  //ShowMessage('Trying load 1.5 version...');
    TSynUniFormatNativeXml15.ImportFromStream(AObject, AStream);
  end
  else begin // version 2.0  //ShowMessage('Trying load 2.0 version...');
    TSynUniFormatNativeXml20.ImportFromStream(AObject, AStream);
  end;

  //SynUniSyn.DefHighlightChange(SynUniSyn);
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXmlAuto.ExportToStream(AObject: TObject; AStream: TStream): Boolean;
begin
  VerifyStream(AStream);
  if (AObject is TSynUniSyn) then begin
    if (TSynUniSyn(AObject).FormatVersion = '1.8') or (TSynUniSyn(AObject).FormatVersion = '1.5') then
      TSynUniFormatNativeXml18.ExportToStream(AObject, AStream)
    else
      TSynUniFormatNativeXml20.ExportToStream(AObject, AStream);
  end
  else
    raise Exception.Create(ClassName + '.ExportFromStream: Cannot automatic export '+AObject.ClassName+' object');
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXmlAuto.ImportFromFile(AObject: TObject; AFileName: string): Boolean;
var
  FileStream: TFileStream;
begin
  VerifyFileName(AFileName);  
  FileStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    ImportFromStream(AObject, FileStream);
  finally
    FreeAndNil(FileStream);
  end;
  if AObject is TSynUniSyn then
    TSynUniSyn(AObject).FileName := AFileName;
  Result := True;
end;

//------------------------------------------------------------------------------
class function TSynUniFormatNativeXmlAuto.ExportToFile(AObject: TObject; AFileName: string): Boolean;
var
  FileStream: TFileStream;
begin
  VerifyEmptyFileName(AFileName);
  FileStream := TFileStream.Create(AFileName, fmCreate or fmShareDenyWrite);
  try
    ExportToStream(AObject, FileStream);
  finally
    FreeAndNil(FileStream);
  end;
  if AObject is TSynUniSyn then
    TSynUniSyn(AObject).FileName := AFileName;
  Result := True;
end;

end.
