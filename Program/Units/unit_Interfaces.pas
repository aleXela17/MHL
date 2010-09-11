(* *****************************************************************************
  *
  * MyHomeLib
  *
  * Copyright (C) 2008-2010 Aleksey Penkov
  *
  * Author(s)           eg_
  *                     Nick Rymanov (nrymanov@gmail.com)
  * Created             03.09.2010
  * Description
  *
  * $Id: unit_Interfaces.pas 631 2010-08-26 04:00:58Z eg_ $
  *
  * History
  *
  ****************************************************************************** *)

unit unit_Interfaces;

interface

uses
  unit_Globals,
  UserData;

type
  IIterator<T> = interface
    function Next(out v: T): Boolean;
    function RecordCount: Integer;
  end;

  IBookIterator = IIterator<TBookRecord>;
  IAuthorIterator = IIterator<TAuthorData>;
  IGenreIterator = IIterator<TGenreData>;
  ISeriesIterator = IIterator<TSeriesData>;
  IGroupIterator = IIterator<TGroupData>;

  TGUIUpdateExtraProc = reference to procedure(
    const BookKey: TBookKey;
    extra: TBookExtra
  );

  IBookCollection = interface
    ['{B1BB5762-2942-48C3-90E3-3154405EC01B}']

    //
    //
    //
    function GetAuthorIterator(const Mode: TAuthorIteratorMode; const FilterValue: PFilterValue = nil): IAuthorIterator;
    function GetGenreIterator(const Mode: TGenreIteratorMode; const FilterValue: PFilterValue = nil): IGenreIterator;
    function GetSeriesIterator(const Mode: TSeriesIteratorMode): ISeriesIterator;
    function GetBookIterator(const Mode: TBookIteratorMode; const LoadMemos: Boolean; const FilterValue: PFilterValue = nil): IBookIterator;
    function Search(const SearchCriteria: TBookSearchCriteria; const LoadMemos: Boolean): IBookIterator;

    //
    //
    //
    function InsertBook(BookRecord: TBookRecord; const CheckFileName: Boolean; const FullCheck: Boolean): Integer; // ���������� � ���������
    procedure GetBookRecord(const BookKey: TBookKey; out BookRecord: TBookRecord; const LoadMemos: Boolean);
    procedure UpdateBook(BookRecord: TBookRecord);
    procedure DeleteBook(const BookKey: TBookKey);
    procedure AddBookToGroup(const BookKey: TBookKey; const GroupID: Integer);

    function GetLibID(const BookKey: TBookKey): string;
    function GetReview(const BookKey: TBookKey): string;

    function SetReview(const BookKey: TBookKey; const Review: string): Integer; // ���������� � ���������
    procedure SetProgress(const BookKey: TBookKey; const Progress: Integer);
    procedure SetRate(const BookKey: TBookKey; const Rate: Integer);
    procedure SetLocal(const BookKey: TBookKey; const AState: Boolean);
    procedure SetFolder(const BookKey: TBookKey; const Folder: string);
    procedure SetFileName(const BookKey: TBookKey; const FileName: string);
    procedure SetSeriesID(const BookKey: TBookKey; const SeriesID: Integer);

    //
    // ����������� � �������� �����
    //
    procedure CleanBookAuthors(const BookID: Integer); // �������� Integer �� TBookKey
    procedure InsertBookAuthors(const BookID: Integer; const Authors: TBookAuthors); // �������� Integer �� TBookKey

    //
    // ����������� � ������� �����
    //
    procedure CleanBookGenres(const BookID: Integer); // �������� Integer �� TBookKey
    procedure InsertBookGenres(const BookID: Integer; const Genres: TBookGenres); // �������� Integer �� TBookKey

    //
    //
    //
    function FindOrCreateSeries(const Title: string): Integer;
    procedure SetSeriesTitle(const SeriesID: Integer; const NewSeriesTitle: string);
    procedure ChangeBookSeriesID(const OldSeriesID: Integer; const NewSeriesID: Integer; const DatabaseID: Integer);

    procedure SetStringProperty(const PropID: Integer; const Value: string);
    procedure SetIntProperty(const PropID: Integer; const Value: Integer);

    procedure ImportUserData(data: TUserData; guiUpdateCallback: TGUIUpdateExtraProc);
    procedure ExportUserData(data: TUserData);

    function CheckFileInCollection(const FileName: string; const FullNameSearch: Boolean; const ZipFolder: Boolean): Boolean;

    procedure BeginBulkOperation;
    procedure EndBulkOperation(Commit: Boolean = True);

    procedure CompactDatabase;
    procedure RepairDatabase;

    function GetTopGenreAlias(const FB2Code: string): string;
    procedure ReloadGenres(const FileName: string);

    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);

    procedure TruncateTablesBeforeImport;

    procedure VerifyCurrentCollection(const DatabaseID: Integer);

    procedure SetHideDeleted(const HideDeleted: Boolean);
    function GetHideDeleted: Boolean;
    procedure SetShowLocalOnly(const ShowLocalOnly: Boolean);
    function GetShowLocalOnly: Boolean;
    procedure SetSeriesFilterType(const SeriesFilterType: string);
    function GetSeriesFilterType: string;
    procedure SetAuthorFilterType(const AuthorFilterType: string);
    function GetAuthorFilterType: string;
  end;

  ILogger = interface
    ['{E0BE38F4-2911-4FD7-8CA2-B6E3981BBFC0}']
    procedure Log(const logMessage: string; const extraInfo: string);
  end;

  IIntervalLogger = interface(ILogger)
    ['{F1E77E3D-7D8C-421D-9647-8E11B9105271}']
    procedure Restart(const extraInfo: string);
  end;

  IScopeLogger = interface(ILogger)
    ['{B3497AEA-D495-4425-8C1A-24EBA789E3DE}']
  end;

  IParamsParser<T> = interface
    function CheckLiteral(const literalValue: string): Boolean;
    function CheckParam(const paramName: string): Boolean;
    function GetValue(const params: T; const paramName: string): string;
  end;

implementation

end.