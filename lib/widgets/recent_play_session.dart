import 'package:flutter/material.dart';
import 'package:flutter_widget_integration_test/data.dart';
import 'package:flutter_widget_integration_test/widgets/subtitle.dart';

import 'album_list_item.dart';
import 'title.dart' as t;

class RecentPlaySession extends StatelessWidget {
  const RecentPlaySession({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _RecentPlaySessionTitle(),
        SizedBox(
          height: 16,
        ),
        _RecentPlaySessionBody()
      ],
    );
  }
}

class _RecentPlaySessionBody extends StatelessWidget {
  const _RecentPlaySessionBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          itemBuilder: (_, index) {
            return AlbumListItem(album: recentlyPlay[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(
                height: 5,
              ),
          itemCount: recentlyPlay.length),
    );
  }
}

class _RecentPlaySessionTitle extends StatelessWidget {
  const _RecentPlaySessionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        t.Title(
            title: 'Recently Play', fontSize: 16, fontWeight: FontWeight.w500),
        Spacer(),
        Subtitle(
          title: 'See All',
        )
      ],
    );
  }
}
