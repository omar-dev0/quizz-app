import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPress;
  const CustomButton({super.key,required this.text, required this.buttonColor, required this.textColor, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            side: const BorderSide(
                color: AppColors.primary
            ),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
           text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
