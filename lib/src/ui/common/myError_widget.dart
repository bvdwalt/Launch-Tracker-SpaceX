import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;

  MyErrorWidget({this.errorMessage, this.onRetryPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AutoSizeText(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
          FlatButton(
            child: Text('Retry'),
            clipBehavior: Clip.hardEdge,
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
