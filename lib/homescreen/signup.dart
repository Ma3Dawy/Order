import 'package:flutter/material.dart';
import 'package:flutter_application_1/box/sinupbox.dart';
import 'package:flutter_application_1/homescreen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: must_be_immutable
class Signup extends StatelessWidget {
final SharedPreferences sharedPreferences;
   const Signup({
    super.key, required this.sharedPreferences,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(" Sing up "),
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Loginscreen(sharedPreferences:sharedPreferences, ),
                    ));
              },
              icon: const Icon(Icons.arrow_back))),
      body: ListView(
        scrollDirection: Axis.vertical,
        children:   [
          Singupbox(sharedPreferences: sharedPreferences,),
        ],
      ),
    );
  }
}
