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
      margin: const EdgeInsets.only(right: 2.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: whiteContainer,
        borderRadius: BorderRadius.circular(3.0),
      ),
      height: heightTextBox,
      child: textField,
    ),
    titleSpacing: 0.0,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Row(
          children: actionsList
        ),
      )
    ],
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
  Function searchAction,
  double iconSize
  ) {
  return InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(bottom: 18, left: 4),
    hintText: 'Find Something...',
    hintStyle: TextStyle(
      fontSize: fontSize,
      color: Colors.black87
    ),
    hintMaxLines: 2,
    suffixIcon: IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.black,
        size: iconSize,
      ),
      onPressed: searchAction,
    )
  );
}