import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:web_portfolio_flutter/models/recent_work_model.dart';

import '../../../helpers/constants.dart';

class RecentWorkCard extends StatefulWidget {
  const RecentWorkCard({
    Key? key,
    required this.recentWork,
    required this.press,
  }) : super(key: key);

  final RecentWorkModel recentWork;
  final VoidCallback press;

  @override
  State<RecentWorkCard> createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.asset(
              width: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? size.width / 6 : size.width / 3,
              height: size.height / 3,
              widget.recentWork.image!,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.recentWork.category!.toUpperCase(),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  maxLines: 7,
                  widget.recentWork.title!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
                const SizedBox(height: kDefaultPadding),
                RichText(
                  text: TextSpan(
                    text: localization.viewDetails,
                    style: const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchUrl(widget.recentWork.link!);
                      },
                  ),
                )
              ],
            ),
          ))
        ]),
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
