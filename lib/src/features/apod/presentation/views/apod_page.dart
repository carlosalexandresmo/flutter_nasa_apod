import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/apod_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/apod_post.dart';
import 'package:flutter_nasa_apod/src/shared/ui/Indicator.dart';
import 'package:get/get.dart';

class ApodPage extends GetView<ApodController> {
  const ApodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nasa APOD'),
          actions: [
            IconButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                controller.setFavorite();
              },
              icon: const Icon(Icons.calendar_today),
            )
            // IconButton(
            //   icon: const Icon(Icons.favorite),
            //   onPressed: () {
            //     context.push(AppRoutes.favorite);
            //     // Navigator.pushNamed(context, '/favorites');
            //   },
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: controller.obx(
              (_) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: const ApodPost(),
                  ),
              onEmpty: Container(), onError: (error) {
            return Text(error ?? '');
          }, onLoading: const Indicator(scale: 1.0, color: Colors.blue)),
        ));
  }
}
