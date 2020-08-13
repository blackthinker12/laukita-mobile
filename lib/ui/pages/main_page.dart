part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final int drawerIndex;
  MainPage({this.bottomNavBarIndex = 0, this.drawerIndex = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  callPage(int bottomNavBarIndex) {
    switch (bottomNavBarIndex) {
      case 0: return HomePage();

      case 1: return NearByPage();

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: bottomNavBarIndex == 1 ? null : appBarWithSearch(
        SizeConfig.safeBlockVertical * 5.3,
        Expanded(
          child: TextField(
            controller: searchController,
            keyboardType: TextInputType.text,
            decoration: appBarInputDecoration(
              SizeConfig.safeBlockHorizontal * 3.3,
              null
            )
          ),
        ),
        <Widget>[
          rIconButton(
            () => Navigator.pushNamed(context, '/scan'),
            Icon(
              RizalIcons.scan,
              size: 24,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.settings,
              size: 20,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: 20,
            )
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.notification,
              color: Colors.white,
              size: 20,
            )
          )
        ],
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: callPage(bottomNavBarIndex),
      drawer: Drawer(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFD13536),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.menu,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(30.0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/laukita.png',
                            width: SizeConfig.safeBlockHorizontal * 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75,),
                DashSeparator(color: Colors.white, width: SizeConfig.safeBlockHorizontal * 0.48,),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.3,),
                drawerMainMenu(
                  SizeConfig.safeBlockVertical * 6.363,
                  'Products',
                  null
                ),
                drawerSubmenuContainer(
                  <Widget>[
                    drawerSubmenu(
                      null,
                      'Catalog'
                    )
                  ]
                ),
                drawerMainMenu(
                  SizeConfig.safeBlockVertical * 6.363,
                  'Referral',
                  //() => Navigator.pushNamed(context, 'referral')
                  null
                ),
                drawerSubmenuContainer(
                  <Widget>[
                    drawerSubmenu(
                      () => Navigator.pushNamed(context, '/registration'),
                      'Registration'
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                    drawerSubmenu(
                      null,
                      'Dashboard'
                    ),
                    // SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                    // drawerSubmenu(
                    //   () => Navigator.pushNamed(context, '/order_payment'),
                    //   'Demo Order Payment Page'
                    // ),
                    // SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                    // drawerSubmenu(
                    //   () => Navigator.pushNamed(context, '/distribution_portal'),
                    //   'Demo Distribution Portal'
                    // ),
                    // SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                    // drawerSubmenu(
                    //   () => Navigator.pushNamed(context, '/upgrade_account'),
                    //   'Demo Upgrade Account'
                    // ),
                    // SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                    // drawerSubmenu(
                    //   () => Navigator.pushNamed(context, '/table'),
                    //   'Demo Table'
                    // ),
                  ]
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 1.0),
                              margin: EdgeInsets.only(right: 6.0),
                              child: Icon(
                                Icons.help,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )  
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2.307,),
                      DashSeparator(color: Colors.white, width: SizeConfig.safeBlockHorizontal * 0.48,),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2.307,),
                      rPreferredSizeButton(
                        BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        SizeConfig.safeBlockHorizontal * 1.21,
                        'Sign out',
                        TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9E0505)
                        ),
                        SizeConfig.safeBlockHorizontal * 2.2,
                        iconButton: Icon(
                          Icons.exit_to_app,
                          size: 15,
                          color: Color(0xFF9E0505),
                        ),
                        widthButton: SizeConfig.safeBlockHorizontal * 29.197,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFcc0001),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(RizalIcons.near_me),
              title: Text(
                'Near by',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(RizalIcons.basket),
              title: Text(
                'My Order',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(RizalIcons.feeds),
              title: Text(
                'Feeds',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(RizalIcons.account),
              title: Text(
                'Accounts',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
          ],
          currentIndex: bottomNavBarIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      )
    );
  }
}
