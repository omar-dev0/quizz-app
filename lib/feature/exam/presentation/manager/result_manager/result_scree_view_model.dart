import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_manager/result_screen_states.dart';

@injectable
class ResultScreenViewModel extends Cubit<ResultScreenStates>{
  ResultScreenViewModel(): super(InitialState());

}