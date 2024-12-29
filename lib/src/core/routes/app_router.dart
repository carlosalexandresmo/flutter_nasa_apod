import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/core/routes/routes.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/apod_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/views/apod_page.dart';
import 'package:flutter_nasa_apod/src/features/not_found_page.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = Get.key;
  BuildContext get currentContext => _rootNavigatorKey.currentContext!;

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    // observers: [MyNavigatorObserver()],
    routes: [
      // GoRoute(
      //   name: AppRoutes.splash,
      //   path: '/splash',
      //   builder: (context, state) => const SplashScreen(),
      // ),
      GoRoute(
        name: AppRoutes.apod,
        path: '/apod',
        builder: (context, state) => const ApodPage(),
      ),

      // GoRoute(
      //   name: AppRoutes.splash,
      //   path: '/splash',
      //   pageBuilder: (context, state) {
      //     return const SplashScreen();
      //   },
      //   builder: (context, state) => GetBuilder(
      //     init: SplashController(),
      //     dispose: (state) {
      //       Get.delete<SplashController>();
      //     },
      //     builder: (controller) => const SplashScreen(),
      //   ),
      // ),
      // GoRoute(
      //   name: AppRoutes.login,
      //   path: '/login',
      //   builder: (context, state) => GetBuilder(
      //     init: LoginController(),
      //     dispose: (state) {
      //       Get.delete<LoginController>();
      //     },
      //     builder: (controller) => const LoginScreen(),
      //   ),
      // ),
      // GoRoute(
      //   //tarefas
      //   name: AppRoutes.apod,
      //   path: '/apod',
      //   builder: (context, state) => GetBuilder(
      //     init: ApodController(),
      //     dispose: (state) {
      //       Get.delete<ApodController>();
      //     },
      //     builder: (controller) => const ApodPage(),
      //   ),
      //   // routes: [
      //   //   GoRoute(
      //   //     name: AppRoutes.detail,
      //   //     path: 'tarefa/:id',
      //   //     pageBuilder: (_, state) {
      //   //       final id = state.pathParameters['id']!;
      //   //       return CustomSlideTransition(
      //   //         key: state.pageKey,
      //   //         child: GetBuilder(
      //   //           init: DetailController(id: id),
      //   //           dispose: (state) {
      //   //             Get.delete<DetailController>();
      //   //           },
      //   //           builder: (controller) => const DetailScreen(),
      //   //         ),
      //   //       );
      //   //     },
      //   //     routes: [
      //   //       GoRoute(
      //   //         name: AppRoutes.services,
      //   //         path: 'servicos',
      //   //         pageBuilder: (_, state) {
      //   //           return CustomSlideTransition(
      //   //             child: GetBuilder(
      //   //               init: ServicesController(),
      //   //               dispose: (state) {
      //   //                 Get.delete<ServicesController>();
      //   //               },
      //   //               builder: (controller) => const ServicesScreen(),
      //   //             ),
      //   //           );
      //   //         },
      //   //       ),
      //   //       GoRoute(
      //   //           name: AppRoutes.attendance,
      //   //           path: 'atendimento',
      //   //           pageBuilder: (_, state) {
      //   //             return CustomSlideTransition(
      //   //               child: GetBuilder(
      //   //                 init: RegisterAttendanceController(),
      //   //                 dispose: (state) {
      //   //                   Get.delete<RegisterAttendanceController>();
      //   //                 },
      //   //                 builder: (controller) =>
      //   //                     const RegisterAttendanceScreen(),
      //   //               ),
      //   //             );
      //   //           },
      //   //           routes: [
      //   //             GoRoute(
      //   //               name: AppRoutes.attachment,
      //   //               path: 'anexo',
      //   //               builder: (context, state) => GetBuilder(
      //   //                 init: AttachmentController(),
      //   //                 dispose: (state) {
      //   //                   Get.delete<AttachmentController>();
      //   //                 },
      //   //                 builder: (controller) => const AttachmentScreen(),
      //   //               ),
      //   //             ),
      //   //           ]),
      //   //            GoRoute(
      //   //         name: AppRoutes.shutdown,
      //   //         path: 'fechamento',
      //   //         pageBuilder: (_, state) {
      //   //           return CustomSlideTransition(
      //   //             child: GetBuilder(
      //   //               init: ShutdownController(),
      //   //               dispose: (state) {
      //   //                 Get.delete<ShutdownController>();
      //   //               },
      //   //               builder: (controller) => const ShutdownScreen(),
      //   //             ),
      //   //           );
      //   //         },
      //   //       ),
      //   //     ],
      //   //   ),
      //   // ]
      // ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
