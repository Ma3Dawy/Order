import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/orderlist.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

StateProvider<String> countproviderr = StateProvider((ref) => "Sort Name");
StateProvider<String> coun = StateProvider((ref) => "");

// ignore: must_be_immutable
class Orderscreen extends ConsumerWidget {
  Orderscreen({super.key});

  List<String> itemdata = ["Sort Name", "Sort Price"];

  @override
  // ignore: avoid_renaming_method_parameters, avoid_types_as_parameter_names, non_constant_identifier_names
  Widget build(BuildContext context, WidgetRef ref) {
    String counter = ref.watch(countproviderr);
    return Scaffold(
      appBar: AppBar(
            actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () => ref.invalidate(coun), icon: Icon(Icons.replay_outlined)),
                DropdownButton(
                  value: counter,
                  items: itemdata
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )))
                      .toList(),
                  onChanged: (item) {
                    ref.watch(countproviderr.notifier).state = item!;
                  },
                ),
              ],
            )
          ]),
      body: TextButton(
        onPressed: () {
          if (counter == "Sort Name") {
            ref.watch(coun.notifier).state = sortorder();
          }
          if (counter == "Sort Price") {
            ref.watch(coun.notifier).state = sortprice();
          } 
        },
        child: ListView.builder(
            itemCount: order.length,
            itemBuilder: (context, index) => Listorders(
                  name: order[index],
                  price: price[index],
                )),
      ),
    );
  }
}
