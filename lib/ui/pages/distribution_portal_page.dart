part of 'pages.dart';

class DistributionPortalPage extends StatefulWidget {
  DistributionPortalPage({Key key}) : super(key: key);

  @override
  _DistributionPortalPageState createState() => _DistributionPortalPageState();
}

class _DistributionPortalPageState extends State<DistributionPortalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Distribution Portal',
        <Widget>[
          rIconButton(
            () => Navigator.of(context).pushNamed('/scan'),
            Icon(
              Icons.settings,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
            ),
            paddingIcon: EdgeInsets.only(left: 13.0, right: 16.0)
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
            ),
            paddingIcon: EdgeInsets.only(left: 13.0, right: 13.0)
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.notification,
              color: Colors.white,
            ),
            paddingIcon: EdgeInsets.only(left: 10.0, right: 16.0)
          )
        ],
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1.21654),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  reverseUnderlineIconButton(
                                    "Balance",
                                    Icons.star,
                                    () {},
                                    SizeConfig.safeBlockHorizontal * 3.4063,
                                    SizeConfig.safeBlockHorizontal * 2.92
                                  ),
                                  Text(
                                    "Musdi Lintang",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontSize: SizeConfig.safeBlockHorizontal * 3.893
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 0.77,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.2),
                                    child: Text(
                                      "14.200",
                                      style: TextStyle(
                                        color: redButtonColor,
                                        fontSize: SizeConfig.safeBlockHorizontal * 2.9
                                      ),
                                    ),
                                  ),
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
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 0.77,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Area Code: x5001",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.433,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 2.433,
                        ),
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
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 4.86618,
                              height: SizeConfig.safeBlockVertical * 12.3076923,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Incomings",
                                      0,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      icon: Icons.list,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "On Process",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                      softWrap: false
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Finished",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 2,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 4.86618,
                        height: SizeConfig.safeBlockVertical * 12.92307,
                        color: primaryColor,
                        child: rotateText("Orders", SizeConfig.safeBlockHorizontal * 3.40632),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 4.86618,
                              height: SizeConfig.safeBlockVertical * 12.3076923,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Orders",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                      onTap: () {
                                        // Navigator.of(context).pushNamed(
                                        //     TransactionScreen.route_name);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Shipment",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Returns",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Complaints",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 2,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 4.86618,
                        height: SizeConfig.safeBlockVertical * 12.92307,
                        color: primaryColor,
                        child: rotateText("Transaction", SizeConfig.safeBlockHorizontal * 3.40632),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 4.86618,
                              height: SizeConfig.safeBlockVertical * 13.07692,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Balance Activity",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Claim Rewards",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Site Location",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 2,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 4.86618,
                        height: SizeConfig.safeBlockVertical * 13.6923,
                        color: primaryColor,
                        child: rotateText("Personal", SizeConfig.safeBlockHorizontal * 3.40632),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 4.86618,
                              height: SizeConfig.safeBlockVertical * 12.3076923,
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Catalog",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Orders",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: verticalIconButton(
                                      "Orders",
                                      0,
                                      icon: Icons.list,
                                      fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                      spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                      iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                      widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                      heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.433,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 2,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 4.86618,
                        height: SizeConfig.safeBlockVertical * 12.92307,
                        color: primaryColor,
                        child: rotateText("Stock", SizeConfig.safeBlockHorizontal * 3.40632),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 0.77,
                ),
                Stack(
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 4.86618,
                              height: SizeConfig.safeBlockVertical * 12.3076923,
                            ),
                            Expanded(
                                child: Center(
                              child: Container(
                                height: SizeConfig.safeBlockVertical * 10.76923,
                                child: Center(
                                  child: ListView.builder(
                                    itemCount: 8,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: SizeConfig.safeBlockHorizontal * 2.433,
                                            ),
                                            Container(
                                              width: SizeConfig.safeBlockHorizontal * 14.6,
                                              height: SizeConfig.safeBlockVertical * 9.231,
                                              child: Center(
                                                child: verticalIconButton(
                                                  "Catalog",
                                                  0,
                                                  icon: Icons.list,
                                                  fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                                                  spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                                                  iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                                                  widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                                                  heightButton: SizeConfig.safeBlockVertical * 5.5385,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 2,
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 4.86618,
                        height: SizeConfig.safeBlockVertical * 12.92307,
                        color: primaryColor,
                        child: rotateText("Stock", SizeConfig.safeBlockHorizontal * 3.40632),
                      ),
                    ),
                  ],
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
                  Icons.subdirectory_arrow_right,
                  Colors.yellow[100],
                  title: "Sign Out",
                  subtitle: "Your button desc here",
                  paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
                  iconSize: SizeConfig.safeBlockHorizontal * 3.65,
                  fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
                  fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 0.77,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}