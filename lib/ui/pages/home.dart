part of 'pages.dart';

final List<String> imgList = [
  "assets/images/ayam_cabe_ijo.jpg",
  "assets/images/ayam_kecombrang.jpg",
  "assets/images/ayam_rica.jpg",
  "assets/images/cakalang_woku.jpg",
  "assets/images/opor_ayam.jpg",
];

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSlider = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                rectangleActions(
                  SizeConfig.safeBlockVertical * 7.5,
                  true,
                  <Widget>[
                    GestureDetector(
                      onTap: () {

                      },
                      child: rButtonType2(
                        Material(
                          color: Color(0xFFFE954E),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.refresh,
                              size: 15,
                            ),
                          ),
                        ),
                        BoxDecoration(
                          color: Color(0xFFff973f),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        SizeConfig.safeBlockHorizontal * 1.21,
                        'Shopping Cart',
                        TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                          fontWeight: FontWeight.bold
                        ),
                        SizeConfig.safeBlockHorizontal * 2.2
                      )
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: rButtonType2(
                        Material(
                          color: Color(0xFFFE954E),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.monetization_on,
                              size: 15,
                            ),
                          ),
                        ),
                        BoxDecoration(
                          color: Color(0xFFff973f),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        SizeConfig.safeBlockHorizontal * 1.21,
                        '14.300 Points',
                        TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                          fontWeight: FontWeight.bold
                        ),
                        0.0
                      )
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: rButtonType2(
                        Material(
                          color: Color(0xFFFE954E),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.favorite,
                              size: 15,
                            ),
                          ),
                        ),
                        BoxDecoration(
                          color: Color(0xFFff973f),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        SizeConfig.safeBlockHorizontal * 1.21,
                        'Wishlist',
                        TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                          fontWeight: FontWeight.bold
                        ),
                        SizeConfig.safeBlockHorizontal * 6
                      )
                    ),
                  ]
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                    height: SizeConfig.safeBlockVertical * 30,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  final List<Widget> imageSliders = imgList
    .map((item) => Container(
      child: Container(
        margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  item, fit: BoxFit.cover, width: double.infinity, height: double.infinity,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'Discount 25%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ))
  .toList();
}