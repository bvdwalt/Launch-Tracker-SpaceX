import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showTextDialog(String title, String value, BuildContext context, {double fontSize: 18}) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: <Widget>[
            SingleChildScrollView(
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: fontSize)
              ),
            )
          ],
          contentPadding: EdgeInsets.all(15),
          semanticLabel: title,
          title: Text(title),
        );
      });
}
