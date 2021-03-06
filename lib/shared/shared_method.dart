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

int convertToEpochTime(String date) {
  return (DateTime.parse(date)).millisecondsSinceEpoch;
}

int getCurrentTimeStamp() {
  return new DateTime.now().millisecondsSinceEpoch;
}

String convertOrderStatusString(int status) {
  switch (status) {
    case 1:
      return "Pending";
      break;
    case 2:
      return "Approved";
      break;
    case 3:
      return "Processed";
      break;
    case 4:
      return "Completed";
      break;
    default:
      return "Undefined";
  }
}

Color convertOrderStatusColor(int status) {
  switch (status) {
    case 1:
      return primaryColor;
      break;
    case 2:
      return Colors.black87;
      break;
    case 3:
      return primaryColorLight;
      break;
    case 4:
      return greenButtonColor;
      break;
    default:
      return Colors.black87;
  }
}

String convertComplaintStatusString(int status) {
  switch (status) {
    case 1:
      return "Open";
      break;
    case 2:
      return "On-Process";
      break;
    case 3:
      return "Resolved";
      break;
    case 4:
      return "Closed";
      break;
    default:
      return "Undefined";
  }
}

Color convertComplaintStatusColor(int status) {
  switch (status) {
    case 1:
      return primaryColor;
      break;
    case 2:
      return primaryColorLight;
      break;
    case 3:
      return greenButtonColor;
      break;
    case 4:
      return greenButtonColor;
      break;
    default:
      return Colors.black87;
  }
}

String convertSupplyStatusString(int status) {
  switch (status) {
    case 1:
      return "Requested";
      break;
    case 2:
      return "On-Process";
      break;
    case 3:
      return "On-Delivery";
      break;
    case 4:
      return "Closed";
      break;
    default:
      return "Undefined";
  }
}

Color convertSupplyStatusColor(int status) {
  switch (status) {
    case 1:
      return primaryColor;
      break;
    case 2:
      return primaryColorLight;
      break;
    case 3:
      return Colors.black87;
      break;
    case 4:
      return greenButtonColor;
      break;
    default:
      return Colors.black87;
  }
}

Future<bool> isInstalled() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = prefs.getBool('installed');
  return result;
}