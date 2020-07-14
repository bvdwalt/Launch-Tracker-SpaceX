import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex_flights/src/ui/common/show_text_dialog.dart';

getDetailWidgetTapForMore(String title, String value, BuildContext context) {
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
          flex: 1,
          child: GestureDetector(
            child: AutoSizeText(
              value ?? '',
              textAlign: TextAlign.right,
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
            onTap: () => showTextDialog(title, value, context),
          ),
        ),
      ],
    );
  }