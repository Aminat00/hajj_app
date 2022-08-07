import 'package:flutter/material.dart';
import 'package:hajj_app/MainPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hajj Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Navigator(
        pages:[
          MaterialPage(child:  MyHomePage(title: 'Hajj Demo page'),)
        ],
        // onPopPage: (route,result)=> route.didPop(result),
      )

    );
  }
}

