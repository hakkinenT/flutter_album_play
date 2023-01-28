import 'package:flutter/material.dart';

import '../app_color/app_color.dart';

class Subtitle extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  const Subtitle(
      {super.key, required this.title, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: AppColor.subtitleColor,
            fontSize: fontSize,
            fontWeight: fontWeight));
  }
}
