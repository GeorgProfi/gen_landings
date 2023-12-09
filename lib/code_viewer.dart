import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter/services.dart';

class CodeListViewer extends StatelessWidget {
  final List<String> codeList;

  CodeListViewer({required this.codeList});

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

  CodeViewer({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SingleChildScrollView(
              child: HighlightView(
            code,
            language: 'dart',
            theme: monokaiSublimeTheme,
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(fontSize: 14),
          )),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _copyToClipboard(context),
            child: Text('Copy to Clipboard'),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Code copied to clipboard'),
      ),
    );
  }
}
