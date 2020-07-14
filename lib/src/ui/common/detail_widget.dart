import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

getDetailWidget(String title, String value) {
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
            child: AutoSizeText(
          value ?? '',
          textAlign: TextAlign.right,
          maxLines: 2,
        ))
      ]);
}
