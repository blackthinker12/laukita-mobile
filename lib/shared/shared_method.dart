part of 'shared.dart';

String capitalize(str) {
  if (str == null) {
    return '';
  }
  else if (str.trim() == '') {
    return '';
  }
  else {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }
}