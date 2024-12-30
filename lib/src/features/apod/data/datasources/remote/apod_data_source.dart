import 'package:dio/dio.dart';
import 'package:flutter_nasa_apod/src/core/common/constants/constants.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';

abstract class ApodDataSource {
  Future<Apod> getApod(DateTime? date);
}

class ApodRemoteDataSourceImpl implements ApodDataSource {
  final Dio dio;

  ApodRemoteDataSourceImpl(this.dio);

  @override
  Future<Apod> getApod(DateTime? date) async {
    try {
      final response = await dio.get(
        kBaseUrl,
        queryParameters: {
          'api_key': kApiKey,
          // 'date': date.toIso8601String().split('T').first,
        },
      );

      if (response.statusCode == 200) {
        return Apod.fromJson(response.data);
      } else {
        throw Exception('Error'); // return null; //ServerFailure('Failed to fetch APOD');
      }
    } on DioException catch (e, s) {
      // log(
      //   'Erro ao conectar à API: ${e.response?.statusCode}',
      //   error: e,
      //   stackTrace: s,
      // );
      throw e;
      // throw ServerFailure('Erro ao conectar à API: ${e.response?.statusCode}');
    }
  }
}
