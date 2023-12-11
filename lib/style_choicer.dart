import 'package:flutter/material.dart';
import 'package:gen_landings/style_button.dart';

class StyleChoicer extends StatelessWidget {
  final List<dynamic> styles;
  final Function(Color) changeStyleFunction;

  const StyleChoicer(
      {Key? key, required this.styles, required this.changeStyleFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScale = styles.length > 3 ? 4 : styles.length.toDouble();
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      width: 32 * widthScale + 4,
      height: 33,
      child: Center(
          child: SizedBox(
        width: 29 * widthScale, // Set a fixed width or adjust as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: styles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: RoundButton(
                onTap: changeStyleFunction,
                style: styles[index],
              ),
            );
          },
        ),
      )),
    );
  }
}
