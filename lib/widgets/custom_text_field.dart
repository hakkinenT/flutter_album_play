import 'package:flutter/material.dart';

import '../app_color/app_color.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.surface, borderRadius: BorderRadius.circular(10)),
      child: const TextField(
        style: TextStyle(color: AppColor.subtitleColor),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.subtitleColor,
          ),
          suffixIcon: Icon(
            Icons.tune,
            color: AppColor.subtitleColor,
          ),
          contentPadding: EdgeInsets.all(16),
          border: InputBorder.none,
          hintText: "Search Album",
          hintStyle: TextStyle(color: AppColor.subtitleColor),
        ),
      ),
    );
  }
}
