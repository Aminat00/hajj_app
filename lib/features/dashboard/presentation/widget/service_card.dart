import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final String nameImage;
  final String nameEng;
  final String? nameAr;
  final String? centeredText;
  const ServiceCard(
      {Key? key,
        required this.containerWidth,
        required this.containerHeight,
        required this.nameImage,
        required this.nameEng,
        this.nameAr,
        this.centeredText,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/'+ nameImage))),
          child: Center(
              child: Text(nameEng,
                     style: const TextStyle(
                         fontSize: 20,
                         fontFamily: 'Righteous-Regular',
                     color: Colors.white,
                     shadows: <Shadow>[ Shadow(
                       offset: Offset(0.0, 0.0),
                       blurRadius: 3.0,
                       color: Color.fromARGB(255, 0, 0, 0),
                     ),
                       Shadow(
                         offset: Offset(0.0, 0.0),
                         blurRadius: 3.0,
                         color: Color.fromARGB(125, 0, 0, 255),
                       ),],)),
              ),
        ),

      ),
    );
  }
}
