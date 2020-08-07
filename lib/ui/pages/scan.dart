part of 'pages.dart';

class Scanner extends StatefulWidget {
  Scanner({Key key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  TextEditingController searchController = TextEditingController();
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      "#ff6666", "Cancel", true, ScanMode.BARCODE)
    .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: () => scanBarcodeNormal(),
                child: Text("Start barcode scan")),
            RaisedButton(
                onPressed: () => scanQR(),
                child: Text("Start QR scan")),
            RaisedButton(
                onPressed: () => startBarcodeScanStream(),
                child: Text("Start barcode scan stream")),
            Text('Scan result : $_scanBarcode\n',
                style: TextStyle(fontSize: 20))
          ]),
      ),
    );
  }
}