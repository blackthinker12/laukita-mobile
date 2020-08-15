part of 'pages.dart';

class EmailVerificationPage extends StatefulWidget {
  EmailVerificationPage({Key key}) : super(key: key);

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;
  String currentText = "";
  bool hasError = false;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Email Verification')
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Please enter the 4 digit code sent to examp**@*****.com',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      )
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3.5,
                    ),
                    PinCodeTextField(
                      textInputType: TextInputType.number,
                      length: 6,
                      obsecureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        inactiveFillColor: Colors.blueGrey,
                        selectedFillColor: Colors.white30,
                        inactiveColor: Colors.transparent,
                        selectedColor: Colors.black,
                        borderWidth: 0.5,
                        activeColor: Colors.green,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3.5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: rPreferredSizeButton(
                        BoxDecoration(
                          color: redColor,
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
                          size: 15,
                          color: Colors.white,
                        ),
                        widthButton: SizeConfig.safeBlockHorizontal * 20,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0, right: 20.0, top: 5.0, bottom: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                          child: Text("OR")
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 5.0, bottom: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )
                          ),
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        rPreferredSizeButton(
                          BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          SizeConfig.safeBlockHorizontal * 1.21,
                          'Resend Code',
                          TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          SizeConfig.safeBlockHorizontal * 2.2,
                          null,
                          widthButton: SizeConfig.safeBlockHorizontal * 30,
                        ),
                        rPreferredSizeButton(
                          BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          SizeConfig.safeBlockHorizontal * 1.21,
                          'Change Email',
                          TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          SizeConfig.safeBlockHorizontal * 2.2,
                          null,
                          widthButton: SizeConfig.safeBlockHorizontal * 30.6,
                        )
                      ],
                    ),
                    // FloatingActionButton.extended(
                    //   label: Text(
                    //     'Verify',
                    //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                    //   ),
                    //   elevation: 2.0,
                    //   backgroundColor: Theme.of(context).accentColor,
                    //   onPressed: () {
                    //     _formKey.currentState.validate();
                    //     if (currentText.length != 6 || currentText != "123456") {
                    //       errorController.add(ErrorAnimationType.shake); // Triggering error shake animation
                    //       setState(() {
                    //         hasError = true;
                    //       });
                    //     }
                    //     else {
                    //       setState(() {
                    //         hasError = false;
                    //         scaffoldKey.currentState.showSnackBar(SnackBar(
                    //           content: Text("Aye!!"),
                    //           duration: Duration(seconds: 2),
                    //         ));
                    //       });
                    //     }
                    //   }
                    // ),
                  ]
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}