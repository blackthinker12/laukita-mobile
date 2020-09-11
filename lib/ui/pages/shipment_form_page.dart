part of 'pages.dart';

enum ShipmentType { gosend, paxel, others }

class ShipmentFormPage extends StatefulWidget {
  ShipmentFormPage({Key key}) : super(key: key);

  @override
  _ShipmentFormPageState createState() => _ShipmentFormPageState();
}

class _ShipmentFormPageState extends State<ShipmentFormPage> {
  TextEditingController _searchController = TextEditingController();
  ShipmentType _selected = ShipmentType.gosend;
  final List<DropdownMenuItem> items = [];
  List<int> selectedItems = [];
  String selectedValue;
  final String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(
            DropdownMenuItem(
              child: Text(wordPair),
              value: wordPair,
            )
          );
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Form'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                SizeConfig.safeBlockHorizontal * 4.866,
                SizeConfig.safeBlockVertical * 2,
                SizeConfig.safeBlockHorizontal * 4.866,
                SizeConfig.safeBlockVertical * 3.69
              ),
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note,
                      size: 16
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Select Order',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 8.0),
                  child: SearchableDropdown.single(
                    items: items,
                    value: selectedValue,
                    hint: "Select one",
                    iconSize: 18,
                    searchHint: null,
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        selectedValue = value;
                      });
                    },
                    dialogBox: true,
                    isExpanded: true,
                  ),
                ),
                Divider(height: 1),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping,
                      size: 16
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Courier',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: ShipmentType.gosend,
                        groupValue: _selected,
                        onChanged: (value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Gosend',
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: ShipmentType.paxel,
                        groupValue: _selected,
                        onChanged: (value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Paxel',
                        ),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: ShipmentType.others,
                        groupValue: _selected,
                        onChanged: (value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Others',
                        ),
                      ),
                    ]
                  ),
                ),
                Divider(height: 1),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Icon(
                //       Icons.monetization_on,
                //       size: 16
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(left: 12.0),
                //       child: Text(
                //         'Delivery Cost',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold
                //         )
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 28.0, top: 10.0),
                //   child: Text('Rp. 10.000', style: TextStyle(color: redButtonColor)),
                // ),
                // SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 16
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Delivery Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 10.0),
                  child: Text('Kamboja Townhouse NO. 8R, Jl Kamboja Pejaten Barat II Jakarta Selatan'),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.contact_phone,
                      size: 16
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 28.0),
                  child: Text('0899848811'),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note,
                      size: 16
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Order Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 28.0),
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.black26, width: 1, style: BorderStyle.solid),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('No'),
                              )
                            )
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('Product'),
                              )
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('Qty'),
                              )
                            )
                          )
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('1'),
                              )
                            )
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text('Ayam Cabe Ijo')
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text('2')
                            )
                          ),
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('2'),
                              )
                            )
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text('Ayam Rica')
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text('1')
                            )
                          ),
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('3'),
                              )
                            )
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text('Cakalang Woku')
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text('1')
                            )
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('From: Jl. H. Dhimun II Depok'),
                    Text(
                      'Rp 100.000,-',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: redButtonColor
                      )
                    )
                  ],
                ),
              ],
            )
          ),
          rectangleActions(
            SizeConfig.safeBlockVertical * 7.5,
            false,
            <Widget>[
              rButton(
                BoxDecoration(
                  color: redButtonColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                SizeConfig.safeBlockHorizontal * 1.21,
                'Print Label',
                TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.6,
                  color: Colors.white
                ),
                SizeConfig.safeBlockHorizontal * 2.2,
                marginButton: EdgeInsets.only(right: 9.0),
                iconButton: Icon(
                  Icons.print,
                  size: SizeConfig.safeBlockHorizontal * 4.86618,
                  color: Colors.white,
                ),
              ),
              rButton(
                BoxDecoration(
                  color: redButtonColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                SizeConfig.safeBlockHorizontal * 1.21,
                'Delivery Order',
                TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.6,
                  color: Colors.white
                ),
                SizeConfig.safeBlockHorizontal * 2.2,
                marginButton: EdgeInsets.only(right: 1.0),
                iconButton: Icon(
                  Icons.local_shipping,
                  size: SizeConfig.safeBlockHorizontal * 4.86618,
                  color: Colors.white,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
            color: containerRedColorInt,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3.4)
          ),
        ],
      )
    );
  }
}