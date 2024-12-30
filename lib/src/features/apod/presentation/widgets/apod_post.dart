import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/apod_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/favorite_item.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ApodPost extends StatelessWidget {
  const ApodPost({super.key});

  @override
  Widget build(BuildContext context) {
    ApodController controller = Get.find();
    return Card(
      elevation: 1.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  controller.apod?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Obx(
                  () => FavoriteItem(favorite: controller.favorite),
                ),
              )
            ],
          ),
          const Gap(16.0),
          AspectRatio(
            aspectRatio: 1,
            child: controller.apod != null ? CachedNetworkImage(
              imageUrl: controller.apod!.url!,
              fit: BoxFit.cover,
            ) : const SizedBox.shrink(),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.person),
            title: Text(controller.apod?.copyright ?? ''),
          ),
          Text(controller.apod?.explanation ?? ''),
          IconButton(
            // padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            // constraints: BoxConstraints(),
            onPressed: () => controller.setFavorite(),
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
