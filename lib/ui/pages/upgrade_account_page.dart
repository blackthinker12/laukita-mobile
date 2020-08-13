part of 'pages.dart';

class UpgradeAccountPage extends StatefulWidget {
  @override
  _UpgradeAccountPageState createState() => _UpgradeAccountPageState();
}

class _UpgradeAccountPageState extends State<UpgradeAccountPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Widget _connectInstagram() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Instagram',
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 3.0,
            onPressed: () {

            }, 
            padding: EdgeInsets.all(12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Color(0xFFD2136D),
            child: Text(
              'Connect to Your Instagram',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4.3,
              )
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Address',
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60.0,
          child: TextField(
            controller: addressController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14.0),
              border: InputBorder.none,
              hintText: 'Enter your address',
              hintStyle: TextStyle(color: Colors.black45),
              prefixIcon: Icon(
                Icons.location_on, 
                color: Colors.black45,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60.0,
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.smartphone,
                color: Colors.black45,
              ),
              hintText: 'Enter your phone number',
              hintStyle: TextStyle(color: Colors.black45)
            ),
          ),
        ),
      ],
    );
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 3.0,
        onPressed: () {

        }, 
        padding: EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Theme.of(context).accentColor,
        child: Text(
          'Upgrade',
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * 4.3,
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Upgrade Account',
        <Widget>[
          rIconButton(
            () => Navigator.pushNamed(context, '/scan'),
            Icon(
              Icons.settings,
              size: 24,
            ),
            paddingIcon: EdgeInsets.only(left: 13.0, right: 16.0)
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: 24,
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
                  SizeConfig.safeBlockVertical * 10.76,
                  SizeConfig.safeBlockHorizontal * 4.866,
                  SizeConfig.safeBlockVertical * 3.69
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Upgrade your account',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3.5,
                    ),
                    _connectInstagram(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                    _inputAddress(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                    _inputPhoneNumber(),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2.461,),
                    _submitButton()
                  ]
                )
              )
            )
          )
        ]
      )
    );
  }
}