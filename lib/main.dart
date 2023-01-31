// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_widget_integration_test/app_color/app_color.dart';
import 'package:flutter_widget_integration_test/widgets/album_filter.dart';

import 'widgets/custom_text_field.dart';

import 'widgets/recent_play_session.dart';
import 'widgets/subtitle.dart';
import 'widgets/title.dart' as t;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryVariantColor,
      body: _AppBody(
        child: ListView(
          children: const [
            _ApresentationText(),
            SizedBox(
              height: 10,
            ),
            SearchTextField(),
            SizedBox(
              height: 20,
            ),
            AlbumFilter(),
            SizedBox(
              height: 15,
            ),
            RecentPlaySession()
          ],
        ),
      ),
      bottomNavigationBar: const _AppBottonNavigationBar(),
    );
  }
}

class _ApresentationText extends StatelessWidget {
  const _ApresentationText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        t.Title(
            title: "Hello Diana,", fontSize: 18, fontWeight: FontWeight.bold),
        SizedBox(
          height: 10,
        ),
        Subtitle(
          title: "What you want to hear today?",
        ),
      ],
    );
  }
}

class _AppBottonNavigationBar extends StatelessWidget {
  const _AppBottonNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        backgroundColor: AppColor.primaryVariantColor,
        items: const [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_outlined,
                color: AppColor.secondaryColor,
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.search_outlined,
                color: AppColor.secondaryColor,
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.bookmark_outline,
                color: AppColor.secondaryColor,
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.settings_outlined,
                color: AppColor.secondaryColor,
              )),
        ]);
  }
}

class _AppBody extends StatelessWidget {
  final Widget child;
  const _AppBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height - 100,
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: child,
    ));
  }
}
