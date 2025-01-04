import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';

abstract class FavoriteDataSource {
  Future<void> addFavorite(Apod apod);
  Future<void> removeFavorite(Apod apod);
  Future<List<Apod>> getFavorites();
  Future<bool> checkIfIsFavorite(Apod apod);
}
