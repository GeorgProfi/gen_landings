import 'package:flutter/material.dart';
import 'body_section.dart';

class BlogOne extends StatefulWidget {
  const BlogOne(
      {Key? key, required this.pageTitle, required this.widgetsParams})
      : super(key: key);
  final List<BodySection> widgetsParams;
  final String pageTitle;
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
          return widget.widgetsParams[index];
        },
        childCount: widget.widgetsParams.length,
      ),
    );
  }
}
