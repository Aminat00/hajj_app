import 'package:flutter/material.dart';
import 'package:hajj_app/models/hijri_date.dart';
import 'package:hajj_app/services/prayers_service.dart';
import 'package:hajj_app/models/prayers.dart';
import 'package:hajj_app/utils/latinize.dart';
import 'prayer_time_icon.dart';
import 'package:intl/intl.dart';

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({Key? key}) : super(key: key);

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  late Future<Pair?> _futurePair;

  @override
  void initState() {
    _futurePair = PrayersService.fetchPair();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futurePair,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error fetching prayers: ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            if (snapshot.data is Pair) {
              return _prayers(snapshot.data as Pair);
            } else {
              return const CircularProgressIndicator();
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  _prayers(Pair pair) {
    DateFormat dateFormat = DateFormat("H:mm");
    final Prayers prayers = pair.item1 as Prayers;
    final HijriDate hijriDate = pair.item2 as HijriDate;
    final closestPrayer = _determineClosest(prayers);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('${hijriDate.day} ${latinize(hijriDate.month)} ${hijriDate.year}',
            style: Theme.of(context).textTheme.headline6),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrayerTimeIcon(
                salahName: 'Fajr',
                salahIcon: Icons.brightness_4,
                salahTime: dateFormat.format(prayers.Fajr.toLocal()),
                closest: prayers.Fajr == closestPrayer,
              ),
              PrayerTimeIcon(
                salahName: 'Sunrise',
                salahIcon: Icons.brightness_5,
                salahTime: dateFormat.format(prayers.Sunrise.toLocal()),
                closest: prayers.Sunrise == closestPrayer,
              ),
              PrayerTimeIcon(
                salahName: 'Dhuhr',
                salahIcon: Icons.wb_sunny,
                salahTime: dateFormat.format(prayers.Dhuhr.toLocal()),
                closest: prayers.Dhuhr == closestPrayer,
              ),
              PrayerTimeIcon(
                salahName: 'Asr',
                salahIcon: Icons.wb_twilight,
                salahTime: dateFormat.format(prayers.Asr.toLocal()),
                closest: prayers.Asr == closestPrayer,
              ),
              PrayerTimeIcon(
                salahName: 'Maghrib',
                salahIcon: Icons.wb_twighlight,
                salahTime: dateFormat.format(prayers.Maghrib.toLocal()),
                closest: prayers.Maghrib == closestPrayer,
              ),
              PrayerTimeIcon(
                salahName: 'Isha',
                salahIcon: Icons.bedtime,
                salahTime: dateFormat.format(prayers.Isha.toLocal()),
                closest: prayers.Isha == closestPrayer,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _determineClosest(Prayers prayers) {
    final List<DateTime> prayersList = [
      prayers.Fajr,
      prayers.Sunrise,
      prayers.Dhuhr,
      prayers.Asr,
      prayers.Maghrib,
      prayers.Isha,
    ];

    final now = DateTime.now();
    DateTime? closetsPrayerToNow;
    prayersList.removeWhere((prayer) => prayer.isBefore(now));

    if (prayersList.isNotEmpty) {
      closetsPrayerToNow =
          prayersList.reduce((a, b) => a.difference(now).abs() < b.difference(now).abs() ? a : b);
    }

    return closetsPrayerToNow;
  }
}
