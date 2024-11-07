import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_states.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';
import 'package:quizz_app/feature/exam/presentation/widgets/subjects_list_view.dart';

class SubjectsBloc extends StatelessWidget {
  const SubjectsBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeScreenStates>(
      builder: (context, state) {
        if (state is SuccessState) {
          return const SubjectsListView();
        } else if (state is FailState) {
          Fluttertoast.showToast(
            msg: state.message,
            backgroundColor: AppColors.error,
            textColor: AppColors.white,
            toastLength: Toast.LENGTH_SHORT,
          );
        }
        else if(state is LoadingState){
          return SizedBox(
            height: 200,
            width: context.width,
            child: const Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            ),
          );
        }
        return const SubjectsListView();
      },
    );
  }
}
