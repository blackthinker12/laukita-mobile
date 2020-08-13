part of 'pages.dart';

class RegistrationPage extends StatefulWidget {
  final bool isLoginWithSocialMedia;

  RegistrationPage({this.isLoginWithSocialMedia});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formUsernameKey = GlobalKey<FormState>();
  bool _visibleEmailForm;
  bool _visibleUsernameForm;
  DateTime dateOfBirth;
  int _dateOfBirthEpochTime;
  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  bool isLoginWithSocialMedia;

  @override
  void initState() {
    super.initState();
    isLoginWithSocialMedia = widget.isLoginWithSocialMedia;
    _visibleEmailForm = true;
    _visibleUsernameForm = false;
    // ignore: unnecessary_statements
    dateController.text == '';
    dateOfBirth = DateTime.parse(INIT_DATE);
  }

   void _showDateTimePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text('Done'),
        cancel: Text('Cancel'),
      ),
      minDateTime: DateTime.parse(MIN_DATE),
      maxDateTime: DateTime.parse(maxDate),
      initialDateTime: dateOfBirth,
      dateFormat: formatDate,
      locale: _locale,
      onClose: () => debugPrint("----- onClose -----"),
      onCancel: () => debugPrint('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          dateOfBirth = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          dateOfBirth = dateTime;
          dateController.text = "${dateOfBirth.year}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}";
          _dateOfBirthEpochTime = convertToEpochTime(dateController.text);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: _visibleEmailForm,
              child: Form(
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
                          'Registration',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 3.5,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: Color(0xFFff973f),
                            primaryColorDark: Color(0xFFF05828),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Email",
                              hintText: "Email"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.461,
                        ),
                        Theme(
                          data: ThemeData(
                            primaryColor: Color(0xFFff973f),
                            primaryColorDark: Color(0xFFF05828),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Password",
                              hintText: "Password"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.461,
                        ),
                        FloatingActionButton(
                          child: Icon(Icons.arrow_forward),
                          elevation: 2.0,
                          backgroundColor: Theme.of(context).accentColor,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {

                              setState(() {
                                _visibleEmailForm = false;
                                _visibleUsernameForm = true;
                              });
                            }
                          }
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 20.0, top: 5.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )
                              ),
                            ),
                            Text("OR"),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 36,
                                )
                              ),
                            ),
                          ]
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              setState(() {
                                _visibleEmailForm = false;
                                _visibleUsernameForm = true;
                                isLoginWithSocialMedia = true;
                              });
                            }, 
                            padding: EdgeInsets.all(18.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(0xFF6B9EF7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Material(
                                    color: Colors.white,
                                    child: Image.asset(
                                      'assets/images/google.png',
                                      width: 24
                                    ),
                                  ),
                                ),
                                SizedBox(width: 24,),
                                Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.safeBlockHorizontal * 4.3,
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15.0, top: 4.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              setState(() {
                                _visibleEmailForm = false;
                                _visibleUsernameForm = true;
                                isLoginWithSocialMedia = true;
                              });
                            }, 
                            padding: EdgeInsets.all(18.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(0xFFD2136D),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/instagram.png',width: 24),
                                SizedBox(width: 24,),
                                Text(
                                  'Sign up with Instagram',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.safeBlockHorizontal * 4.3,
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ),
                  )
                ),
              ),
          ),
          Visibility(
            visible: _visibleUsernameForm,
              child: Form(
                key: _formUsernameKey,
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
                          'Registration',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 3.5,
                        ),
                        !isLoginWithSocialMedia ? Theme(
                          data: ThemeData(
                            primaryColor: Color(0xFFff973f),
                            primaryColorDark: Color(0xFFF05828),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Name",
                              hintText: "Name"
                            ),
                          ),
                        ) : SizedBox(),
                        !isLoginWithSocialMedia ? SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.461,
                        ) : SizedBox(),
                        !isLoginWithSocialMedia ? GestureDetector(
                          onTap: () => _showDateTimePicker(),
                          child: TextFormField(
                            enabled: false,
                            enableInteractiveSelection: false,
                            controller: dateController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Birth Date",
                              hintText: "Birth Date",
                              suffixIcon: Icon(
                                Icons.date_range
                              )
                            ),
                          ),
                        ) : SizedBox(),
                        !isLoginWithSocialMedia ? SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.461,
                        ) : SizedBox(),
                        Theme(
                          data: ThemeData(
                            primaryColor: Color(0xFFff973f),
                            primaryColorDark: Color(0xFFF05828),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Username",
                              hintText: "Username"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.461,
                        ),
                        FloatingActionButton(
                          child: Icon(Icons.arrow_forward),
                          elevation: 2.0,
                          backgroundColor: Theme.of(context).accentColor,
                          onPressed: () {
                            if (_formUsernameKey.currentState.validate()) {
                              Navigator.pushNamed(context, '/email_verification');
                            }
                          }
                        ),
                      ]
                    )
                  )
                )
            ),
          )
        ],
      ),
    );
  }
}