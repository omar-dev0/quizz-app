import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizz_app/core/bloc_observer/simple_bloc_observer.dart';
import 'package:quizz_app/core/resources/theme.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/answers_cached.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quizz_app/feature/auth/presentation/login/ui/login_screen.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/domain/entities/answer_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/answers_cached_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/cached_exam_result_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
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
    Hive.registerAdapter(SubjectCachedModelAdapter());
    Hive.registerAdapter(SubjectExamsCachedModelAdapter());
    Hive.registerAdapter(QuestionsCachedModelAdapter());
    Hive.registerAdapter(AnswersCachedAdapter());
    Hive.registerAdapter(AnswerCachedEntityAdapter());
    Hive.registerAdapter(CachedExamResultEntityAdapter());
    Hive.registerAdapter(ExamEntityAdapter());
    Hive.registerAdapter(AnswersEntityAdapter());
    if (!Hive.isBoxOpen(AppConstant.kSubjectsHiveBox)) {
      await Hive.openBox<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    }
    if (!Hive.isBoxOpen(AppConstant.kSubjectExamsHiveBox)) {
      await Hive.openBox<SubjectExamsCachedModel>(
          AppConstant.kSubjectExamsHiveBox);
    }
    if (!Hive.isBoxOpen(AppConstant.kQuestionsHiveBox)) {
      await Hive.openBox<QuestionsCachedModel>(AppConstant.kQuestionsHiveBox);
    }
    if (!Hive.isBoxOpen(AppConstant.kExamResult)) {
      await Hive.openBox<CachedExamResultEntity>(
          AppConstant.kExamResult); // Use the model type, not the adapter
    }
    if (!Hive.isBoxOpen(AppConstant.kAnswersResultHiveBox)) {
      await Hive.openBox<AnswerCachedEntity>(AppConstant.kAnswersResultHiveBox);
    }
    if(!Hive.isBoxOpen(AppConstant.kExamEntity)){
      await Hive.openBox<ExamEntity>(AppConstant.kExamEntity);
    }
    if(!Hive.isBoxOpen(AppConstant.kAnsewrEntity)){
      await Hive.openBox<AnswersEntityAdapter>(AppConstant.kAnsewrEntity);
    }
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
        initialRoute: LoginScreen.route,
        routes: {
          LoginScreen.route: (context) => LoginScreen(),
          RegistrationScreen.route: (_) => RegistrationScreen(),
          ProfileScreen.route: (_) => ProfileScreen(),
          ChangePassword.route: (_) => ChangePassword(),
        },
      ),
    );
  }
}
