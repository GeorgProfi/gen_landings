import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  double maxHeight = 392;
  double minHeight = 10;

  String title;
  String innerText;
  double widgetWidth;
  double widgetHeight;
  double fontSizeTitle;
  double fontSizeText;

  HeaderWidget(
      {super.key,
      this.title = 'No input title',
      this.innerText = 'No input text',
      this.widgetWidth = 47.33,
      this.widgetHeight = 22,
      this.fontSizeTitle = 9.64,
      this.fontSizeText = 20}) {
    // Check max and min size

    widgetHeight = widgetHeight > maxHeight ? maxHeight : widgetHeight;

    widgetHeight = widgetHeight < minHeight ? minHeight : widgetHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 224, 224, 224),
      width: double.infinity,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 400,
          height: 100,
          alignment: Alignment.center,

          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image(image: Image.asset('blog/mini.png').image),
            SizedBox(width: 20),
            Text("Text in title")
          ]),
        ),
        Container(
          width: 500,
          height: 100,
          alignment: Alignment.center,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text("Link First"),
            Text("Link Second"),
            Text("Link Third"),
            Text("Link Fourth"),
            SizedBox(width: 10,)
          ]),
        )
      ]),
    );
  }
}
