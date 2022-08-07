import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/supplications.dart';
import 'package:hajj_app/hajj_app_theme.dart';
import '../features/dashboard/presentation/screen/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';

import 'features/dashboard/presentation/screen/process.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp(
   //   options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = HajjAppTheme.light();
    return MaterialApp(
      title: 'Hajj Application',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:  FutureBuilder(
        future: _fbApp, builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
      if (snapshot.hasError) {
        print('You have an error &{snapshot.error.toString()}');
        return const Text('Something went wrong');
      }
      else if (snapshot.hasData) {
        return const MyHomePage(title: 'Hajj Demo page');
      } else {
        return const Center(
            child: CircularProgressIndicator()
        );
      }}
      )
    );

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const  MyHomePage(title: 'Hajj Demo page'),
      //   '/homepage': (context) => const  MyHomePage(title: 'Hajj Demo page'),
      //   '/dashboard': (context) => const  MyHomePage(title: 'Hajj Demo page'),
      //   '/supplications': (context) => const Supplications(),
      //   '/howtodo': (context) => const  Process(),
      // },

  }
}



