import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';

import 'screens/about/about_section.dart';
import 'screens/contact/contact_section.dart';
import 'screens/recent_works/recent_works_section.dart';
import 'screens/services/services_section.dart';
import 'screens/top/top_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const TopSection(),
          SizedBox(height: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? kDefaultPadding / 2.5 : kDefaultPadding),
          const AboutSection(),
          const ServicesSection(),
          const RecentWorksSection(),
          const ContactSection(),
        ]),
      ),
    );
  }
}
