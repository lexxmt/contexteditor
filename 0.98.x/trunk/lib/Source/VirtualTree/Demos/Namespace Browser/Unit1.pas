unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, XPMan, ExtCtrls, VirtualTrees, VirtualExplorerTree,
  StdCtrls, VirtualShellUtilities, VirtualSystemImageLists, ActiveX,
  VirtualShellTypes,

  ComObj;

const
  CategoryNameList: array[0..6] of string = (
    'Alphabetical',
    'DriveSize',
    'DriveType',
    'FreeSpace',
    'Size',
    'Time',
    'Merged'
  );

type
  TForm1 = class(TForm)
    VET: TVirtualExplorerTree;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Splitter1: TSplitter;
    PageControlShellBrowser: TPageControl;
    XPManifest1: TXPManifest;
    TabSheetIShellFolder: TTabSheet;
    TabSheetIcons: TTabSheet;
    TabSheetColumnDetails: TTabSheet;
    TabSheetExtractImage: TTabSheet;
    TabSheetQueryInfo: TTabSheet;
    CheckBoxCanCopy: TCheckBox;
    CheckBoxCanRename: TCheckBox;
    CheckBoxCanDelete: TCheckBox;
    CheckBoxHasPropSheet: TCheckBox;
    CheckBoxCanLink: TCheckBox;
    CheckBoxCanMove: TCheckBox;
    CheckBoxIContextMenu: TCheckBox;
    CheckBoxIContextMenu2: TCheckBox;
    CheckboxIContextMenu3: TCheckBox;
    CheckboxIExtractImage: TCheckBox;
    CheckBoxIExtractImage2: TCheckBox;
    CheckBoxIDataObject: TCheckBox;
    CheckBoxIDropTarget: TCheckBox;
    CheckBoxIExtractIconA: TCheckBox;
    CheckBoxIShellDetails: TCheckBox;
    CheckBoxIShellIcon: TCheckBox;
    CheckBoxIShellIconOverlay: TCheckBox;
    CheckboxIShellLink: TCheckBox;
    CheckBoxIQueryInfo: TCheckBox;
    CheckBoxIShellFolder2: TCheckBox;
    GroupBoxInterfaces: TGroupBox;
    CheckBoxIExtractIconW: TCheckBox;
    CheckBoxGhosted: TCheckBox;
    CheckBoxLink: TCheckBox;
    CheckBoxReadOnly: TCheckBox;
    CheckBoxShared: TCheckBox;
    CheckBoxFileSystem: TCheckBox;
    CheckBoxFileSysAncestor: TCheckBox;
    CheckBoxFolder: TCheckBox;
    CheckBoxRemovable: TCheckBox;
    CheckBoxHasSubFolders: TCheckBox;
    GroupBoxCapabilities: TGroupBox;
    CheckBoxBrowsable: TCheckBox;
    CheckBoxCanMoniker: TCheckBox;
    CheckBoxCompressed: TCheckBox;
    CheckBoxDropTarget: TCheckBox;
    CheckBoxEncrypted: TCheckBox;
    CheckBoxHidden: TCheckBox;
    CheckBoxHasStorage: TCheckBox;
    CheckBoxIsSlow: TCheckBox;
    CheckBoxNewContent: TCheckBox;
    CheckBoxNonEnumerated: TCheckBox;
    CheckBoxStorage: TCheckBox;
    CheckBoxStorageAncestor: TCheckBox;
    CheckBoxStream: TCheckBox;
    GroupBoxNameRelativeToFolder: TGroupBox;
    GroupBoxNameRelativeToDesktop: TGroupBox;
    LabelNameFolderNormal: TLabel;
    LabelNameFolderParsing: TLabel;
    LabelNameFolderAddressbar: TLabel;
    LabelNameFolderParsingAddressbar: TLabel;
    LabelNameFolderEditing: TLabel;
    LabelNameDesktopNormal: TLabel;
    LabelNameDesktopParsing: TLabel;
    LabelNameDesktopAddressbar: TLabel;
    LabelNameDesktopParsingAddressbar: TLabel;
    LabelNameDesktopEditing: TLabel;
    GroupBoxIconNormal: TGroupBox;
    GroupBoxIconsOpen: TGroupBox;
    ImageNormalExtraLarge: TImage;
    ImageNormalLarge: TImage;
    ImageNormalSmall: TImage;
    ImageOpenExtraLarge: TImage;
    ImageOpenSmall: TImage;
    ImageOpenLarge: TImage;
    GroupBoxIconOverlays: TGroupBox;
    ImageExtraLargeOverlay: TImage;
    ImageLargeOverlay: TImage;
    ImageSmallOverlay: TImage;
    LabelExLargeImageIndex: TLabel;
    LabelLargeImageIndex: TLabel;
    LabelSmallImageIndex: TLabel;
    LabelExLargeOpenImageIndex: TLabel;
    LabelLargeOpenImageIndex: TLabel;
    LabelSmallOpenImageIndex: TLabel;
    LabelOverlayIndex: TLabel;
    LabelOverlayIconIndex: TLabel;
    ListViewDetails: TListView;
    Label16: TLabel;
    Label15: TLabel;
    CheckBoxIShellDetailsGetDetailsOf: TCheckBox;
    CheckBoxIShellFolder2GetDetailsOf: TCheckBox;
    CheckBoxDefaultGetDetailsOf: TCheckBox;
    ImageExtractImage: TImage;
    Label18: TLabel;
    LabelExtractImagePath: TLabel;
    GroupBoxQueryInfo: TGroupBox;
    LabelQueryInfo: TLabel;
    CheckBoxExtractImageEnable: TCheckBox;
    TabSheetCatagories: TTabSheet;
    CheckBoxICategoryProvider: TCheckBox;
    Panel1: TPanel;
    Splitter2: TSplitter;
    Label20: TLabel;
    ListViewCategoriesByColumnID: TListView;
    Panel2: TPanel;
    ListViewStandardCategories: TListView;
    Label21: TLabel;
    Splitter3: TSplitter;
    Panel3: TPanel;
    Label19: TLabel;
    ListViewCategoryByEnum: TListView;
    Panel4: TPanel;
    Label22: TLabel;
    Splitter4: TSplitter;
    ListviewDefaultCategory: TListView;
    Panel5: TPanel;
    CheckBoxThreadedImages: TCheckBox;
    CheckBoxIBrowserFrameOptions: TCheckBox;
    CheckBoxIQueryAssociations: TCheckBox;
    procedure VETChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxThreadedImagesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FillInfo;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.FillInfo;
