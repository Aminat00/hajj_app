import 'package:flutter/material.dart';
import 'package:hajj_app/pages/HomePage/CarouselSliderHajj.dart';
import 'package:hajj_app/pages/HomePage/ExtraServices.dart';
import 'package:hajj_app/pages/HomePage/MainServices.dart';
import 'package:hajj_app/pages/HomePage/PrayerTimes.dart';
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
      children:const[
        CarouselSliderHajj(),
        PrayerTimes(),
        Padding(
            padding:  EdgeInsets.only(top: 0.0,bottom: 5.0),
            child:
            Text('Main Services',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Righteous-Regular',
              ),
            )),
        MainServices(),
        Padding(
            padding:  EdgeInsets.only(top: 10.0,bottom: 5.0),
          child:
          Text('Extra Services',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Righteous-Regular'
              ),
        )),
        Expanded(child: ExtraServices()),
        ]
      ),
    );
  }
}
