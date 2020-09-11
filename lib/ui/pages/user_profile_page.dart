part of 'pages.dart';

class UserProfilePage extends StatefulWidget {

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
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
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2),
                      color: _tabController.index == 0
                          ? Colors.white
                          : Colors.grey[100],
                    ),
                    child: Tab(
                      text: "Buyer Account",
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2),
                      color: _tabController.index == 1
                          ? Colors.white
                          : Colors.grey[100],
                    ),
                    width: double.infinity,
                    child: Tab(
                      text: "Refferal Account",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  BuyerAccountPage(),
                  ReferralAccountPage()  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}