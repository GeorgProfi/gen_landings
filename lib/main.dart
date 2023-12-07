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
  List<Widget> header = [];

  @override
  Widget build(BuildContext context) {
    addToHeader(widgetToAdd) {
      setState(() {
        header.add(widgetToAdd);
      });
    }

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    DragTarget<Widget>(
                      builder: (context, candidateItems, rejectedItems) {
                        return Container(
                          color: Colors.green,
                          height: screenHeight * 0.17,
                          alignment: AlignmentDirectional.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: header, ),
                        );
                      },
                      onAccept: (item) {
                        addToHeader(item);
                        print(header);
                      },
                    ),
                    Container(
                      color: const Color.fromARGB(255, 85, 21, 21),
                      height: screenHeight * 0.6,
                    ),
                    Container(
                      color: const Color.fromARGB(255, 175, 76, 142),
                      height: screenHeight * 0.17,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 1,
            child: Container(
              color: Colors.blue,
              width: 150,
              height: screenHeight,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  LongPressDraggable<Widget>(
                    data: Padding(padding: EdgeInsets.all(8),child:  Container(
                      width: 100,
                      height: 50,
                      color: Colors.white,
                      child: const Center(child: Text('Text')),
                    )),
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.white,
                      child: const Center(child: Text('Text')),
                    ),
                    feedback: Material(
                      elevation: 5,
                      child: Container(
                        width: 100,
                        height: 50,
                        color: Colors.white,
                        child: const Center(child: Text('Text')),
                      ),
                    ),
                    childWhenDragging: Container(),
                  ),
                ]),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
