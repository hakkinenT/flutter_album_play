import 'package:flutter/material.dart';
import 'package:flutter_widget_integration_test/app_color/app_color.dart';
import 'package:flutter_widget_integration_test/widgets/album_image.dart';

class StackImage extends StatelessWidget {
  const StackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            const AlbumImage(
                imageUrl: "assets/images/andrea.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover),
            Container(
              margin: const EdgeInsets.only(right: 5, top: 5),
              padding: const EdgeInsets.all(5),
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 136, 33, 177),
                        AppColor.secondaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.mirror,
                      stops: [0.1, 0.6])),
              child: const Center(
                  child: Text(
                'NEW',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class NewStackWidget extends StatelessWidget {
  const NewStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior: Clip
              .none, //! Impede que o elemento que está por cima, seja cortado
          alignment: Alignment.topRight,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 40,
                )),
            const Positioned(
                bottom: 30,
                left: 30,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text("1"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
