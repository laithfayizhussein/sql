import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void myAlert(BuildContext context, String title, String desc, String rightT,
    String leftT, VoidCallback rightB, VoidCallback leftB) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        child: Text(
          rightT,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: rightB,
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          leftT,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: leftB,
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
      )
    ],
  ).show();
}
