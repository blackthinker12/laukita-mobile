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
        confirm: Text('Finish'),
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
                      SizeConfig.safeBlockVertical * 1,
                      SizeConfig.safeBlockHorizontal * 4.866,
                      SizeConfig.safeBlockVertical * 3.69
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Step 1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                        ),
                        SizedBox(height: 9,),
                        Divider(height: 1,),
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
                              labelText: "Password",
                              hintText: "Password",
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
                              color: Color(0xFF9E0505),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            SizeConfig.safeBlockHorizontal * 1.21,
                            'Next',
                            TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            SizeConfig.safeBlockHorizontal * 2.2,
                            () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _visibleEmailForm = false;
                                  _visibleUsernameForm = true;
                                });
                              }
                            },
                            iconButton: Icon(
                              Icons.arrow_forward,
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
                                color: Color(0xFF13A7DB),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              SizeConfig.safeBlockHorizontal * 1.21,
                              'Google',
                              TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                              SizeConfig.safeBlockHorizontal * 2.2,
                              () => 
                                setState(() {
                                  _visibleEmailForm = false;
                                  _visibleUsernameForm = true;
                                  isLoginWithSocialMedia = true;
                                }), 
                              image: 'assets/images/google.png',
                              widthImage: 24,
                              widthButton: SizeConfig.safeBlockHorizontal * 30,
                            ),
                            rPreferredSizeButton(
                              BoxDecoration(
                                color: Color(0xFFCC1A7A),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              SizeConfig.safeBlockHorizontal * 1.21,
                              'Instagram',
                              TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                              SizeConfig.safeBlockHorizontal * 2.2,
                              () => 
                                setState(() {
                                  _visibleEmailForm = false;
                                  _visibleUsernameForm = true;
                                  isLoginWithSocialMedia = true;
                                }), 
                              image: 'assets/images/instagram.png',
                              widthImage: 24,
                              widthButton: SizeConfig.safeBlockHorizontal * 30,
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Text("Already have an account? Login"),
                              )
                            )
                          ),
                        )
                      ],
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
                      SizeConfig.safeBlockVertical * 1,
                      SizeConfig.safeBlockHorizontal * 4.866,
                      SizeConfig.safeBlockVertical * 3.69
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Step 2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                        ),
                        SizedBox(height: 9,),
                        Divider(height: 1,),
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
                              labelText: "Username",
                              hintText: "Username"
                            ),
                          ),
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
                              labelText: "Birth Date",
                              hintText: "Birth Date",
                              suffixIcon: Icon(
                                Icons.date_range
                              )
                            ),
                          ),
                        ) : SizedBox(),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2.461,
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 4,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: rPreferredSizeButton(
                            BoxDecoration(
                              color: Color(0xFF9E0505),
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
                            () {
                              if (_formUsernameKey.currentState.validate()) {
                                Navigator.pushNamed(context, '/email_verification');
                              }
                            },
                            iconButton: Icon(
                              Icons.done,
                              size: 15,
                              color: Colors.white,
                            ),
                            widthButton: SizeConfig.safeBlockHorizontal * 20,
                          ),
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