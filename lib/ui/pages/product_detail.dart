part of 'pages.dart';

class Reviews {
  String review;
  double rating;
  String name;

  Reviews(this.review, this.rating, this.name);
}

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  TextEditingController searchController = TextEditingController();
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

  @override
  void initState() {
    currentImage = "assets/images/ayam_cabe_ijo.jpg";
    currentTitle = "Ayam Cabe Ijo";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                            Container(
                              width: MediaQuery.of(context).size.width-80,
                              height: 148,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(currentImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 40,)
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
                                tapBodyToCollapse: true,
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
                                tapBodyToCollapse: true,
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
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                children: List.generate(4, (i) {
                                  return ListTile(
                                    title: Text(
                                      reviews[i].name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                        Text(
                                          reviews[i].review,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    isThreeLine: true,
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Colors.transparent,
                                      child: Image.asset(
                                        "assets/images/logo/map-red.png",
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
    );
  }
}