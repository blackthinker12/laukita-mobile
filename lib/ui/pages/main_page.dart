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
  PageController pageController;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      bottomNavBarIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: bottomNavBarIndex == 1 ? null : appBarActions(
        true,
        SizeConfig.safeBlockVertical * 5.3,
        TextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          decoration: appBarInputDecoration(
            SizeConfig.safeBlockHorizontal * 3.3,
            null
          )
        ),
        <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/scan');
              },
              child: Icon(Icons.scanner),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.settings),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.email),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.notifications),
            ),
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
      body: Stack(
        children: <Widget>[
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[
              HomePage(),
              NearBy()
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFD13536),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              DrawerHeader(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(0.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/laukita.png',
                    width: SizeConfig.safeBlockHorizontal * 30,
                  )
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5,),
              DashSeparator(color: Colors.white, width: 2.0,),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: double.infinity,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Color(0XFF8F0100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        )  
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32.0, 11.0, 0.0, 12.0),
                child: Text(
                  'Catalog',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: double.infinity,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Color(0XFF8F0100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Referral / Agent',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )  
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32.0, 11.0, 0.0, 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Text(
                        'Registration',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/order_payment');
                      },
                      child: Text(
                        'Demo Order Payment Page',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 160,),
              Container(
                margin: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 1.0),
                      margin: const EdgeInsets.only(right: 6.0),
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
              SizedBox(height: 15,),
              DashSeparator(color: Colors.white, width: 2.0,),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerRight,
                child: rButtonType1(
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFcc0001),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.black26,
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
              icon: Icon(Icons.navigation),
              title: Text(
                'Near by',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(
                'My Order',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list),
              title: Text(
                'Feeds',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.0,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
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
      ),
    );
  }
}
