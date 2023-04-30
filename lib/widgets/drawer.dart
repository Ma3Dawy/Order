import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen/loginscreen.dart';
import 'package:flutter_application_1/homescreen/orderscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginmodel.dart';

// ignore: must_be_immutable
final validkeyy = GlobalKey<FormState>();

class Drower extends StatelessWidget {
  const Drower(
      {super.key, required this.user, required this.sharedPreferences});
  final LogInModel user;
  final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: validkeyy,
      child: Drawer(
        backgroundColor: Colors.orange,
        child: DrawerHeader(
            child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              height: 40,
              decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white,borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text(user.username!,style: const TextStyle(fontWeight:FontWeight.bold),)),

            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text("Home"),
              subtitle: const Text("The Best Restruent Ever"),
              trailing: const Icon(Icons.fastfood_sharp),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Order Page"),
              subtitle: const Text("The Best Restruent Ever"),
              trailing: const Icon(Icons.fastfood_sharp),
              leading: const Icon(Icons.fastfood),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Orderscreen(),
                    ));
              },
            ),
            ListTile(
              title: const Text("Log out"),
              leading: const Icon(Icons.logout),
              onTap: () {
                sharedPreferences.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Loginscreen(sharedPreferences: sharedPreferences)),
                    (route) => false);
              },
            ),
          ],
        )),
      ),
    );
  }
}
