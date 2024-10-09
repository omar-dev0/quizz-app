import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:quizz_app/feature/auth/ui/registration/registration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'di/di.dart';
void main() {
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
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
        initialRoute: RegistrationScreen.route,
        routes: {
          RegistrationScreen.route : (_)=>  RegistrationScreen(),
        },
      ),
    );
  }
}

