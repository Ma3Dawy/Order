import 'package:flutter/material.dart';
import 'package:flutter_application_1/box/screenbox.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Screenwidget(),
        ],

      ),
    );
  }
}
