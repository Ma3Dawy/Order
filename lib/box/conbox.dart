import 'package:flutter/material.dart';

class Conbox extends StatelessWidget {
  final String? name;
  final String? item;
  const Conbox({super.key,this.name, this.item,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundColor: Colors.white),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  Text(item!,style: const TextStyle(color: Colors.white),)
                ],
              )
            ],
          ),
          const Icon(Icons.more_vert_rounded,color: Colors.white,)
        ],
      ),
    );
  }
}
