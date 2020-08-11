part of 'widgets.dart';

AppBar appBarWithSearch(
  double heightTextBox,
  Widget textField,
  List<Widget> actionsList,
  Widget leading
) {
  return AppBar(
    leading: leading,
    title: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(3.0),
      ),
      height: heightTextBox,
      child: textField,
    ),
    titleSpacing: 0.0,
    actions: actionsList,
  );
}

AppBar appBar(
  String title,
  List<Widget> actionsList,
  Widget leading
) {
  return AppBar(
    leading: leading,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white
      ),
    ),
    titleSpacing: 0.0,
    actions: actionsList,
  );
}

InputDecoration appBarInputDecoration(
  double fontSize,
  Function searchAction
  ) {
  return InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(bottom: 18, left: 4),
    hintText: 'Find Something...',
    hintStyle: TextStyle(
      fontSize: fontSize
    ),
    hintMaxLines: 2,
    suffixIcon: IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.black,
        size: 20.0,
      ),
      onPressed: searchAction,
    )
  );
}