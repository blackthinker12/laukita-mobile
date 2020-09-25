part of 'widgets.dart';

Widget inputNumber(
  {
    TextEditingController textController,
    Function increase,
    Function decrease,
    double height,
    double borderWidth
  }
) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * 11,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      border: Border.all(
        width: borderWidth,
        color: Colors.grey[300]
      ),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: TextFormField(
              style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.2),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              controller: textController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                child: Icon(
                  Icons.arrow_drop_up,
                  size: 12.0,
                ),
                onTap: increase
              ),
            ),
            Expanded(
              child: InkWell(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 12.0,
                ),
                onTap: decrease,
              ),
            ),
          ]
        )
      ]
    )
  );
}