import 'package:flutter/material.dart';
import 'package:hajj_app/models/dua.dart';

class DuaScreen extends StatelessWidget {
  final Dua dua;
  const DuaScreen({Key? key, required this.dua}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 237, 229, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(dua.enName),
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
                Text(
                  dua.body,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Divider(
                  height: 36,
                  thickness: 2,
                ),
                Text(
                  dua.enBody,
                  style: TextStyle(color: Colors.black),
                ),
                Divider(
                  height: 36,
                  thickness: 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dua.reference,
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
