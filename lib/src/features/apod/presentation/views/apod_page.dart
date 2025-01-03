import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/core/routes/routes.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/apod_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/apod_post.dart';
import 'package:flutter_nasa_apod/src/shared/ui/indicator.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ApodPage extends GetView<ApodController> {
  const ApodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nasa APOD'),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRoutes.favorites),
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Container(
        child: controller.obx(
            (_) => SingleChildScrollView(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ApodPost(apod: controller.apod!),
                )),
            onEmpty: Container(), onError: (error) {
          return Text(error ?? '');
        }, onLoading: const Indicator(scale: 1.0, color: Colors.blue)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          );
          controller.getApod(date: date);
        },
        child: const Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
      ),
    );
  }
}
