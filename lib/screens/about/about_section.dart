import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio_flutter/screens/about/components/about_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/constants.dart';
import '../../widgets/default_button.dart';
import '../../widgets/outline_button.dart';
import 'components/about_section_text.dart';
import 'components/experience_card.dart';

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
    return ResponsiveBreakpoints.of(context).largerThan(TABLET)
        ? Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AboutText(),
                  Expanded(
                    child: AboutSectionText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    ),
                  ),
                  ExperienceCard(numOfExp: "03"),
                  Expanded(
                    child: AboutSectionText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    imageSrc: "assets/hand.png",
                    text: localization.hireMe,
                    press: () {},
                  ),
                  const SizedBox(width: kDefaultPadding * 1.5),
                  DefaultButton(
                    imageSrc: "assets/download.png",
                    text: localization.downloadCV,
                    press: () {
                      // downloadPDF();
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
              const AboutSectionText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              ),
              const SizedBox(height: 10),
              const ExperienceCard(numOfExp: "03"),
              const SizedBox(height: 10),
              const AboutSectionText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              ),
              const SizedBox(height: kDefaultPadding * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlineButton(
                    imageSrc: "assets/hand.png",
                    text: localization.hireMe,
                    press: () {},
                  ),
                  const SizedBox(width: 5),
                  DefaultButton(
                    imageSrc: "assets/download.png",
                    text: localization.downloadCV,
                    press: () {
                      // downloadPDF();
                    },
                  ),
                ],
              ),
            ],
          );
  }

  // void downloadPDF() {
  //   File file = 'assets/cv-ptbr.pdf';

  //   final content = base64Encode(file as List<int>);
  //   final anchor = AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,$content")
  //     ..setAttribute("download", "file.pdf")
  //     ..click();
  // }
}
