import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: controller.obx(
        (_) => Container(),
      )),
    );
  }
}
