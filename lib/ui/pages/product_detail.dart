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
      appBar: appBarActions(
        false,
        () => Navigator.pop(context),
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
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/scan');
              },
              child: Icon(Icons.scanner),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.shopping_cart),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.navigation),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.share),
            ),
          ),
        ]
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
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
                                    height: 148,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(currentImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isFavorited=!isFavorited;
                                                });
                                              },
                                              child: Icon(
                                                isFavorited ? Icons.favorite : Icons.favorite_border,
                                                color: Color(0xFFcc0001),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: GestureDetector(
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
                                padding: const EdgeInsets.only(left: 15.0),
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
                                          padding: const EdgeInsets.only(right: 8.0),
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
                                          padding: const EdgeInsets.only(right: 8.0),
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
                                padding: const EdgeInsets.only(left: 15.0),
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
                          width: 80,
                          height: 190,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentImage = "assets/images/ayam_kecombrang.jpg";
                                    currentTitle = "Ayam Kecombrang";
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/ayam_kecombrang.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentImage = "assets/images/ayam_rica.jpg";
                                    currentTitle = "Ayam Rica";
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/ayam_rica.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentImage = "assets/images/ayam_cabe_ijo.jpg";
                                    currentTitle = "Ayam Cabe Ijo";
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/ayam_cabe_ijo.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentImage = "assets/images/cakalang_woku.jpg";
                                    currentTitle = "Cakalang Woku";
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/cakalang_woku.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentImage = "assets/images/opor_ayam.jpg";
                                    currentTitle = "Opor Ayam";
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/opor_ayam.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
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
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: <Widget>[
                              ScrollOnExpand(
                                scrollOnExpand: true,
                                scrollOnCollapse: false,
                                child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
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
                                        theme: const ExpandableThemeData(crossFadePoint: 0),
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
                        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: <Widget>[
                              ScrollOnExpand(
                                scrollOnExpand: true,
                                scrollOnCollapse: false,
                                child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
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
                                    padding: const EdgeInsets.all(0.0),
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
                                        theme: const ExpandableThemeData(crossFadePoint: 0),
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
          Container(
            height: SizeConfig.safeBlockVertical * 7.5,
            decoration: BoxDecoration(
              color: Color(0xFFcc0001),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: InkWell(
                            child: Icon(
                              Icons.remove,
                              size: 15,
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
                        Expanded(
                          child: TextFormField(
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
                        Container(
                          margin: EdgeInsets.only(right: 4),
                          child: InkWell(
                            child: Icon(
                              Icons.add,
                              size: 15,
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
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 4.0),
                  width: 100.0,
                  height: 27.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: _selectedType,
                      items: _dropdownTypeItems,
                      onChanged: onChangeDropdownTypeItem,
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7.0),
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
                Container(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                  margin: const EdgeInsets.only(right: 9.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF9E0505),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 1.21,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 2.2,
                      ),
                    ]),
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}