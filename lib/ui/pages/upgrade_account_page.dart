part of 'pages.dart';

class UpgradeAccountPage extends StatefulWidget {
  @override
  _UpgradeAccountPageState createState() => _UpgradeAccountPageState();
}

class _UpgradeAccountPageState extends State<UpgradeAccountPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _inputAddress() {
    return Theme(
      data: textBoxTheme(),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        controller: addressController,
        decoration: InputDecoration( 
          labelText: "Address",
          hintText: "Address"
        ),
      ),
    );
  }

  Widget _inputPhoneNumber() {
    return Theme(
      data: textBoxTheme(),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        controller: addressController,
        decoration: InputDecoration( 
          labelText: "Phone Number",
          hintText: "Phone Number"
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rPreferredSizeButton(
          BoxDecoration(
            color: greenButtonColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          SizeConfig.safeBlockHorizontal * 1.21,
          'Connect to your Instagram',
          TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          SizeConfig.safeBlockHorizontal * 2.2,
          null,
          image: 'assets/images/instagram.png',
          widthImage: 24,
          widthButton: SizeConfig.safeBlockHorizontal * 60,
        ),
        rPreferredSizeButton(
          BoxDecoration(
            color: redButtonColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          SizeConfig.safeBlockHorizontal * 1.21,
          'Finish',
          TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          SizeConfig.safeBlockHorizontal * 2.2,
          null,
          iconButton: Icon(
            Icons.done,
            size: SizeConfig.safeBlockHorizontal * 3.6496,
            color: Colors.white,
          ),
          widthButton: SizeConfig.safeBlockHorizontal * 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Referral Registration'),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  SizeConfig.safeBlockHorizontal * 4.866,
                  MediaQuery.of(context).size.height/4,
                  SizeConfig.safeBlockHorizontal * 4.866,
                  SizeConfig.safeBlockVertical * 0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _inputAddress(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                    _inputPhoneNumber(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                    _submitButton()
                  ]
                )
              )
            ),
          )
        ]
      )
    );
  }
}