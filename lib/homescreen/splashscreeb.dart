import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen/homescreen.dart';
import 'package:flutter_application_1/homescreen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../box/local/shared_pref_local_storage_caller.dart';


class Splashscreen extends StatefulWidget {
    const Splashscreen({super.key,});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

@override
  void didChangeDependencies() async {
    // Future.delayed to navigate after 1 sec
    Future.delayed(const Duration(seconds: 1), () async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      await SharedPrefsLocalStorageCaller(sharedPreferences: sharedPreferences)
          .restoreUserData(
        key: 'user',
      )
          .then((user) {
        // debugPrint('user=$user');
        if (user != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Homescreen(
                    sharedPreferences: sharedPreferences,
                        user: user,
                      )),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Loginscreen(
                        sharedPreferences: sharedPreferences,
                        
                        
                      )),
              (route) => false);
        }
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIbYzDjnJ--xM6Fkg8Ia5CQXZt8BCqC1rSDHxDFJ2u5OEdyNm7fArufDFxYajYMxo2b-g&usqp=CAU",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
