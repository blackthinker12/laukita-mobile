import 'dart:convert';
import 'package:equatable/equatable.dart';

class AddDeviceOnesignalModel extends Equatable {
  AddDeviceOnesignalModel({
    this.success,
    this.id,
  });

  final bool success;
  final String id;

  factory AddDeviceOnesignalModel.fromJson(Map<String, dynamic> json) => AddDeviceOnesignalModel(
    success: json["success"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "id": id,
  };

  static AddDeviceOnesignalModel addDeviceOnesignalModelFromJson(String str) => AddDeviceOnesignalModel.fromJson(json.decode(str));
  static String addDeviceOnesignalModelToJson(AddDeviceOnesignalModel data) => json.encode(data.toJson());

  @override
  List<Object> get props => [success, id];
}