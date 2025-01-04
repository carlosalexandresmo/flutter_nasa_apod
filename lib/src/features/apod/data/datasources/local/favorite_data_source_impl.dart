import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/app_box.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/favorite_data_source.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteDataSourceImpl extends FavoriteDataSource {
  static const String favoriteKey = 'favorite';
  final Box apodBox = AppBox.box<Apod>();

  @override
  Future<List<Apod>> getFavorites() async {
    List<Apod> apods = apodBox.values.toList() as List<Apod>;
    return apods;
  }

  @override
  Future<bool> checkIfIsFavorite(Apod apod) async {
    final favorites = await getFavorites();
    final isFavorite = favorites.any((apod) => apod.url == apod.url);
    return isFavorite;
  }

  @override
  Future<void> removeFavorite(Apod apod) async {
    Apod item = apod;
    List<Apod> favorites = await getFavorites();
    int find = favorites.indexWhere((apod) => apod.url == item.url);
    await apodBox.deleteAt(find);
  }

  @override
  Future<void> addFavorite(Apod apod) async {
    final isAlreadyFavorite = await checkIfIsFavorite(apod);
    if (!isAlreadyFavorite) {
      await apodBox.add(apod);
    } else {
      await removeFavorite(apod);
    }
  }
}
