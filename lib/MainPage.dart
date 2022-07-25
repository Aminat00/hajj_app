import 'package:flutter/material.dart';
import 'package:hajj_app/pages/HomePage/Home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex=0;
  String? _selectedItem;
  String? _selectedRoute;
  bool show404 = false;

  static const List<Widget> _items =[
    Home(),
    Text('Index1: "Location"'),
    Text('Index2: "Tasks"'),
    Text('Index3: "Social"'),
  ];

  void _onTap(int index)
  {
    _selectedIndex=index;
    setState((){

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: IndexedStack(
            index:_selectedIndex,
            children:_items
        ),

      bottomNavigationBar: ShowBottomNav(),
    );
  }

  Widget ShowBottomNav()
  {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_on,
          ),
          label:'Places',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt),
          label:'Amal',
        ),
        BottomNavigationBarItem(
          icon:Icon(
            Icons.forum,
          ),
          label:'Dua',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }
}


