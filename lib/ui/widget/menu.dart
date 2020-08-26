part of 'widgets.dart';

Widget drawerMainMenu(
  double height,
  String titleMenu,
  Function action,
  {
    int backgroundColor = 0XFF8F0100,
  }
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal),
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      color: Color(backgroundColor)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: action,
          child: Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2.44),
            child: Text(
              titleMenu,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 3,
                fontWeight: FontWeight.bold
              )  
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2.44),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: SizeConfig.safeBlockHorizontal * 3
          ),
        ),
      ],
    ),
  );
}

Widget drawerSubmenuContainer(
  List<Widget> submenuList
) {
  return Container(
    margin: EdgeInsets.fromLTRB(20.0, SizeConfig.safeBlockVertical, 0.0, SizeConfig.safeBlockVertical),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: submenuList
    )
  );
}

Widget drawerSubmenu(
  Function action,
  String submenuTitle
) {
  return InkWell(
    onTap: action,
    child: Text(
      submenuTitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.safeBlockHorizontal * 2.676399,
      ),
    ),
  );
}