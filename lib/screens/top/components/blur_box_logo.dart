import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
      crossAxisAlignment: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset('assets/logo.png'),
        ),
        GlassContent(size: size),
        const Spacer(flex: 3),
      ],
    );
  }
}
