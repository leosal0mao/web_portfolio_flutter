import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          TopSection(),
          SizedBox(height: kDefaultPadding * 2),
          AboutSection(),
          ServicesSection(),
          RecentWorksSection(),
          SizedBox(height: kDefaultPadding),
          ContactSection(),
        ]),
      ),
    );
  }
}
