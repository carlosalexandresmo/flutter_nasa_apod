import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/favorites_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/empty_widget.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/fail_widget.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/favorite_item.dart';
import 'package:flutter_nasa_apod/src/shared/ui/indicator.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: controller.obx(
            (_) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.apods.length,
                  itemBuilder: (context, index) {
                    Apod apod = controller.apods[index];
                    return Dismissible(
                        key: UniqueKey(), 
                        background: Container(color: Colors.red),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          if(direction == DismissDirection.endToStart) {

                          }
                        },
                        child: FavoriteItem(apod: apod));
                  },
                ),
            onEmpty: const Center(
              child: EmptyWidget(),
            ),
            onError: (error) => const FailWidget(),
            onLoading: const Indicator(scale: 1.0, color: Colors.blue)),
      ),
    );
  }
}
