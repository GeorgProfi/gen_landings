import 'package:flutter/material.dart';
import 'package:gen_landings/consts.dart';

class MiniWidget extends StatelessWidget {
  const MiniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage('blog/blog_oneOtn.png'));
  }
}

class MiniWidgetHeaderOne extends StatelessWidget {
  final double hBlock2lvl = 50;
  final Color mainColor;
  final ThemeType theme;
  const MiniWidgetHeaderOne(
      {Key? key, required this.mainColor, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 224, 224, 224),
      width: 170,
      height: 20,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 57,
          height: 10,
          alignment: Alignment.center,

          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(backgroundColor: mainColor,),  
            SizedBox(width: 2),
            Container(color: mainColor, width: 15, height: 4,),
          ]),
        ),
        Container(
          width: 50,
          height: 10,
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Container(color: mainColor, width: 7, height: 4,),
            Container(color: mainColor, width: 7, height: 4,),
            Container(color: mainColor, width: 7, height: 4,),  
            SizedBox(width: 5,)
            
          ]),
        )
      ]),
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
