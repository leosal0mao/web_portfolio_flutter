import 'package:flutter/material.dart';
import 'package:web_portfolio_flutter/helpers/constants.dart';
import 'package:web_portfolio_flutter/widgets/default_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'text', hintText: 'text'),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'text', hintText: 'text'),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'text', hintText: 'text'),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'text', hintText: 'text'),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Center(
            child: FittedBox(
              child: DefaultButton(text: 'tsxt', imageSrc: 'assets/contact_icon.png', press: () {}),
            ),
          )
        ],
      ),
    );
  }
}
