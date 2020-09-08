part of 'widgets.dart';

Widget imageScrollable(
  Function updateState,
  double width,
  double height,
  String imageUrl
) {
  return GestureDetector(
    onTap: updateState,
    child: Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}