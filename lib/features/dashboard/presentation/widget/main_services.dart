import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/duas_screen.dart';
import 'service_card.dart';

class MainServices extends StatefulWidget {
  const MainServices({Key? key}) : super(key: key);

  @override
  State<MainServices> createState() => _MainServicesState();
}

class _MainServicesState extends State<MainServices> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          ServiceCard(
            imageWidth: 170,
            imageHeight: 130,
            nameImage: 'dua.jpg',
            nameEng: 'Duas',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DuasScreen(),
              ),
            ),
          ),
           ServiceCard(
            imageWidth: 200,
            imageHeight: 130,
            nameImage: 'hajj.webp',
            nameEng: 'Umrah',
            onTap:() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DuasScreen(),
              ),
            ), 
          ),
        ],
      ),
    ]);
  }
}
