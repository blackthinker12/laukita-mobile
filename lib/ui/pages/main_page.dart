part of 'pages.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main';

  final int bottomNavBarIndex;
  final int drawerIndex;
  MainPage({this.bottomNavBarIndex = 0, this.drawerIndex = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  TextEditingController searchController = TextEditingController();
  OnesignalRepositories onesignalRepository = OnesignalRepository();
  String _advertisingId = '';
  String _deviceModel = '';
  String _deviceOS = '';
  String _packageInfo = '';
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = widget.bottomNavBarIndex;
    //_initDeviceModelState();
    //onesignalRepository.initPlatformState();
    // onesignalRepository.sendNotification(
    //   {"en": "English Message", "id": "Pesan Bahasa Indonesia"},
    //   {"en": "English Title", "id": "Judul Bahasa Indonesia"},
    // );
    // OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
    //   print("title: ${notification.payload.title}");
    //   print("content: ${notification.payload.body}");
    // });

    // OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    //   print("Tap Notification");
    // });
    //_addDeviceOneSignal();
    // initPlatformState();

    // Future.delayed(const Duration(seconds: 3), () {
    //   OneSignal.shared.consentGranted(true);
    // });

    // Future.delayed(const Duration(seconds: 5), () {
    //   OneSignal.shared.setLocationShared(true);
    // });
  }

  Future<void> _initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() {
      _packageInfo = version;
    });
  }

  _addDeviceOneSignal() {
    onesignalRepository.addDevice(
      onesignalKey,
      languange: ui.window.locale.languageCode,
      timezone: timeZoneOffsetSeconds,
      deviceModel: _deviceModel,
      deviceOS: _deviceOS,
      adId: _advertisingId,
      tags: {'user_account': 1},
      externalUserId: 'user-account-1',
      gameVersion: _packageInfo
    );
  }

  Future<void> _initDeviceModelState() async {
    String advertisingId;

    try {
      if (Platform.isAndroid) {
        _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
      _initPackageInfo();
      advertisingId = await AdvertisingId.id;

      _addDeviceOneSignal();
    } on PlatformException {
      print('Error: Failed to get platform version.');
      print('Failed to get platform version.');
    }
    
    if (!mounted) return;

    setState(() {
      _advertisingId = advertisingId;
    });
  }

  _readAndroidBuildData(AndroidDeviceInfo build) {
    setState(() {
      _deviceOS = build.version.release;
      _deviceModel = build.model;
    });
  }

  _readIosDeviceInfo(IosDeviceInfo data) {
    setState(() {
      _deviceModel = data.model;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  _buildBody(int bottomNavBarIndex, ScreenArgumentsModel args) {
    switch (bottomNavBarIndex) {
      case 0: return HomePage(args: args);
      case 1: return NearByPage();
      case 4: return UserProfilePage();

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final ScreenArgumentsModel args = ModalRoute.of(context).settings.arguments;

    double topMarginHintText;
    if (MediaQuery.of(context).size.width > 700) {
      topMarginHintText = 4.0;
    }
    else {
      topMarginHintText = 0;
    }

    return Scaffold(
      appBar: bottomNavBarIndex == 1 ? null : appBarWithSearch(
        SizeConfig.safeBlockVertical * 5.3,
        Container(
          child: TextField(
            controller: searchController,
            keyboardType: TextInputType.text,
            decoration: appBarInputDecoration(
              SizeConfig.safeBlockHorizontal * 3.3,
              null,
              SizeConfig.safeBlockHorizontal * 4.86618,
              topMarginHintText
            )
          ),
        ),
        <Widget>[
          rIconButton(
            () => Navigator.of(context).pushNamed('/scan'),
            Icon(
              RizalIcons.scan,
              size: SizeConfig.safeBlockHorizontal * 5.8394,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.settings,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
          ),
          rIconButtonWithBadges(
            null,
            Icon(
              RizalIcons.notification,
              color: Colors.white,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
            ),
            1,
            context
          ),
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
      body: _buildBody(bottomNavBarIndex, args),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width/1.8,
        child: Drawer(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: redMenuContainerColor,
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
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.menu,
                              color: Theme.of(context).primaryColor,
                              size: SizeConfig.safeBlockHorizontal * 5,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            SizeConfig.safeBlockHorizontal * 7.29927,
                            SizeConfig.safeBlockVertical * 4.61538461,
                            SizeConfig.safeBlockHorizontal * 7.29927,
                            SizeConfig.safeBlockVertical * 1.54
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/laukita.png',
                              width: SizeConfig.safeBlockHorizontal * 20,
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
                    SizeConfig.safeBlockVertical * 4.15,
                    'Products',
                    null
                  ),
                  drawerSubmenuContainer(
                    <Widget>[
                      drawerSubmenu(
                        null,
                        'Catalog'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical,),
                    ]
                  ),
                  drawerMainMenu(
                    SizeConfig.safeBlockVertical * 4.15,
                    'Referral',
                    //() => Navigator.pushNamed(context, 'referral')
                    null
                  ),
                  drawerSubmenuContainer(
                    <Widget>[
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/login'),
                        'Registration'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        null,
                        'Dashboard'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/order_payment'),
                        'Demo Order Payment Page'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/distribution_portal'),
                        'Demo Distribution Portal'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/upgrade_account'),
                        'Demo Upgrade Account'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/shipment_form'),
                        'Demo Delivery Form Page'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/table'),
                        'Demo Table Page'
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1.5,),
                      drawerSubmenu(
                        () => Navigator.of(context).pushNamed('/transactions_page'),
                        'Demo Transactions Page'
                      ),
                    ]
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6.0),
                                child: Icon(
                                  Icons.help,
                                  color: Colors.white,
                                  size: SizeConfig.safeBlockHorizontal * 3,
                                ),
                              ),
                              Text(
                                'Help',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                                )  
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical),
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
                            color: redMenuTextColor
                          ),
                          SizeConfig.safeBlockHorizontal,
                          null,
                          iconButton: Icon(
                            Icons.exit_to_app,
                            size: SizeConfig.safeBlockHorizontal * 3.6496,
                            color: redMenuTextColor
                          ),
                          widthButton: SizeConfig.safeBlockHorizontal * 22,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: primaryColor,
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
