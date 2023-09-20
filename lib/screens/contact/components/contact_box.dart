import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:web_portfolio_flutter/screens/contact/components/social_media_card.dart';

class ContactBox extends StatelessWidget {
  const ContactBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: size.width * 0.8),
      margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ResponsiveBreakpoints.of(context).largerThan(TABLET)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialMediaCard(
                      iconSrc: 'assets/telegram.png',
                      name: 'Telegram',
                      color: const Color(0xFFE8F0F9),
                      press: () {
                        _launchUrl('https://t.me/nashzen');
                      },
                    ),
                    SocialMediaCard(
                      iconSrc: 'assets/linkedin.png',
                      name: 'Linkedin',
                      color: const Color(0xFFD9FFFC),
                      press: () {
                        _launchUrl('https://www.linkedin.com/in/leosalomao20/');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding * 2),
                child
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaCard(
                  iconSrc: 'assets/telegram.png',
                  name: 'Telegram',
                  color: const Color(0xFFE8F0F9),
                  press: () {
                    _launchUrl('https://t.me/nashzen');
                  },
                ),
                const SizedBox(height: kDefaultPadding),
                SocialMediaCard(
                  iconSrc: 'assets/linkedin.png',
                  name: 'Linkedin',
                  color: const Color(0xFFD9FFFC),
                  press: () {
                    _launchUrl('https://www.linkedin.com/in/leosalomao20/');
                  },
                ),
                const SizedBox(height: kDefaultPadding * 2),
                child
              ],
            ),
    );
  }

  _launchUrl(String url) async {
    final Uri link = Uri.parse(url);

    if (!await launchUrl(link)) {
      throw Exception('Could not launch $link');
    }
  }
}
