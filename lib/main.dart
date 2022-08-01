import 'package:flutter/material.dart';
import '../features/dashboard/presentation/screen/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

