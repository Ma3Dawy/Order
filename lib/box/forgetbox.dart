import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/box/custemtextfield.dart';

import '../widgets/country.dart';

class Countrybox extends StatelessWidget {
   Countrybox({super.key});
  final phone = TextEditingController();
  final validkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: validkey,
      child: Column(
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIbYzDjnJ--xM6Fkg8Ia5CQXZt8BCqC1rSDHxDFJ2u5OEdyNm7fArufDFxYajYMxo2b-g&usqp=CAU"),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            "Yall Delivery Restrurant",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text("Please Enter Your Phone Number to send code")),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Country(),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Coustemtextfield(
                maxlenght: 11,
                controlar: phone,
                hinttext: "",
                maxline: 1,
                labelText: "Phone Number",
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
            ),
            )
          ]),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                validkey.currentState!.validate() == true;
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              child: const Text("Send"))
        ],
      ),
    );
  }
}
