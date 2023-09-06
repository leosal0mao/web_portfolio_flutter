import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.press,
    required this.imageSrc,
    required this.text,
  });

  final VoidCallback press;
  final String imageSrc, text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding * 2.0,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFEDEDED)),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          children: [
            Image.asset(imageSrc, height: 40),
            const SizedBox(width: kDefaultPadding),
            Text(text),
          ],
        ),
      ),
    );
  }
}
