part of 'widgets.dart';

AppBar appBarActions(
  bool isHomePage,
  Function leadingEvents,
  double heightTextBox,
  Widget textField,
  List<Widget> actionsList
) {
  return AppBar(
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(
            isHomePage ? Icons.menu : Icons.arrow_back,
            color: Colors.white
          ),
          onPressed: leadingEvents,
        );
      },
    ),
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