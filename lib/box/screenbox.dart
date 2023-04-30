import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custemtextfield.dart';

class Screenwidget extends StatelessWidget {
   Screenwidget({super.key});
  final username = TextEditingController();

  final phone = TextEditingController();

  // ignore: non_constant_identifier_names
  final Addrase = TextEditingController();

  final validkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: validkey,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            height: 240,
            child: Stack(
              children: const <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 200,
                    backgroundImage: NetworkImage(
                      "https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/313973036_660498005719903_3162242604617531209_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_eui2=AeErLV-R4VOkbBITghO3SbDH9_JQBn6KcEr38lAGfopwSuMtl9shsc3_wwOkvGG23FCMxxnEEZHKzM3FGkgN6Zl8&_nc_ohc=CBEMcWx30swAX_LyJnY&_nc_ht=scontent.fcai19-4.fna&oh=00_AfCPQfBOyOYFlEZBON3GM3HJW7x2VDx-ZeRNseBx4mnFKw&oe=64505930",
                    )),
                Positioned(
                    bottom: 15,
                    right: 90, //give the values according to your requirement
                    child: CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text("Ahmed Hamdy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45))),
          const SizedBox(
            height: 30,
          ),
          const Center(child: Text("ElWaraq")),
          Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Restruant name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Coustemtextfield(
                    controlar: username,
                    hinttext: "",
                    labelText: "",
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please Enter Number";
                      }
                      return null;
                    },
                  )
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Coustemtextfield(
                    maxlenght: 11,
                    controlar: phone,
                    hinttext: "",
                    pref: "02  ",
                    labelText: "",
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (p0) {
                      if (!p0!.startsWith("012") &&
                          !p0.startsWith("010") &&
                          !p0.startsWith("011") &&
                          !p0.startsWith("015")) {
                        return "Please Enter Valid Number";
                      }
                      if (p0.isNotEmpty && p0.length < 11) {
                        return "Your Number is less than 11 number";
                      }
                      if (p0.isNotEmpty && p0.length == 11) {
                        return null;
                      }
                      if (p0.isNotEmpty && p0.length > 11) {
                        return "Your Number is Overflow";
                      }

                      if (p0.isEmpty) {
                        return "Please Enter Phone Number";
                      }
                      return null;
                    },
                  )
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Addrase",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Coustemtextfield(
                    controlar: Addrase,
                    hinttext: "",
                    labelText: "",
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please Enter Number";
                      }
                      return null;
                    },
                  )
                ],
              )),
          ElevatedButton(
            onPressed: () {
              if (validkey.currentState!.validate() == true) {}
            },
            style: const ButtonStyle(
              iconSize: MaterialStatePropertyAll(150),
              backgroundColor: MaterialStatePropertyAll(Colors.brown),
            ),
            child: const Text("Confirm"),
          )
        ],
      ),
    );
  }

}
