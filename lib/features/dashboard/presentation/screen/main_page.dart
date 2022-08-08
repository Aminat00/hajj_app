import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/signin_screen.dart';

import 'home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final String title = 'Tawaf';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool show404 = false;

  static const List<Widget> _items = [
    Home(),
    Text('Index2: "Tasks"'),
    Text('Index2: "Tasks"'),
  ];

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: const Color(0x44000000),
        backgroundColor: Colors.teal,
        elevation: 10,
        title: Text(widget.title, style: Theme.of(context).textTheme.headline2),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.account_circle_outlined, color: Colors.white,)),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _items),

      bottomNavigationBar: showBottomNav(),
    );
  }

  Widget showBottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF8AD7C7),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_on,
          ),
          label: 'Places',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt),
          label: 'Agenda',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.white,
      onTap: _onTap,
    );
  }
}
