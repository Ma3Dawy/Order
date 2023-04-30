import 'package:flutter/material.dart';

import '../box/forgetbox.dart';

// ignore: must_be_immutable
class Forgetscreen extends StatelessWidget {
   const Forgetscreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    body: ListView(
      scrollDirection: Axis.vertical,
      children:  [
        Countrybox()
      ],
    )
    );
  }
}
