import 'package:flutter/material.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({super.key});

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            }),
        Text(
          "Remember me",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 13),

        )
      ],
    );
  }
}
