part of 'pages.dart';

final List<String> imgList = [
  "assets/images/ayam_cabe_ijo.jpg",
  "assets/images/ayam_kecombrang.jpg",
  "assets/images/ayam_rica.jpg",
  "assets/images/cakalang_woku.jpg",
  "assets/images/opor_ayam.jpg",
];

class HomePage extends StatefulWidget {
  final ScreenArgumentsModel args;
  HomePage({Key key, this.args}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInvalidToken;
  String tokenValue;
  int _currentSlider = 0;
  final CarouselController _imageSliderController = CarouselController();

  @override
  void initState() {
    super.initState();
    if (widget.args != null) {
      if (widget.args.token != null && widget.args.token.code == 200) {
        setState(() {
          tokenValue = widget.args.token.result.token;
        });
        _getProducts();
      }
    }
  }

  _getProducts() {
    context.bloc<ProductBloc>().add(GetProducts(tokenValue));
  }

  _generateToken() {
    context.bloc<TokenBloc>().add(GenerateToken(
      "owner@laukita.com", "owner"
    ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Scaffold(
      body: BlocListener<TokenBloc, TokenState>(
        listener: (_, state) {
          if(state is TokenLoaded) {
            if (state.token.code == 200) {
              setState(() {
                tokenValue = state.token.result?.token;
              });
              print(tokenValue);
              _getProducts(); 
            }
            else {
              _generateToken();
            } 
          }
        },
        child: Column(
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
                          color: orangeButtonColor,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 1.8),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Icon(
                                RizalIcons.basket,
                                size: SizeConfig.safeBlockHorizontal * 3.89294,
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
                        () => Navigator.of(context).pushNamed(ShoppingCartPage.routeName),
                        SizeConfig.safeBlockHorizontal * 29.3,
                        SizeConfig.safeBlockHorizontal * 29.6
                      ),
                      rButtonWithCircleIcon(
                        Material(
                          color: orangeButtonColor,
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Icon(
                              RizalIcons.points,
                              size: SizeConfig.safeBlockHorizontal * 5.352798,
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
                        SizeConfig.safeBlockHorizontal * 29.3,
                        SizeConfig.safeBlockHorizontal * 29.6
                      ),
                      rButtonWithCircleIcon(
                        Material(
                          color: orangeButtonColor,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.bookmark_border,
                              size: SizeConfig.safeBlockHorizontal * 4.86618,
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
                        SizeConfig.safeBlockHorizontal * 29.3,
                        SizeConfig.safeBlockHorizontal * 29.6
                      )
                    ],
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3.4)
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
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is ProductInitial) {
                          return buildLoading(SizeConfig.safeBlockHorizontal * 9.73236009);
                        } else if (state is ProductLoaded) {
                          //List<DataProductModel> products = state.product.result.data.sublist(0, 10);
                          if (state.product.code == 200) {
                            List<DataProductModel> products = state.product.result.data;
                            return cardList(
                              SizeConfig.safeBlockVertical * 23,
                              cardColorInt,
                              listView: _buildProductCard(
                                context,
                                products,
                                products.length
                              )
                            );
                          }
                          else if (state.product.message == 'invalid_token') {
                            print(state.product.message);
                            _generateToken();
                            return buildLoading(SizeConfig.safeBlockHorizontal * 9.73236009);
                          }
                          else {
                            return noInternetConnection(
                              text: "Couldn't fetch products",
                              action: _getProducts()
                            );
                          }
                        } else if (state is ProductError) {
                          return noInternetConnection(
                            text: "Couldn't fetch products",
                            action: _getProducts()
                          );
                        } else {
                          return buildLoading(SizeConfig.safeBlockHorizontal * 9.73236009);
                        }
                      },
                    ),
                    'Recommended For You',
                    SizeConfig.safeBlockHorizontal * 4.2,
                    SizeConfig.safeBlockHorizontal * 2.5
                  ),
                  containerList(
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is ProductInitial) {
                          return buildLoading(SizeConfig.safeBlockHorizontal * 9.73236009);
                        } else if (state is ProductLoaded) {
                          if (state.product.code == 200) {
                            List<DataProductModel> products = state.product.result.data;
                            return cardList(
                              SizeConfig.safeBlockVertical * 23,
                              cardColorInt,
                              listView: _buildProductCard(
                                context,
                                products,
                                products.length
                              )
                            );
                          }
                          else if (state.product.message == 'invalid_token') {
                            print(state.product.message);
                            _generateToken();
                            return buildLoading(SizeConfig.safeBlockHorizontal * 9.73236009);
                          }
                          else {
                            return noInternetConnection(
                              text: "Couldn't fetch products",
                              action: _getProducts()
                            );
                          }
                        } else if (state is ProductError) {
                          return noInternetConnection(
                            text: "Couldn't fetch products",
                            action: _getProducts()
                          );
                        } else {
                          return buildLoading(SizeConfig.safeBlockHorizontal * 9.73236009);
                        }
                      },
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
      ),
    );
  }

  _buildProductCard(BuildContext context, List<DataProductModel>products, int length) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: length,
      itemBuilder: (context, i) {
        ScreenArgumentsModel argumentsValue = ScreenArgumentsModel(
          product: products[i],
        );
        return productCard(
          () => Navigator.of(context).pushNamed(
            ProductDetailPage.routeName,
            arguments: argumentsValue
          ),
          SizeConfig.safeBlockHorizontal * 22.6273,
          SizeConfig.safeBlockVertical * 0.151,
          SizeConfig.safeBlockHorizontal * 2.8,
          products[i].pdName,
          i > 2 ? 'assets/images/3.jpg' : 'assets/images/$i.jpg'
        );
      }
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
                        fontSize: SizeConfig.safeBlockHorizontal * 3.893,
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