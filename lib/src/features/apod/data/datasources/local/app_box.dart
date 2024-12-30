import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class AppBox {
  AppBox._();
  static Future<void> initialize() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    Hive.registerAdapter(ApodAdapter());
    await openBox<bool>();
    await openBox<String>();
    await openBox<Apod>();
  }

  static Future<void> openBox<T>() async {
    await Hive.openBox<T>(T.toString());
  }

  static Box<T> box<T>() {
    return Hive.box<T>(T.toString());
  }
}
