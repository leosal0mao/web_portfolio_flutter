import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio_flutter/screens/about/components/about_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/constants.dart';
import '../../widgets/default_button.dart';
import 'components/about_section_text.dart';
import 'components/experience_card.dart';
import 'dart:html' as html;

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    final Locale appLocale = Localizations.localeOf(context);

    return ResponsiveBreakpoints.of(context).largerThan(TABLET)
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AboutText(),
                  Expanded(
                    child: AboutSectionText(
                      text: localization.aboutMe1,
                    ),
                  ),
                  const ExperienceCard(numOfExp: "03"),
                  Expanded(
                    child: AboutSectionText(
                      text: localization.aboutMe2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    imageSrc: "assets/download.png",
                    text: localization.downloadCV,
                    press: () {
                      if (appLocale.languageCode == 'en') {
                        downloadFile('https://drive.google.com/uc?export=download&id=1xIU71BICAVZGlUpqQZHNLz-fnJdC5rIe');
                      } else {
                        downloadFile('https://drive.google.com/uc?export=download&id=1aliAfsVbcqMNH10okrwRn3bj7538B39L');
                      }
                    },
                  ),
                ],
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AboutText(),
              AboutSectionText(text: localization.aboutMe1),
              const SizedBox(height: 10),
              const ExperienceCard(numOfExp: "03"),
              const SizedBox(height: 10),
              AboutSectionText(
                text: localization.aboutMe2,
              ),
              const SizedBox(height: kDefaultPadding * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultButton(
                    imageSrc: "assets/download.png",
                    text: localization.downloadCV,
                    press: () {
                      if (appLocale == 'en') {
                        downloadFile('https://drive.google.com/uc?export=download&id=1xIU71BICAVZGlUpqQZHNLz-fnJdC5rIe');
                      } else {
                        downloadFile('https://drive.google.com/uc?export=download&id=1aliAfsVbcqMNH10okrwRn3bj7538B39L');
                      }
                    },
                  ),
                ],
              ),
            ],
          );
  }

  void downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}
