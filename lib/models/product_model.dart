part of 'models.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel extends Equatable {
  ProductModel({
    this.message,
    this.code,
    this.result,
  });

  final String message;
  final int code;
  final ResultProductModel result;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] == 200) {
      return ProductModel(
        message: json["message"],
        code: json["code"],
        result: ResultProductModel.fromJson(json["result"]),
      );
    } else {
      return ProductModel(
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
  List<Object> get props => [code, message, result];
}

class ResultProductModel {
  ResultProductModel({
    this.data,
  });

  List<DataProductModel> data;

  factory ResultProductModel.fromJson(Map<String, dynamic> json) => ResultProductModel(
    data: List<DataProductModel>.from(json["data"].map((x) => DataProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataProductModel {
  DataProductModel({
    this.pdId,
    this.pdCtId,
    this.pdName,
    this.pdPrice,
    // this.pdCreatedOn,
    // this.pdCreatedBy,
    // this.pdUpdatedOn,
    // this.pdUpdatedBy,
    // this.pdDeletedOn,
    // this.pdDeletedBy,
    this.pdWeight,
    this.pdUnit,
    this.pdPackage,
    this.pdDescription,
    this.isBookmark = false
  });

  int pdId;
  int pdCtId;
  String pdName;
  int pdPrice;
  // DateTime pdCreatedOn;
  // int pdCreatedBy;
  // dynamic pdUpdatedOn;
  // dynamic pdUpdatedBy;
  // dynamic pdDeletedOn;
  // dynamic pdDeletedBy;
  String pdWeight;
  String pdUnit;
  String pdPackage;
  String pdDescription;
  bool isBookmark;

  factory DataProductModel.fromJson(Map<String, dynamic> json) => DataProductModel(
    pdId: json["pd_id"],
    pdCtId: json["pd_ct_id"],
    pdName: json["pd_name"],
    pdPrice: json["pd_price"],
    // pdCreatedOn: DateTime.parse(json["pd_created_on"]),
    // pdCreatedBy: json["pd_created_by"],
    // pdUpdatedOn: json["pd_updated_on"],
    // pdUpdatedBy: json["pd_updated_by"],
    // pdDeletedOn: json["pd_deleted_on"],
    // pdDeletedBy: json["pd_deleted_by"],
    pdWeight: json["pd_weight"],
    pdUnit: json["pd_unit"],
    pdPackage: json["pd_package"],
    pdDescription: json["pd_description"],
    isBookmark: json["isBookmark"] ?? false
  );

  Map<String, dynamic> toJson() => {
    "pd_id": pdId,
    "pd_ct_id": pdCtId,
    "pd_name": pdName,
    "pd_price": pdPrice,
    // "pd_created_on": pdCreatedOn.toIso8601String(),
    // "pd_created_by": pdCreatedBy,
    // "pd_updated_on": pdUpdatedOn,
    // "pd_updated_by": pdUpdatedBy,
    // "pd_deleted_on": pdDeletedOn,
    // "pd_deleted_by": pdDeletedBy,
    "pd_weight": pdWeight,
    "pd_unit": pdUnit,
    "pd_package": pdPackage,
    "pd_description": pdDescription,
    "isBookmark": isBookmark
  };
}