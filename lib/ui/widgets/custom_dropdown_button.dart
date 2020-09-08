part of 'widgets.dart';

Widget customDropdownButton(
  Function onTap,
  String value
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            )
          ),
          SizedBox(width:5.0,),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    ),
  );
}