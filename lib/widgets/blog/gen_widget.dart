import 'body_section.dart';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:universal_html/html.dart' as html;

String genWidgetString(List<BodySection> widgets) {
  String result = '';
  for (final widget in widgets) {
    result += """
    BodySection(
              title: "${widget.title}",
              innerText: "${widget.innerText}",
              widgetWidth: ${widget.widgetWidth},
              widgetHeight: ${widget.widgetHeight},
              fontSizeText: ${widget.fontSizeText},
              fontSizeTitle: ${widget.fontSizeTitle},
            ),
    """;
  }
  print(result);

  return result;
}

String genWidgetCode(String pageTitle, widgets) {
  String code = """
import 'package:flutter/material.dart';
import 'body_section.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$pageTitle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BodySection> widgets = [${genWidgetString(widgets)}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return widgets[index];
          }),
    )
    );
  }
}
""";
  return code;
}

void downloadArchive() {
  final List<String> fileNames = ['file1.dart', 'file2.dart', 'file3.dart'];
  var archive = Archive();
  fileNames.forEach((fileName) {
    final content = 'Your Dart code for $fileName';
    archive.addFile(ArchiveFile(
        fileName, content.length, Uint8List.fromList(content.codeUnits)));
  });

  final zipBytes = ZipEncoder().encode(archive);

  final blob = html.Blob([Uint8List.fromList(zipBytes!)]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  // ignore: unused_local_variable
  final anchor = html.AnchorElement(href: url)
    ..target = 'download'
    ..download = 'archive.zip'
    ..click();
  
  html.Url.revokeObjectUrl(url);
}

