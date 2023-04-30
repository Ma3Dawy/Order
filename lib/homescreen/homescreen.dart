import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen/screen1.dart';
import 'package:flutter_application_1/homescreen/screen2.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/loginmodel.dart';

// ignore: must_be_immutable
StateProvider<int> counter = StateProvider<int>((ref) => 0);

// ignore: must_be_immutable
class Homescreen extends ConsumerWidget {
  final LogInModel user;
  final SharedPreferences sharedPreferences;

  Homescreen({super.key, required this.user, required this.sharedPreferences});

  List<Widget> lis = [const Screen2(), const Screen1()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counter);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home")  ,
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
            ],
            currentIndex: count,
            onTap: (v) {
              ref.watch(counter.notifier).state = v;
            },
            backgroundColor: Colors.orange),
        appBar: AppBar(
          title: const Text("Home Screen"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        drawer: Drower(
          sharedPreferences: sharedPreferences,
          user: user,
        ),
        body: lis[count]);
  }
}
