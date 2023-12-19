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
    return Column(children: [Container(
      
      color: Colors.red,
      width: double.infinity,
      height: 100,
      
    )]);
    
  }
}

