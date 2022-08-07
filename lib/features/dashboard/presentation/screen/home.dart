import 'package:flutter/material.dart';
import '../widget/carousel_slider_hajj.dart';
import '../widget/main_services.dart';
import '../widget/prayer_times.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Column(
      children: const [
        CarouselSliderHajj(),
        PrayerTimes(),
        Padding(
            padding:  EdgeInsets.only(top: 0.0,bottom: 5.0),
            child:MainServices())
            // Text('Main Services',
            //   style: Theme.of(context).textTheme.headline2,
            // )),
        ,


        ]
      ),
    );
  }
}
