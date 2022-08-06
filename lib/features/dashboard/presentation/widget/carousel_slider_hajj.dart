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
    'And [mention] when We made the House [i.e., the Kaʿbah] a place of return for the people and [a place of] security. And take, [O believers], from the standing place of Abraham a place of prayer. And We charged Abraham and Ishmael, [saying], "Purify My House for those who perform ṭawāf1 and those who are staying [there] for worship and those who bow and prostrate [in prayer]." Quran [2:125]',
    'Indeed, the hills of Ṣafa and Marwah are among the symbols of Allah. So whoever performs the pilgrimage or minor pilgrimage,2 let them walk between ˹the two hills˺. And whoever does good willingly, Allah is truly Appreciative, All-Knowing. Quran [2:158]',
    ' "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire."َ',
    '˹Commitment to˺ pilgrimage is made in appointed months.1 Whoever commits to ˹performing˺ pilgrimage, let them stay away from intimate relations, foul language, and arguments during pilgrimage. Whatever good you do, Allah ˹fully˺ knows of it. Take ˹necessary˺ provisions ˹for the journey˺—surely the best provision is righteousness. And be mindful of Me, O  people of reason! Quran[2:197]',
    'There is no blame on you for seeking the bounty of your Lord ˹during this journey˺.1 When you return from ’Arafât,2 praise Allah near the sacred place3 and praise Him for having guided you, for surely before this ˹guidance˺ you were astray. Quran[2:198]',
    'And remember Allah during ˹these˺ appointed days.1 Whoever departs swiftly on the second day is not sinful, neither are those who stay behind ˹till the third—seeking additional reward˺, so long as they are mindful ˹of their Lord˺. And be mindful of Allah, and know that to Him you will ˹all˺ be gathered Quran[2:203]',

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
        autoPlayInterval: const Duration(seconds: 15),
        autoPlayAnimationDuration: const Duration(milliseconds: 900),
        autoPlayCurve: Curves.easeInOutBack,
    enlargeCenterPage: true,
    viewportFraction: 1.0,
    aspectRatio: 33/28,
    onPageChanged: (index,other){
    setState((){
    _current=index;
    });
    }
    )),
    AspectRatio(aspectRatio: 33/28,
    child: Center(
      child: Padding(
    padding: const EdgeInsets.all(10.0),
        child:Text(
          verses[_current],
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Righteous-Regular',
              color:Colors.white,
              fontSize: MediaQuery.of(context).size.width/20
          ),
        ),
    )
      
    ))

      ],

    );

  }
}
