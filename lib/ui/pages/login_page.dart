part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizeConfig.safeBlockVertical * 6,
                  SizeConfig.safeBlockHorizontal * 4.866,
                  SizeConfig.safeBlockVertical * 3.69
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3.5,
                    ),
                    Theme(
                      data: textBoxTheme(),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Username"
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2.461,
                    ),
                    Theme(
                      data: textBoxTheme(),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        obscureText: passwordVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                              color: Colors.black45,
                              size: SizeConfig.blockSizeHorizontal * 4.3795,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            }
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 4,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: rPreferredSizeButton(
                        BoxDecoration(
                          color: redButtonColor,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        SizeConfig.safeBlockHorizontal * 1.21,
                        'Login',
                        TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        SizeConfig.safeBlockHorizontal * 2.2,
                        () {
                          if (_formKey.currentState.validate()) {
                            
                          }
                        },
                        widthButton: SizeConfig.safeBlockHorizontal * 20,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registration');
                          },
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Text("Don't have an account? Sign up"),
                          )
                        )
                      ),
                    )                    
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