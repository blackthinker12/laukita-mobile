part of 'shared.dart';

String baseUrl = 'http://192.168.43.154/v0.1'; 
const String MIN_DATE = '1950-01-01';
const String INIT_DATE = '1990-06-15';
const String formatDate = 'yyyy-MMMM-dd';

var todayDate = new DateTime.now();
var formatterDate = new DateFormat('yyyy-MM-dd');
String maxDate = formatterDate.format(todayDate);