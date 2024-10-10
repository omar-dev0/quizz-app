import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';

import 'core/di/di.dart';
void main() async{
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child)=> MaterialApp(
        theme: AppTheme.light,
        home: child,
      ),
      child: LoginScreen(),
    );
  }
}

class TestScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child:  Text(
            'show',
          ),
        ),
      ),
    );
  }

}