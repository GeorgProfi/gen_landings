import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function(Color) onTap;
  final dynamic style;

  const RoundButton({super.key, required this.onTap, required this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(style["buttonColor"]);
      },
      child: Container(
        width: 25.0, // Adjust the size as needed
        height: 25.0, // Adjust the size as needed
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: style["buttonColor"], // Change the color as needed
        ),
      ),
    );
  }
}
