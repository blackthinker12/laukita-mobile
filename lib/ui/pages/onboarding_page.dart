part of 'pages.dart';

class OnBoardingPage extends StatefulWidget {
  static const routeName = '/onboarding';

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Widget _buildImage(String assetName, bool isSvg, bool width) {
    return Align(
      child: isSvg ? SvgPicture.asset(assetName, width: width ? SizeConfig.safeBlockHorizontal * 85.15815 : SizeConfig.safeBlockHorizontal * 80) : Image.asset(assetName, width: width ? SizeConfig.safeBlockHorizontal * 85.15815 : SizeConfig.safeBlockHorizontal * 78),
      alignment: Alignment.bottomCenter,
    );
  }

  _generateToken() {
    context.bloc<TokenBloc>().add(GenerateToken(
      "owner@laukita.com", "owner"
    ));
  }

  _setBoolInstalled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('installed', true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocListener<TokenBloc, TokenState>(
      listener: (_, state) {
        if(state is TokenLoaded) {
          if (state.token.code == 200) {
            ScreenArgumentsModel argumentsValue = ScreenArgumentsModel(
              token: state.token
            );
            _setBoolInstalled();
            context.bloc<PageBloc>().add(GoToMainPage(argumentsValue: argumentsValue));
          }
          else {
            print('bbbb');
            _generateToken();
          }
        }
        else if (state is TokenError) {
          Flushbar(
            duration: Duration(seconds: 2),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: redButtonColor,
            message: "No Internet Connection",
          )..show(context);
        }
      },
      child: BlocListener<PageBloc, PageState>(
        listener: (_, pageState) {
          if (pageState is OnMainPage) {
            Navigator.of(context).pushReplacementNamed(
              MainPage.routeName,
              arguments: pageState.argumentsValue
            );
          }
        },
        child: IntroductionScreen(
          key: introKey,
          pages: getOnBoardingItems().map((item) => renderPageItem(item)).toList(),
          onDone: () { _generateToken(); },
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: Text(
            'Previous',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.40632
            )
          ),
          next: Text(
            'Next',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.40632
            )
          ),
          done: Text(
            'Finish',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.40632,
              fontWeight: FontWeight.w600
            )
          ),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeColor: primaryColor,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel renderPageItem(OnBoardingModel item) {
    return PageViewModel(
      title: item.title,
      body: item.description,
      image: _buildImage(item.imageUrl, item.isSVG, item.is350),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 5.352798, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.892944),
        descriptionPadding: EdgeInsets.fromLTRB(
          SizeConfig.safeBlockHorizontal * 3.892944,
          0.0,
          SizeConfig.safeBlockHorizontal * 3.892944,
          SizeConfig.safeBlockVertical * 2.461538461
        ),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      )
    );
  }
}