import 'package:flutter/material.dart';

abstract class OptionalDialogListener {
  void onPositiveClick();

  void onNegativeClick();
}

//typedef OkDialogListener = void Function();

class AppDialogs {
  static void showOKDialog(BuildContext context, String title, String content) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showAlertDialog(
      BuildContext context,
      String title,
      String content,
      String positiveBtnName,
      String negativeBtnName,
      OptionalDialogListener listener) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(negativeBtnName),
              onPressed: () {
                listener.onNegativeClick();
              },
            ),
            FlatButton(
              child: Text(positiveBtnName),
              onPressed: () {
                listener.onPositiveClick();
              },
            ),
          ],
        );
      },
    );
  }
}
