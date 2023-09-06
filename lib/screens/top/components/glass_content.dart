import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints: BoxConstraints(maxWidth: size.width * 0.8, maxHeight: size.height * 0.5),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization!.hello,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                '${localization.leonardo} \n${localization.salomao}',
                style: TextStyle(
                  fontSize: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 70 : 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                localization.programmer,
                style: ResponsiveBreakpoints.of(context).largerThan(TABLET)
                    ? Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)
                    : Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
