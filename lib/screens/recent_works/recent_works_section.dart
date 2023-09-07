import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/models/RecentWorkModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/constants.dart';
import '../../widgets/hire_me_card.dart';
import '../../widgets/section_title.dart';
import 'components/recent_work_card.dart';

class RecentWorksSection extends StatelessWidget {
  const RecentWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    List<RecentWorkModel> recentWorks = [
      RecentWorkModel(
        id: 1,
        title: localization.myOldPortfolio,
        category: localization.webDevelopment,
        image: "assets/portfoliosite.png",
        link: 'https://github.com/leosal0mao/three_js_site',
      ),
      RecentWorkModel(
        id: 2,
        title: localization.myOldPortfolio,
        category: localization.webDevelopment,
        image: "assets/portfoliosite.png",
        link: 'https://github.com/leosal0mao/three_js_site',
      ),
      RecentWorkModel(
        id: 3,
        title: localization.myOldPortfolio,
        category: localization.webDevelopment,
        image: "assets/portfoliosite.png",
        link: 'https://github.com/leosal0mao/three_js_site',
      ),
    ];

    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding * 6),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/recent_work_bg.png"),
        ),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, -80),
            child: const HireMeCard(),
          ),
          SectionTitle(
            title: localization.recentWorks,
            subtitle: localization.strongAreas,
            color: const Color(0xFFFFB100),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1110,
            child: Wrap(
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                recentWorks.length,
                (index) => RecentWorkCard(recentWork: recentWorks[index], press: () {}),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
