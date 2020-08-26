part of 'models.dart';

class Complaint {
  final String customerName;
  final int status;
  final String complaintCode;
  final String date;
  final Product product;
  final String message;
  final List<String> images;
  Complaint({
    @required this.customerName,
    @required this.status,
    @required this.complaintCode,
    @required this.product,
    @required this.date,
    @required this.message,
    @required this.images,
  });
}