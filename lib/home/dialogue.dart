import 'dart:io';
import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {static Future<DialogAction> yesAbortDialog(BuildContext context,
      String title, String body) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
          title: Text(title), content: Text(body), actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.abort),
              child: const Text('No', style: TextStyle(color: Colors.black87))),
            FlatButton(onPressed: () => exit(0),
              child: const Text('Yes', style: TextStyle(color: Colors.black87)))]);
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}
