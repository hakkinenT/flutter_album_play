import 'package:flutter/material.dart';

class AlbumImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  const AlbumImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imageUrl,
        fit: fit,
        width: width,
        height: width,
      ),
    );
  }
}
