import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
    );
  }
}
