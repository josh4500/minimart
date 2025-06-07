import 'package:flutter/material.dart';
import 'package:minimart/presentation.dart' show App;

import 'di.dart';

void main() {
  setupDependencies();
  runApp(const App());
}
