import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  const Picture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800, maxHeight: 1100),
      child: Image.asset("assets/picture.png"),
    );
  }
}
