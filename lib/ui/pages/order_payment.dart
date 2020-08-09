part of 'pages.dart';

enum PaymentType { cash, transfer, credit_card }

class OrderPayment extends StatefulWidget {
  @override
  _OrderPaymentState createState() => _OrderPaymentState();
}

class _OrderPaymentState extends State<OrderPayment> {
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
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 9,),
                Divider(height: 1,),
                CheckboxListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    'Use my point rewards [14.300]',
                    style: TextStyle(fontSize: 13),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checked,
                  onChanged: (bool value) {
                    setState(() {
                      _checked = !_checked;
                    });
                  },
                  activeColor: Color(0xFFcc0001),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Color(0xffFBFBEF),
                  ),
                  height: 170,
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
                SizedBox(height: 11,),
                Text(
                  'Overview',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 9,),
                Divider(height: 1,),
                SizedBox(height: 9,),
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
                  padding: const EdgeInsets.only(top:8.0),
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
                  padding: const EdgeInsets.only(top:8.0),
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
                  padding: const EdgeInsets.only(top:8.0),
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
              color: Color(0xFFcc0001),
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
                          fontSize: 18
                        ),
                      ),
                    ),
                  ]
                ),
                rButtonType1(
                  BoxDecoration(
                    color: Color(0xFF9E0505),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  SizeConfig.safeBlockHorizontal * 1.21,
                  'Paynow',
                  TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 2.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  SizeConfig.safeBlockHorizontal * 2.2,
                  marginButton: const EdgeInsets.only(right: 11),
                  iconButton: Icon(
                    Icons.add_shopping_cart,
                    size: 15,
                    color: Colors.white,
                  ),
                  widthButton : SizeConfig.safeBlockHorizontal * 2
                )
              ]
            )
          )
        ],
      )
    );
  }
}