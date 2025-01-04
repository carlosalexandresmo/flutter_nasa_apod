import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';

abstract class ApodRepository {
  Future<Either<Exception, Apod>> getApod({DateTime? date});
  Future<Either<Exception, Apod>> saveFavorite(Apod apod);
  Future<Either<Exception, Apod>> removeFavorite(Apod apod);
  Future<Either<Exception, List<Apod>>> getFavorites();
  Future<Either<Exception, bool>> isFavorite(Apod apod);
}