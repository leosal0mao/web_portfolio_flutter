import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    List<String> menuItems = [
      localization!.home,
      localization.about,
      localization.services,
      localization.recentWorks,
      localization.contact,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
          (index) => buildMenuItem(index, context, menuItems),
        ),
      ),
    );
  }

  Widget buildMenuItem(int index, BuildContext context, List<String> menuItems) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: const BoxConstraints(minWidth: 120),
          height: 100,
          child: Stack(alignment: Alignment.center, children: [
            Text(
              menuItems[index],
              style: const TextStyle(fontSize: 20, color: kTextColor),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: 0,
              right: 0,
              bottom: selectedIndex != index && hoverIndex == index ? -2 : -32,
              child: Image.asset("assets/hover.png"),
            ),
            // Select
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: 0,
              right: 0,
              bottom: selectedIndex == index ? -2 : -32,
              child: Image.asset("assets/hover.png"),
            ),
          ]),
        ),
      );
}
