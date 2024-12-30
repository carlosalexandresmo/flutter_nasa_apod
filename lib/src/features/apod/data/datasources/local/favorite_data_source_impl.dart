import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/app_box.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/favorite_data_source.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteDataSourceImpl extends FavoriteDataSource {
  static const String favoriteKey = 'favorite';
  final Box apodBox = AppBox.box<Apod>();

  @override
  Future<List<Apod>> getFavoriteApod() async {
    
    // TODO: implement getFavoriteApod
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavoriteApod(Apod apod) async {
    // TODO: implement isFavoriteApod
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavoriteApod(Apod apod) async {
    // await apodBox.
  }

  @override
  Future<void> saveFavoriteApod(Apod apod) async {
    await apodBox.add(apod);
  }
}
