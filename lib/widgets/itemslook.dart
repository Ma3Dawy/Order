import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/box/conbox.dart';
import 'listitem.dart';

class Itemslook extends StatelessWidget {
  const Itemslook({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Conbox(
              name: list[index]["name"],
              item: list[index]["item"],
            ));
  }
}
