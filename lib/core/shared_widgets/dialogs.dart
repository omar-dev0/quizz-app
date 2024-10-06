import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizz_app/core/resources/assets_manger.dart';

abstract class Dialogs{
  static void alertDialog(
      {
        required String message,
        Widget? animation,
        String? negativeFeedback,
        String? positiveFeedback,
        VoidCallback? positiveAction,
        VoidCallback? negativeAction,
        Widget? icon,
        bool isClosed = true,
        required BuildContext context,
      }
      )
  {
    List<Widget> actions = [];
    if(positiveFeedback != null)
      {
        actions.add(ElevatedButton(onPressed: positiveAction, child: Text(positiveFeedback)));
      }
    if(negativeFeedback != null)
      {
        actions.add(ElevatedButton(onPressed: negativeAction, child: Text(negativeFeedback)));
      }
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: animation ?? icon,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message)
        ],
      ),

      actions: actions,
    ));

  }

  static void successDialog({required BuildContext context}){
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Lottie.asset(AnimationAssets.success)
    ));
  }

  static void loading({required BuildContext context}){
    showDialog(context: context, builder: (context)=> AlertDialog(
        title: Lottie.asset(
          height: MediaQuery.of(context).size.height*.2,
            AnimationAssets.loading),
    ),
      barrierDismissible: false
    );
  }
}