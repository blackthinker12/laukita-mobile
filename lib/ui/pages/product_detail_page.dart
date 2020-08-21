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
  String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

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
    currentTitle = "Ayam Cabe Ijo";
    quantityController.text='1';
    _dropdownTypeItems = buildDropdownTypeItems(_dataType);
    _selectedType = _dropdownTypeItems[0].value;
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

  onChangeDropdownTypeItem(Type selectedType) {
    setState(() {
      _selectedType = selectedType;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    double paddingBottomAction;
    if (MediaQuery.of(context).size.width <= 375) {
      paddingBottomAction = 1;
    } else {
      paddingBottomAction = SizeConfig.safeBlockHorizontal * 3.2;
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
            SizeConfig.safeBlockHorizontal * 4.86618
          )
        ),
        <Widget>[
          rIconButton(
            () => Navigator.pushNamed(context, '/scan'),
            Icon(
              RizalIcons.scan,
              size: SizeConfig.safeBlockHorizontal * 5.8394,
            )
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.basket,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
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
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: Column(
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
                                      SizeConfig.safeBlockHorizontal * 8.51581
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width-80,
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
                                                isFavorited ? Icons.bookmark : Icons.bookmark_border,
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
                                                  SizeConfig.safeBlockHorizontal * 8.51581
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
                                SizedBox(height: SizeConfig.safeBlockVertical * 6.15,),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width-80,
                                height: SizeConfig.safeBlockVertical * 6.46,
                                padding: EdgeInsets.only(left: 15.0),
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
                                            fontSize: SizeConfig.safeBlockHorizontal * 2.919
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
                              bottom: 24,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2,
                                height: SizeConfig.safeBlockVertical * 4.15,
                                padding: EdgeInsets.only(left: 15.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFC17D1C).withOpacity(0.8)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      currentTitle,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.safeBlockHorizontal * 3.89
                                     )
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
                            height: SizeConfig.safeBlockVertical * 28.7,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                imageScrollable(
                                  () => setState(() {
                                    currentImage = "assets/images/ayam_kecombrang.jpg";
                                    currentTitle = "Ayam Kecombrang";
                                  }),
                                  SizeConfig.safeBlockHorizontal * 19.46,
                                  SizeConfig.safeBlockVertical * 6,
                                  'assets/images/ayam_kecombrang.jpg'
                                ),
                                imageScrollable(
                                  () => setState(() {
                                    currentImage = "assets/images/ayam_rica.jpg";
                                    currentTitle = "Ayam Rica";
                                  }),
                                  SizeConfig.safeBlockHorizontal * 19.46,
                                  SizeConfig.safeBlockVertical * 6,
                                  'assets/images/ayam_rica.jpg'
                                ),
                                imageScrollable(
                                  () => setState(() {
                                    currentImage = "assets/images/ayam_cabe_ijo.jpg";
                                    currentTitle = "Ayam Cabe Ijo";
                                  }),
                                  SizeConfig.safeBlockHorizontal * 19.46,
                                  SizeConfig.safeBlockVertical * 6,
                                  'assets/images/ayam_cabe_ijo.jpg'
                                ),
                                imageScrollable(
                                  () => setState(() {
                                    currentImage = "assets/images/cakalang_woku.jpg";
                                    currentTitle = "Cakalang Woku";
                                  }),
                                  SizeConfig.safeBlockHorizontal * 19.46,
                                  SizeConfig.safeBlockVertical * 6,
                                  'assets/images/cakalang_woku.jpg'
                                ),
                                imageScrollable(
                                  () => setState(() {
                                    currentImage = "assets/images/opor_ayam.jpg";
                                    currentTitle = "Opor Ayam";
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
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: <Widget>[
                              ScrollOnExpand(
                                scrollOnExpand: true,
                                scrollOnCollapse: true,
                                child: ExpandablePanel(
                                  theme: ExpandableThemeData(
                                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                                    tapBodyToCollapse: false,
                                  ),
                                  header: Container(
                                    padding: EdgeInsets.all(10),
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
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          loremIpsum,
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
                                    padding: EdgeInsets.all(10),
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
                                              itemSize: 15,
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
                  vertical: SizeConfig.safeBlockVertical * 2.16
                ),
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 17.03,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 2.4,
                        margin: EdgeInsets.only(right: 4),
                        child: GestureDetector(
                          child: Icon(
                            Icons.remove,
                            size: 10,
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
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 6.56,
                        child: Center(
                          child: TextFormField(
                            style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 2.4),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
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
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: GestureDetector(
                          child: Icon(
                            Icons.add,
                            size: 10,
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
                      onChanged: onChangeDropdownTypeItem,
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                SizeConfig.safeBlockHorizontal * 2.2,
                marginButton: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2.19),
                iconButton: Icon(
                  Icons.add_shopping_cart,
                  size: SizeConfig.safeBlockHorizontal * 4.8,
                  color: Colors.white,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            color: containerRedColorInt,
            padding: EdgeInsets.symmetric(horizontal: paddingBottomAction)
          )
        ],
      ),
    );
  }
}