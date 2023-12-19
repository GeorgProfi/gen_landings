import 'package:flutter/material.dart';
import 'header_widget.dart';

class HeaderOne extends StatefulWidget {
  const HeaderOne({Key? key, required this.widgetsParams}) : super(key: key);
  final dynamic widgetsParams;

  @override
  State<HeaderOne> createState() => _BlogOneState();
}

class _BlogOneState extends State<HeaderOne> {
  @override
  Widget build(BuildContext context) {
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return HeaderWidget(
              title: widget.widgetsParams["title"][index] ?? "title",
              innerText:
                  widget.widgetsParams["description"][index] ?? "description",
              widgetHeight: widget.widgetsParams["height"] ?? 0,
              widgetWidth: widget.widgetsParams["width"] ?? 0,
            );
          },
          childCount: 1,
        ),
      
    );
  }
}
