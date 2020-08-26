part of '../pages.dart';

class TransactionSupplyPage extends StatefulWidget {
  @override
  _TransactionSupplyPageState createState() => _TransactionSupplyPageState();
}

class _TransactionSupplyPageState extends State<TransactionSupplyPage> {
  int _tabIndex = 1;

  void _onTapCategory(int id) {
    setState(() {
      _tabIndex = id;
    });
  }

  List<Complaint> _complaintData = dummyComplaint;

  final _categoryData = [
    {"title": "All", "value": 0, "id": 1},
    {"title": "Submit", "value": 1, "id": 2},
    {"title": "Approval", "value": 2, "id": 3},
    {"title": "On-Delivery", "value": 3, "id": 4},
    {"title": "Received", "value": 4, "id": 5},
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _complaintData.length,
          //     itemBuilder: (context, i) {
          //       final complaint = _complaintData[i];
          //       return TransactionComplaintCard(complaint: complaint);
          //     }
          //   ),
          // ),
        ]
      )
    );
  }
}