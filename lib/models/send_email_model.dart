import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future sendEmail({
  required String name,
  required String email,
  required String message,
  BuildContext? context,
}) async {
  var localization = AppLocalizations.of(context!)!;

  const serviceId = 'service_k56rzlq';
  const templateId = 'template_f8sbhak';
  const userId = 'XWWDgO2sSf_eRPt_T';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'user_message': message,
      },
    }),
  );

  if (response.statusCode != 200) {
    Fluttertoast.showToast(
        msg: localization.failEmail,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        webPosition: 'center',
        webBgColor: '#FF0000',
        fontSize: 90.0);
    throw Exception('Failed to send email');
  } else {
    Fluttertoast.showToast(
        msg: localization.sucessEmail,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        webPosition: 'center',
        fontSize: 90.0);
  }
}
