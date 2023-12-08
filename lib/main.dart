import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget? choiceWidget;
  bool headerVisible = true;
  pressButt() {
    print('press');
    setState(() {
      headerVisible = !headerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    setWidget(widgetToAdd) {
      setState(() {
        choiceWidget = widgetToAdd;
      });
    }

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
                            padding: EdgeInsets.all(8),
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
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 175, 76, 142),
                  child: Center(child: choiceWidget),
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
                            setWidget(Container(
                              width: 100,
                              height: 50,
                              color: Colors.white,
                              child: const Center(child: Text('Text')),
                            ));
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
                            setWidget(Container(
                              width: 100,
                              height: 50, 
                              color: Colors.white,
                              child: const Center(child: Text('New text')),
                            ));
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
