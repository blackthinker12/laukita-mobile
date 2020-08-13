part of 'shared.dart';

const String MIN_DATE = '1950-01-01';
const String INIT_DATE = '1990-06-15';
const String formatDate = 'yyyy-MMMM-dd';

var todayDate = new DateTime.now();
var formatterDate = new DateFormat('yyyy-MM-dd');
String maxDate = formatterDate.format(todayDate);