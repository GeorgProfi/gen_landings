import 'package:flutter/material.dart';
import 'body_section.dart';

class BlogOne extends StatefulWidget {
  BlogOne({Key? key, required this.pageTitle, required this.widgetsParams})
      : super(key: key);
  final List<BodySection> widgetsParams;
  final String pageTitle;
  String code = "";
  @override
  State<BlogOne> createState() => _BlogOneState();
}

class _BlogOneState extends State<BlogOne> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: widget.widgetsParams.length,
          itemBuilder: (context, index) {
            return widget.widgetsParams[index];
          }),
    );
  }
}

