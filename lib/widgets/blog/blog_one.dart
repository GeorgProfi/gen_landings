import 'package:flutter/material.dart';
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
    print(widget.widgetsParams);
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
