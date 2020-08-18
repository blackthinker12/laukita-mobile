part of 'pages.dart';

enum ShipmentType { gosend, paxel }

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
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
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
        title: Text('Shipment Form'),
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
                Text(
                  'Select Order'
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SearchableDropdown.single(
                    items: items,
                    value: selectedValue,
                    hint: "Select one",
                    searchHint: null,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    dialogBox:  false,
                    isExpanded: true,
                    menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Text(
                  "Courier",
                ),
                Row(
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
                Row(
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
                Divider(height: 4,),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Text(
                  "Delivery Address",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text(loremIpsum),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Text(
                  "Contact",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text('099848848904949'),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Text(
                  "Order Details",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: whiteContainer,
                      margin: EdgeInsets.only(left: 16.0, top: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product'),
                            SizedBox(height: SizeConfig.safeBlockVertical * 10,),
                          ],
                        ),
                      )
                    ),
                    Card(
                      color: whiteContainer,
                      margin: EdgeInsets.only(left: 16.0, top: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Qty'),
                            SizedBox(height: SizeConfig.safeBlockVertical * 10,),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('From: xxxxxxxxx'),
                    Text('Rp 100.000,-')
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
                'Print Delivery',
                TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.6,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                SizeConfig.safeBlockHorizontal * 2.2,
                marginButton: EdgeInsets.only(right: 9.0),
                iconButton: Icon(
                  Icons.print,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              rButton(
                BoxDecoration(
                  color: redButtonColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                SizeConfig.safeBlockHorizontal * 1.21,
                'Shipment Order',
                TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.6,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                SizeConfig.safeBlockHorizontal * 2.2,
                marginButton: EdgeInsets.only(right: 1.0),
                iconButton: Icon(
                  Icons.local_shipping,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            color: containerRedColorInt,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3.4)
          ),
        ],
      )
    );
  }
}