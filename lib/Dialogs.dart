import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogActiion { ok }

class Dialogs {
  static Future<DialogActiion> yesAbort(
    BuildContext context,
    String title,
    String body,
  ) async {
    final dialogActiion = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: TextStyle(color: Colors.blue)),
            content: Text(body, style: TextStyle(color: Colors.blue)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogActiion.ok);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          );
        });
    return (dialogActiion != null) ? dialogActiion : DialogActiion.ok;
  }
}
