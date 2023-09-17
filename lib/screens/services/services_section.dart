import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../helpers/constants.dart';
import '../../models/service_model.dart';
import '../../widgets/section_title.dart';
import 'components/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    List<ServiceModel> services = [
      ServiceModel(
        id: 1,
        title: localization!.mobileApps,
        image: "assets/graphic.png",
        color: const Color(0xFFD9FFFC),
      ),
      ServiceModel(
        id: 2,
        title: localization.webApps,
        image: "assets/desktop.png",
        color: const Color(0xFFE4FFC7),
      ),
      ServiceModel(
        id: 3,
        title: localization.videoEditing,
        image: "assets/interaction_design.png",
        color: const Color(0xFFFFE0E0),
      ),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? const BoxConstraints(maxWidth: 1110) : const BoxConstraints(maxWidth: 480),
      child: Column(
        children: [
          SectionTitle(
            color: const Color(0xFFFF0000),
            title: localization.serviceOffering,
            subtitle: localization.strongAreas,
          ),
          ResponsiveBreakpoints.of(context).largerThan(TABLET)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    services.length,
                    (index) => ServiceCard(
                      service: services[index],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    services.length,
                    (index) => ServiceCard(
                      service: services[index],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
