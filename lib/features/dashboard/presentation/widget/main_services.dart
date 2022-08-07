import 'package:flutter/material.dart';
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
      children:[
    Row(
    children: const [
    ServiceCard(
    imageWidth: 170,
      imageHeight: 130,
      nameImage: 'dua.jpg',
      nameEng: 'Duas',
    ),
    ServiceCard(
    imageWidth: 200,
    imageHeight: 130,
    nameImage: 'hajj.webp',
    nameEng: 'Umrah',
    ),
    ],
    ),
        ]
    );

  }
}
