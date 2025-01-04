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
      Apod result = await apodDataSource.getApod(date);
      bool isFavorite = await favoriteDataSource.checkIfIsFavorite(result);
      result.isFavorite = isFavorite;
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<Apod>>> getFavorites() async {
    try {
      List<Apod> apods = await favoriteDataSource.getFavorites();
      return Right(apods);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> isFavorite(Apod apod) async {
    try {
      await favoriteDataSource.checkIfIsFavorite(apod);
      return const Right(false);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Apod>> removeFavorite(Apod apod) async {
    try {
      await favoriteDataSource.removeFavorite(apod);
      return Right(apod);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Apod>> saveFavorite(Apod apod) async {
    try {
      await favoriteDataSource.addFavorite(apod);
      return Right(apod);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
