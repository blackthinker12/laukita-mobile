part of 'widgets.dart';

Widget containerList(
  Widget contentList,
  String title,
  double fontSize,
  double fontSizeReadMore,
  {
    Function seeAllAction
  }
) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3.892944, right: SizeConfig.safeBlockHorizontal * 3.892944, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: fontSize),
              ),
              InkWell(
                onTap: seeAllAction,
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: fontSizeReadMore,
                  ),
                ),
              )
            ]
          ),
        ),
        contentList
      ]
    )
  );
}

Widget cardList(
  double height,
  int color,
  {
    ListView listView
  }
) {
  return Container(
    height: height,
    color: Color(color),
    padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
    child: Padding(
      padding: EdgeInsets.only(top: 5.0, left: SizeConfig.safeBlockHorizontal * 3.892944, right: SizeConfig.safeBlockHorizontal * 3.892944),
      child: listView
    )
  );
}

Widget productCard(
  Function tap,
  double maxWidth,
  double space,
  double fontSize,
  String title,
  String imageUrl
) {
  return GestureDetector(
    onTap: tap,
    child: Card(
      child: Container(
        margin: EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(imageUrl),
            SizedBox(height: space,),
            Expanded(
              child:Text(
                title,
                overflow: TextOverflow.visible,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                ),
              )
            ),
          ],
        ),
      ),
    ),
  );
}