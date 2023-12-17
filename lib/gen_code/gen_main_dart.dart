import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:gen_landings/gen_code/gen_code_widget_params.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:convert';

void downloadArchive(List<dynamic> widgetsParams) {
  String mainCode = "import 'package:flutter/material.dart';";
  List<String> usedWidgets = [];
  List<dynamic> jsonParams = [];
  for (var widgetParam in widgetsParams) {
    String jsonString = widgetParam.replaceAllMapped(
        RegExp(r'([a-zA-Z]+)'), (match) => '"${match.group(1)}"');

    // Add double quotes around values
    print(jsonString);
    Map<String, dynamic> myMap = json.decode(jsonString);
    mainCode += usedWidgets.contains(myMap['name'])
        ? ""
        : "${generateParams[myMap['name']]?['imports']}";
    jsonParams.add(myMap);
    if (!usedWidgets.contains(myMap['name'])) {
      usedWidgets.add(myMap['name']);
    }
  }
  mainCode += """void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Flutter!'),
      ),
      body: Center(
        child: CustomScrollView(slivers: visibleWidget),
      ),
       bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
          height: 50.0,
          child: Center(
            child: Text(
              '© 2023 Your App Name',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}""";
  var archive = Archive();
  final content = 'Your Dart code for';
  archive.addFile(ArchiveFile(
      'main.dart', content.length, Uint8List.fromList(content.codeUnits)));
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
