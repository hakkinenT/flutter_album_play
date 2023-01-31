import 'package:flutter/material.dart';
import 'package:flutter_widget_integration_test/widgets/album_image.dart';

import '../app_color/app_color.dart';
import 'dart:ui' as ui;

class AlbumFilter extends StatefulWidget {
  const AlbumFilter({super.key});

  @override
  State<AlbumFilter> createState() => _AlbumFilterState();
}

class _AlbumFilterState extends State<AlbumFilter>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FilterTitle(controller: _tabController),
        _FilterContent(controller: _tabController)
      ],
    );
  }
}

class _FilterTitle extends StatelessWidget {
  final TabController controller;
  const _FilterTitle({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
          controller: controller,
          indicator: const UnderlineGradientIndicator(),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.only(bottom: 6),
          labelColor: AppColor.titleColor,
          unselectedLabelColor: AppColor.subtitleColor,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(left: 0, right: 15),
          tabs: const [
            Tab(
              text: "Recommendation",
            ),
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Business",
            ),
            Tab(
              text: "Crypto",
            ),
          ]),
    );
  }
}

class _FilterContent extends StatefulWidget {
  final TabController controller;
  const _FilterContent({required this.controller});

  @override
  State<_FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<_FilterContent> {
  List<String> images = [
    "assets/images/andrea.jpg",
    "assets/images/brian.jpg",
    "assets/images/celine.jpg",
    "assets/images/laura.jpg",
    "assets/images/shakira.jpg",
    "assets/images/whitney.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, top: 20),
      width: double.maxFinite,
      height: 200,
      child: TabBarView(controller: widget.controller, children: [
        ListView.separated(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
                  width: 15,
                ),
            itemBuilder: (_, index) {
              return AlbumImage(
                imageUrl: images[index],
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              );
            }),
        const Text(
          "2",
          style: TextStyle(color: AppColor.titleColor),
        ),
        const Text(
          "3",
          style: TextStyle(color: AppColor.titleColor),
        ),
        const Text(
          "4",
          style: TextStyle(color: AppColor.titleColor),
        ),
      ]),
    );
  }
}

class UnderlineGradientIndicator extends Decoration {
  const UnderlineGradientIndicator() : super();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return const UnderlineGradientIndicatorPainter();
  }
}

class UnderlineGradientIndicatorPainter extends BoxPainter {
  const UnderlineGradientIndicatorPainter() : super();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final bounds = offset & configuration.size!;

    final endOffset =
        Offset(bounds.bottomCenter.dx + 7, bounds.bottomCenter.dy);

    final startGradient =
        Offset(bounds.bottomCenter.dx - 2, bounds.bottomCenter.dy - 2);
    final endGradient =
        Offset(bounds.bottomCenter.dx - 24, bounds.bottomCenter.dy);

    Paint paint = Paint()
      ..strokeWidth = 4
      ..shader = ui.Gradient.linear(startGradient, endGradient, [
        AppColor.secondaryColor,
        AppColor.primaryColor,
      ]);

    canvas.drawLine(bounds.bottomLeft, endOffset, paint);
  }
}
