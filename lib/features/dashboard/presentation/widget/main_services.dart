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
    return Row(
      children: const [
        ServiceCard(
          imageWidth: 160,
          imageHeight: 115,
            nameImage: 'dua.jpg',
            nameEng: 'Duas',
            ),
        ServiceCard(
          imageWidth: 200,
          imageHeight: 115,
            nameImage: 'hajj.webp',
            nameEng: 'Hajj',
            ),
              ],
            );

  }
}
