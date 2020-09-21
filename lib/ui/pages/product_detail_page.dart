part of 'pages.dart';

class Reviews {
  String review;
  double rating;
  String name;

  Reviews(this.review, this.rating, this.name);
}

class Type {
  int id;
  String type;

  Type(this.id,this.type);

  static List<Type> getTypes() {
    return <Type>[
      Type(0, 'Sachet')
    ];
  }
}

class ProductDetailPage extends StatefulWidget {
  static const routeName = '/product_detail';

  ProductDetailPage({Key key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorited = true;
  Type _selectedType;
  TextEditingController searchController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  String currentImage;
  String currentTitle;

  final List<Reviews> reviews = [
    Reviews('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 3.5, 'Rizal Hermawan'),
    Reviews('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 4.5, 'Tuan Krab'),
    Reviews('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 5.0, 'Patrick'),
    Reviews('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 4.0, 'SpongeBob'),
  ];

  List<Type> _dataType = Type.getTypes();
  List<DropdownMenuItem<Type>> _dropdownTypeItems;

  @override
  void initState() {
    currentImage = "assets/images/ayam_cabe_ijo.jpg";
    quantityController.text='1';
    _dropdownTypeItems = buildDropdownTypeItems(_dataType);
    _selectedType = _dropdownTypeItems[0].value;
    context.bloc<CartBloc>().add(GetCartData());
    super.initState();
  }

  List<DropdownMenuItem<Type>> buildDropdownTypeItems(List types) {
    List<DropdownMenuItem<Type>> items = List();
    for (Type type in types) {
      items.add(
        DropdownMenuItem(
          value: type,
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 60.82,
            child: Text(
              type.type,
              overflow: TextOverflow.ellipsis,
            )
          ),
        ),
      );
    }
    return items;
  }

  _onChangeDropdownTypeItem(Type selectedType) {
    setState(() {
      _selectedType = selectedType;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final ScreenArgumentsModel args = ModalRoute.of(context).settings.arguments;
    currentTitle =args.product.pdName;

    double paddingBottomAction = SizeConfig.safeBlockHorizontal * 3.2;
    
    double mainContainerImageProduct;
    double titleYellowContainer;
    double topMarginHintText;
    if (MediaQuery.of(context).size.width > 700) {
      mainContainerImageProduct = (MediaQuery.of(context).size.width/100)*60;
      titleYellowContainer = (MediaQuery.of(context).size.width/100)*38;
      topMarginHintText = 4.0;
    }
    else {
      mainContainerImageProduct = (MediaQuery.of(context).size.width/100)*80;
      titleYellowContainer = (MediaQuery.of(context).size.width/100)*55;
      topMarginHintText = 0;
    }

    return Scaffold(
      appBar: appBarWithSearch(
        SizeConfig.safeBlockVertical * 5.3,
        TextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          decoration: appBarInputDecoration(
            SizeConfig.safeBlockHorizontal * 3.3,
            null,
            SizeConfig.safeBlockHorizontal * 4.86618,
            topMarginHintText
          )
        ),
        <Widget>[
          rIconButton(
            () => Navigator.of(context).pushNamed('/scan'),
            Icon(
              RizalIcons.scan,
              size: SizeConfig.safeBlockHorizontal * 5.8394,
            )
          ),
          rIconButtonWithBadges(
            null,
            Icon(
              RizalIcons.basket,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            ),
            0,
            context
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.near_me,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.share,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            ),
            paddingIcon: EdgeInsets.only(right: 5.0)
          ),
        ],
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (_, state) {
          if(state is CartLoaded) {
            // setState(() {
            //   cartLength = state.cartProducts.cart.length;
            // });
            print(state.cartProducts.toJson());
          }
          else if(state is CartLoading) {
            print("state.loading");
          }
          else if(state is CartError) {
            print(state.message);
          }
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Modals.showImage(
                                        context,
                                        currentTitle,
                                        true,
                                        currentImage,
                                        SizeConfig.safeBlockHorizontal * 4.86618,
                                        SizeConfig.safeBlockHorizontal * 5.5
                                      );
                                    },
                                    child: Container(
                                      width: mainContainerImageProduct,
                                      height: SizeConfig.safeBlockVertical * 22.424,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(currentImage),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isFavorited=!isFavorited;
                                                  });
                                                },
                                                child: Icon(
                                                  !isFavorited ? Icons.bookmark : Icons.bookmark_border,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Modals.showImage(
                                                    context,
                                                    currentTitle,
                                                    true,
                                                    currentImage,
                                                    SizeConfig.safeBlockHorizontal * 4.86618,
                                                    SizeConfig.safeBlockHorizontal * 5.5
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.zoom_out_map,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical * 5.849,),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: mainContainerImageProduct,
                                  height: SizeConfig.safeBlockVertical * 5.8,
                                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3.64963503649635),
                                  decoration: BoxDecoration(
                                    color: containerTitleProductDetail
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: SizeConfig.safeBlockVertical * 2.15,),
                                          Text(
                                            "Kategori: ayam, makanan pedas",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontSize: SizeConfig.safeBlockHorizontal * 2.4330900243309
                                           )
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0),
                                            child: RatingBar(
                                              itemSize: 15,
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ignoreGestures: true,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 1,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              '4.5 of 5 (215 Reviews)',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic,
                                                fontSize: SizeConfig.safeBlockHorizontal * 2.18
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 21,
                                child: Container(
                                  width: titleYellowContainer,
                                  height: SizeConfig.safeBlockVertical * 4.15,
                                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3.649635),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC17D1C).withOpacity(0.8)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        currentTitle,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: SizeConfig.safeBlockHorizontal * 4.37956204379562
                                       ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: SizeConfig.safeBlockHorizontal * 19.4,
                              height: SizeConfig.safeBlockVertical * 28.6,
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                children: <Widget>[
                                  imageScrollable(
                                    () => setState(() {
                                      currentImage = "assets/images/ayam_kecombrang.jpg";
                                    }),
                                    SizeConfig.safeBlockHorizontal * 19.46,
                                    SizeConfig.safeBlockVertical * 6,
                                    'assets/images/ayam_kecombrang.jpg'
                                  ),
                                  imageScrollable(
                                    () => setState(() {
                                      currentImage = "assets/images/ayam_rica.jpg";
                                    }),
                                    SizeConfig.safeBlockHorizontal * 19.46,
                                    SizeConfig.safeBlockVertical * 6,
                                    'assets/images/ayam_rica.jpg'
                                  ),
                                  imageScrollable(
                                    () => setState(() {
                                      currentImage = "assets/images/ayam_cabe_ijo.jpg";
                                    }),
                                    SizeConfig.safeBlockHorizontal * 19.46,
                                    SizeConfig.safeBlockVertical * 6,
                                    'assets/images/ayam_cabe_ijo.jpg'
                                  ),
                                  imageScrollable(
                                    () => setState(() {
                                      currentImage = "assets/images/cakalang_woku.jpg";
                                    }),
                                    SizeConfig.safeBlockHorizontal * 19.46,
                                    SizeConfig.safeBlockVertical * 6,
                                    'assets/images/cakalang_woku.jpg'
                                  ),
                                  imageScrollable(
                                    () => setState(() {
                                      currentImage = "assets/images/opor_ayam.jpg";
                                    }),
                                    SizeConfig.safeBlockHorizontal * 19.46,
                                    SizeConfig.safeBlockVertical * 6,
                                    'assets/images/opor_ayam.jpg'
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.grey[300]
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      ExpandableNotifier(
                        initialExpanded: true,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: <Widget>[
                                ScrollOnExpand(
                                  scrollOnExpand: true,
                                  scrollOnCollapse: false,
                                  child: ExpandablePanel(
                                    theme: ExpandableThemeData(
                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: false,
                                    ),
                                    header: Container(
                                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                                      child: Text(
                                        "Product Information",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: SizeConfig.safeBlockHorizontal * 3.89
                                        ),
                                      ),
                                    ),
                                    expanded: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 2.44),
                                          child: Text(
                                            args.product.pdDescription.toString(),
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                          )),
                                      ],
                                    ),
                                    builder: (_, collapsed, expanded) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                        child: Expandable(
                                          collapsed: collapsed,
                                          expanded: expanded,
                                          theme: ExpandableThemeData(crossFadePoint: 0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ),
                      ExpandableNotifier(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: <Widget>[
                                ScrollOnExpand(
                                  scrollOnExpand: true,
                                  scrollOnCollapse: false,
                                  child: ExpandablePanel(
                                    theme: ExpandableThemeData(
                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: false,
                                    ),
                                    header: Container(
                                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.44, vertical: SizeConfig.safeBlockVertical * 1.54),
                                      child: Text(
                                        "Reviews",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: SizeConfig.safeBlockHorizontal * 3.89
                                        ),
                                      ),
                                    ),
                                    expanded: GridView.count(
                                      childAspectRatio: 3/2,
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(0.0),
                                      children: List.generate(4, (i) {
                                        return ListTile(
                                          title: Text(
                                            reviews[i].name,
                                            style: TextStyle(
                                              fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RatingBar(
                                                itemSize: 14,
                                                initialRating: reviews[i].rating,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 1,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              Text(
                                                reviews[i].review,
                                                style: TextStyle(
                                                  fontSize: SizeConfig.safeBlockHorizontal * 2.676,
                                                ),
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          isThreeLine: true,
                                          leading: CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: Colors.transparent,
                                            child: Image.asset(
                                              "assets/images/user_pic.png",
                                              height: SizeConfig.safeBlockVertical * 6.15,
                                              width: SizeConfig.safeBlockHorizontal * 9.75,
                                              alignment: Alignment.center,
                                              fit: BoxFit.fill,
                                            ) 
                                          ),
                                          contentPadding: EdgeInsets.all(3.0),
                                        );
                                      }),
                                    ),
                                    builder: (_, collapsed, expanded) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2.44, right: SizeConfig.safeBlockHorizontal * 2.44, bottom: SizeConfig.safeBlockVertical * 1.54),
                                        child: Expandable(
                                          collapsed: collapsed,
                                          expanded: expanded,
                                          theme: ExpandableThemeData(crossFadePoint: 0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
            rectangleActions(
              SizeConfig.safeBlockVertical * 7.5,
              false,
              <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 2.4,
                    vertical: SizeConfig.safeBlockVertical * 2.1
                  ),
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 11,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: TextFormField(
                              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.2),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none
                              ),
                              controller: quantityController,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: false,
                                signed: true,
                              ),
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  size: 12.0,
                                ),
                                onTap: () {
                                  int currentValue = int.parse(quantityController.text);
                                  setState(() {
                                    currentValue++;
                                    quantityController.text = (currentValue)
                                        .toString(); // incrementing value
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 12.0,
                                ),
                                onTap: int.parse(quantityController.text) > 1 ? () {
                                  int currentValue = int.parse(quantityController.text);
                                  setState(() {
                                    currentValue--;
                                    quantityController.text = (currentValue)
                                        .toString(); // incrementing value
                                  });
                                } : null,
                              ),
                            ),
                          ]
                        )
                      ]
                    )
                  )
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 17.03,
                  height: SizeConfig.safeBlockVertical * 3,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: DropdownButton(
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.9,
                          color: Colors.black
                        ),
                        iconSize: SizeConfig.safeBlockHorizontal * 4.8,
                        isExpanded: true,
                        value: _selectedType,
                        items: _dropdownTypeItems,
                        onChanged: _onChangeDropdownTypeItem,
                      ),
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Rp. 110.000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 3.89
                        ),
                      ),
                      Text(
                        "Hands on: Agent #09",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 2.19
                        ),
                      ),
                    ],
                  ),
                ),
                rButton(
                  BoxDecoration(
                    color: redButtonColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Add to cart',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.6,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  marginButton: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2.19),
                  iconButton: Icon(
                    Icons.add_shopping_cart,
                    size: SizeConfig.safeBlockHorizontal * 4.8,
                    color: Colors.white,
                  ),
                  action: () {
                    context.bloc<CartBloc>().add(AddToCart(
                      product: args.product,
                      quantity: int.parse(quantityController.text)
                    ));
                  }
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              color: containerRedColorInt,
              padding: EdgeInsets.symmetric(horizontal: paddingBottomAction)
            )
          ],
        ),
      ),
    );
  }
}