import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';

abstract class FavoriteDataSource {
  Future<void> saveFavoriteApod(Apod apod);
  Future<void> removeFavoriteApod(Apod apod);
  Future<List<Apod>> getFavoriteApod();
  Future<bool> isFavoriteApod(Apod apod);
}
