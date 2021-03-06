part of 'shared.dart';

const Color greenButtonColor = Color(0xFF1EA64C);
const Color redButtonColor = Color(0xFF9E0505);
const Color orangeButtonColor = Color(0xFFF59622);
const Color redMenuContainerColor = Color(0xFFD13536);
const Color redMenuTextColor = Color(0xFF9E0505);
const Color yellowContainer = Color(0xffFBFBEF);
const Color blueButtonColor = Color(0xFF13A7DB);
const Color containerTitleProductDetail = Color(0xFF900A09);
const Color whiteContainer = Color(0xFFFAFAFA);
const Color purpleButtonColor = Color(0xFFCC1A7A);

const int cardColorInt = 0xFFfafaed;
const int containerRedColorInt = 0xFFcc0001;

const Color primaryColor = Color(0xFFe8282e);
const Color primaryColorLight = Color(0xFFF05828);
const Color accentColor = Color(0xFFFE954E);

ThemeData textBoxTheme() {
  return ThemeData(
    primaryColor: Color(0xFFff973f),
    primaryColorDark: Color(0xFFF05828),
  );
}

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 1,
    ),
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    accentColor: accentColor,
    //hintColor: Color(0xffcdd3e0),
    //dividerColor: Colors.grey[100],
    buttonColor: primaryColor,
    //scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      // bodyText2: TextStyle(
      //   fontSize: 14,
      //   color: Colors.black,
      // ),
      subtitle2: TextStyle(
        fontSize: 10,
        color: Colors.grey,
      ),
    //   caption: TextStyle(
    //     fontSize: 12,
    //   ),
    //   headline1: TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w800,
    //     color: Colors.black,
    //   ),
    //   headline2: TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w700,
    //     color: Colors.black,
    //   ),
    //   headline3: TextStyle(
    //     fontSize: 16,
    //     fontWeight: FontWeight.w500,
    //     color: Colors.black,
    //   ),
    //   button: TextStyle(
    //     fontSize: 14,
    //     color: Colors.white,
    //     fontWeight: FontWeight.w700,
    //   ),
    ),
    // dividerTheme: DividerThemeData(
    //   color: Colors.grey[100],
    //   thickness: 1,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

class SizeConfig {
  // set width, height & fontSize of all elements in the application, size icon
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double _safeBlockHorizontal;
  static double _safeBlockVertical;
  
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    
    _safeAreaHorizontal = _mediaQueryData.padding.left + 
      _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
      _mediaQueryData.padding.bottom;
    _safeBlockHorizontal = (screenWidth -
      _safeAreaHorizontal) / 100;
    _safeBlockVertical = (screenHeight -
      _safeAreaVertical) / 100;

    // 7.3 inchi
    if (_safeBlockHorizontal > 5.5 && _safeBlockHorizontal < 6.0 && _safeBlockVertical > 7.0 && _safeBlockVertical < 7.9) {
      safeBlockHorizontal = _safeBlockHorizontal-1;
      safeBlockVertical = _safeBlockVertical-0.5;
    } 
    // 8 inchi
    else if (_safeBlockHorizontal > 7.5 && _safeBlockHorizontal < 8.5 && _safeBlockVertical > 8.0 && _safeBlockVertical < 9.0) {
      safeBlockHorizontal = _safeBlockHorizontal-2.5;
      safeBlockVertical = _safeBlockVertical-1;
    }
    // 8.86 inchi
    else if (_safeBlockHorizontal > 7.5 && _safeBlockHorizontal < 8.5 && _safeBlockVertical > 9.0 && _safeBlockVertical < 9.9) {
      safeBlockHorizontal = _safeBlockHorizontal-2.5;
      safeBlockVertical = _safeBlockVertical-2;
    }
    // 9.9 inchi
    else if (_safeBlockHorizontal > 8.8 && _safeBlockVertical > 11.0) {
      safeBlockHorizontal = _safeBlockHorizontal-3;
      safeBlockVertical = _safeBlockVertical-4;
    }
    // 10 inchi
    else if (_safeBlockHorizontal > 7.9 && _safeBlockHorizontal < 8.7 && _safeBlockVertical > 11.0) {
      safeBlockHorizontal = _safeBlockHorizontal-2.8;
      safeBlockVertical = _safeBlockVertical-4.5;
    }
    else {
      safeBlockHorizontal = _safeBlockHorizontal;
      safeBlockVertical = _safeBlockVertical;
    }
  }
}