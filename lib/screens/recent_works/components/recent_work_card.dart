// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:web_portfolio_flutter/models/RecentWorkModel.dart';

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
      color: Colors.white,
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Row(children: [
          Container(
            width: size.width / 8,
            height: size.height / 4,
            child: Image.asset(
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
                Text(widget.recentWork.category!.toUpperCase()),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  widget.recentWork.title!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.5),
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
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
