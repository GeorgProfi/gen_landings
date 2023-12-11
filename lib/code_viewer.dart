import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeListViewer extends StatelessWidget {
  final List<String> codeList;

  const CodeListViewer({super.key, required this.codeList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: codeList.length,
      itemBuilder: (context, index) {
        return CodeViewer(code: codeList[index]);
      },
    );
  }
}

class CodeViewer extends StatelessWidget {
  final String code;

  const CodeViewer({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return HighlightView(
      code,
      language: 'dart',
      theme: monokaiSublimeTheme,
      padding: const EdgeInsets.all(12),
      textStyle: const TextStyle(fontSize: 14),
    );
  }
}
