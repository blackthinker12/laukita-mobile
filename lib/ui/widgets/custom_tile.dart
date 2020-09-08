part of 'widgets.dart';

Widget customTile(
  EdgeInsets paddingContainer,
  Function onTap,
  IconData icon,
  Color buttonColor,
  {
    String title = "",
    String subtitle = "",
    EdgeInsets paddingIcon = const EdgeInsets.symmetric(horizontal: 5),
    double iconSize = 15,
    double fontSizeTitle,
    double fontSizeSubtitle
  }
) {
  return Container(
    color: buttonColor,
    padding: paddingContainer,
    child: InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: paddingIcon,
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizeTitle,
                    color: Colors.black87
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: fontSizeSubtitle,
                    fontStyle: FontStyle.italic,
                    color: Colors.black45
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}