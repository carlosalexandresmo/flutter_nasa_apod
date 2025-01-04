import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.favorite});
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return favorite
        ? const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 24.0,
          )
        : const Icon(
            Icons.favorite_border,
            size: 24.0,
          );
  }
}
