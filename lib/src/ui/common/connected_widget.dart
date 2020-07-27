import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';

Widget getConnectedWidget() {
  return OfflineBuilder(
    connectivityBuilder: (
      BuildContext context,
      ConnectivityResult connectivity,
      Widget child,
    ) {
      final bool connected = connectivity != ConnectivityResult.none;
      return new Stack(
        fit: StackFit.passthrough,
        children: [
          getDisconnectedOrConnectedIcon(connected),
        ],
      );
    },
    builder: (BuildContext context) {
      return SizedBox.shrink();
    },
  );
}

getDisconnectedOrConnectedIcon(bool connected) {
  return Icon(
    connected ? Icons.cloud : Icons.cloud_off,
    color: connected ? Colors.green[300] : Colors.red[300],
  );
}
