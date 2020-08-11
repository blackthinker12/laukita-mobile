part of 'widgets.dart';

Widget rectangleActions(
  double heightContainer1,
  bool isShadow,
  List<Widget> content,
  {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    int color = 0xFFF05828
  }
) {
  return Container(
    height: heightContainer1,
    decoration: isShadow ? BoxDecoration(
      color: Color(color),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            0.0, // Move to bottom 10 Vertically
          ),
        )
      ],
    ) : BoxDecoration(
      color: Color(color)
    ),
    child: Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: content
    ),
  );
}