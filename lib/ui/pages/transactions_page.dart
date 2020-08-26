part of 'pages.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Transactions',
        <Widget>[
          rIconButton(
            () => Navigator.pushNamed(context, '/scan'),
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
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.1, vertical: SizeConfig.safeBlockVertical * 1.5),
                    width: double.infinity,
                    child: TabBar(
                      indicatorColor: redButtonColor,
                      labelPadding: EdgeInsets.zero,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.40632
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      tabs: [
                        customTopTabBar(
                          _tabController,
                          0,
                          "Orders",
                          3,
                        ),
                        customTopTabBar(
                          _tabController,
                          1,
                          "Complaints",
                          2,
                        ),
                        customTopTabBar(
                          _tabController,
                          2,
                          "Supply",
                          0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        TransactionOrdersPage(),
                        TransactionComplaintsPage(),
                        TransactionSupplyPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            rectangleActions(
              SizeConfig.safeBlockVertical * 7.5,
              false,
              _tabController.index != 2 ? <Widget>[
                rPreferredSizeButton(
                  BoxDecoration(
                    color: redButtonColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Save Report',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.65,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  null,
                  iconButton: Icon(
                    Icons.save,
                    size: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white,
                  ),
                  marginButton: EdgeInsets.zero
                )
              ] : <Widget>[
                rPreferredSizeButton(
                  BoxDecoration(
                    color: redButtonColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Request',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.65,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  null,
                  iconButton: Icon(
                    Icons.send,
                    size: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white,
                  ),
                  marginButton: EdgeInsets.zero
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 2.44,),
                rPreferredSizeButton(
                  BoxDecoration(
                    color: redButtonColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Report',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.65,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  null,
                  iconButton: Icon(
                    Icons.save,
                    size: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white,
                  ),
                  marginButton: EdgeInsets.zero
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
              color: containerRedColorInt,
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4.86618)
            )
          ],
        ),
      ),
    );
  }
}