var
  Node: PVirtualNode;
  NS: TNamespace;
  Icon: TIcon;
  i: Integer;
  Item: TListItem;
  Column: TListColumn;
  EnumGUID: IEnumGUID;
  GUID: TGUID;
  Fetched: Longword;
  WS: WideString;
  CategoryList: array of TGUID;
  Categorizer: ICategorizer;
  ColumnID: TSHColumnID;
begin
  Node := VET.GetFirstSelected;
  if VET.ValidateNamespace(Node, NS) then
  begin
    CheckBoxCanCopy.Checked := NS.CanCopy;
    CheckBoxCanRename.Checked := NS.CanRename;
    CheckBoxCanDelete.Checked := NS.CanDelete;
    CheckBoxHasPropSheet.Checked := NS.HasPropSheet;
    CheckBoxCanLink.Checked := NS.CanLink;
    CheckBoxCanMove.Checked := NS.CanMove;
    CheckBoxGhosted.Checked := NS.Ghosted;
    CheckBoxLink.Checked := NS.Link;
    CheckBoxReadOnly.Checked := NS.ReadOnly;
    CheckBoxShared.Checked := NS.Share;
    CheckBoxFileSystem.Checked := NS.FileSystem;
    CheckBoxFileSysAncestor.Checked := NS.FileSysAncestor;
    CheckBoxFolder.Checked := NS.Folder;
    CheckBoxRemovable.Checked := NS.Removable;
    CheckBoxHasSubFolders.Checked := NS.HasSubFolder;
    CheckBoxBrowsable.Checked := NS.Browsable;
    CheckBoxCanMoniker.Checked := NS.CanMoniker;
    CheckBoxCompressed.Checked := NS.Compressed;
    CheckBoxDropTarget.Checked := NS.DropTarget;
    CheckBoxEncrypted.Checked := NS.Encrypted;
    CheckBoxHidden.Checked := NS.Hidden;
    CheckBoxHasStorage.Checked := NS.HasStorage;
    CheckBoxIsSlow.Checked := NS.IsSlow;
    CheckBoxNewContent.Checked := NS.NewContent;
    CheckBoxNonEnumerated.Checked := NS.NonEnumerated;
    CheckBoxStorage.Checked := NS.Storage;
    CheckBoxStorageAncestor.Checked := NS.StorageAncestor;
    CheckBoxStream.Checked := NS.Stream;

    CheckBoxIContextMenu.Checked := Assigned(NS.ContextMenuInterface);
    CheckBoxIContextMenu2.Checked := Assigned(NS.ContextMenu2Interface);
    CheckboxIContextMenu3.Checked := Assigned(NS.ContextMenu3Interface);
    CheckboxIExtractImage.Checked := Assigned(NS.ExtractImage.ExtractImageInterface);
    CheckBoxIExtractImage2.Checked := Assigned(NS.ExtractImage.ExtractImage2Interface);
    CheckBoxIDataObject.Checked := Assigned(NS.DataObjectInterface);
    CheckBoxIDropTarget.Checked := Assigned(NS.DropTargetInterface);
    CheckBoxIExtractIconA.Checked := Assigned(NS.ExtractIconAInterface);
    CheckBoxIExtractIconW.Checked := Assigned(NS.ExtractIconWInterface);
    CheckBoxIShellDetails.Checked := Assigned(NS.ShellDetailsInterface);
    CheckBoxIShellIcon.Checked := Assigned(NS.ShellIconInterface);
    CheckboxIShellLink.Checked := Assigned(NS.ShellLink);
    CheckBoxIShellIconOverlay.Checked := Assigned(NS.ShellIconOverlayInterface);
    CheckBoxIQueryInfo.Checked := Assigned(NS.QueryInfoInterface);
    CheckBoxIShellFolder2.Checked := Assigned(NS.ShellFolder2);
    CheckBoxICategoryProvider.Checked := Assigned(NS.CategoryProviderInterface);
    CheckBoxIBrowserFrameOptions.Checked := Assigned(NS.BrowserFrameOptionsInterface);
    CheckBoxIQueryAssociations.Checked := Assigned(NS.QueryAssociationsInterface);


    LabelNameFolderNormal.Caption := NS.NameInFolder;
    LabelNameFolderParsing.Caption := NS.NameForParsingInFolder;
    LabelNameFolderAddressbar.Caption := NS.NameAddressbarInFolder;
    LabelNameFolderParsingAddressbar.Caption := NS.NameParseAddressInFolder;
    LabelNameFolderEditing.Caption := NS.NameForEditingInFolder;
    LabelNameDesktopNormal.Caption := NS.NameNormal;
    LabelNameDesktopParsing.Caption := NS.NameForParsing;
    LabelNameDesktopAddressbar.Caption := NS.NameAddressbar;
    LabelNameDesktopParsingAddressbar.Caption := NS.NameParseAddress;
    LabelNameDesktopEditing.Caption := NS.NameForEditing;


    Icon := TIcon.Create;
    try
      if ExtraLargeSysImages <> nil then
      begin
        ExtraLargeSysImages.GetIcon(NS.GetIconIndex(False, icLarge), Icon);
        ImageNormalExtraLarge.Picture.Icon := Icon;
        ExtraLargeSysImages.GetIcon(NS.GetIconIndex(True, icLarge), Icon);
        ImageOpenExtraLarge.Picture.Icon := Icon;
        if NS.OverlayIconIndex > -1 then
        begin
          ExtraLargeSysImages.GetIcon(NS.OverlayIconIndex, Icon);
          ImageExtraLargeOverlay.Picture.Icon := Icon;
        end else
          ImageExtraLargeOverlay.Picture.Icon := nil;

        LabelExLargeImageIndex.Caption := IntToStr(NS.GetIconIndex(False, icLarge));
        LabelExLargeOpenImageIndex.Caption := IntToStr(NS.GetIconIndex(True, icLarge));
      end;
      if LargeSysImages <> nil then
      begin
        LargeSysImages.GetIcon(NS.GetIconIndex(False, icLarge), Icon);
        ImageNormalLarge.Picture.Icon := Icon;
        LargeSysImages.GetIcon(NS.GetIconIndex(True, icLarge), Icon);
        ImageOpenLarge.Picture.Icon := Icon;
        if NS.OverlayIconIndex > -1 then
        begin
          LargeSysImages.GetIcon(NS.OverlayIconIndex, Icon);
          ImageLargeOverlay.Picture.Icon := Icon;
        end else
          ImageLargeOverlay.Picture.Icon := nil;

        LabelLargeImageIndex.Caption := IntToStr(NS.GetIconIndex(False, icLarge));
        LabelLargeOpenImageIndex.Caption := IntToStr(NS.GetIconIndex(True, icLarge));
      end;
      if SmallSysImages <> nil then
      begin
        SmallSysImages.GetIcon(NS.GetIconIndex(False, icSmall), Icon);
        ImageNormalSmall.Picture.Icon := Icon;
        SmallSysImages.GetIcon(NS.GetIconIndex(True, icSmall), Icon);
        ImageOpenSmall.Picture.Icon := Icon;
        if NS.OverlayIconIndex > -1 then
        begin
          SmallSysImages.GetIcon(NS.OverlayIconIndex, Icon);
          ImageSmallOverlay.Picture.Icon := Icon;
        end else
          ImageSmallOverlay.Picture.Icon := nil;

        LabelSmallImageIndex.Caption := IntToStr(NS.GetIconIndex(False, icSmall));
        LabelSmallOpenImageIndex.Caption := IntToStr(NS.GetIconIndex(True, icSmall));
      end;

      LabelOverlayIndex.Caption := IntToStr(NS.OverlayIndex);
      LabelOverlayIconIndex.Caption := IntToStr(NS.OverlayIconIndex);

      ListViewDetails.Items.Clear;
      ListViewDetails.Columns.Clear;

      Column := ListViewDetails.Columns.Add;
      Column.Caption := 'Column';
      Column.Width := 50;
      Column := ListViewDetails.Columns.Add;
      Column.Caption := 'Detail Title';
      Column.Width := 140;
      Column := ListViewDetails.Columns.Add;
      Column.Caption := 'Detail';
      Column.Width := 250;
      Column := ListViewDetails.Columns.Add;
      Column.Caption := 'Alignment';
      Column.Width := 100;

      for i := 0 to NS.DetailsSupportedColumns - 1 do
      begin
        Item := ListViewDetails.Items.Add;
        Item.Caption := IntToStr(i);
        if Assigned(NS.Parent) then
          Item.SubItems.Add(NS.Parent.DetailsColumnTitle(i))
        else
          Item.SubItems.Add(' ');
        Item.SubItems.Add(NS.DetailsOf(i));
        case NS.DetailsColumnTitleInfo(i) of
          tiCenterAlign: Item.SubItems.Add('Center');
          tiLeftAlign: Item.SubItems.Add('Left');
          tiRightAlign: Item.SubItems.Add('Right');
          tiContainsImage: Item.SubItems.Add('Contains Image');
        end
      end;

      CheckBoxIShellFolder2GetDetailsOf.Checked := False;
      CheckBoxIShellDetailsGetDetailsOf.Checked := False;
      CheckBoxIShellFolder2GetDetailsOf.Checked := Assigned(NS.ShellFolder2);
      if not CheckBoxIShellFolder2GetDetailsOf.Checked then
        CheckBoxIShellDetailsGetDetailsOf.Checked := Assigned(NS.ShellDetailsInterface);

      if Assigned(NS.ExtractImage.ExtractImageInterface) then
      begin
        if CheckBoxExtractImageEnable.Checked then
        begin
          NS.ExtractImage.Width := ImageExtractImage.Width;
          NS.ExtractImage.Height := ImageExtractImage.Height;
          NS.ExtractImage.ColorDepth := 32;
          LabelExtractImagePath.Caption := NS.ExtractImage.ImagePath;
          ImageExtractImage.Picture.Bitmap := NS.ExtractImage.Image
        end else
          LabelExtractImagePath.Caption := 'Extraction Not Enabled';
      end else
        LabelExtractImagePath.Caption := 'IExtractImage not Supported';

      if Assigned(NS.QueryInfoInterface) then
        LabelQueryInfo.Caption := NS.InfoTip
      else
        LabelQueryInfo.Caption := 'IQueryInfo Not Supported';
    finally
      Icon.Free
    end;


    ListViewStandardCategories.Items.BeginUpdate;
    ListViewCategoriesByColumnID.Items.BeginUpdate;
    ListViewCategoryByEnum.Items.BeginUpdate;
    ListViewDefaultCategory.Items.BeginUpdate;
    try
      ListViewStandardCategories.Items.Clear;
      ListViewCategoriesByColumnID.Clear;
      ListViewCategoryByEnum.Clear;
      ListViewDefaultCategory.Clear;

      if Assigned(NS.CategoryProviderInterface) then
      begin
        SetLength(WS, 256);

        // Find the dEfault Category
        FillChar(ColumnID, SizeOf(ColumnID), #0);
        GUID := GUID_NULL;
        if Succeeded(NS.CategoryProviderInterface.GetDefaultCategory(GUID_NULL, ColumnID)) then
        begin
          Item := ListviewDefaultCategory.Items.Add;
          Item.Caption := (GUIDToString(ColumnID.fmtid));
          Item.SubItems.Add(IntToStr(ColumnID.pid));

          if Succeeded(NS.CategoryProviderInterface.CanCategorizeOnSCID(ColumnID)) then
            begin
              Item.SubItems.Add('True');
              if Succeeded(NS.CategoryProviderInterface.GetCategoryForSCID(ColumnID, GUID)) then
              begin
                Item.SubItems.Add(GUIDToString(GUID));
                FillChar(PWideChar(WS)^, 256 * 2, #0);
                if Succeeded(NS.CategoryProviderInterface.GetCategoryName(GUID, PWideChar(WS), 128)) then
                  Item.SubItems.Add(WS)
                else begin
                  Item.SubItems.Add('[Not Available]');
                end
              end else
              begin
                Item.SubItems.Add('[Not Available]');
                Item.SubItems.Add('[Not Available]');
              end
            end else
            begin
              Item.SubItems.Add('False');
              Item.SubItems.Add('[Not Available]');
              Item.SubItems.Add('[Not Available]');
              Item.SubItems.Add('[Not Available]');
            end;
          end;

        // Use IShellFolder2 to Extract Category info though the Columns
        if Assigned(NS.ShellFolder2) then
        begin
          i := 0;
          FillChar(ColumnID, SizeOf(ColumnID), #0);
          GUID := GUID_NULL;
          while Succeeded(NS.ShellFolder2.MapColumnToSCID(i, ColumnID)) do
          begin
            Item := ListViewCategoriesByColumnID.Items.Add;
            Item.Caption := IntToStr(i);
            Item.SubItems.Add(GUIDToString(ColumnID.fmtid));
            Item.SubItems.Add(IntToStr(ColumnID.pid));
            if Succeeded(NS.CategoryProviderInterface.CanCategorizeOnSCID(ColumnID)) then
            begin
              Item.SubItems.Add('True');
              if Succeeded(NS.CategoryProviderInterface.GetCategoryForSCID(ColumnID, GUID)) then
              begin
               Item.SubItems.Add(GUIDToString(GUID));
               FillChar(PWideChar(WS)^, 256 * 2, #0);
               if Succeeded(NS.CategoryProviderInterface.GetCategoryName(GUID, PWideChar(WS), 128)) then
                 Item.SubItems.Add(WS)
               else begin
                 Item.SubItems.Add('[Not Available]');
               end
              end else
              begin
                Item.SubItems.Add('[Not Available]');
                Item.SubItems.Add('[Not Available]');
              end
            end else
            begin
              Item.SubItems.Add('False');
              Item.SubItems.Add('[Not Available]');
              Item.SubItems.Add('[Not Available]');
              Item.SubItems.Add('[Not Available]');
            end;
            FillChar(ColumnID, SizeOf(ColumnID), #0);
            GUID := GUID_NULL;
            Inc(i)
          end
        end;

        // Get any custom categories through enumeration
        NS.CategoryProviderInterface.EnumCategories(EnumGUID);
        if Assigned(EnumGUID) then
        begin
          while EnumGUID.Next(1, GUID, Fetched) = NOERROR do
          begin
            Item := ListViewCategoryByEnum.Items.Add;
            Item.Caption := GUIDToString(GUID);
              if Succeeded(NS.CategoryProviderInterface.GetCategoryName(GUID, PWideChar(WS), 256)) then
                Item.SubItems.Add(WS)
              else
                Item.SubItems.Add('[Not Available]');
          end
        end;

        SetLength(CategoryList, 7);
        CategoryList[0] := CLSID_AlphabeticalCategorizer;
        CategoryList[1] := CLSID_DriveSizeCategorizer;
        CategoryList[2] := CLSID_DriveTypeCategorizer;
        CategoryList[3] := CLSID_FreeSpaceCategorizer;
        CategoryList[4] := CLSID_SizeCategorizer;
        CategoryList[5] := CLSID_TimeCategorizer;
        CategoryList[6] := CLSID_MergedCategorizer;

        for i := 0 to Length(CategoryList) - 1 do
        begin
          FillChar(PWideChar(WS)^, 256 * 2, #0);
          Item := ListViewStandardCategories.Items.Add;
          Item.Caption := CategoryNameList[i];
          Item.SubItems.Add(GUIDToString(CategoryList[i]));
          if Succeeded(NS.CategoryProviderInterface.GetCategoryName(CategoryList[i], PWideChar(WS), 256)) then
          begin
            Item.SubItems.Add(WS);
            if Succeeded(NS.CategoryProviderInterface.CreateCategory(CategoryList[i], IID_ICategorizer, Categorizer)) then
            begin
              Categorizer.GetDescription(PWideChar(WS), 256);
              Item.SubItems.Add(WS);
            end else
            begin
              Item.SubItems.Add('[Not Available]');
            end
          end else
          begin
            Item.SubItems.Add('[Not Available]');
            Item.SubItems.Add('[Not Available]');
          end
        end
      end
    finally
      ListViewDefaultCategory.Items.EndUpdate;
      ListViewCategoryByEnum.Items.EndUpdate;
      ListViewStandardCategories.Items.EndUpdate;
      ListViewCategoriesByColumnID.Items.EndUpdate
    end
  end
end;

procedure TForm1.VETChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  FillInfo
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  VET.Selected[VET.GetFirst] := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 // PageControlShellBrowser.DoubleBuffered := True;
 // Form1.DoubleBuffered := True
end;

procedure TForm1.CheckBoxThreadedImagesClick(Sender: TObject);
begin
  if CheckBoxThreadedImages.Checked then
    VET.TreeOptions.VETImageOptions := VET.TreeOptions.VETImageOptions + [toThreadedImages]
  else
    VET.TreeOptions.VETImageOptions := VET.TreeOptions.VETImageOptions - [toThreadedImages]
end;

end.
