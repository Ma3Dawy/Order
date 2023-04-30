import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Coustemtextfield extends StatelessWidget {
  final String? hinttext;
  final String? counterText;
  final String? pref;
  TextEditingController controlar = TextEditingController();
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final double? width;
  final double? high;
  final String? labelText;
  final int? maxlenght;
  final void Function()? onTap;
  // ignore: prefer_typing_uninitialized_variables
  final inputFormatters;
  final int? maxline;
  final IconData? icon2;
  final vaildkey = GlobalKey<FormState>();
  final bool? obscure;
  Coustemtextfield({
    super.key,
    this.hinttext,
    required this.controlar,
    this.validator,
    this.suffixIcon,
    this.onTap,
    this.obscure,
    this.inputFormatters,
    this.counterText,
    this.width,
    this.high,
    this.labelText,
    this.maxline,
    this.icon2,
    this.pref,
    this.maxlenght,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: high,
      child: TextFormField(
        maxLength: maxlenght,
        maxLines: maxline,
        textDirection: TextDirection.ltr,
        inputFormatters: inputFormatters,
        textAlign: TextAlign.justify,
        validator: validator,
        controller: controlar,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
            icon: Icon(icon2),
            counterText: counterText,
            prefixText: pref,
            prefixStyle: const TextStyle(color: Colors.black),
            hintText: "$hinttext",
            labelText: "$labelText",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: IconButton(onPressed: onTap, icon: Icon(suffixIcon))),
      ),
    );
  }
}
