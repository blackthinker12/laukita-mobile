part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String username;
  String password;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  void _getToken() async {
    Token token = await getToken();
    setState(() {
      username = token?.username;
      password = token?.password;
    });
  }

  Widget _laukitaSplashScreen() {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/laukita.png",
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ), 
    );
  }

  @override
  Widget build(BuildContext context) {
    var _duration = Duration(seconds: 5);
    Timer(_duration, () => context.bloc<PageBloc>().add(GoToMainPage()));

    return BlocListener<PageBloc, PageState>(
      listener: (_, pageState) {
        if (pageState is OnMainPage) {
          Navigator.of(context).pushNamed('/main');
        }
      },
      child: _laukitaSplashScreen(),
    );
    // return BlocBuilder<PageBloc, PageState>(
    //   builder: (_, pageState) => 
    //     (pageState is OnMainPage) ? Get.to(MainPage())
    //     : _laukitaSplashScreen()
    //   );
  }
}