part of 'widgets.dart';

Widget shadowImage(
  { 
    String image,
    double width,
    double height,
  }
) {
  return Card(
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        3,
      ),
    ),
    elevation: 8,
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: .5,
        color: Colors.grey,
      )),
      padding: EdgeInsets.all(2),
      width: width,
      height: height,
      child: Image.network(image),
    ),
  );
}