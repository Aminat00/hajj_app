import 'package:flutter/material.dart';
import 'package:hajj_app/pages/HomePage/ServiceCard.dart';


class MainServices extends StatefulWidget {
  const MainServices({Key? key}) : super(key: key);

  @override
  State<MainServices> createState() => _MainServicesState();
}

class _MainServicesState extends State<MainServices> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ServiceCard(
            containerWidth: 160,
            containerHeight: 115,
            nameImage: 'dua.jpg',
            nameEng: 'Duas',
            ),
        ServiceCard(
            containerWidth: 220,
            containerHeight: 115,
            nameImage: 'hajj.webp',
            nameEng: 'Hajj',
            ),
              ],
            );

  }
}
