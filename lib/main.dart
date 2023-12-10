import 'package:flutter/material.dart';
import 'package:gen_landings/code_viewer.dart';
import 'package:gen_landings/style_choicer.dart';
import 'package:flutter/services.dart';
import 'widgets/blog_one.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 80, 68, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Generation Landings'),
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
  Widget? choiceWidget;
  Widget? visibleWidget;
  String code = "";
  bool visibleCode = false;
  bool headerVisible = true;
  pressButt() {
    setState(() {
      headerVisible = !headerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    setWidget(Widget widgetToAdd, String widgetCode) {
      setState(() {
        choiceWidget = widgetToAdd;
        visibleWidget = widgetToAdd;
        code = widgetCode;
        visibleCode = false;
      });
    }

    void copyToClipboard(BuildContext context) {
      Clipboard.setData(ClipboardData(text: code));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Code copied to clipboard'),
        ),
      );
    }

    setViewCode() {
      setState(() {
        visibleWidget = CodeViewer(code: code);
        visibleCode = true;
      });
    }

    setViewWidget() {
      setState(() {
        visibleWidget = choiceWidget;
        visibleCode = false;
      });
    }

    changeStyle(String style) {
      print(style);
    }

    const styles = [
      {"name": "SOmeName", "buttonColor": Colors.red},
      {"name": "SOmeName2", "buttonColor": Color.fromARGB(255, 105, 54, 244)},
    ];
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 85, 21, 21),
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Visibility(
                              visible: !headerVisible,
                              child: FloatingActionButton(
                                onPressed: pressButt,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                        visible: !visibleCode,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: setViewCode,
                            style: elevatedButtonStyle,
                            child: const Text('View Code'),
                          ),
                        )),
                    Visibility(
                        visible: visibleCode,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () => copyToClipboard(context),
                            style: elevatedButtonStyle,
                            child: const Text('Copy to Clipboard'),
                          ),
                        )),
                    Visibility(
                        visible: visibleCode,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: setViewWidget,
                            style: elevatedButtonStyle,
                            child: const Text('Preview'),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyleChoicer(
                          changeStyleFunction: changeStyle,
                          styles: styles,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 175, 76, 142),
                  child: Center(child: visibleWidget),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            child: Visibility(
              visible: headerVisible,
              child: Container(
                color: Colors.blue,
                width: 100,
                height: screenHeight,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        FloatingActionButton(
                          onPressed: pressButt,
                        ),
                        InkWell(
                          onTap: () {
                            setWidget(
                                Container(
                                  width: 100,
                                  height: 50,
                                  color: Colors.white,
                                  child: Center(child: Blog_one()),
                                ),
                                """Container(
                              width: 100,
                              height: 50,
                              color: Colors.white,
                              child: const Center(child: Text('Text'))""");
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            color: Colors.white,
                            child: const Center(child: Text('Text')),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setWidget(
                                Container(
                                  width: 100,
                                  height: 50,
                                  color: Colors.white,
                                  child: const Center(child: Text('New text')),
                                ),
                                """Container(
                              width: 100,
                              height: 50,
                              color: Colors.white,
                              child: const Center(child: Text('New text')),
                            )""");
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            color: Colors.white,
                            child: const Center(child: Text('New text')),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
