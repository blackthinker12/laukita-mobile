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
  final CarouselController _imageSliderController = CarouselController();

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
                    rButtonWithCircleIcon(
                      Material(
                        color: Color(0xFFF59622),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 1.8),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              RizalIcons.basket,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      'Shopping Cart',
                      TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                        fontWeight: FontWeight.bold
                      ),
                      null,
                      SizeConfig.safeBlockHorizontal * 31.38,
                      SizeConfig.safeBlockHorizontal * 31.63
                    ),
                    rButtonWithCircleIcon(
                      Material(
                        color: Color(0xFFFE954E),
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Icon(
                            RizalIcons.points,
                            size: 22,
                          ),
                        ),
                      ),
                      BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      '900 Pts',
                      TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                        fontWeight: FontWeight.bold
                      ),
                      null,
                      SizeConfig.safeBlockHorizontal * 31.38,
                      SizeConfig.safeBlockHorizontal * 31.63
                    ),
                    rButtonWithCircleIcon(
                      Material(
                        color: Color(0xFFF59622),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.bookmark_border,
                            size: 20,
                          ),
                        ),
                      ),
                      BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      'Bookmark',
                      TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                        fontWeight: FontWeight.bold
                      ),
                      null,
                      SizeConfig.safeBlockHorizontal * 31.38,
                      SizeConfig.safeBlockHorizontal * 31.63
                    )
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
                  carouselController: _imageSliderController
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return GestureDetector(
                      onTap: () {
                        _imageSliderController.animateToPage(index, duration: Duration(milliseconds: 800));
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
                containerList(
                  cardList(
                    SizeConfig.safeBlockVertical * 22,
                    0xFFfafaed,
                    <Widget> [
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Cakalang Woku',
                        'assets/images/3.jpg'
                      ),
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Ayam Rica Kemangi',
                        'assets/images/1.jpg'
                      ),
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Ayam Cabe Ijo',
                        'assets/images/2.jpg'
                      ),
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Opor Ayam',
                        'assets/images/4.jpg'
                      ),
                    ],
                  ),
                  'Recommended For You',
                  SizeConfig.safeBlockHorizontal * 4.2,
                  SizeConfig.safeBlockHorizontal * 2.5
                ),
                containerList(
                  cardList(
                    SizeConfig.safeBlockVertical * 22,
                    0xFFfafaed,
                    <Widget> [
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Opor Ayam',
                        'assets/images/4.jpg'
                      ),
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Cakalang Woku',
                        'assets/images/3.jpg'
                      ),
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Ayam Rica Kemangi',
                        'assets/images/1.jpg'
                      ),
                      productCard(
                        () => Navigator.pushNamed(context, '/product_detail'),
                        SizeConfig.safeBlockHorizontal * 22.6273,
                        SizeConfig.safeBlockVertical * 0.151,
                        SizeConfig.safeBlockHorizontal * 2.8,
                        SizeConfig.safeBlockVertical * 1.515,
                        'Ayam Cabe Ijo',
                        'assets/images/2.jpg'
                      ),
                    ],
                  ),
                  'Favorite and Best Reviewed',
                  SizeConfig.safeBlockHorizontal * 4.2,
                  SizeConfig.safeBlockHorizontal * 2.5
                ),
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
        color: Colors.grey,
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