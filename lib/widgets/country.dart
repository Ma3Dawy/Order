import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Country extends StatelessWidget {
  const Country({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CountryCodePicker(
              favorite: ['EG', 'FR'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              showFlag: false,
              alignLeft: false,
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
