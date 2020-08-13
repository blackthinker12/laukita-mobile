part of 'pages.dart';

class ShipmentFormPage extends StatefulWidget {
  ShipmentFormPage({Key key}) : super(key: key);

  @override
  _ShipmentFormPageState createState() => _ShipmentFormPageState();
}

class _ShipmentFormPageState extends State<ShipmentFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipment Form'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 4.866,
            SizeConfig.safeBlockVertical * 10.76,
            SizeConfig.safeBlockHorizontal * 4.866,
            SizeConfig.safeBlockVertical * 3.69
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

            ]
          )
        )
      )
    );
  }
}