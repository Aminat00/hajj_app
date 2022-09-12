import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/umrah_steps_card.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/umrah_steps_tile.dart';
import 'package:hajj_app/models/umrah_list.dart';
import 'package:hajj_app/reusable_widgets/umrah_card.dart';
import 'package:hajj_app/services/umrah_service.dart';

import '../../../../models/umrah.dart';
import '../widget/service_card.dart';

class UmrahScreen extends StatefulWidget {
  const UmrahScreen({Key? key}) : super(key: key);

  @override
  State<UmrahScreen> createState() => _UmrahScreenState();
}

class _UmrahScreenState extends State<UmrahScreen> {
  late Future<UmrahList?> _futureUmrah;

  @override
  void initState() {
    _futureUmrah = UmrahService.fetchUmrah();
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
          'Umrah',
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: FutureBuilder(
          future: _futureUmrah,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
                "Error fetching umrah processes: ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            if (snapshot.data is UmrahList) {
              final UmrahList list = snapshot.data as UmrahList;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('1.Prepare',
                            style: Theme.of(context).textTheme.headline5)),
                    ServiceCard(
                        imageWidth: double.infinity,
                        imageHeight: 250,
                        nameImage: 'prepare.jpg',
                        nameEng: 'Click to know more',
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UmrahScreen2(
                                  umrah: list.prepare, category: 'Prepare');
                            }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('2.Ihram',
                            style: Theme.of(context).textTheme.headline5)),
                    ServiceCard(
                        imageWidth: double.infinity,
                        imageHeight: 250,
                        nameImage: 'ihram.webp',
                        nameEng: 'Click to know more',
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UmrahScreen2(
                                  umrah: list.ihram, category: 'Ihram');
                            }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('3.Tawah al-Umrah',
                            style: Theme.of(context).textTheme.headline5)),
                    ServiceCard(
                        imageWidth: double.infinity,
                        imageHeight: 250,
                        nameImage: 'tawaf.jpg',
                        nameEng: 'Click to know more',
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UmrahScreen2(
                                  umrah: list.tawafAlUmrah,
                                  category: 'Tawah_al_Umrah');
                            }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('4.Sa\'i',
                            style: Theme.of(context).textTheme.headline5)),
                    ServiceCard(
                        imageWidth: double.infinity,
                        imageHeight: 250,
                        nameImage: 'sai.jpg',
                        nameEng: 'Click to know more',
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UmrahScreen2(
                                  umrah: list.sai, category: 'Sa\'i');
                            }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('5.Halq and Taqsir',
                            style: Theme.of(context).textTheme.headline5)),
                    ServiceCard(
                        imageWidth: double.infinity,
                        imageHeight: 250,
                        nameImage: 'halq.webp',
                        nameEng: 'Click to know more',
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UmrahScreen2(
                                  umrah: list.halqOrTaqsir,
                                  category: 'Halq or Taqsir');
                            }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text('6.Mabrook!',
                            style: Theme.of(context).textTheme.headline5)),
                    ServiceCard(
                        imageWidth: double.infinity,
                        imageHeight: 250,
                        nameImage: 'mabrook.jpg',
                        nameEng: '',
                        onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UmrahScreen2(
                                  umrah: list.mabrook, category: 'Mabrook!');
                            }))),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class UmrahScreen2 extends StatelessWidget {
  const UmrahScreen2({Key? key, required this.umrah, required this.category})
      : super(key: key);

  final List<Umrah> umrah;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 237, 229, 1),
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                category,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (umrah[index].card_title != null) {
                  return _umrahCard(umrah[index], index, context);
                } else {
                  return _umrahTile(umrah[index], index, context);
                }
              },
              childCount: umrah.length,
            ),
          ),
        ],
      ),
    );
  }

  _umrahCard(Umrah umrah, int index, BuildContext context) {
    if (umrah.card_title != null && umrah.card_text != null) {
      return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UmrahStepsCard(umrah: umrah))),
          child: umrahCard(umrah.card_title, umrah.card_text, umrah.card_img));
    }
  }

  _umrahTile(Umrah umrah, int index, BuildContext context) {
    if (umrah.list_tile_text != null) {
      return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UmrahStepsTile(umrah: umrah))),
          child: Card(
            color: Colors.white,
            elevation: 7.0,
            margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                umrah.list_tile_text!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.teal,
              ),
            ),
          ));
    }
  }
}
