import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/controllers/apod_controller.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/favorite_icon.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/post_image.dart';
import 'package:flutter_nasa_apod/src/features/apod/presentation/widgets/post_video.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ApodPost extends StatelessWidget {
  const ApodPost({super.key, required this.apod, this.onPressed});

  final Apod apod;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    ApodController controller = Get.find();
    return Card(
      child: Column(
        children: [
          const Gap(16.0),
          apod.mediaType == 'image'
              ? PostImage(imageUrl: apod.url ?? '')
              : apod.mediaType == 'video'
                  ? PostVideo(videoUrl: apod.url ?? '')
                  : const SizedBox.shrink(),
          Wrap(
            runSpacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      apod.title ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => onPressed!(),
                    icon: Obx(() => FavoriteIcon(favorite: controller.apod!.isFavorite!)),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    apod.formatDate,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(apod.explanation ?? '')
            ],
          )
        ],
      ),
    );
  }
}
