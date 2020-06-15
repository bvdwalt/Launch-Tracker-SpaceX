import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String loadingMessage;

  LoadingWidget({this.loadingMessage});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(theme.primaryColor),
              semanticsValue: loadingMessage),
          Container(height: 15),
          Text(loadingMessage),
        ]));
  }
}
