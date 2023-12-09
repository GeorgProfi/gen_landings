import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BodySection(
                    Title: "Заголовок 1",
                    innerText: "Текст внутри первого блока",
                    Width: 250,
                    Heigth: 200),
                BodySection(
                  Title: "Заголовок 2",
                  innerText: "Текст внутри второго блока",
                  Width: 625,
                  Heigth: 500,
                ),
                BodySection(
                  Title: "Заголовок 3",
                  innerText: "Текст внутри третьего блока",
                  Width: 125,
                  Heigth: 100,
                  fontSizeTitle: 1,
                ),
              ]),
        ),
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  double MaxWidth = 477.33;
  double MinWidth = 250;

  double MaxHeigth = 392;
  double MinHeigth = 200;

  String Title;
  String innerText;
  double Width;
  double Heigth;
  double fontSizeTitle;
  double fontSizeText;

  BodySection(
      {this.Title = 'No input title',
      this.innerText = 'No input text',
      this.Width = 477.33,
      this.Heigth = 392,
      this.fontSizeTitle = 9.64,
      this.fontSizeText = 20}) {
    // Check max and min size
    if (this.Width > MaxWidth) {
      this.Width = MaxWidth;
    }

    if (this.Width < MinWidth) {
      this.Width = MinWidth;
    }

    if (this.Heigth > MaxHeigth) {
      this.Heigth = MaxHeigth;
    }

    if (this.Heigth < MinHeigth) {
      this.Heigth = MaxHeigth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Width,
          height: Heigth,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0x99E5E7EB)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: Width,
                  height: Heigth,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 2,
                top: 2,
                child: Container(
                  width: Width,
                  height: Heigth * 0.4897,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          Image.asset('img/400x200.jpg').image as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: Heigth * 0.556,
                child: SizedBox(
                  width: Width * 0.155,
                  height: Heigth * 0.04,
                  child: Text(
                    'CATEGORY',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: fontSizeTitle,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 1.20,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: Heigth * 0.607,
                child: SizedBox(
                  width: Width * 0.232,
                  height: 28,
                  child: Text(
                    Title,
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: fontSizeTitle,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: Heigth * 0.721,
                child: SizedBox(
                  width: 387.50,
                  height: 42,
                  child: Text(
                    innerText,
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: fontSizeText,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: Heigth * 0.872,
                child: SizedBox(
                  width: Width * 0.175,
                  height: 24,
                  child: Text(
                    'Learn More',
                    style: TextStyle(
                      color: Color(0xFF6366F1),
                      fontSize: Heigth * 0.04,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 115.36,
                top: Heigth * 0.882,
                child: Container(
                  width: 16,
                  height: 16,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: 423.53,
                top: Heigth * 0.882,
                child: Container(
                  width: 16,
                  height: 16,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
