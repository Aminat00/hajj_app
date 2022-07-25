import 'package:flutter/material.dart';
import 'package:hajj_app/pages/HomePage/PrayerTimeIcon.dart';

class PrayerTimes extends StatefulWidget {

  const PrayerTimes({Key? key}) : super(key: key);

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          PrayerTimeIcon(
              salahName: 'Fajr',
              salahIcon: Icons.brightness_4,
              salahTime: '2:49'),
          PrayerTimeIcon(
              salahName: 'Sunrise',
              salahIcon: Icons.brightness_5,
              salahTime: '4:09'),
          PrayerTimeIcon(
              salahName: 'Dhuhr',
              salahIcon:
              Icons.wb_sunny,
              salahTime: '12:44'),
          PrayerTimeIcon(
              salahName: 'Asr',
              salahIcon: Icons.wb_twilight,
              salahTime: '3:00'),
          PrayerTimeIcon(
              salahName: 'Maghrib',
              salahIcon: Icons.wb_twighlight,
              salahTime: '21:10'),
          PrayerTimeIcon(
              salahName: 'Isha',
              salahIcon: Icons.bedtime,
              salahTime: '22:20'),
        ],
      ),
      ),


    );
  }
}
