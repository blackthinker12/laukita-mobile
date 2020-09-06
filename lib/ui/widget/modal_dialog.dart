part of 'widgets.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String body,
    bool dismissible
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(DialogAction.abort);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(DialogAction.yes);
              },
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}