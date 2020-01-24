import 'dart:convert';

import 'package:bookzbox/features/box/models/book.dart';

class BooksApiResponse {
  final String kind;
  final int totalItems;
  final List<BookResponseItem> items;

  BooksApiResponse({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory BooksApiResponse.fromRawJson(String str) =>
      BooksApiResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BooksApiResponse.fromJson(Map<String, dynamic> json) => BooksApiResponse(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["totalItems"] > 0
            ? List<BookResponseItem>.from(
                json["items"]?.map((x) => BookResponseItem.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson()) ?? []),
      };
}

class BookResponseItem {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final SearchInfo searchInfo;

  BookResponseItem({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory BookResponseItem.fromRawJson(String str) =>
      BookResponseItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Book2 toDomain() {
    return Book2(
      title: volumeInfo.title,
      authors: volumeInfo.authors,
      categories: volumeInfo.categories,
      fullSizeImageUrl: volumeInfo.imageLinks?.thumbnail,
      isbn10: volumeInfo.industryIdentifiers
              ?.firstWhere((id) => id.type == 'ISBN_10')
              ?.identifier ??
          null,
      isbn13: volumeInfo.industryIdentifiers
              ?.firstWhere((id) => id.type == 'ISBN_13')
              ?.identifier ??
          null,
      pageCount: volumeInfo.pageCount,
      publisher: volumeInfo.publisher,
      publishYear: int.tryParse(volumeInfo.publishedDate) ?? -1,
      synopsis: volumeInfo.description,
      thumbnailUrl: volumeInfo.imageLinks?.smallThumbnail,
    );
  }

  factory BookResponseItem.fromJson(Map<String, dynamic> json) => BookResponseItem(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
        "searchInfo": searchInfo.toJson(),
      };
}

class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Epub epub;
  final Epub pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromRawJson(String str) => AccessInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

class Epub {
  final bool isAvailable;

  Epub({
    this.isAvailable,
  });

  factory Epub.fromRawJson(String str) => Epub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
      };
}

class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  factory SaleInfo.fromRawJson(String str) => SaleInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
      };
}

class SearchInfo {
  final String textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  factory SearchInfo.fromRawJson(String str) => SearchInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final String subtitle;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final int pageCount;
  final String printType;
  final List<String> categories;
  final double averageRating;
  final int ratingsCount;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final PanelizationSummary panelizationSummary;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromRawJson(String str) => VolumeInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: List<String>.from(json["authors"]?.map((x) => x) ?? []),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        industryIdentifiers: List<IndustryIdentifier>.from(
            json["industryIdentifiers"]?.map((x) => IndustryIdentifier.fromJson(x)) ??
                []),
        readingModes: json["readingModes"] != null
            ? ReadingModes.fromJson(json["readingModes"])
            : null,
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: List<String>.from(json["categories"]?.map((x) => x) ?? []),
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] != null
            ? PanelizationSummary.fromJson(json["panelizationSummary"])
            : null,
        imageLinks:
            json["imageLinks"] != null ? ImageLinks.fromJson(json["imageLinks"]) : null,
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": List<dynamic>.from(authors?.map((x) => x)),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "industryIdentifiers":
            List<dynamic>.from(industryIdentifiers?.map((x) => x.toJson()) ?? []),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printType": printType,
        "categories": List<dynamic>.from(categories?.map((x) => x) ?? []),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary.toJson(),
        "imageLinks": imageLinks.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromRawJson(String str) => ImageLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifier.fromRawJson(String str) =>
      IndustryIdentifier.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromRawJson(String str) =>
      PanelizationSummary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

class ReadingModes {
  final bool text;
  final bool image;

  ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromRawJson(String str) => ReadingModes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}
