part of 'widgets.dart';

InputDecoration appBarInputDecoration(fontSize, searchAction) {
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