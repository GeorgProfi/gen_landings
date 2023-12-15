import 'package:flutter/material.dart';

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
  const MiniWidgetBlogOne({Key? key, required this.mainColor}) : super(key: key);

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
              MiniWidgetImg(hBlock2lvl: hBlock2lvl, mainColor: mainColor),
              MiniWidgetImg(hBlock2lvl: hBlock2lvl, mainColor: mainColor),
              MiniWidgetImg(hBlock2lvl: hBlock2lvl, mainColor: mainColor),
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
  const MiniWidgetImg({Key? key, required this.hBlock2lvl, required this.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 180, 180, 184),
      height: hBlock2lvl,
      width: hBlock2lvl,
      child: Column(children: [
        Container(
          height: 20,
          width: 50,
          color: Colors.white,
          alignment: Alignment.topCenter,
          child: const Text("image"),
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 5),
            height: 5,
            width: 25,
            color: Colors.white),
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
