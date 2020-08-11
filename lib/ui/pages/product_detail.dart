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

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
            width: 250,
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

    return Scaffold(
      appBar: appBarWithSearch(
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
              RizalIcons.basket,
              size: 20,
            )
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.near_me,
              size: 20,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.share,
              size: 20,
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
                                            child: InkWell(
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
                                            child: InkWell(
                                              onTap: () {
                                                Modals.showImage(
                                                  context,
                                                  currentTitle,
                                                  true,
                                                  currentImage,
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
                                SizedBox(height: 40,),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width-80,
                                height: 42,
                                padding: EdgeInsets.only(left: 15.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF900A09)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 14,),
                                        Text(
                                          "Kategori: ayam, makanan pedas",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 11
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
                                              fontSize: 9
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
                                height: 27,
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
                                        fontSize: 16
                                     )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
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
                                        fontSize: 16
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
                                        fontSize: 16
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
                                            fontSize: 14,
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
                                                fontSize: 11,
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
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14),
                child: Container(
                  width: 70.0,
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
                        width: 10,
                        margin: EdgeInsets.only(right: 4),
                        child: InkWell(
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
                        width: 27,
                        child: Center(
                          child: TextFormField(
                            style: TextStyle(fontSize: 10),
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
                        child: InkWell(
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
                width: 70.0,
                height: 20.0,
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
                        fontSize: 12,
                        color: Colors.black
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      value: _selectedType,
                      items: _dropdownTypeItems,
                      onChanged: onChangeDropdownTypeItem,
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rp. 110.000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    Text(
                      "Hands on: Agent #09",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9
                      ),
                    ),
                  ],
                ),
              ),
              rButton(
                BoxDecoration(
                  color: Color(0xFF9E0505),
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
                marginButton: EdgeInsets.only(right: 9.0),
                iconButton: Icon(
                  Icons.add_shopping_cart,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            color: 0xFFcc0001
          )
        ],
      ),
    );
  }
}