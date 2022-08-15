import 'package:flutter/material.dart';
import 'package:hajj_app/models/umrah.dart';


class UmrahStepsCard extends StatelessWidget {
  final Umrah umrah;
  const UmrahStepsCard({Key? key, required this.umrah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 237, 229, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:Text(umrah.card_title!,
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
                if(umrah.title_no1 != null && umrah.title_no1 != '') Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                child:  Text(
                  umrah.title_no1!,
                  style: Theme.of(context).textTheme.headline3,
                ),
                ),
                if(umrah.body_text1 != null && umrah.body_text1 != '') Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    umrah.body_text1!,
                    style: Theme.of(context).textTheme.bodyText2,
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

                if(umrah.warning_text != null && umrah.warning_text!= '') Card(
                    color: Colors.red[300],
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      leading:  Icon(
                          Icons.warning,color: Colors.red[900]
                      ),
                      title: Text(
                        umrah.warning_text!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                if(umrah.img1 != null && umrah.img1 != '') Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(umrah.img1!,
                        height: 200,
                        width: 330,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Divider(
                      height: 36,
                      thickness: 2,
                    ),
                  ],
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

                if(umrah.title_no2 != null && umrah.title_no2 != '') Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                    umrah.title_no2!,
                    style:Theme.of(context).textTheme.headline3,
                ),
                  ),
                if(umrah.body_text2 != null && umrah.body_text2 != '') Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    umrah.body_text2!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                if(umrah.warning_text2 != null && umrah.warning_text2!= '') Card(
                  color: Colors.red[300],
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    leading:  Icon(
                        Icons.warning,color: Colors.red[900]
                    ),
                    title: Text(
                      umrah.warning_text2!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                if(umrah.img2 != null && umrah.img2 != '') Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(umrah.img2!,
                        height: 200,
                        width: 330,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Divider(
                      height: 36,
                      thickness: 2,
                    ),
                  ],
                ),

                if(umrah.title_no3 != null && umrah.title_no3 != '') Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    umrah.title_no3!,
                    style:Theme.of(context).textTheme.headline3,
                  ),
                ),
                if(umrah.body_text3 != null && umrah.body_text3 != '') Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    umrah.body_text3!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                if(umrah.img3 != null && umrah.img3 != '') ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(umrah.img3!,
                    height: 200,
                    width: 330,
                    fit: BoxFit.fill,
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
