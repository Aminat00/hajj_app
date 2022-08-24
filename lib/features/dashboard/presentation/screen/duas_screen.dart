import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/dua_screen.dart';
import 'package:hajj_app/services/quran_service.dart';

import 'package:hajj_app/models/dua.dart';

class DuasScreen extends StatefulWidget {
  const DuasScreen({Key? key}) : super(key: key);

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  late Future<List<Dua>> _futureDuas;

  @override
  void initState() {
    _futureDuas = QuranService.fetchDuas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 237, 229, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Duas',
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _futureDuas,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error fetching duas : ${snapshot.error.toString()}");
                } else if (snapshot.hasData) {
                  if (snapshot.data is List<Dua>) {
                    return _duas(snapshot.data as List<Dua>);
                  } else {
                    return const CircularProgressIndicator();
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _duas(List<Dua> duas) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: duas.length + 1,
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white,
                trailing: const Icon(Icons.search_outlined),
                title: const Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(6.0),
              child: _duaTile(duas[index - 1], index),
            ),
    );
  }

  _duaTile(Dua dua, int index) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) => DuaScreen(dua: dua))),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                  ),
                  child: Center(
                      child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dua.enName,
                            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                          Text(
                            '${dua.reference}',
                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        dua.name,
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
