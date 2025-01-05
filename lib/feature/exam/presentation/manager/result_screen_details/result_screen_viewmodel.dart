import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/presentation/manager/result_screen_details/result_details_screen_states.dart';

@injectable
class ResultDetailsViewModel extends Cubit<ResultDetailsScreenState>{
  ResultDetailsViewModel():super(InitialState());
  List<int> selectedAnswers = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
}