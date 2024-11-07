import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizz_app/core/bloc_observer/simple_bloc_observer.dart';
import 'package:quizz_app/core/constant/hive_box.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/answers_cached.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quizz_app/feature/auth/data/api/model/response/login/login_response.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/presentation/pages/main_screen.dart';
import 'core/di/di.dart';
import 'package:quizz_app/feature/auth/presentation/profile/profile_screen.dart';
import 'package:quizz_app/feature/auth/presentation/update_password/change_password.dart';
import 'feature/auth/presentation/registration/registration.dart';

void main() async {
  configureDependencies();
  await initHive();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(LoginResponseAdapter());
    Hive.registerAdapter(SubjectCachedModelAdapter());
    Hive.registerAdapter(SubjectExamsCachedModelAdapter());
    Hive.registerAdapter(QuestionsCachedModelAdapter());
    Hive.registerAdapter(AnswersCachedAdapter());
    await Hive.openBox<LoginResponse>(HiveBox.userBox);
    await Hive.openBox<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    await Hive.openBox<SubjectExamsCachedModel>(AppConstant.kSubjectExamsHiveBox);
    await Hive.openBox<QuestionsCachedModel>(AppConstant.kQuestionsHiveBox);
    print("Hive initialized and boxes opened successfully.");
  } catch (e) {
    print("Error initializing Hive: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
        initialRoute: MainScreen.route,
        routes: {
          LoginScreen.route: (context) => LoginScreen(),
          RegistrationScreen.route: (_) => RegistrationScreen(),
          ProfileScreen.route: (_) => ProfileScreen(),
          ChangePassword.route: (_) => ChangePassword(),
          MainScreen.route : (_)=>MainScreen(),
        },
      ),
    );
  }
}
