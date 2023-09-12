import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio_flutter/widgets/default_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helpers/constants.dart';

class HireMeCard extends StatelessWidget {
  const HireMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [kDefaultShadow],
      ),
      child: ResponsiveBreakpoints.of(context).largerThan(TABLET)
          ? Row(
              children: [
                Image.asset(
                  "assets/email.png",
                  height: 80,
                  width: 80,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: SizedBox(
                    height: 80,
                    child: VerticalDivider(),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization.startingProject,
                        style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        localization.contactMe,
                        style: const TextStyle(fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
                DefaultButton(
                  text: localization.hireMe,
                  imageSrc: "assets/hand.png",
                  press: () {
                    _launchUrl('https://www.linkedin.com/in/leosalomao20/');
                  },
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/email.png"),
                    const SizedBox(width: kDefaultPadding),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: SizedBox(
                        height: 80,
                        child: VerticalDivider(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              localization.startingProject,
                              style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              localization.contactMe,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: kDefaultPadding * 1.5),
                Padding(
                  padding: EdgeInsets.only(left: size.width / 6, right: size.width / 6),
                  child: DefaultButton(
                    text: localization.hireMe,
                    imageSrc: "assets/hand.png",
                    press: () {
                      _launchUrl('https://www.linkedin.com/in/leosalomao20/');
                    },
                  ),
                )
              ],
            ),
    );
  }

  _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
