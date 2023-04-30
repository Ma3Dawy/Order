import 'package:flutter/cupertino.dart';

import 'orderlist.dart';

class Orderlist extends StatelessWidget {
  const Orderlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) => Listorders(
              name: order[index],
              price: price[index],
            ));
  }
}
