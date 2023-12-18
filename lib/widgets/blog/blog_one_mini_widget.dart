import 'package:flutter/material.dart';
import 'package:gen_landings/consts.dart';

class MiniWidget extends StatelessWidget {
  const MiniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('blog/blog_oneOtn.png'));
  }
}

class MiniWidgetBlogOne extends StatelessWidget {
  final double hBlock2lvl = 50;
  final Color mainColor;
  final ThemeType theme;
  const MiniWidgetBlogOne(
      {Key? key, required this.mainColor, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: mainColor,
          height: 100,
          width: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MiniWidgetImg(
                  hBlock2lvl: hBlock2lvl, mainColor: mainColor, theme: theme),
              MiniWidgetImg(
                  hBlock2lvl: hBlock2lvl, mainColor: mainColor, theme: theme),
              MiniWidgetImg(
                  hBlock2lvl: hBlock2lvl, mainColor: mainColor, theme: theme),
            ],
          ),
        )
      ],
    );
  }
}

class MiniWidgetImg extends StatelessWidget {
  final double hBlock2lvl;
  final Color mainColor;
  final ThemeType theme;

  const MiniWidgetImg(
      {Key? key,
      required this.hBlock2lvl,
      required this.mainColor,
      required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme == ThemeType.light
          ? const Color.fromARGB(255, 180, 180, 184)
          : const Color.fromARGB(255, 37, 37, 63),
      height: hBlock2lvl,
      width: hBlock2lvl,
      child: Column(children: [
        Container(
          height: 20,
          width: 50,
          color: theme == ThemeType.light
              ? Colors.white
              : const Color.fromARGB(255, 63, 59, 59),
          alignment: Alignment.topCenter,
          child: const Text("image"),
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5),
            height: 5,
            width: 25,
            color: theme == ThemeType.light
                ? Colors.white
                : const Color.fromARGB(255, 63, 59, 59)),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5),
            height: 5,
            width: 25,
            color: mainColor)
      ]),
    );
  }
}
