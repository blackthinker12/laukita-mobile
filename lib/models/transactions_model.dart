part of 'models.dart';

class Transaction {
  final String customerName;
  final int status;
  final String transactionCode;
  final String date;
  final int totalTransaction;
  final List<Product> product;
  final String shippingNumber;
  Transaction({
    @required this.customerName,
    @required this.status,
    @required this.transactionCode,
    @required this.totalTransaction,
    @required this.product,
    @required this.date,
    this.shippingNumber,
  });
}