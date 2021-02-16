import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_tracker_spacex/src/ui/common/getTextDirection.dart';

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
              valueColor: AlwaysStoppedAnimation(theme.accentColor),
              semanticsValue: Text(
                loadingMessage,
                textDirection: getTextDirection(),
              ).toString()),
          Container(height: 15),
          Text(
            loadingMessage,
            textDirection: getTextDirection(),
          ),
        ],
      ),
    );
  }
}
