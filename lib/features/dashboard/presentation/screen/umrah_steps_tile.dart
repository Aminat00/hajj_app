import 'package:flutter/material.dart';
import 'package:hajj_app/models/umrah.dart';

class UmrahStepsTile extends StatelessWidget {
  final Umrah umrah;

  const UmrahStepsTile({Key? key, required this.umrah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 237, 229, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:Text(umrah.list_tile_text!,
          style: Theme
              .of(context)
              .textTheme
              .headline6,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              children: [
                if(umrah.info_text != null && umrah.info_text != '') Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    umrah.info_text!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2,
                  ),
                ),
                if(umrah.intro_text != null && umrah.intro_text != '') Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      umrah.intro_text!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText2,
                    ),
                  ),

                if(umrah.point_text != null && umrah.point_text!= '') Card(
                    color: Colors.green[300],
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      leading:  Icon(
                          Icons.checklist,color: Colors.green[900]
                      ),
                      title: Text(
                        umrah.point_text!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                if(umrah.important_text != null && umrah.important_text != '') Card(
                  color: Colors.yellow,
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    leading:  Icon(
                      Icons.error, color: Colors.yellow.shade900,
                      size: 30,
                    ),
                    title: Text(
                      umrah.important_text!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                if(umrah.warning_text != null && umrah.warning_text != '') Card(
                    color: Colors.red,
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      leading:  Icon(
                        Icons.warning, color: Colors.red[900],
                        size:30,
                      ),
                      title: Text(
                        umrah.warning_text!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),

                if(umrah.arabic_text != null && umrah.arabic_text != '') Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        umrah.arabic_text!,
                        textAlign: TextAlign.center,
                        style:  Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    const Divider(
                      height: 30,
                      thickness: 2,
                    ),
                  ],
                ),

                if(umrah.transliteration != null && umrah.transliteration != '') Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          umrah.transliteration!,
                          style:  Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    const Divider(
                      height: 30,
                      thickness: 2,
                    ),
                  ],
                ),

                if(umrah.translation != null && umrah.translation != '') Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          umrah.translation!,
                          style:  Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    const Divider(
                      height: 36,
                      thickness: 2,
                    ),
                  ],
                ),

                if(umrah.img1 != null && umrah.img1 != '') ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(umrah.img1!,
                    height: 300,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                ),
                if(umrah.info_text2 != null && umrah.info_text2 != '') Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    umrah.info_text2!,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                  ),
                ),
                if(umrah.point_text2 != null && umrah.point_text2!= '') Card(
                  color: Colors.green[300],
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    leading:  Icon(
                        Icons.checklist,color: Colors.green[900]
                    ),
                    title: Text(
                      umrah.point_text2!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
