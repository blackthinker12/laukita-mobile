part of 'pages.dart';

class OnBoardingPage extends StatefulWidget {
  static const routeName = '/onboarding';

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  InstallationInfoRepositories installInfo = InstallationInfoRepository();

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
            installInfo.save(InstallationInformationModel(true));
            context.bloc<PageBloc>().add(GoToMainPage(argumentsValue: argumentsValue));
          }
          else {
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
            'Skip',
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 3.40632
            )
          ),
          previous: Text(
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
        titleTextStyle: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.892944, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3),
        descriptionPadding: EdgeInsets.fromLTRB(
          SizeConfig.safeBlockHorizontal * 3.892944,
          0.0,
          SizeConfig.safeBlockHorizontal * 3.892944,
          SizeConfig.safeBlockVertical * 2.461538461
        ),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        containerContentPadding: EdgeInsets.only(bottom: 0)
      )
    );
  }
}