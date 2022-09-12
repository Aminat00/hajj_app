import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/duas_screen.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/signin_screen.dart';
import 'package:hajj_app/hajj_app_theme.dart';
import '../features/dashboard/presentation/screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';

import 'features/dashboard/presentation/screen/umrah_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,);
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   // final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = HajjAppTheme.light();
    return MaterialApp(
      title: 'Hajj Application',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const  MyHomePage(),
        '/homepage': (context) => const  MyHomePage(),
        '/dashboard': (context) => const  MyHomePage(),
        '/duas': (context) => const DuasScreen(),
        '/howtodo': (context) => const  UmrahScreen(),
        '/signin': (context) => const  SignInScreen(),

      },

    );



  }
}

// home:  FutureBuilder(
//   future: _fbApp, builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
// if (snapshot.hasError) {
//   print('You have an error &{snapshot.error.toString()}');
//   return const Text('Something went wrong');
// }
// else if (snapshot.hasData) {
//   return const MyHomePage(title: 'Hajj Demo page');
// } else {
//   return const Center(
//       child: CircularProgressIndicator()
//   );
// }}
// )


