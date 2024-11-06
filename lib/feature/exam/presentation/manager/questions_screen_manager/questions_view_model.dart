import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/questions_screen_manager/questions_screen_states.dart';

@injectable
class QuestionsScreenViewModel extends Cubit<QuestionsScreenStates>{
  QuestionsScreenViewModel(): super(InitialState());

}