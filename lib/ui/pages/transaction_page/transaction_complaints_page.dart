part of '../pages.dart';

class TransactionComplaintsPage extends StatefulWidget {
  @override
  _TransactionComplaintsPageState createState() => _TransactionComplaintsPageState();
}

class _TransactionComplaintsPageState extends State<TransactionComplaintsPage> {
  int _tabIndex = 1;

  void _onTapCategory(int id) {
    setState(() {
      _tabIndex = id;
    });
  }

  List<TransactionComplaintModel> _complaintData = dummyComplaint;

  final _categoryData = [
    {"title": "All", "value": 0, "id": 1},
    {"title": "Open", "value": 1, "id": 2},
    {"title": "On-Process", "value": 2, "id": 3},
    {"title": "Resolved", "value": 3, "id": 4},
    {"title": "On-Delivery", "value": 4, "id": 5},
    {"title": "Received", "value": 5, "id": 6},
    {"title": "Closed", "value": 6, "id": 7},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.1, vertical: 0),
      child: Column(
        children: <Widget>[
          Container(
          height: SizeConfig.safeBlockVertical * 3.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categoryData.length,
              itemBuilder: (context, index) {
                final category = _categoryData[index];
                return customTag(
                  () => _onTapCategory(category["id"]),
                  title: category["title"],
                  selectedIndex: _tabIndex,
                  tabIndex: category["id"]
                );
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1.54,
          ),
          searchProductCard(),
          Expanded(
            child: ListView.builder(
              itemCount: _complaintData.length,
              itemBuilder: (context, i) {
                final complaint = _complaintData[i];
                return TransactionComplaintCard(complaint: complaint);
              }
            ),
          ),
        ]
      )
    );
  }
}