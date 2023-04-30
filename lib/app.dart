import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen/splashscreeb.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),                                                                                                                                                                                                                                                                                                                                                                                                                                              ); }
}