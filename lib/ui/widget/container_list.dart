part of 'widgets.dart';

Widget containerList(
  Widget contentList,
  String title,
  double fontSize,
  double fontSizeReadMore
) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: fontSize),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: fontSizeReadMore,
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
  List<Widget> children,
) {
  return Container(
    height: height,
    color: Color(color),
    padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
    child: Padding(
      padding: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: children
      )
    )
  );
}

Widget productCard(
  Function tap,
  double maxWidth,
  double space,
  double fontSize,
  double space2,
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
          children: <Widget>[
            Image.asset(imageUrl),
            SizedBox(height: space,),
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
            SizedBox(height: space2),
          ],
        ),
      ),
    ),
  );
}