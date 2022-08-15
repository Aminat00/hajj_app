import 'package:flutter/material.dart';
import 'package:hajj_app/hajj_app_theme.dart';

Card umrahCard(

  String? cardTitle,
  String? cardText,
    String? cardImg,
) {
  return Card(
    color: Colors.white,
    elevation: 7.0,
    margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child:
      Column(
        children: [
          ListTile(
            subtitle: Text(
              cardText!,
              style: HajjAppTheme.lightTextTheme.bodyText2,
            ),
            title: Text(
              cardTitle!,
              style: HajjAppTheme.lightTextTheme.headline3,
            ),
          ),
          if(cardImg != null && cardImg != '') ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(0.0), bottom: Radius.circular(15.0)),
            child: Image.network(cardImg,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
            ),
          ),
        ],
      )
    ),
  );
}
