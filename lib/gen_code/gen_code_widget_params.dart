Map<String, Map<String, dynamic>> generateParams = {
  "BlogOne": {
    "imports": """import 'blog_one.dart';""",
    "defaultParams": {
      "height": 150,
      "width": 150,
      "shouldRepeat": 3,
      "img": ["hh", 1, 1],
      "category": ["category", "category", "category"],
      "title": ["title", "title", "title"],
      "description": ["desc", "desc", "desc"],
      "name": "BlogOne"
    },
    "archiveFilesNames":["blog_one.dart","body_section.dart"],
    "archiveFiles": [
      """import 'package:flutter/material.dart';
import 'body_section.dart';

class BlogOne extends StatefulWidget {
  const BlogOne({Key? key, required this.widgetsParams}) : super(key: key);
  final dynamic widgetsParams;

  @override
  State<BlogOne> createState() => _BlogOneState();
}

class _BlogOneState extends State<BlogOne> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500, mainAxisSpacing: 8, crossAxisSpacing: 8),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return BodySection(
            title: widget.widgetsParams["title"][index] ?? "title",
            innerText:
                widget.widgetsParams["description"][index] ?? "description",
            widgetHeight: widget.widgetsParams["height"] ?? 0,
            widgetWidth: widget.widgetsParams["width"] ?? 0,
          );
        },
        childCount: widget.widgetsParams["shouldRepeat"],
      ),
    );
  }
}
""",
      """import 'package:flutter/material.dart';
// ignore: must_be_immutable
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
                      image: Image.asset('blog/maxi.jpg').image,
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

"""
    ]
  }
};
