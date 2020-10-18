part of 'pages.dart';

class CatalogsPage extends StatefulWidget {
  static const routeName = '/catalogs';

  @override
  _CatalogsPageState createState() => _CatalogsPageState();
}

class _CatalogsPageState extends State<CatalogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'Catalogs',
        <Widget>[
          rIconButton(
            () => Navigator.of(context).pushNamed('/scan'),
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
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        })
      ),
    );
  }
}