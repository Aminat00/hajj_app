import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String nameImage;
  final String nameEng;
  final String? nameAr;
  final String? centeredText;
  const ServiceCard(
      {Key? key,
        required this.imageWidth,
        required this.imageHeight,
        required this.nameImage,
        required this.nameEng,
        this.nameAr,
        this.centeredText,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageAddress = "assets/images/";
    return Card(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Stack(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
        Colors.black38,
          BlendMode.colorBurn,
        ),
        child: Image.asset(imageAddress + nameImage,
          height: imageWidth,
          width: imageWidth,
          fit:BoxFit.cover,), ),),
      AspectRatio(aspectRatio: 26/20,
        child: Center (
         child:Text(nameEng,
           style: Theme.of(context).textTheme.headline2,
         ),
       ))
           ],

    ),
      ));
  }
}
