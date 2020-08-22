part of 'widgets.dart';

Widget rotateText(
  String text,
  double fontSize
) {
  return RotatedBox(
    quarterTurns: -1,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "CaveatBrush",
          fontSize: fontSize,
        ),
      ),
    ),
  );
}