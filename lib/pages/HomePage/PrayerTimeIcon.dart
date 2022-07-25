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
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Righteous-Regular',
      color: Colors.green)),
        Icon(salahIcon, color: Colors.green[500]),
        Text(salahTime,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Righteous-Regular',
                color: Colors.green)),
      ],
    );
  }
}
