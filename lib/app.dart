import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/core/common/constants/constants.dart';
import 'package:flutter_nasa_apod/src/core/routes/app_router.dart';
import 'package:flutter_nasa_apod/src/shared/app_binding.dart';
import 'package:get/get.dart';

class FlutterNasaApod extends StatelessWidget {
  const FlutterNasaApod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: kAppName,
      // theme: AppTheme.theme,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // scaffoldBackgroundColor: BackgroundColor.backgroundColor,
        fontFamily: 'SFProDisplay',
        // appBarTheme: Theme.of(context).appBarTheme.copyWith(
        //   systemOverlayStyle: const SystemUiOverlayStyle(
        //     // statusBarBrightness: Brightness.dark,
        //     statusBarColor: Colors.amber
        //   )
        // ),
      ),
      key: GlobalKey<NavigatorState>(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      // navigatorObservers: [defaultLifecycleObserver],
      initialBinding: AppBinding(),
    );
  }
}
