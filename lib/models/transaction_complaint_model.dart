import 'package:flutter/widgets.dart';
import 'package:Laukita/models/models.dart';

class TransactionComplaintModel {
  final String customerName;
  final int status;
  final String complaintCode;
  final String date;
  final ProductDetailModel product;
  final String message;
  final List<String> images;

  TransactionComplaintModel({
    @required this.customerName,
    @required this.status,
    @required this.complaintCode,
    @required this.product,
    @required this.date,
    @required this.message,
    @required this.images,
  });
}