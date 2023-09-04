import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          ResponsiveBreakpoints.of(context).largerThan(TABLET) ? "${localization.about} \n${localization.me}" : "${localization.about} ${localization.me}",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: kDefaultPadding * 2),
      ],
    );
  }
}
