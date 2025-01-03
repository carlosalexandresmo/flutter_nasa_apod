import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/core/routes/custom_transition.dart';
import 'package:flutter_nasa_apod/src/core/routes/routes.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/local/favorite_data_source_impl.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/datasources/remote/apod_data_source.dart';
import 'package:flutter_nasa_apod/src/features/apod/data/repositories/apod_repository_impl.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/apod_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/favorites_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/views/apod_page.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/views/favorites_page.dart';
import 'package:flutter_nasa_apod/src/features/not_found_page.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = Get.key;
  BuildContext get currentContext => _rootNavigatorKey.currentContext!;

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.apod,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          name: AppRoutes.apod,
          path: '/apod',
          builder: (context, state) => GetBuilder(
                init: ApodController(ApodRepositoryImpl(
                    apodDataSource: ApodRemoteDataSourceImpl(Dio()),
                    favoriteDataSource: FavoriteDataSourceImpl())),
                dispose: (state) {
                  Get.delete<ApodController>();
                },
                builder: (controller) => const ApodPage(),
              ),
          routes: [
            GoRoute(
              name: AppRoutes.favorites,
              path: 'favorites',
              pageBuilder: (_, state) {
                return CustomSlideTransition(
                  child: GetBuilder(
                    init: FavoritesController(),
                    dispose: (state) {
                      Get.delete<FavoritesController>();
                    },
                    builder: (controller) => const FavoritesPage(),
                  ),
                );
              },
            ),
          ]),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
