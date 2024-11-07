import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizz_app/core/bloc_observer/simple_bloc_observer.dart';
import 'package:quizz_app/core/constant/hive_box.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';
import 'package:quizz_app/feature/auth/presentation/profile/profile_screen.dart';
import 'package:quizz_app/feature/auth/presentation/update_password/change_password.dart';
import 'di/di.dart';
import 'feature/auth/presentation/registration/registration.dart';
void setUp(){
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
        initialRoute: ProfileScreen.route,
        routes: {
          RegistrationScreen.route : (_)=>  RegistrationScreen(),
          ProfileScreen.route : (_)=> ProfileScreen(),
          ChangePassword.route : (_)=>ChangePassword(),
        },
      ),
    );
  }
}

