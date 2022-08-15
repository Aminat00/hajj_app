import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/duas_screen.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/umrah_screen.dart';
import 'service_card.dart';

class MainServices extends StatefulWidget {
  const MainServices({Key? key}) : super(key: key);

  @override
  State<MainServices> createState() => _MainServicesState();
}

class _MainServicesState extends State<MainServices> {
  @override
  Widget build(BuildContext context) {
    return Column(

        children: [

           ServiceCard(
            imageWidth: double.infinity,
            imageHeight: 95,
            nameImage: 'hajj.webp',
            nameEng: 'Umrah',
            onTap:() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UmrahScreen(),
              ),
            ), 
          ),
          ServiceCard(
            imageWidth: double.infinity,
            imageHeight: 95,
            nameImage: 'dua.jpg',
            nameEng: 'Duas',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DuasScreen(),
              ),
            ),
          ),
    ]
      );
  }
}
