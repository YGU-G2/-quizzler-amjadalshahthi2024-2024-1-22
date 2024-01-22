import 'package:flutter/material.dart';

class ColorButtons extends StatelessWidget {
  const ColorButtons({
    super.key, required this.color, required this.tap,
  });

  final Color color;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: color,
            width: 70,
            height: 70,
          ),
        ),
      ),
    );
  }
}
