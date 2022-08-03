import 'package:flutter/material.dart';
import 'package:hajj_app/hajj_app_theme.dart';
import '../features/dashboard/presentation/screen/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (context) => const  MyHomePage(title: 'Hajj Demo page'),
        '/homepage': (context) => const  MyHomePage(title: 'Hajj Demo page'),
        '/dashboard': (context) => const  MyHomePage(title: 'Hajj Demo page'),
      },

    );
  }
}

