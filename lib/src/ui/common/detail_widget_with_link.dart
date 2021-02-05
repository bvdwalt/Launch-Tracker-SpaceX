import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:launch_tracker_spacex/src/ui/common/get_url_with_copy_paste.dart';

getDetailWidgetWithLink(String title, String value, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
          child: Text(
        title,
        textAlign: TextAlign.left,
      )),
      Expanded(
        child: getURLWithCopyPaste(context, value),
      ),
    ],
  );
}
