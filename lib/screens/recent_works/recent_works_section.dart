import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/models/recent_work_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../helpers/constants.dart';
import '../../widgets/hire_me_card.dart';
import '../../widgets/section_title.dart';
import 'components/recent_work_card.dart';

class RecentWorksSection extends StatelessWidget {
  const RecentWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    List<RecentWorkModel> recentWorks1 = [
      RecentWorkModel(
        title: localization.myOldPortfolio,
        category: localization.webDevelopment,
        image: "assets/portfoliosite.png",
        link: 'https://github.com/leosal0mao/three_js_site',
      ),
      RecentWorkModel(
        title: localization.financesAppDescription,
        category: localization.mobileDevelopment,
        image: "assets/finance.jpg",
        link: 'https://github.com/leosal0mao/finance-app-design',
      ),
    ];
    List<RecentWorkModel> recentWorks2 = [
      RecentWorkModel(
        title: localization.cbSongsDescription,
        category: localization.backendDevelopment,
        image: "assets/discord.png",
        link: 'https://github.com/leosal0mao/cb-songs',
      ),
      RecentWorkModel(
        title: localization.firstfolioDescription,
        category: localization.webDevelopment,
        image: "assets/firstfolio.png",
        link: 'https://github.com/leosal0mao/portfolio-leo',
      ),
    ];

    List<RecentWorkModel> recentWorks3 = recentWorks1 + recentWorks2;

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

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
          ResponsiveBreakpoints.of(context).largerThan(TABLET)
              ? SizedBox(
                  height: size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding * 2, right: kDefaultPadding * 2),
                    child: Row(
                      children: [
                        Flexible(
                          child: ListView.builder(
                            itemCount: recentWorks1.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) => RecentWorkCard(recentWork: recentWorks1[i], press: () {}),
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding * 2),
                        Flexible(
                          child: ListView.builder(
                            itemCount: recentWorks2.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) => RecentWorkCard(recentWork: recentWorks2[i], press: () {}),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  width: size.width / 1.2,
                  child: Wrap(
                    spacing: kDefaultPadding,
                    runSpacing: kDefaultPadding * 2,
                    children: List.generate(
                      recentWorks3.length,
                      (index) => RecentWorkCard(recentWork: recentWorks3[index], press: () {}),
                    ),
                  ),
                ),
          const SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
