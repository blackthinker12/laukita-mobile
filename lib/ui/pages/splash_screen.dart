part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInstalledValue;

  @override
  void initState() {
    super.initState();
    _checkTheFirstTime();
    _moveScreen();
  }

  void _checkTheFirstTime() async {
    var value = await isInstalled();
    setState(() {
      isInstalledValue = value ?? false;
    });
  }

  void _moveScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      if (isInstalledValue) {
        context.bloc<PageBloc>().add(GoToMainPage());
      } else {
        context.bloc<PageBloc>().add(GoToOnBoardingPage());
      }
    });
  }

  Widget _laukitaSplashScreen() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     stops: [0.1, 0.4, 0.7, 0.9],
        //     colors: [
        //       Color(0xFFE74261),
        //       Color(0xFFff778e),
        //       Color(0xFFffa9be),
        //       Color(0xFFffdbf0),
        //     ],
        //   ),
        // ),
        child: BlocListener<PageBloc, PageState>(
          listener: (_, pageState) {
            if (pageState is OnMainPage) {
              Navigator.of(context).pushReplacementNamed(MainPage.routeName);
            }
            else if (pageState is OnBoardingPageState) {
              Navigator.of(context).pushReplacementNamed(OnBoardingPage.routeName);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.safeBlockVertical * 23.0769230
              ),
              Image.asset(
                "assets/images/laukita512.png",
                alignment: Alignment.center,
                width: SizeConfig.safeBlockHorizontal * 50,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 38.461538461
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'PT LAUKITA BERSAMA INDONESIA',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 2.9197
                  )
                )
              ),
            ],
          ),
        ),
      ), 
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _laukitaSplashScreen();
  }
}