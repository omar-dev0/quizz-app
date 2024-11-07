import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors.dart';

class TimerEndDialog extends StatelessWidget {
  final VoidCallback onPressed;
  const TimerEndDialog({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(ImageAssets.timerEnd)),
                Text(
                  "Time out!!",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.error),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                "View score",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}