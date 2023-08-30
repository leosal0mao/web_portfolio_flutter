import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/screens/top/components/glass_content.dart';

class BlurBoxLogo extends StatelessWidget {
  const BlurBoxLogo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          child: Image.asset('assets/logo.png'),
        ),
        const Spacer(),
        GlassContent(size: size),
        const Spacer(flex: 3),
      ],
    );
  }
}
