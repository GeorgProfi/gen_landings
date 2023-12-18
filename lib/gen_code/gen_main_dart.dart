import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:gen_landings/gen_code/gen_code_widget_params.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:convert';
import 'package:path/path.dart' as path;

void downloadArchive(List<dynamic> widgetsParams) {
  String mainCode = "import 'package:flutter/material.dart';";
  List<String> usedWidgets = [];
  List<dynamic> jsonParams = [];
  List<String> jsonStrings = [];
  for (var widgetParam in widgetsParams) {
    String jsonString = widgetParam.replaceAllMapped(
        RegExp(r'([a-zA-ZЁёА-я]+)'), (match) => '"${match.group(1)}"');
    jsonStrings.add(jsonString);
    // Add double quotes around values
    Map<String, dynamic> myMap = json.decode(jsonString);
    mainCode += usedWidgets.contains(myMap['name'])
        ? ""
        : "${generateParams[myMap['name']]?['imports']}";
    jsonParams.add(myMap);
    if (!usedWidgets.contains(myMap['name'])) {
      usedWidgets.add(myMap['name']);
    }
  }

  String visibleWidget = "";
  for (var widget in usedWidgets) {
    visibleWidget +=
        """"$widget": (params) => $widget(widgetsParams: params),""";
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
     Map<String, Widget Function(Map<String, dynamic>)> widgetBuilders = {
     $visibleWidget
    };
    List<Widget> visibleWidget = [];
    List<dynamic> visibleParams = $jsonStrings;
    for (int i = 0; i < visibleParams.length; i++) {
      Map<String, dynamic> commonParams = visibleParams[i];
      Widget Function(Map<String, dynamic>) widgetBuilder =
          widgetBuilders[commonParams["name"]]!;

      visibleWidget.add(widgetBuilder(commonParams));
    }
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
  archive.addFile(ArchiveFile(
      'main.dart', mainCode.length, Uint8List.fromList(mainCode.codeUnits)));
  for (var widget in usedWidgets) {
    for (int i = 0 ; i < generateParams[widget]!["archiveFiles"].length;i++) {
      archive.addFile(ArchiveFile(generateParams[widget]!["archiveFilesNames"][i], generateParams[widget]!["archiveFiles"][i].length,
          Uint8List.fromList(generateParams[widget]!["archiveFiles"][i].codeUnits)));
    }
  }
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

Future<String> readTextFromFile(String filePath) async {
  try {
    File file = File(filePath);
    if (await file.exists()) {
      String contents = await file.readAsString();
      return contents;
    } else {
      throw FileSystemException('File not found', filePath);
    }
  } catch (e) {
    print('Error reading file: $e');
    return '';
  }
}
