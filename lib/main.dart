import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizz_app/core/bloc_observer/simple_bloc_observer.dart';
import 'package:quizz_app/core/constant/hive_box.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:quizz_app/feature/auth/ui/registration/registration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'di/di.dart';
void main() {
  configureDependencies();
import 'package:quizz_app/feature/auth/data/api/model/response/login_response.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';
import 'core/di/di.dart';

void setUp(){
  getIt.registerLazySingleton<Dio>(()=>Dio());
  configureDependencies();
}
void main() async{
  setUp();
  await Hive.initFlutter();
  Hive.registerAdapter(LoginResponseAdapter());
  await Hive.openBox<LoginResponse>(HiveBox.userBox);
  Bloc.observer = SimpleBlocObserver();
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
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
        initialRoute: RegistrationScreen.route,
        routes: {
          RegistrationScreen.route : (_)=>  RegistrationScreen(),
        },
      ),
      child: LoginScreen(),
    );
  }
}

