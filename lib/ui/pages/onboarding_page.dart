part of 'pages.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushReplacementNamed(context, '/main');
  }

  Widget _buildImage(String assetName, bool isSvg, bool width) {
    return Align(
      child: isSvg ? SvgPicture.asset(assetName, width: width ? SizeConfig.safeBlockHorizontal * 85.15815 : SizeConfig.safeBlockHorizontal * 80) : Image.asset(assetName, width: width ? SizeConfig.safeBlockHorizontal * 85.15815 : SizeConfig.safeBlockHorizontal * 78),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return IntroductionScreen(
      key: introKey,
      pages: getOnBoardingItems().map((item) => renderPageItem(item)).toList(),
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: primaryColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
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