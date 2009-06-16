{-------------------------------------------------------------------------------
@abstract(Provides EditPlus highlighting schemes import)
@authors(Fantasist [walking_in_the_sky@yahoo.com], Vit [nevzorov@yahoo.com],
         Vitalik [2vitalik@gmail.com], Quadr0 [quadr02005@gmail.com])
@created(2003)
@lastmod(2004-05-12)
-------------------------------------------------------------------------------}
{$IFNDEF QSynUniImportEditPlus}
unit SynUniImport;
{$ENDIF}

interface

uses
{$IFDEF SYN_CLX}
  QClasses,
  QSynUniHighlighter,
{$ELSE}
  Classes,
  SynUniHighlighter;
{$ENDIF}

type
  TSynUniImport = class  
    class function ImportFromStream(Stream: TStream; SynUniSyn: TSynUniSyn): boolean; virtual; abstract;
    class function ImportFromFile(FileName: string; SynUniSyn: TSynUniSyn): boolean; virtual; abstract;
  end;

implementation

end.
