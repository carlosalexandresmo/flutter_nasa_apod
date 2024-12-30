import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';

abstract class ApodRepository {
  Future<Either<Exception, Apod>> getApod({DateTime? date});
  // Future<Either<Failure, void>> saveFavorite(Apod apod);
  // Future<Either<Failure, void>> removeFavorite(Apod apod);
  // Future<Either<Failure, List<Apod>>> getFavorites();
  // Future<Either<Failure, bool>> isFavorite(Apod apod);
}