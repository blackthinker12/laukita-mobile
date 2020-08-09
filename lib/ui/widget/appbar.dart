part of 'widgets.dart';

AppBar appBarActions(
  bool isHomePage,
  double heightTextBox,
  Widget textField,
  List<Widget> actionsList,
  Widget leading
) {
  return AppBar(
    leading: leading,
    title: Container(
      margin: const EdgeInsets.only(right: 5.0),
      alignment: Alignment.centerLeft,
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

InputDecoration appBarInputDecoration(
  double fontSize,
  Function searchAction
  ) {
  return InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
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