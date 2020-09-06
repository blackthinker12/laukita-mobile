part of 'models.dart';

class TransactionSupplyModel {
  final String customerName;
  final int status;
  final String transactionCode;
  final String date;
  final int totalTransaction;
  final List<ProductDetailModel> product;
  final String shippingNumber;

  TransactionSupplyModel({
    @required this.customerName,
    @required this.status,
    @required this.transactionCode,
    @required this.totalTransaction,
    @required this.product,
    @required this.date,
    this.shippingNumber,
  });
}