part of 'widgets.dart';

Widget customTag(
  Function action,
  {
    String title,
    int selectedIndex,
    int tabIndex
  }
) {
  return Container(
    child: InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black26),
          borderRadius: BorderRadius.circular(15),
          color: selectedIndex == tabIndex
              ? redButtonColor
              : Colors.grey[300],
        ),
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2.9197),
        margin: EdgeInsets.only(right: 3),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 2.9197,
              color: selectedIndex == tabIndex
                  ? Colors.white
                  : Colors.grey[700],
            ),
          ),
        ),
      ),
    ),
  );
}