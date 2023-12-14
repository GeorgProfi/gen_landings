import 'package:flutter/material.dart';

class MiniWidget extends StatelessWidget {
  const MiniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('blog/blog_oneOtn.png'));
  }
}

class MiniWidgetBlogOne extends StatelessWidget {
  double hBlock2lvl = 50;
  Color mainColor;
  MiniWidgetBlogOne({Key? key, required this.mainColor}) : super(key: key);

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
              miniWidgetImg(hBlock2lvl: hBlock2lvl, mainColor: mainColor),
              miniWidgetImg(hBlock2lvl: hBlock2lvl, mainColor: mainColor),
              miniWidgetImg(hBlock2lvl: hBlock2lvl, mainColor: mainColor),
            ],
          ),
        )
      ],
    );
  }
}

class miniWidgetImg extends StatelessWidget {
  final double hBlock2lvl;
  final Color mainColor;
  miniWidgetImg({Key? key, required this.hBlock2lvl, required this.mainColor})
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
