part of 'widgets.dart';

class TransactionSupplyCard extends StatelessWidget {
  const TransactionSupplyCard({
    Key key,
    @required this.supply,
  }) : super(key: key);

  final TransactionSupplyModel supply;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Container(
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockHorizontal * 34,
                padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54, SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54),
                color: supply.status == 4 ? yellowContainer : Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          convertSupplyStatusString(supply.status),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 2.44,
                            fontWeight: FontWeight.bold,
                            color: convertSupplyStatusColor(
                              supply.status,
                            ),
                          ),
                        ),
                        Text(
                          "04/07/2020",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "RS0123123123",
                      style: TextStyle(
                        fontSize: 8,
                        decoration: TextDecoration.underline
                      ),
                    ),
                    Text(
                      "HUB-001",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54, SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Shipped by",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                ),
                                Text(
                                  "Delivery date",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                ),
                                Text(
                                  "Received by",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 2.44
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}