import 'package:flutter/material.dart';

class AllSupplications extends StatefulWidget {
  const AllSupplications({Key? key}) : super(key: key);

  @override
  State<AllSupplications> createState() => _AllSupplicationsState();
}

class _AllSupplicationsState extends State<AllSupplications> {
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
            child: Center(
              child: (Text('Dua ${entries[index]}')),
            ));
      },
    );
  }
}
