import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderHajj extends StatefulWidget {
  const CarouselSliderHajj({Key? key}) : super(key: key);

  @override
  State<CarouselSliderHajj> createState() => _CarouselSliderHajjState();
}

class _CarouselSliderHajjState extends State<CarouselSliderHajj> {
  int _current =0;
  CarouselController buttonCarouselController = CarouselController();

  final List<String> images = [
    'assets/images/makkah1.jpg',
    'assets/images/makkah2.jpg',
    'assets/images/makkah3.jpg',
    'assets/images/madeenah1.jpg',
    'assets/images/madeenah2.jpg',
    'assets/images/madeenah3.jpg',
  ];

  final List<String> verses =[
    'Quran [2:125]',
    'Quran [2:158]',
    ' "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire."َ',
    'Quran[2:197]',
    'Quran[2:198]',
    'Quran[2:200]',

  ];


  List<Widget> generateImageTiles(){
    return images.map((element)=>Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
        Expanded(

      child:ColorFiltered(
    colorFilter: const ColorFilter.mode(
      Colors.black38,
      BlendMode.colorBurn,
    ),
      child: Image.asset(element,
          height: 180,
          fit:BoxFit.fill),
      ),
     ), ]
    )).toList();



  }
  @override
  Widget build(BuildContext context) {
    return Stack(
    children:[
        CarouselSlider(
        items: generateImageTiles(),
    options: CarouselOptions(
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 1.0,
    aspectRatio: 26/20,
    onPageChanged: (index,other){
    setState((){
    _current=index;
    });
    }
    )),
    AspectRatio(aspectRatio: 26/20,
    child: Center(
      child: Padding(
    padding: const EdgeInsets.all(10.0),
        child:Text(
          verses[_current],
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Righteous-Regular',
              color:Colors.white,
              fontSize: MediaQuery.of(context).size.width/15
          ),
        ),
    )
      
    ))

      ],

    );

  }
}
