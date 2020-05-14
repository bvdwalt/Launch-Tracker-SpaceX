import 'package:flutter/material.dart';
import 'package:spacex_flights/service_locator.dart';
import 'package:spacex_flights/src/app.dart';

void main() {
  registerServices();
  runApp(App());
}
