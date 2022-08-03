import 'package:flutter/material.dart';

class PrayerTimeIcon extends StatelessWidget {
  final String salahName;
  final IconData salahIcon;
  final String salahTime;
  const PrayerTimeIcon(
      {Key? key,
      required this.salahName,
      required this.salahIcon,
      required this.salahTime})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(salahName,
      style:Theme.of(context).textTheme.bodyText2),
        Icon(salahIcon, color: Colors.green[500]),
        Text(salahTime,
            style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}
