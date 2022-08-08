import 'package:flutter/material.dart';
import 'package:hajj_app/services/prayers_service.dart';
import 'package:hajj_app/models/prayers.dart';
import 'prayer_time_icon.dart';
import 'package:intl/intl.dart';

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({Key? key}) : super(key: key);

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  late Future<Prayers?> _futurePrayers;

  @override
  void initState() {
    _futurePrayers = PrayersService.fetchPrayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futurePrayers,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error fetching prayers: ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            if (snapshot.data is Prayers) {
              return _prayers(snapshot.data as Prayers);
            } else {
              return const CircularProgressIndicator();
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  _prayers(Prayers prayers) {
    DateFormat dateFormat = DateFormat("H:mm");
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PrayerTimeIcon(
              salahName: 'Fajr',
              salahIcon: Icons.brightness_4,
              salahTime: dateFormat.format(prayers.Fajr.toLocal())),
          PrayerTimeIcon(
              salahName: 'Sunrise',
              salahIcon: Icons.brightness_5,
              salahTime: dateFormat.format(prayers.Sunrise.toLocal())),
          PrayerTimeIcon(
              salahName: 'Dhuhr',
              salahIcon: Icons.wb_sunny,
              salahTime: dateFormat.format(prayers.Dhuhr.toLocal())),
          PrayerTimeIcon(
              salahName: 'Asr',
              salahIcon: Icons.wb_twilight,
              salahTime: dateFormat.format(prayers.Asr.toLocal())),
          PrayerTimeIcon(
              salahName: 'Maghrib',
              salahIcon: Icons.wb_twighlight,
              salahTime: dateFormat.format(prayers.Maghrib.toLocal())),
          PrayerTimeIcon(
              salahName: 'Isha',
              salahIcon: Icons.bedtime,
              salahTime: dateFormat.format(prayers.Isha.toLocal())),
        ],
      ),
    );
  }
}
