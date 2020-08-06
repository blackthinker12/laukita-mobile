part of 'pages.dart';

final List<String> imgList = [
  "assets/images/ayam_cabe_ijo.jpg",
  "assets/images/ayam_kecombrang.jpg",
  "assets/images/ayam_rica.jpg",
  "assets/images/cakalang_woku.jpg",
  "assets/images/opor_ayam.jpg",
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;
  int _currentSlider = 0;
  final CarouselController _controller = CarouselController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: null,
            );
          },
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(3.0),
          ),
          height: SizeConfig.safeBlockVertical * 5.3,
          child: TextField(
            controller: searchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              hintText: 'Find Something...',
              hintStyle: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3.3,
              ),
              hintMaxLines: 2,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20.0,
                ),
                onPressed: null,
              )),
          ),
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.scanner),
            onPressed: () {
              Navigator.pushNamed(context, '/scan');
            },
          ),
          IconButton(
            icon: const Icon(Icons.email),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical * 7.5,
                  decoration: BoxDecoration(
                    color: Color(0xFFFD6400),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          0.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFff973f),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: Color(0xFFFE954E),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.refresh,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 1.21,
                              ),
                              Text(
                                'Your Orders',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 2.2,
                              ),
                            ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFff973f),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: Color(0xFFFE954E),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.monetization_on,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 1.21,
                              ),
                              Text(
                                '14.300 Points',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFff973f),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: Color(0xFFFE954E),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 1.21,
                              ),
                              Text(
                                'Wishlist',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 6,
                              ),
                            ]),
                        ),
                      ),
                    ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 3.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlider = index;
                      });
                    },
                  ),
                  carouselController: _controller
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Promo Product",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: SizeConfig.safeBlockHorizontal * 4.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return GestureDetector(
                            onTap: () {
                              _controller.animateToPage(index, duration: Duration(milliseconds: 800));
                            },
                            child: Container(
                              width: SizeConfig.safeBlockHorizontal * 2.4,
                              height: SizeConfig.safeBlockVertical * 1.5,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentSlider == index
                                    ? Color.fromRGBO(0, 0, 0, 0.9)
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Recommended For You',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: SizeConfig.safeBlockHorizontal * 4.2),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 2.5,
                              ),
                            )
                          ]
                        ),
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical * 22,
                        color: Color(0xFFfafaed),
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/product_detail');
                                },
                                child: Card(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset('assets/images/3.jpg'),
                                        SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                        Text(
                                          "Product Name",
                                          style: TextStyle(
                                            fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/3.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/1.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/2.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ),
                      )
                    ]
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Favorite and Best Reviewed',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: SizeConfig.safeBlockHorizontal * 4.2),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 2.5,
                              ),
                            )
                          ]
                        ),
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical * 22,
                        color: Color(0xFFfafaed),
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/3.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/4.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/1.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  constraints: BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 22.6273),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/images/1.jpg'),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 0.151,),
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVertical * 1.515,),
                                    ],
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ),
                      )
                    ]
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFcc0001),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.black12,
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
                'Cart',
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: EdgeInsets.only(top: 15.0, bottom: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(
                item, fit: BoxFit.contain,
              ),
            ],
          )),
    ))
  .toList();
}