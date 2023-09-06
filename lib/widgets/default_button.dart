// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.imageSrc,
  }) : super(key: key);

  final String imageSrc, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 1.8,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: const Color(0xFFE8F0F9),
      ),
      child: Row(
        children: [
          Image.asset(imageSrc, height: 40),
          const SizedBox(width: kDefaultPadding),
          Text(text),
        ],
      ),
    );
  }
}
