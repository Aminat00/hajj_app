import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/umrah_steps_card.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/umrah_steps_tile.dart';
import 'package:hajj_app/models/umrah_list.dart';
import 'package:hajj_app/reusable_widgets/umrah_card.dart';
import 'package:hajj_app/services/umrah_service.dart';

import '../../../../models/umrah.dart';

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
                    _umrah(list.prepare, 'Prepare'),
                    _umrah(list.ihram, 'Ihram'),
                    _umrah(list.tawafAlUmrah, 'Tawah al Umrah'),
                    _umrah(list.sai, 'Sa\'i'),
                    _umrah(list.halqOrTaqsir, 'Halq or Taqsir'),
                    _umrah(list.mabrook, 'Mabrook!'),
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


  _umrah(List<Umrah> umrah, String category) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Align(
          alignment:Alignment.center ,
        child:Text(category, style: Theme
            .of(context)
            .textTheme
            .headline5,),
    )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (umrah[index].card_title != null) {
                return _umrahCard(umrah[index], index);
              } else {
                return _umrahTile(umrah[index], index);
              }
            },
            childCount: umrah.length,
          ),
        ),
      ],
    );
  }

  _umrahCard(Umrah umrah, int index) {
    if (umrah.card_title != null && umrah.card_text != null) {
      return InkWell(
          onTap:  () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) => UmrahStepsCard(umrah: umrah))),
   child: umrahCard(umrah.card_title, umrah.card_text, umrah.card_img));
    }
  }

  _umrahTile(Umrah umrah, int index) {
    if (umrah.list_tile_text!=null) {
      return  InkWell(
          onTap:  () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) => UmrahStepsTile(umrah: umrah))),
          child: Card(
            color: Colors.white,
            elevation: 7.0,
            margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
        child: ListTile(
          title: Text(umrah.list_tile_text!,
          style: Theme.of(context).textTheme.bodyText1,),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.teal,
          ),
        ),
      ));
    }
  }
}
