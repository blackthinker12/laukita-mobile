part of 'widgets.dart';

Widget searchProductCard() {
  return Card(
    elevation: 5,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.5),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.safeBlockVertical * 5.5,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search product, consumer, or invoice number",
                contentPadding: EdgeInsets.all(6.5),
                hintStyle: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                ),
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1.54,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Period:",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 2.44,),
              customDropdownButton(
                () {},
                "01/07/2020",
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 2.44,),
              Text(
                "to:",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 2.44,),
              customDropdownButton(
                () {},
                "01/08/2020",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}