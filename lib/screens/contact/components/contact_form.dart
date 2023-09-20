import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:web_portfolio_flutter/widgets/default_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          SizedBox(
            width: size.width / 1.5,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: localization.yourName,
                hintText: localization.enterName,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          SizedBox(
            width: size.width / 1.5,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: localization.emailAdress,
                hintText: localization.enterEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          SizedBox(
            width: size.width / 1.5,
            child: TextFormField(
              maxLines: size.height ~/ 90,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: localization.yourMessage,
                hintText: localization.enterMessage,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Center(
            child: FittedBox(
              child: DefaultButton(text: localization.send, imageSrc: 'assets/contact_icon.png', press: () {}),
            ),
          )
        ],
      ),
    );
  }
}
