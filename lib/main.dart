import 'package:flutter/material.dart';
import 'package:gen_landings/code_viewer.dart';
import 'package:gen_landings/style_choicer.dart';
import 'package:flutter/services.dart';
import 'package:gen_landings/widgets/blog/blog_one.dart';

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
  Color topHeaderColor = Color.fromARGB(255, 85, 21, 21);
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
                      duration: Duration(milliseconds: 500),
                      width: headerVisible ? 100 : 0,
                    ),
                    Visibility(
                        visible: !headerVisible,
                        child: SizedBox(
                          width: 20,
                        )),
                    IconButton(
                      icon: Icon(headerVisible ? Icons.arrow_back : Icons.menu),
                      onPressed: pressButt,
                      color: Colors.white,
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
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: headerVisible ? 100 : 0,
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Center(child: visibleWidget),
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(
                    color: Colors.black, // Adjust the color as needed
                    width: 2.0, // Adjust the width as needed
                  ),
                ),
              ),
              width: headerVisible ? 200 : 0,
              height: screenHeight,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setWidget(Blog_one(), """  BodySection()""");
                        },
                        child: MiniWidgetBlogOne(),
                      )
                    ],
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
