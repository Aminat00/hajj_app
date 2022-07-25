import 'package:flutter/material.dart';
class AllDuas extends StatefulWidget {
  const AllDuas({Key? key}) : super(key: key);

  @override
  State<AllDuas> createState() => _AllDuasState();
}



class _AllDuasState extends State<AllDuas> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 70,
          color: Colors.green[colorCodes[index]],
          child: Center(child: (Text('Dua ${entries[index]}')),)
        );
      },
      
    );
  }


}
