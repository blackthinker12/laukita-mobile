part of '../pages.dart';

class ReferralAccountPage extends StatefulWidget {
  @override
  _ReferralAccountPageState createState() => _ReferralAccountPageState();
}

class _ReferralAccountPageState extends State<ReferralAccountPage> {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Verified Referral",
                                    style: TextStyle(
                                      color: greenButtonColor, fontSize: SizeConfig.safeBlockHorizontal * 2.92
                                    ),
                                  ),
                                  SizedBox(width: 2,),
                                  Icon(
                                    Icons.info,
                                    size: SizeConfig.safeBlockHorizontal * 3.4063,
                                    color: greenButtonColor,
                                  )
                                ],
                              ),
                              underlineIconButton(
                                "Activity Rank",
                                Icons.local_activity,
                                null,
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
                              Text(
                                "Rudi Hartono",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3.893
                                ),
                              ),
                              RatingBarIndicator(
                                rating: 2.75,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 14.0,
                                direction: Axis.horizontal,
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
                                "78/100",
                                style: TextStyle(
                                  color: Colors.black87,
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
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1.54,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 0.77, horizontal: SizeConfig.safeBlockHorizontal * 1.217),
              child: Text(
                "Order and Rewards",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                  fontSize: SizeConfig.safeBlockHorizontal * 3.2
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            verticalIconButton(
                              "Orders",
                              0,
                              fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                              spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                              icon: Icons.insert_chart,
                              iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                              widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                              heightButton: SizeConfig.safeBlockVertical * 5.5385
                            ),
                            verticalIconButton(
                              "Rewards Claim",
                              0,
                              fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                              spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                              icon: Icons.bubble_chart,
                              iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                              widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                              heightButton: SizeConfig.safeBlockVertical * 5.5385
                            ),
                            verticalIconButton(
                              "Point Story",
                              0,
                              fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                              spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                              icon: Icons.av_timer,
                              iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                              widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                              heightButton: SizeConfig.safeBlockVertical * 5.5385
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        underlineIconButton(
                          "Point Balance",
                          Icons.attach_money,
                          null,
                          SizeConfig.safeBlockHorizontal * 3.4063,
                          SizeConfig.safeBlockHorizontal * 2.92
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 0.77,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2.9),
                          child: Text(
                            "Rp. 300.000",
                            style: TextStyle(
                              color: redButtonColor,
                              fontStyle: FontStyle.italic,
                              fontSize: SizeConfig.safeBlockHorizontal * 2.9
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1.54,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 0.77, horizontal: SizeConfig.safeBlockHorizontal * 1.217),
              child: Text(
                "Social Contents",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                  fontSize: SizeConfig.safeBlockHorizontal * 3.2
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            verticalIconButton(
                              "My Post",
                              0,
                              fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                              spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                              icon: Icons.filter_frames,
                              iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                              widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                              heightButton: SizeConfig.safeBlockVertical * 5.5385
                            ),
                            verticalIconButton(
                              "Followers",
                              0,
                              fontSize: SizeConfig.safeBlockHorizontal * 2.92,
                              spaceVertical: SizeConfig.safeBlockVertical * 0.77,
                              icon: Icons.person,
                              iconSize: SizeConfig.safeBlockHorizontal * 4.87,
                              widthButton: SizeConfig.safeBlockHorizontal * 8.5158151,
                              heightButton: SizeConfig.safeBlockVertical * 5.5385
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        underlineIconButton(
                          "Social Networks",
                          Icons.share,
                          null,
                          SizeConfig.safeBlockHorizontal * 3.4063,
                          SizeConfig.safeBlockHorizontal * 2.92
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 0.77,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2.9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/google.png",
                                  width: SizeConfig.safeBlockHorizontal * 3.65,
                                  height: SizeConfig.safeBlockVertical * 2.308,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 2.44,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/instagram.png",
                                  width: SizeConfig.safeBlockHorizontal * 3.65,
                                  height: SizeConfig.safeBlockVertical * 2.308,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1.54,
            ),
            customTile(
              EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
              () {},
              Icons.settings,
              Colors.grey[100],
              title: "Account Settings",
              subtitle: "Your button desc here",
              paddingIcon: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 1.21655, 1.0, SizeConfig.safeBlockHorizontal * 2.4331, 0),
              iconSize: SizeConfig.safeBlockHorizontal * 3.65,
              fontSizeTitle: SizeConfig.safeBlockHorizontal * 3.4063,
              fontSizeSubtitle: SizeConfig.safeBlockHorizontal * 2.92,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1.54,
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
              height: SizeConfig.safeBlockVertical * 1.54,
            ),
          ],
        ),
      ),
    );
  }
}