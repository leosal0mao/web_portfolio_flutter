import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:web_portfolio_flutter/screens/contact/components/contact_box.dart';
import 'package:web_portfolio_flutter/screens/contact/components/contact_form.dart';
import 'package:web_portfolio_flutter/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background2.png"),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(height: kDefaultPadding * 1.5),
          SectionTitle(
            subtitle: 'subtitle',
            color: Color(0xFF07E24A),
            title: 'title',
          ),
          SizedBox(height: kDefaultPadding),
          ContactBox(child: ContactForm()),
        ],
      ),
    );
  }
}
