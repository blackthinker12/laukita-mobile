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
    margin: EdgeInsets.symmetric(horizontal: 5.0),
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
            margin: EdgeInsets.only(left: 15.0),
            child: Text(
              titleMenu,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4.38,
                fontWeight: FontWeight.bold
              )  
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
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
    margin: EdgeInsets.fromLTRB(32.0, 11.0, 0.0, 12.0),
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
        color: Colors.white
      ),
    ),
  );
}