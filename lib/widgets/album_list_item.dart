import 'package:flutter/material.dart';
import 'package:flutter_widget_integration_test/widgets/subtitle.dart';

import '../app_color/app_color.dart';
import '../model/album.dart';
import '../widgets/title.dart' as w;
import 'album_image.dart';

class AlbumListItem extends StatelessWidget {
  final Album album;
  const AlbumListItem({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ItemSurface(
      child: Row(
        children: [
          AlbumImage(
            imageUrl: album.imageUrl,
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AlbumInformation(album: album),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _ExecutionTimeInformation(album: album),
                  const SizedBox(
                    width: 60,
                  ),
                  const _PlayButton()
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.play_circle,
          size: 40,
          color: AppColor.secondaryColor,
        ));
  }
}

class _ExecutionTimeInformation extends StatelessWidget {
  const _ExecutionTimeInformation({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '12:30',
            style: const TextStyle(
              color: AppColor.subtitleColor,
            ),
            children: [
          const TextSpan(
              text: "/",
              style: TextStyle(
                color: AppColor.subtitleColor,
              )),
          TextSpan(
              text: album.totalTime,
              style: const TextStyle(color: AppColor.secondaryColor))
        ]));
  }
}

class _AlbumImage extends StatelessWidget {
  const _AlbumImage({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        album.imageUrl,
        fit: BoxFit.fill,
        width: 100,
        height: 100,
      ),
    );
  }
}

class _ItemSurface extends StatelessWidget {
  final Widget child;
  const _ItemSurface({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }
}

class _AlbumInformation extends StatelessWidget {
  final Album album;
  const _AlbumInformation({required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        w.Title(title: album.name, fontSize: 17, fontWeight: FontWeight.bold),
        const SizedBox(
          height: 8,
        ),
        Subtitle(
          title: album.artist,
        ),
      ],
    );
  }
}
