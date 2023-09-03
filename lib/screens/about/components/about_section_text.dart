// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';

class AboutSectionText extends StatelessWidget {
  const AboutSectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w200,
          color: kTextColor,
          height: 2,
        ),
      ),
    );
  }
}
