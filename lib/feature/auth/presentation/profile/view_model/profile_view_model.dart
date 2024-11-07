import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/auth/presentation/profile/view_model/actions.dart';
import 'package:quizz_app/feature/auth/presentation/profile/view_model/state.dart';


@injectable
class ProfileViewModel extends Cubit<ProfileState>
{
  @factoryMethod
  ProfileViewModel() : super(ProfileInitState());
  final TextEditingController firstName = TextEditingController(text: 'Omar');
final TextEditingController lastName = TextEditingController(text: 'Osama');
final TextEditingController email = TextEditingController(text: 'oo143043@gmail.com');
final TextEditingController userName = TextEditingController(text: 'Omar02');
final TextEditingController password = TextEditingController(text: '111100000111');
final TextEditingController phoneNumber = TextEditingController(text: '01017599365');

void doEvent(ProfileActions action)
{
  switch (action) {

    case ChangeButtonClicked():
     emit(NavigateToChnagePassword());
  }
}


}