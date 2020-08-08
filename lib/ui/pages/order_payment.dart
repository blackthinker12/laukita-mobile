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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[

                      ]
                    )
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