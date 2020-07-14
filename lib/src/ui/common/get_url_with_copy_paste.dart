import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex_flights/src/helpers/url_helper.dart';

getURLWithCopyPaste(BuildContext context, String url) {
  return GestureDetector(
    onLongPress: () {
      Clipboard.setData(new ClipboardData(text: url));
      // Scaffold.of(context)
      //     .showSnackBar(SnackBar(content: Text('Copied link: \n${url}')));
    },
    onTap: () {
      launchURL(url);
    },
    child: AutoSizeText(url ?? '',
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.blue),
        maxLines: 2),
  );
}
