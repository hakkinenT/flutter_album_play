import 'package:flutter/material.dart';

import '../app_color/app_color.dart';

class Title extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  const Title({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: AppColor.titleColor,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
