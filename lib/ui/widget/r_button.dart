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

Widget rIconButtonWithBadges(
  Function onTap,
  Icon icon,
  int badgesCount,
  BuildContext context,
  {EdgeInsets paddingIcon = const EdgeInsets.symmetric(horizontal: 4.0)}
) {
  return Padding(
    padding: paddingIcon,
    child: Stack(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: icon,
        ),
        badgesCount > 0
          ? Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                constraints: BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Center(
                  child: Text(
                    badgesCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ) : SizedBox()
      ],
    ),
  );
}

Widget underlineIconButton(
  String buttonName,
  IconData icon,
  Function onTap,
  double fontSize,
  double iconSize
) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: <Widget>[
        Text(
          buttonName,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            fontSize: fontSize
          ),
        ),
        SizedBox(width: 2,),
        Icon(
          icon,
          size: iconSize,
        )
      ],
    ),
  );
}

Widget rPreferredSizeButton(
  BoxDecoration boxButton,
  double spacing,
  String textButton,
  TextStyle textButtonStyle,
  double spacing2,
  Function tap,
  {
    EdgeInsets paddingButton = const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
    EdgeInsets marginButton = const EdgeInsets.only(right: 9.0, bottom: 15.0),
    Icon iconButton,
    double widthButton,
    String image,
    double widthImage
  }
) {
  return InkWell(
    onTap: tap,
    child: Container(
      width: widthButton,
      padding: paddingButton,
      margin: marginButton,
      decoration: boxButton,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          iconButton == null && image == null ? SizedBox() : iconButton != null ? iconButton : Image.asset(image, width: widthImage),
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
    ),
  );
}

Widget verticalIconButton(
  String buttonName,
  int badgesCount,
  {
    double widthButton = 35,
    double heightButton = 35,
    double fontSize = 11,
    double spaceVertical = 5.0,
    IconData icon,
    double iconSize = 12,
    double badgesSize = 12,
  }
) { 
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            height: heightButton,
            width: widthButton,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: iconSize,
            ),
          ),
          badgesCount > 0
            ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: primaryColorLight,
                    borderRadius: BorderRadius.circular(badgesSize / 2),
                  ),
                  constraints: BoxConstraints(
                    minWidth: badgesSize,
                    minHeight: badgesSize,
                  ),
                  child: Center(
                    child: Text(
                      badgesCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ))
            : SizedBox()
        ],
      ),
      SizedBox(
        height: spaceVertical,
      ),
      Text(
        buttonName,
        style: TextStyle(
          fontSize: fontSize,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.black45
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    ],
  );
}