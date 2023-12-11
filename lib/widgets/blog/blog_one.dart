import 'package:flutter/material.dart';

class BodySection extends StatelessWidget {
  double maxWidth = 477.33;
  double minWidth = 250;

  double maxHeight = 392;
  double minHeight = 200;

  String title;
  String innerText;
  double widgetWidth;
  double widgetHeight;
  double fontSizeTitle;
  double fontSizeText;

  BodySection(
      {super.key,
      this.title = 'No input title',
      this.innerText = 'No input text',
      this.widgetWidth = 477.33,
      this.widgetHeight = 392,
      this.fontSizeTitle = 9.64,
      this.fontSizeText = 20}) {
    // Check max and min size
    widgetWidth = widgetWidth > maxWidth ? maxWidth : widgetWidth;

    widgetWidth = widgetWidth < minWidth ? minWidth : widgetWidth;

    widgetHeight = widgetHeight > maxHeight ? maxHeight : widgetHeight;

    widgetHeight = widgetHeight < minHeight ? minHeight : widgetHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widgetWidth,
          height: widgetHeight,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0x99E5E7EB)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: widgetWidth,
                  height: widgetHeight,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 2,
                top: 2,
                child: Container(
                  width: widgetWidth,
                  height: widgetHeight * 0.4897,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('img/400x200.jpg').image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: widgetHeight * 0.556,
                child: SizedBox(
                  width: widgetWidth * 0.155,
                  height: widgetHeight * 0.04,
                  child: Text(
                    'CATEGORY',
                    style: TextStyle(
                      color: const Color(0xFF9CA3AF),
                      fontSize: fontSizeTitle,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 1.20,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: widgetHeight * 0.607,
                child: SizedBox(
                  width: widgetWidth * 0.232,
                  height: 28,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF111827),
                      fontSize: fontSizeTitle,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: widgetHeight * 0.721,
                child: SizedBox(
                  width: 387.50,
                  height: 42,
                  child: Text(
                    innerText,
                    style: TextStyle(
                      color: const Color(0xFF4B5563),
                      fontSize: fontSizeText,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: widgetHeight * 0.872,
                child: SizedBox(
                  width: widgetWidth * 0.175,
                  height: 24,
                  child: Text(
                    'Learn More',
                    style: TextStyle(
                      color: const Color(0xFF6366F1),
                      fontSize: widgetHeight * 0.04,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 115.36,
                top: widgetHeight * 0.882,
                child: Container(
                  width: 16,
                  height: 16,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 423.53,
                top: widgetHeight * 0.882,
                child: Container(
                  width: 16,
                  height: 16,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BlogOne extends StatelessWidget {
  const BlogOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BodySection(
                title: "Заголовок 1",
                innerText: "Текст внутри первого блока",
                widgetWidth: 250,
                widgetHeight: 200),
            BodySection(
              title: "Заголовок 2",
              innerText: "Текст внутри второго блока",
              widgetWidth: 625,
              widgetHeight: 500,
            ),
            BodySection(
              title: "Заголовок 3",
              innerText: "Текст внутри третьего блока",
              widgetWidth: 125,
              widgetHeight: 100,
              fontSizeTitle: 1,
            ),
          ]),
    );
  }
}

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
              Container(
                color: const Color.fromARGB(255, 180, 180, 184),
                height: hBlock2lvl,
                width: hBlock2lvl,
                child: Column(children: [
                  Container(
                    height: 20,
                    width: 50,
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: const Text("Image"),
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
              ),
              Container(
                color: const Color.fromARGB(255, 180, 180, 184),
                height: hBlock2lvl,
                width: hBlock2lvl,
                child: Column(children: [
                  Container(
                    height: 20,
                    width: 50,
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: const Text("Image"),
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
              ),
              Container(
                color: const Color.fromARGB(255, 180, 180, 184),
                height: hBlock2lvl,
                width: hBlock2lvl,
                child: Column(children: [
                  Container(
                    height: 20,
                    width: 50,
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: const Text("Image"),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
