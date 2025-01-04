import 'package:flutter/material.dart';
import 'package:flutter_nasa_apod/src/features/apod/domain/entities/apod.model.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.apod});

  final Apod apod;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: apod.mediaType == 'image' ? const Icon(Icons.image) : const Icon(Icons.video_collection),
      title: Text(apod.title ?? '',),
      subtitle: Text(apod.formatDate),
    );
  }
}