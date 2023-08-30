import 'package:flutter/material.dart';
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
      elevation: 30,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxHeight: 900, minHeight: 700),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          width: 1200,
          child: Stack(
            children: [
              BlurBoxLogo(size: size),
              const Positioned(
                bottom: 0,
                right: 0,
                child: Picture(),
              ),
              const Positioned(
                bottom: 0,
                child: Menu(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
