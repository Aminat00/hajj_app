import 'package:flutter/material.dart';
import 'package:hajj_app/pages/HomePage/ServiceCard.dart';
class ExtraServices extends StatefulWidget {
  const ExtraServices({Key? key}) : super(key: key);

  @override
  State<ExtraServices> createState() => _ExtraServicesState();
}

class _ExtraServicesState extends State<ExtraServices> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: (1 / .8),
      crossAxisCount: 3,
      children: const [
         ServiceCard(
             containerWidth: 70,
             containerHeight: 50,
             nameImage: 'restaurant.jpg',
             nameEng: 'Eat'
         ),
          ServiceCard(
              containerWidth: 70,
              containerHeight: 50,
              nameImage: 'hotel.jpg',
              nameEng: 'Hotels'
          ),
          ServiceCard(
              containerWidth: 70,
              containerHeight: 50,
              nameImage: 'taxi.jpg',
              nameEng: 'Taxi'
          ),
      ServiceCard(
          containerWidth: 123,
          containerHeight: 50,
          nameImage: 'currency.jpg',
          nameEng: 'Currency'
      ),
      ServiceCard(
          containerWidth: 123,
          containerHeight: 50,
          nameImage: 'laundry.jpg',
          nameEng: 'Laundry'
      ),
      ServiceCard(
          containerWidth: 123,
          containerHeight: 50,
          nameImage: 'guide.jpg',
          nameEng: 'Guide me'
      ),
        ],
      );
  }
}
