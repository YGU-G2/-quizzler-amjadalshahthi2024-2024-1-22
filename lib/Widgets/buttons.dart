import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.btnChild,
    required this.press,
  });

  final Widget btnChild;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: press,
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Center(child: btnChild),
          ),
        ),
      ),
    );
  }
}
