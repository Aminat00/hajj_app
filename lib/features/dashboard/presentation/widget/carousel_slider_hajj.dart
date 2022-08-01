import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_controller.dart';

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

  final List<String> ayats =[
    'Quran [2:125]',
    'Quran [2:158]',
    '۞ يَسْـَٔلُونَكَ عَنِ ٱلْأَهِلَّةِ ۖ قُلْ هِىَ مَوَٰقِيتُ لِلنَّاسِ وَٱلْحَجِّ ۗ وَلَيْسَ ٱلْبِرُّ بِأَن تَأْتُوا۟ ٱلْبُيُوتَ مِن ظُهُورِهَا وَلَـٰكِنَّ ٱلْبِرَّ مَنِ ٱتَّقَىٰ ۗ وَأْتُوا۟ ٱلْبُيُوتَ مِنْ أَبْوَٰبِهَا ۚ وَٱتَّقُوا۟ ٱللَّهَ لَعَلَّكُمْ تُفْلِحُونَ',
    'Quran[2:197]',
    'Quran[2:198]',
    'Quran[2:200]',

  ];


  List<Widget> generateImageTiles(){
    return images.map((element)=>Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children:[
        Expanded(

      child:Image.asset(element,
          height: 180,
          fit:BoxFit.fill),

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
    aspectRatio: 26/14,
    onPageChanged: (index,other){
    setState((){
    _current=index;
    });
    }
    )),
    AspectRatio(aspectRatio: 26/14,
    child: Center(
      child: Padding(
    padding: EdgeInsets.all(10.0),
        child:Text(
          ayats[_current],
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Righteous-Regular',
              color:Colors.white,
              fontSize: MediaQuery.of(context).size.width/25
          ),
        ),
    )
      
    ))

      ],

    );

  }
}
