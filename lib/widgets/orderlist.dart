import 'package:flutter/material.dart';

class Listorders extends StatelessWidget {
  const Listorders({
    super.key,
    required this.name, required this.price,
  });
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 30,),
        Text(name),
        const SizedBox(height: 10,width: 20,),
        Text(price)
      ],
    );
  }
}

List<String> order = ["Iphone", "Sammsong", "Oppo", "Nokia", "xaomi"];
List<String> price = ["6000 LE", "5000 LE", "2000 LE", "3000 LE","4000 LE"];

String sortorder() {
  order.sort();
  return order.toString();
}

String sortprice() {
  price.sort();
  return price.toList().toString();
}
