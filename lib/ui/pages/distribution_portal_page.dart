part of 'pages.dart';

class DistributionPortalPage extends StatefulWidget {
  DistributionPortalPage({Key key}) : super(key: key);

  @override
  _DistributionPortalPageState createState() => _DistributionPortalPageState();
}

class _DistributionPortalPageState extends State<DistributionPortalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Distribution Portal',
        <Widget>[
          rIconButton(
            () => Navigator.pushNamed(context, '/scan'),
            Icon(
              Icons.settings,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
            ),
            paddingIcon: EdgeInsets.only(left: 13.0, right: 16.0)
          ),
          rIconButton(
            null,
            Icon(
              Icons.email,
              size: SizeConfig.safeBlockHorizontal * 5.352798,
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
      body: null,
    );
  }
}