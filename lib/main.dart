import 'package:flutter/material.dart';
import 'service_locator.dart';
import 'src/app.dart';

void main() {
  registerServices();
  runApp(App());
}
