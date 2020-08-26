part of '../pages.dart';

class TransactionOrdersPage extends StatefulWidget {
  @override
  _TransactionOrdersPageState createState() => _TransactionOrdersPageState();
}

class _TransactionOrdersPageState extends State<TransactionOrdersPage> {
  int _tabIndex = 1;

  void _onTapCategory(int id) {
    setState(() {
      _tabIndex = id;
    });
  }

  List<Transaction> _transactionData = dummyTransaction;

  final _categoryData = [
    {"title": "All", "value": 0, "id": 1},
    {"title": "Submit", "value": 1, "id": 2},
    {"title": "On-Process", "value": 2, "id": 3},
    {"title": "On-Delivery", "value": 3, "id": 4},
    {"title": "Received", "value": 4, "id": 5},
    {"title": "Closed", "value": 5, "id": 6},
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
            height: SizeConfig.safeBlockVertical,
          ),
          searchProductCard(),
          Expanded(
            child: ListView.builder(
              itemCount: _transactionData.length,
              itemBuilder: (context, i) {
                final transaction = _transactionData[i];
                return TransactionOrdersCard(transaction: transaction);
              }
            ),
          ),
        ],
      )
    );
  }
}