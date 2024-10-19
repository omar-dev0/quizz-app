import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        filled: false,
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
