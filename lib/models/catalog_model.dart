import 'dart:convert';
import 'package:equatable/equatable.dart';

CatalogModel catalogFromJson(String str) => CatalogModel.fromJson(json.decode(str));
String catalogToJson(CatalogModel data) => json.encode(data.toJson());

class CatalogModel extends Equatable {
  CatalogModel({
    this.message,
    this.code,
    this.result,
  });

  final String message;
  final int code;
  final ResultCatalogModel result;

  factory CatalogModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] == 200) {
      return CatalogModel(
        message: json["message"],
        code: json["code"],
        result: ResultCatalogModel.fromJson(json["result"]),
      );
    } else {
      return CatalogModel(
        message: json["message"],
        code: json["code"]
      );
    }
  } 

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "result": result.toJson(),
  };

  @override
  List<Object> get props => [message, code, result];
}

class ResultCatalogModel extends Equatable {
  ResultCatalogModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  final int currentPage;
  final List<DataCatalogModel> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  factory ResultCatalogModel.fromJson(Map<String, dynamic> json) => ResultCatalogModel(
    currentPage: json["current_page"],
    data: List<DataCatalogModel>.from(json["data"].map((x) => DataCatalogModel.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };

  @override
  List<Object> get props => [currentPage, data, firstPageUrl, from, lastPage, nextPageUrl, perPage, prevPageUrl, to, total];
}

class DataCatalogModel extends Equatable {
  DataCatalogModel({
    this.ctId,
    this.ctCode,
    this.ctName,
    this.ctCreatedOn,
    this.ctCreatedBy,
    this.ctDescription,
    this.ctSlug,
    this.media,
  });

  final int ctId;
  final String ctCode;
  final String ctName;
  final DateTime ctCreatedOn;
  final int ctCreatedBy;
  final dynamic ctDescription;
  final String ctSlug;
  final List<Media> media;

  factory DataCatalogModel.fromJson(Map<String, dynamic> json) => DataCatalogModel(
    ctId: json["ct_id"],
    ctCode: json["ct_code"],
    ctName: json["ct_name"],
    ctCreatedOn: DateTime.parse(json["ct_created_on"]),
    ctCreatedBy: json["ct_created_by"],
    ctDescription: json["ct_description"],
    ctSlug: json["ct_slug"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ct_id": ctId,
    "ct_code": ctCode,
    "ct_name": ctName,
    "ct_created_on": ctCreatedOn.toIso8601String(),
    "ct_created_by": ctCreatedBy,
    "ct_description": ctDescription,
    "ct_slug": ctSlug,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [ctId, ctCode, ctName, ctCreatedOn, ctCreatedBy, ctDescription, ctSlug, media];
}

class Media extends Equatable {
  Media({
    this.mdId,
    this.mdMdlId,
    this.mdRefId,
    this.mdName,
    this.mdFileHashName,
    this.mdContentType,
    this.mdCreatedOn,
    this.mdCreatedBy,
  });

  final int mdId;
  final int mdMdlId;
  final int mdRefId;
  final String mdName;
  final String mdFileHashName;
  final String mdContentType;
  final DateTime mdCreatedOn;
  final int mdCreatedBy;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    mdId: json["md_id"],
    mdMdlId: json["md_mdl_id"],
    mdRefId: json["md_ref_id"],
    mdName: json["md_name"],
    mdFileHashName: json["md_file_hash_name"],
    mdContentType: json["md_content_type"],
    mdCreatedOn: DateTime.parse(json["md_created_on"]),
    mdCreatedBy: json["md_created_by"],
  );

  Map<String, dynamic> toJson() => {
    "md_id": mdId,
    "md_mdl_id": mdMdlId,
    "md_ref_id": mdRefId,
    "md_name": mdName,
    "md_file_hash_name": mdFileHashName,
    "md_content_type": mdContentType,
    "md_created_on": mdCreatedOn.toIso8601String(),
    "md_created_by": mdCreatedBy,
  };

  @override
  List<Object> get props => [mdId, mdMdlId, mdRefId, mdName, mdFileHashName, mdContentType, mdCreatedOn, mdCreatedBy];
}