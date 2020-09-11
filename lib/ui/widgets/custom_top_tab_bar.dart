part of 'widgets.dart';

Widget customTopTabBar(
  TabController _tabController,
  int _tabIndex,
  String _tabTitle,
  int _badgesCount,
) {
  return Stack(
    children: <Widget>[
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.2),
          color: _tabController.index == _tabIndex
              ? Colors.white
              : Colors.grey[100],
        ),
        child: Container(
          child: Tab(
            text: _tabTitle,
          ),
        ),
      ),
      _badgesCount > 0
        ? Positioned(
            right: 15,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: redButtonColor,
                borderRadius: BorderRadius.circular(9),
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Center(
                child: Text(
                  _badgesCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ))
        : Positioned(
            right: 10,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(9),
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Center(
                child: Text(
                  _badgesCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
    ],
  );
}