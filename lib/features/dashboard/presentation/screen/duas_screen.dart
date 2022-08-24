import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/dua_screen.dart';
import 'package:hajj_app/services/quran_service.dart';

import 'package:hajj_app/models/dua.dart';
import 'package:hajj_app/services/user_service.dart';

class DuasScreen extends StatefulWidget {
  const DuasScreen({Key? key}) : super(key: key);

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  TextEditingController editingController = TextEditingController();

  List<Dua> duplicateItems = [];
  List<Dua> items = [];

  late Future<List<Dua>> _futureDuas;
  List<int>? _futureFavourites;
  bool didAddFav = false;
  bool isFirstBuild = true;

  User? get _user => FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _futureDuas = QuranService.fetchDuas();
    if (_user != null) {
      UserService.fetchFavourite(_user!.uid).then((value) {
        _futureFavourites = value;
        setState(() {});
      });
    }
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
                    if (isFirstBuild) {
                      duplicateItems = snapshot.data as List<Dua>;
                      items.addAll(duplicateItems);
                      isFirstBuild = false;
                    }
                    return _duas();
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

  _duas() {
    if (_futureFavourites != null && !didAddFav) {
      for (var duaIndex in _futureFavourites!) {
        items[duaIndex].changeFavourite();
      }
      didAddFav = true;
    }
    int index = 0;
    for (var dua in items) {
      if (dua.originalIndex == null) {
        dua.originalIndex = index;
        index++;
      }
    }
    items.sort((a, b) => b.favourite ? 1 : -1);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length + 1,
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white,
                trailing: const Icon(Icons.search_outlined),
                title: TextField(
                  controller: editingController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  onChanged: filterSearchResults,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(6.0),
              child: _duaTile(
                items[index - 1],
                index,
                () {
                  if (_user != null) {
                    if (!items[index - 1].favourite) {
                      items[index - 1].changeFavourite();
                      UserService.addFavourite(_user!.uid, items[index - 1].originalIndex!);
                      setState(() {});
                    } else {
                      items[index - 1].changeFavourite();
                      UserService.removeFavourite(_user!.uid, items[index - 1].originalIndex!);
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You need to be logged in to add dua to favourites'),
                      ),
                    );
                  }
                },
              ),
            ),
    );
  }

  _duaTile(Dua dua, int index, Function onFav) {
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
                    index.toString(),
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
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  onFav.call();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    dua.favourite ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterSearchResults(String query) {
    List<Dua> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<Dua> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.enName.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }
}
