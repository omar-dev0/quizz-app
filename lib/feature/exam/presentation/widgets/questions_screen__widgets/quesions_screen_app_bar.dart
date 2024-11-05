import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors.dart';

class QuesionsScreenAppBar extends StatefulWidget {
  const QuesionsScreenAppBar({super.key});

  @override
  State<QuesionsScreenAppBar> createState() => _QuesionsScreenAppBarState();
}

class _QuesionsScreenAppBarState extends State<QuesionsScreenAppBar> {
  Timer? _timer;
  int _minutes = 30;
  int _seconds = 0;


  void _startTimer(){
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer){
      setState(() {
        if(_seconds == 0 && _minutes == 0){
          timer.cancel();
        }else if(_seconds == 0){
          _minutes--;
          _seconds = 59;
        }else{
          _seconds--;
        }
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _startTimer();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const SizedBox(width: 6,),
            Text("Exam",style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
        Row(
          children: <Widget>[
            Image.asset(ImageAssets.timerImage),
            const SizedBox(width: 6,),
            Text("$_minutes:${_seconds.toString().padLeft(2,'0')}", style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.timerColor,)),
          ],
        )
      ],
    );
  }
}
