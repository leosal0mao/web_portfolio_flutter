// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../helpers/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.subtitle,
    required this.color,
    required this.title,
  }) : super(key: key);

  final String title, subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      constraints: const BoxConstraints(maxWidth: 1110),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPadding),
            padding: const EdgeInsets.only(bottom: 72),
            width: 8,
            height: 100,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subtitle,
                style: const TextStyle(fontWeight: FontWeight.w200, color: kTextColor),
              ),
              Text(
                title,
                style: ResponsiveBreakpoints.of(context).largerThan(TABLET)
                    ? Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)
                    : Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
