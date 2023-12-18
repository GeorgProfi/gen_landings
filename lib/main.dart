import 'package:flutter/material.dart';
import 'package:gen_landings/style_choicer.dart';
import 'package:gen_landings/excel/export_settings.dart';
import 'package:gen_landings/excel/import_settings.dart';
import 'widgets/blog/blog_one.dart';
import 'package:gen_landings/gen_code/gen_main_dart.dart';
import "gen_code/gen_code_widget_params.dart";
import 'widgets/blog/blog_one_mini_widget.dart';
import 'dart:html' as html;
import 'dart:convert';

enum ThemeEvent { toggle }

enum ThemeType { light, dark }

// Состояния для BLoC
class ThemeState {
  final bool isDark;

  ThemeState({required this.isDark});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generation Landings',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: "some"),
    );
  }
}

final elevatedButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(
      horizontal: 20, vertical: 15), // Adjust the padding as needed
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeType _currentTheme = ThemeType.light;

  void _toggleTheme() {
    setState(() {
      _currentTheme =
          _currentTheme == ThemeType.light ? ThemeType.dark : ThemeType.light;
    });
  }

  Widget choiceWidget = Container();
  bool headerVisible = true;
  bool animateStart = false;
  Color topHeaderColor = const Color.fromARGB(255, 85, 21, 21);
  List<List<dynamic>> columnOfWidget = [
    [BlogOne, const MiniWidgetBlogOne(mainColor: Color.fromARGB(255, 85, 21, 21))]
  ];
  pressButt() {
    setState(() {
      headerVisible = !headerVisible;
      animateStart = true;
    });
  }

  Future<void> importSettingsButton() async {
    int countParams = await importSettings();
    if (countParams > 0) {
      setState(() {
        visibleParams = [];
        for (int i = 1; i <= countParams; i++) {
          String? curParams = html.window.localStorage["widget $i"];
          if (curParams != null) {
            String jsonString = curParams.replaceAllMapped(
                RegExp(r'([a-zA-ZЁёА-я]+)'), (match) => '"${match.group(1)}"');
            Map<String, dynamic> myMap = json.decode(jsonString);
            visibleParams.add(myMap);
          }
        }
      });
    }
  }

  List<dynamic> visibleParams = [];

  @override
  Widget build(BuildContext context) {
    Map<String, Widget Function(Map<String, dynamic>)> widgetBuilders = {
      "BlogOne": (params) => BlogOne(widgetsParams: params),
      // Add more widget builders as needed
    };
    List<Widget> visibleWidget = [];
    for (int i = 0; i < visibleParams.length; i++) {
      Map<String, dynamic> commonParams = visibleParams[i];
      Widget Function(Map<String, dynamic>) widgetBuilder =
          widgetBuilders[commonParams["name"]]!;

      visibleWidget.add(widgetBuilder(commonParams));
    }
    void exportSettingsButton() {
      exportSettings(visibleWidget);
    }

    void download() {
      List<dynamic> paramsWidget = [];
      int lengthWidgets = visibleWidget.length;
      for (int i = 1; i <= lengthWidgets; ++i) {
        paramsWidget.add(html.window.localStorage["widget $i"]);
      }
      downloadArchive(paramsWidget);
    }

    setWidget(String widgetToAdd) {
      setState(() {
        visibleParams.add(generateParams[widgetToAdd]!["defaultParams"]);
      });
    }

    changeStyle(Color color) {
      setState(() {
        topHeaderColor = color;
      });
    }

    const styles = [
      {"name": "SOmeName", "buttonColor": Colors.red},
      {"name": "SOmeName2", "buttonColor": Color.fromARGB(255, 105, 54, 244)},
    ];
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:
          _currentTheme == ThemeType.light ? Colors.white : Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: topHeaderColor,
                height: 100,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: headerVisible ? 200 : 0,
                    ),
                    Visibility(
                        visible: !headerVisible,
                        child: const SizedBox(
                          width: 20,
                        )),
                    IconButton(
                      icon: Icon(headerVisible ? Icons.arrow_back : Icons.menu),
                      onPressed: pressButt,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: importSettingsButton,
                        style: elevatedButtonStyle,
                        child: const Text('Import'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: exportSettingsButton,
                        style: elevatedButtonStyle,
                        child: const Text('Export'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: download,
                        style: elevatedButtonStyle,
                        child: const Text('Download'),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyleChoicer(
                          changeStyleFunction: changeStyle,
                          styles: styles,
                        )),
                    InkWell(
                        onTap: _toggleTheme,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: _currentTheme == ThemeType.light
                              ? const Icon(Icons.wb_sunny,
                                  size: 50.0, key: ValueKey('light'))
                              : const Icon(Icons.nightlight_round,
                                  size: 50.0, key: ValueKey('dark')),
                        )),
                    const SizedBox(
                      width: 10,
                      height: 5,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: headerVisible ? 200 : 0,
                    height: 10,
                  ),
                  Expanded(child: Container()),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: headerVisible ? 210 : 10,
                      height: 10,
                    ),
                    Expanded(
                      child: CustomScrollView(slivers: visibleWidget),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              )
            ],
          ),
          Positioned(
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              onEnd: () {
                setState(() {
                  animateStart = false;
                });
              },
              decoration: BoxDecoration(
                color: _currentTheme == ThemeType.light
                    ? Colors.white
                    : Colors.black,
                border: Border(
                  right: BorderSide(
                    color: _currentTheme == ThemeType.light
                        ? Colors.black
                        : Colors.white, // Adjust the color as needed
                    width: 2.0, // Adjust the width as needed
                  ),
                ),
              ),
              width: headerVisible ? 200 : 0,
              height: screenHeight,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Visibility(
                      visible: headerVisible && !animateStart,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: columnOfWidget.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    setWidget(
                                        columnOfWidget[index][0].toString());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: columnOfWidget[index][1],
                                  ));
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
