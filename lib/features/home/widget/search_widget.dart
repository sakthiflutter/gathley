import 'package:flutter/material.dart';
import 'package:gatherly/utill/custom_themes.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: textRegular.copyWith(
          fontWeight: FontWeight.w100,
          color: Colors.grey.shade500
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        prefixIcon: Icon(Icons.search,color: Colors.grey.shade500,),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
        ),
      ),
    );
  }
}
