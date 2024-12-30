import 'package:dartz/dartz.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/favorite_data_source.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/remote/apod_data_source.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/repositories/apod_repository.dart';

class ApodRepositoryImpl implements ApodRepository {
  final ApodDataSource apodDataSource;
  final FavoriteDataSource favoriteDataSource;

  ApodRepositoryImpl({
    required this.apodDataSource,
    required this.favoriteDataSource,
  });

  @override
  Future<Either<Exception, Apod>> getApod({DateTime? date}) async {
    try {
      final result = await apodDataSource.getApod(date);
      // final isFavorite = await favoriteDataSource.isFavoriteApod(result);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
