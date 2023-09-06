// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';
import '../../../models/ServiceModel.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.service,
  }) : super(key: key);

  final ServiceModel service;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
        height: 256,
        width: 256,
        decoration: BoxDecoration(
          color: widget.service.color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover || !kIsWeb) kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              padding: const EdgeInsets.all(kDefaultPadding * 1.5),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isHover)
                    BoxShadow(
                      offset: const Offset(0, 20),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                ],
              ),
              child: Image.asset(
                widget.service.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Text(
              widget.service.title,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
