// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/box/custemtextfield.dart';
import 'package:flutter_application_1/homescreen/loginscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local/shared_pref_local_storage_caller.dart';

final phone = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();
final repassword = TextEditingController();
final short = TextEditingController();
final salary = TextEditingController();
final vaildkey = GlobalKey<FormState>();
bool visable = true;
final StateProvider<bool> cheaker = StateProvider<bool>((ref) => true);
final StateProvider<bool> recheaker = StateProvider<bool>((ref) => true);
late final SharedPrefsLocalStorageCaller shared;

// ignore: camel_case_types
class Singupbox extends ConsumerWidget {
  const Singupbox({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool cheak = ref.watch(cheaker);
    final bool recheak = ref.watch(recheaker);
    return Form(
        key: vaildkey,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            const SizedBox(height: 20),
            Coustemtextfield(
              maxline: 1,
              controlar: phone,
              pref: "02  ",
              labelText: "Phone number",
              hinttext: "",
              maxlenght: 11,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              icon2: Icons.phone,
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
            const SizedBox(height: 20),
            Coustemtextfield(
              maxline: 1,
              controlar: email,
              hinttext: "",
              icon2: Icons.email,
              labelText: "Email",
              validator: (e) {
                if (!e!.contains("@")) {
                  return "Your Email is missing @";
                }
                if (!e.contains(".com")) {
                  return "Your Email is missing .com";
                }
                if (e.isEmpty) {
                  return "Please Enter Your Email";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Coustemtextfield(
              controlar: short,
              maxline: 5,
              labelText: "",
              hinttext: "Life Story",
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "Please Enter Your Stroy";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const Text("Keep it short,this is just a demo"),
            const SizedBox(height: 20),
            Coustemtextfield(
              controlar: salary,
              pref: "",
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              labelText: "Salary",
              hinttext: "",
              maxline: 1,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "Please Enter Your Salary";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Coustemtextfield(
              controlar: password,
              maxline: 1,
              counterText: "0/8",
              hinttext: "",
              labelText: "Password",
              obscure: cheak,
              validator: (pas) {
                if (pas!.isNotEmpty && pas.length < 8) {
                  return "Your Password is less than 8 number";
                }
                if (pas.isNotEmpty && pas.length == 8) {
                  return null;
                }
                if (pas.isNotEmpty && pas.length > 8) {
                  return "Your Password is Overflow";
                }

                if (pas.isEmpty) {
                  return "please Enter Your Password";
                }
                return null;
              },
              onTap: () {
                ref.watch(cheaker.notifier).state = !cheak;
              },
              suffixIcon: Icons.visibility,
            ),
            const SizedBox(height: 20),
            Coustemtextfield(
              controlar: repassword,
              maxline: 1,
              hinttext: "",
              counterText: "0/8",
              labelText: "Repassword",
              obscure: recheak,
              validator: (p) {
                if (p != password.text) {
                  return "Your Password is not the same";
                }
                if (p!.isNotEmpty && p.length < 8) {
                  return "Your Password is less than 8 number";
                }
                if (p.isNotEmpty && p.length == 8) {
                  return null;
                }
                if (p.isNotEmpty && p.length > 8) {
                  return "Your Password is Overflow";
                }
                if (p.isEmpty) {
                  return "Please Enter Your Password";
                }
                return null;
              },
              onTap: () {
                ref.watch(recheaker.notifier).state = !recheak;
              },
              suffixIcon: Icons.visibility,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  if (vaildkey.currentState!.validate() == true) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Loginscreen(sharedPreferences: sharedPreferences),
                        ),
                        (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Submit")),
          ]),
        ));
  }
}
