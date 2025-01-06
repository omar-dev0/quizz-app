

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/one_exam_result/one_exam_result_states.dart';

import 'one_exam_result_actions.dart';

@injectable
class OneExamResultViewModel extends Cubit<OneExamResultState>{
  OneExamResultViewModel():super(InitialState());

  void doActions(OneExamResultActions action) {
    switch (action) {
      case GoToExamResultDetailsAction():
        emit(GoToResultDetailState());
        break;
    }
  }

}