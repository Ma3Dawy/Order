import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen/forgetpasswordscreen.dart';
import 'package:flutter_application_1/homescreen/homescreen.dart';
import 'package:flutter_application_1/homescreen/signup.dart';
import 'package:flutter_application_1/box/custemtextfield.dart';
import 'package:flutter_application_1/widgets/provider/counter_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../box/local/i_local_storage_caller.dart';
import '../box/local/shared_pref_local_storage_caller.dart';

import '../widgets/loginmodel.dart';

// ignore: must_be_immutable

class Loginscreen extends ConsumerWidget {
  Loginscreen({
    super.key,
    required this.sharedPreferences,
  });
  final SharedPreferences sharedPreferences;

  final username = TextEditingController();
  final password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late final SharedPrefsLocalStorageCaller shared;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valid = ref.watch(countProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIbYzDjnJ--xM6Fkg8Ia5CQXZt8BCqC1rSDHxDFJ2u5OEdyNm7fArufDFxYajYMxo2b-g&usqp=CAU")),
              //  Center(child: Text("Log in",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 50),)),
              const SizedBox(
                height: 15,
              ),
              Coustemtextfield(
                controlar: username,
                maxline: 1,
                hinttext: "",
                width: 300,
                high: 70,
                labelText: "Username",
                obscure: false,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "Please Enter Your Username";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Coustemtextfield(
                controlar: password,
                maxline: 1,
                hinttext: "",
                width: 300,
                high: 70,
                counterText: "0/8",
                labelText: "Password",
                obscure: valid,
                validator: (p) {
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
                    return "please Enter Your Password";
                  }
                  return null;
                },
                onTap: () {
                  // ignore: invalid_use_of_protected_member
                  ref.watch(countProvider.notifier).state = !valid;
                },
                suffixIcon: Icons.visibility,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Forgetscreen()));
                  },
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate() == true) {
                      shared = SharedPrefsLocalStorageCaller(
                          sharedPreferences: sharedPreferences);

                      await shared.saveData(
                          key: 'user',
                          value: json.encode(LogInModel.toMap(
                              phone: username.text, password: password.text)),
                          dataType: DataType.string);

                      await shared
                          .restoreUserData(key: "user")
                          .then((v) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homescreen(
                                    user: v!,
                                    sharedPreferences: sharedPreferences),
                              ),
                              (route) => false));
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Signup(
                                  sharedPreferences: sharedPreferences,
                                )),
                        (route) => false);
                  },
                  style: const ButtonStyle(
                      iconSize: MaterialStatePropertyAll(50),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text("Creat Account",
                      style: TextStyle(
                        color: Colors.black,
                      )))
            ],
          ),
        ));
  }
}
