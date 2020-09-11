part of 'widgets.dart';

Widget rectangleActions(
  double heightContainer1,
  bool isShadow,
  List<Widget> content,
  {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    int color = 0xFFF05828,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 14.0)
  }
) {
  return Container(
    padding: padding,
    height: heightContainer1,
    decoration: isShadow ? BoxDecoration(
      color: Color(color),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            0.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    ) : BoxDecoration(
      color: Color(color)
    ),
    child: Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: content
    ),
  );
}

Widget noInternetConnection(
  {
    String text = 'No Internet Connection',
    bool fontSizeDefault = true,
    double fontSize,
    bool buttonSizeDefault = true,
    double buttonSize,
    Function action
  }
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSizeDefault ? SizeConfig.safeBlockHorizontal * 2.9197 : fontSize
        )
      ),
      SizedBox(height: 4),
      rPreferredSizeButton(
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: redButtonColor,
          ),
        ),
        0,
        'Try Again',
        TextStyle(
          fontSize: fontSizeDefault ? SizeConfig.safeBlockHorizontal * 2.9197 : fontSize,
          color: redButtonColor
        ),
        0,
        action,
        paddingButton: EdgeInsets.all(4.0),
        widthButton: buttonSizeDefault ? SizeConfig.safeBlockHorizontal * 20 : buttonSize,
        marginButton: EdgeInsets.zero,
      ),
    ]
  );
}