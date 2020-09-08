part of 'pages.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
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

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double topMarginHintText;
    if (MediaQuery.of(context).size.width > 700) {
      topMarginHintText = 4.0;
    }
    else {
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
          rIconButton(
            null,
            Icon(
              Icons.settings,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
          ),
          rIconButton(
            null,
            Icon(
              RizalIcons.notification,
              color: Colors.white,
              size: SizeConfig.safeBlockHorizontal * 4.86618,
            )
          )
        ],Builder(
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