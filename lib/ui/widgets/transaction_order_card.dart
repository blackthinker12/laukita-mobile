part of 'widgets.dart';

class TransactionOrdersCard extends StatelessWidget {
  TransactionOrdersCard({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final TransactionOrderModel transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                color: transaction.status == 4 ? yellowContainer : Colors.white,
                padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54, SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54),
                width: SizeConfig.safeBlockHorizontal * 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      transaction.date,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 1.946472,
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            convertOrderStatusString(transaction.status),
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 2.44,
                              color: convertOrderStatusColor(
                                transaction.status,
                              ),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            transaction.customerName,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          transaction.status != 1
                            ? Text(
                                'Ship no ${transaction.shippingNumber}',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 1.946472,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            : SizedBox(),
                            Text(
                              'Rp. ${transaction.totalTransaction}',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                                color: redButtonColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              transaction.transactionCode,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 1.946472,
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(width: 1,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54, SizeConfig.safeBlockHorizontal * 2.44, SizeConfig.safeBlockVertical * 1.54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (var product in transaction.product)
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.network(
                                    product.imageUrl,
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 2.44
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      Text(
                                        '${product.quantity} ${product.unit}',
                                        style: TextStyle(
                                          fontSize: SizeConfig.safeBlockHorizontal * 1.946472,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              product != transaction.product.last
                                  ? Divider()
                                  : SizedBox(),
                            ],
                          ),
                        )
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