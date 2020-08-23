part of 'pages.dart';

class Product {
  final String name;
  final int quantity;
  final String unit;
  final int price;
  final String imageUrl;
  bool selected;
  Product({
    @required this.name,
    @required this.quantity,
    @required this.unit,
    @required this.price,
    @required this.imageUrl,
    this.selected = false,
  });
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Product> _products = [
    Product(
      name: "Ayam Cabe Ijo",
      quantity: 2,
      unit: "Sachet(s)",
      price: 225000,
      imageUrl:
          "https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/5/14/fc9ed1a1-21f2-4eb6-951b-d5b6938a0ded.jpg",
      selected: false,
    ),
    Product(
      name: "Opor Ayam Kuah Pedas",
      quantity: 3,
      unit: "Tray(s)",
      price: 355000,
      imageUrl:
          "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/5/19/77668127/77668127_586f7088-602b-4614-95b5-cad67a5bd93d_1080_1080",
      selected: true,
    ),
  ];

  String _courierSelected;

  List _listCourier = [
    "Paxel",
    "JNE",
    "JNT",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Shopping Cart',
        <Widget>[
          rIconButton(
            () => Navigator.pushNamed(context, '/scan'),
            Icon(
              Icons.settings,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
            ),
            paddingIcon: EdgeInsets.only(left: 13.0, right: 16.0)
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
            ),
            paddingIcon: EdgeInsets.only(left: 13.0, right: 13.0)
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.notification,
              color: Colors.white,
            ),
            paddingIcon: EdgeInsets.only(left: 10.0, right: 16.0)
          )
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.54, horizontal: SizeConfig.safeBlockHorizontal * 4.86618),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Cart details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.65
                          ),
                        ),
                        underlineButton(
                          () {},
                          "14.300 Points- Change your points",
                          primaryColor,
                          SizeConfig.safeBlockHorizontal * 2.9197,
                          TextAlign.end
                        )
                      ],
                    ),
                    Divider(),
                    for (var product in _products)
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.44,
                                  ),
                                  Container(
                                    child: Checkbox(
                                      value: product.selected,
                                      onChanged: (value) {
                                        setState(() {
                                          product.selected = value;
                                        });
                                      },
                                    ),
                                    width: SizeConfig.safeBlockHorizontal * 4.86618,
                                    height: SizeConfig.safeBlockVertical * 3.07692,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.44,
                                  ),
                                  Card(
                                    elevation: 5,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: .5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Image.network(
                                        product.imageUrl,
                                        width: SizeConfig.safeBlockHorizontal * 9.73236,
                                        height: SizeConfig.safeBlockVertical * 6.153846,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.44,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 3.40632,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      SizedBox(
                                        height: SizeConfig.safeBlockVertical * 0.77
                                      ),
                                      Text(
                                        '${product.quantity} ${product.unit}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            .copyWith(fontSize: SizeConfig.safeBlockHorizontal * 2.44),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                'Rp. ${product.price}',
                                style: TextStyle(
                                  color: redButtonColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3.40632
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 10.9489, SizeConfig.safeBlockVertical * 1.23, 0.0, SizeConfig.safeBlockVertical * 1.23),
                            child: DashSeparator(
                              color: Colors.grey[300],
                              width: SizeConfig.safeBlockHorizontal * 0.48,
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        rPreferredSizeButton(
                          BoxDecoration(
                            color: redButtonColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          SizeConfig.safeBlockHorizontal * 1.21,
                          'Remove',
                          TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                            color: Colors.white
                          ),
                          SizeConfig.safeBlockHorizontal * 2.2,
                          () {},
                          iconButton: Icon(
                            Icons.restore_from_trash,
                            size: SizeConfig.safeBlockHorizontal * 3.6,
                            color: Colors.white,
                          ),
                          widthButton: SizeConfig.safeBlockHorizontal * 27,
                          marginButton: EdgeInsets.zero
                        ),
                        
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 1.5,
                        ),

                        rPreferredSizeButton(
                          BoxDecoration(
                            color: redButtonColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          SizeConfig.safeBlockHorizontal * 1.21,
                          "Add items",
                          TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                            color: Colors.white
                          ),
                          SizeConfig.safeBlockHorizontal * 2.2,
                          () {},
                          iconButton: Icon(
                            Icons.add_shopping_cart,
                            size: SizeConfig.safeBlockHorizontal * 3.6,
                            color: Colors.white,
                          ),
                          widthButton: SizeConfig.safeBlockHorizontal * 27,
                          marginButton: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1.54,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Shipping options",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.65
                          ),
                        ),
                        reverseUnderlineIconButton(
                          "Point Location",
                          Icons.location_on,
                          null,
                          SizeConfig.safeBlockHorizontal * 2.9197,
                          SizeConfig.safeBlockHorizontal * 3,
                          fontColor: primaryColor,
                          iconColor: primaryColor,
                          weight: FontWeight.normal
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Jalan Siliwangi No.27 RT 07 RW 18 Kelurahan Kalijati Kecamatan Bumi Indah Kota Bandung Jawa Barat | Kode Pos 45132",
                            style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontSize: SizeConfig.safeBlockHorizontal * 2.44)
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 24.33,
                          child: underlineButton(
                            null,
                            "edit",
                            primaryColor,
                            SizeConfig.safeBlockHorizontal * 2.9197,
                            TextAlign.end
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Card(
                          elevation: 3,
                          child: Container(
                            color: yellowContainer,
                            alignment: Alignment.centerRight,
                            width: SizeConfig.safeBlockHorizontal * 51.09,
                            padding: EdgeInsets.only(
                              bottom: SizeConfig.safeBlockVertical * 1.54,
                              top: SizeConfig.safeBlockVertical * 1.54,
                              right: SizeConfig.safeBlockHorizontal * 2.44,
                              left: SizeConfig.safeBlockHorizontal * 4.86618,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Choose courier :",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.safeBlockHorizontal * 2.44,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.safeBlockHorizontal * 1.946472, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            width: .2,
                                            color: Colors.grey,
                                          )),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isDense: true,
                                          hint: Text(
                                            "Courier",
                                            style: TextStyle(
                                              fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                                            ),
                                          ),
                                          value: _courierSelected,
                                          items: _listCourier.map((value) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 2.9197),
                                              ),
                                              value: value,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _courierSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.safeBlockVertical * 0.77),
                                Text(
                                  "Total Weight : 2 Kilogram(s)",
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal * 2.44,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1.54,
                    ),
                    Text(
                      "Coupon",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.65
                      ),
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(6.5),
                                  border: OutlineInputBorder(),
                                  hintText: "Place your coupon code..",
                                  hintStyle: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal * 3.65
                                  )
                                ),
                              ),
                              SizedBox(height: SizeConfig.safeBlockVertical * 0.77),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  underlineButton(
                                    () {},
                                    "Show your coupons",
                                    primaryColor,
                                    SizeConfig.safeBlockHorizontal * 2.9197,
                                    TextAlign.end
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 2.44),
                        rPreferredSizeButton(
                          BoxDecoration(
                            color: greenButtonColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          SizeConfig.safeBlockHorizontal * 1.21,
                          'Apply',
                          TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                            color: Colors.white
                          ),
                          SizeConfig.safeBlockHorizontal * 2.2,
                          () {},
                          iconButton: Icon(
                            Icons.verified_user,
                            size: SizeConfig.safeBlockHorizontal * 3.6,
                            color: Colors.white,
                          ),
                          widthButton: SizeConfig.safeBlockHorizontal * 23,
                          marginButton: EdgeInsets.zero
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 2.44,
                    ),
                    Text(
                      "Overview",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.65
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total shopping cart (5 items)",
                          style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontSize: SizeConfig.safeBlockHorizontal * 2.44)
                        ),
                        Text(
                          "Rp. 580.000",
                          style: TextStyle(color: redButtonColor, fontWeight: FontWeight.w500,)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total shipping fee",
                          style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontSize: SizeConfig.safeBlockHorizontal * 2.44)
                        ),
                        Text(
                          "Rp. 37.000",
                          style: TextStyle(color: redButtonColor, fontWeight: FontWeight.w500,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Used coupon (code : -)",
                          style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(fontSize: SizeConfig.safeBlockHorizontal * 2.44)
                        ),
                        Text("- 0"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            rectangleActions(
              SizeConfig.safeBlockVertical * 7.5,
              false,
              <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 2.44,
                        decoration: TextDecoration.underline
                      ),
                    ),
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 2.44),
                    Text(
                      "Rp. 617.000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.safeBlockHorizontal * 3.65,
                      ),
                    ),
                  ],
                ),
                rPreferredSizeButton(
                  BoxDecoration(
                    color: redButtonColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Confirm Order',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.65,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  null,
                  iconButton: Icon(
                    Icons.done,
                    size: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white,
                  ),
                  marginButton: EdgeInsets.zero
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              color: containerRedColorInt,
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4.86618)
            )
          ],
        ),
      ),
    );
  }
}