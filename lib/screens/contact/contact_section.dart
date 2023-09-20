import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:web_portfolio_flutter/screens/contact/components/contact_box.dart';
import 'package:web_portfolio_flutter/screens/contact/components/contact_form.dart';
import 'package:web_portfolio_flutter/widgets/section_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background2.png"),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 1.5),
          SectionTitle(
            subtitle: localization.moreInfo,
            color: const Color(0xFF07E24A),
            title: localization.contactMe,
          ),
          const SizedBox(height: kDefaultPadding),
          const ContactBox(child: ContactForm()),
        ],
      ),
    );
  }
}
