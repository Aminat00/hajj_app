import 'package:firebase_auth/firebase_auth.dart';
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
      backgroundColor: Color.fromRGBO(243, 237, 229, 1),
      endDrawer: _drawer(context),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 10,
        title: Text(widget.title, style: Theme.of(context).textTheme.headline2),
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

  _drawer(BuildContext context) {
    return Drawer(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _drawerContent(context),
        ),
      ),
    );
  }

  _drawerContent(BuildContext context) {
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
    User? currentUser;
    if (isLoggedIn) {
      currentUser = FirebaseAuth.instance.currentUser;
    }

    if (!isLoggedIn) {
      return [
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('Log in'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          ).then((value) => setState(() {})),
        ),
      ];
    } else {
      return [
        Text(currentUser?.displayName ?? ''),
        const SizedBox(height: 10),
        Text(currentUser?.email ?? ''),
        const SizedBox(height: 10),
        Divider(
          thickness: 2,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app_outlined),
          title: const Text('Log out'),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            setState(() {});
          },
        ),
      ];
    }
  }
}
