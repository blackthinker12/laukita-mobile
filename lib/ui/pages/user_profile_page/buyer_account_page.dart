part of '../pages.dart';

class BuyerAccountPage extends StatefulWidget {
  @override
  _BuyerAccountPageState createState() => _BuyerAccountPageState();
}

class _BuyerAccountPageState extends State<BuyerAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1.217),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                      child: Icon(
                        Icons.photo_camera,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      width: SizeConfig.safeBlockHorizontal * 14.6,
                      height: SizeConfig.safeBlockVertical * 9.231,
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 2.44,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Verified Referral",
                                style: TextStyle(
                                  color: greenButtonColor, fontSize: SizeConfig.safeBlockHorizontal * 2.92)
                              ),
                              SizedBox(width: 2,),
                              Icon(
                                Icons.info,
                                size: SizeConfig.safeBlockHorizontal * 3.4063,
                                color: greenButtonColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.77,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Musdi Lintang",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3.893
                                ),
                              ),
                              underlineIconButton(
                                "Member Point",
                                Icons.star,
                                () {},
                                SizeConfig.safeBlockHorizontal * 3.4063,
                                SizeConfig.safeBlockHorizontal * 2.92
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.77,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                  "Edit profile",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black54,
                                    fontSize: SizeConfig.safeBlockHorizontal * 2.92
                                  ),
                                ),
                              ),
                              Text(
                                "14.300",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: SizeConfig.safeBlockHorizontal * 2.92
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: verticalIconButton(
                        "Orders\n",
                        0,
                        fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                        spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                        icon: Icons.list,
                        iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                        widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                        heightButton: SizeConfig.safeBlockVertical * 5.5385
                      ),
                    ),
                    Expanded(
                      child: verticalIconButton(
                        "Coupons\n",
                        0,
                        fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                        spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                        icon: Icons.card_membership,
                        iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                        widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                        heightButton: SizeConfig.safeBlockVertical * 5.5385
                      ),
                    ),
                    Expanded(
                      child: verticalIconButton(
                        "Product Reviews",
                        0,
                        fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                        spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                        icon: Icons.filter_frames,
                        iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                        widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                        heightButton: SizeConfig.safeBlockVertical * 5.5385
                      ),
                    ),
                    Expanded(
                      child: verticalIconButton(
                        "Complaints\n",
                        0,
                        fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                        spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                        icon: Icons.phone_android,
                        iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                        widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                        heightButton: SizeConfig.safeBlockVertical * 5.5385
                      ),
                    ),
                    Expanded(
                      child: verticalIconButton(
                        "Bookmark\n",
                        0,
                        fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                        spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                        icon: Icons.bookmark,
                        iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                        widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                        heightButton: SizeConfig.safeBlockVertical * 5.5385
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 0.77,
            ),
            customTile(
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
              () {},
              Icons.remove_red_eye,
              Colors.grey[100],
              title: "Last Viewed Product",
              subtitle: "Your button desc here",
              paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
              iconSize: SizeConfig.safeBlockHorizontal * 3.65,
              fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
              fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 0.77,
            ),
            customTile(
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
              () {},
              Icons.people,
              Colors.grey[100],
              title: "Your Refferal Account",
              subtitle: "Your button desc here",
              paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
              iconSize: SizeConfig.safeBlockHorizontal * 3.65,
              fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
              fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 0.77,
            ),
            customTile(
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
              () {},
              Icons.person_add,
              Colors.grey[100],
              title: "Account Settings",
              subtitle: "Your button desc here",
              paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
              iconSize: SizeConfig.safeBlockHorizontal * 3.65,
              fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
              fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 0.77,
            ),
            customTile(
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
              () {},
              Icons.help,
              Colors.grey[100],
              title: "Help Center",
              subtitle: "Your button desc here",
              paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
              iconSize: SizeConfig.safeBlockHorizontal * 3.65,
              fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
              fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 0.77,
            ),
            customTile(
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
              () {},
              Icons.exit_to_app,
              Color(0xFFF2F3E2),
              title: "Sign Out",
              subtitle: "Your button desc here",
              paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
              iconSize: SizeConfig.safeBlockHorizontal * 3.65,
              fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
              fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
            ),
          ],
        ),
      ),
    );
  }
}