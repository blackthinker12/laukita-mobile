part of 'pages.dart';

enum PaymentType { cash, transfer, credit_card }

class OrderPaymentPage extends StatefulWidget {
  @override
  _OrderPaymentPageState createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage> {
  bool _checked = false;

  PaymentType _selected = PaymentType.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Payment'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
              scrollDirection: Axis.vertical,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.893
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 1.38,),
                Divider(height: 1,),
                CheckboxListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    'Use my point rewards [14.300]',
                    style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.40633),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checked,
                  onChanged: (bool value) {
                    setState(() {
                      _checked = !_checked;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: yellowContainer
                  ),
                  height: SizeConfig.safeBlockVertical * 26.15,
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text('Cash'),
                        value: PaymentType.cash,
                        groupValue: _selected,
                        onChanged: (PaymentType value) {
                          setState(() { _selected = value; });
                        },
                      ),
                      RadioListTile(
                        title: Text('Transfer'),
                        value: PaymentType.transfer,
                        groupValue: _selected,
                        onChanged: (PaymentType value) {
                          setState(() { _selected = value; });
                        },
                      ),
                      RadioListTile(
                        title: Text('Credit Card'),
                        value: PaymentType.credit_card,
                        groupValue: _selected,
                        onChanged: (PaymentType value) {
                          setState(() { _selected = value; });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 1.69,),
                Text(
                  'Overview',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.893
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 1.38,),
                Divider(height: 1,),
                SizedBox(height: SizeConfig.safeBlockVertical * 1.38,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Shopping cart (5 items)',
                      style: TextStyle(
                        color: Colors.grey, 
                      ),
                    ),
                    Text(
                      '580.000',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
                Padding(
                  padding: EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Shipping fee (2 kgs)',
                        style: TextStyle(
                          color: Colors.grey, 
                        ),
                      ),
                      Text(
                        '37.000',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Used Coupon (code: -)',
                        style: TextStyle(
                          color: Colors.grey, 
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Payment Fee - Credit Card',
                        style: TextStyle(
                          color: Colors.grey, 
                        ),
                      ),
                      Text(
                        '13.000',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ]
                  ),
                )
              ],
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 7.5,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Total: ',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Rp. 630.000,-',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.38
                        ),
                      ),
                    ),
                  ]
                ),
                rButton(
                  BoxDecoration(
                    color: redButtonColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Pay now',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  marginButton: EdgeInsets.only(right: 11),
                  iconButton: Icon(
                    Icons.add_shopping_cart,
                    size: SizeConfig.safeBlockHorizontal * 3.6496,
                    color: Colors.white,
                  )
                )
              ]
            )
          )
        ],
      )
    );
  }
}