part of 'widgets.dart';

Widget rButton(
  BoxDecoration boxButton,
  double spacing,
  String textButton,
  TextStyle textButtonStyle,
  double spacing2,
  {
    EdgeInsets paddingButton = const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
    EdgeInsets marginButton = const EdgeInsets.only(right: 9.0, bottom: 15.0),
    Icon iconButton,
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

Widget rIconButton(
  Function action,
  Icon icon,
  {EdgeInsets paddingIcon = const EdgeInsets.symmetric(horizontal: 4.0)}
) {
  return Padding(
    padding: paddingIcon,
    child: InkWell(
      onTap: action,
      child: icon,
    ),
  );
}

Widget rPreferredSizeButton(
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
    width: widthButton,
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

Widget rButtonWithCircleIcon(
  Material clipOval,
  BoxDecoration boxButton,
  String textButton,
  TextStyle textButtonStyle,
  Function action,
  double minWidth,
  double maxWidth,
  {
    EdgeInsets paddingButton = const EdgeInsets.all(4.0),
  }
) {
  return InkWell(
    onTap: action,
    child: Container(
      padding: paddingButton,
      decoration: boxButton,
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: clipOval,
          ),
          Text(
            textButton,
            style: textButtonStyle,
          ),
          SizedBox(),
        ]
      ),
    )
  );
}