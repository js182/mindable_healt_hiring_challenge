import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindable_healt_hiring_challenge/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  runApp(const App());
}
