import 'package:flutter/material.dart';

class PrayerTimeIcon extends StatelessWidget {
  final String salahName;
  final IconData salahIcon;
  final String salahTime;
  final bool closest;

  const PrayerTimeIcon({
    Key? key,
    required this.salahName,
    required this.salahIcon,
    required this.salahTime,
    this.closest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(salahName,
            style:
                Theme.of(context).textTheme.bodyText2?.apply(fontSizeFactor: closest ? 1.2 : 1.0)),
        Icon(
          salahIcon,
          color: Colors.teal[closest ? 800 : 500],
          size: closest ? 36 : 24,
        ),
        Text(salahTime,
            style:
                Theme.of(context).textTheme.bodyText2?.apply(fontSizeFactor: closest ? 1.2 : 1.0)),
      ],
    );
  }
}
