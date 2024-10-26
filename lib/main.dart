import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/presentation/pages/home.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/di/di.dart';
import 'feature/exam/data/core/simple_observer.dart';
void main() async{
  configureDependencies();
  initHive();
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}

Future<void> initHive()async{
  await Hive.initFlutter();
  Hive.registerAdapter(SubjectItemEntityAdapter());
  await Hive.openBox<SubjectItemEntity>(AppConstant.kSubjectsHiveBox);
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
      child: HomeScreen(),
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