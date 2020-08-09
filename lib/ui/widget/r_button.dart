part of 'widgets.dart';

Widget rButtonType1(
  BoxDecoration boxButton,
  double spacing,
  String textButton,
  TextStyle textButtonStyle,
  double spacing2,
  {
    EdgeInsets paddingButton = const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
    EdgeInsets marginButton = const EdgeInsets.only(right: 9.0, bottom: 15.0),
    Icon iconButton,
    double widthButton
  }
) {
  return Container(
    padding: paddingButton,
    margin: marginButton,
    decoration: boxButton,
    child: Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        iconButton,
        SizedBox(
          width: spacing,
        ),
        Text(
          textButton,
          style: textButtonStyle,
        ),
        SizedBox(
          width: spacing2,
        ),
      ]
    ),
  );
}

Widget rButtonType2(
  Material clipOval,
  BoxDecoration boxButton,
  double spacing,
  String textButton,
  TextStyle textButtonStyle,
  double spacing2,
  {
    EdgeInsets paddingButton = const EdgeInsets.all(4.0)
  }
) {
  return Container(
    padding: paddingButton,
    decoration: boxButton,
    child: Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: clipOval,
        ),
        SizedBox(
          width: spacing,
        ),
        Text(
          textButton,
          style: textButtonStyle,
        ),
        SizedBox(
          width: spacing2,
        ),
      ]),
  );
}