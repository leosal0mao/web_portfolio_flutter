import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:web_portfolio_flutter/screens/top/components/menu.dart';
import 'package:web_portfolio_flutter/screens/top/components/picture.dart';

import 'components/blur_box_logo.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        alignment: Alignment.center,
        constraints: ResponsiveBreakpoints.of(context).largerThan(TABLET)
            ? BoxConstraints(maxHeight: size.height.toDouble(), minHeight: 700)
            : BoxConstraints(maxHeight: size.height.toDouble() / 1.5, minHeight: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: Container(
          margin: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? const EdgeInsets.only(top: kDefaultPadding) : null,
          width: 1200,
          child: Stack(
            children: [
              BlurBoxLogo(size: size),
              ResponsiveBreakpoints.of(context).largerThan(TABLET)
                  ? const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Picture(),
                    )
                  : const SizedBox(),
              ResponsiveBreakpoints.of(context).largerThan(TABLET)
                  ? Positioned(
                      bottom: 0,
                      child: Center(child: Container()),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
