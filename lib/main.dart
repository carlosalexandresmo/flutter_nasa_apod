import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/app.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/app_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBox.initialize();
  runApp(const FlutterNasaApod());
}
