import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizz_app/core/di/di.dart';
import 'package:quizz_app/core/extensions/build_context_extensions.dart';
import 'package:quizz_app/feature/auth/presentation/profile/view_model/actions.dart';
import 'package:quizz_app/feature/auth/presentation/profile/view_model/profile_view_model.dart';
import 'package:quizz_app/feature/auth/presentation/profile/view_model/state.dart';
import 'package:quizz_app/feature/auth/presentation/profile/widget/update_button.dart';
import 'package:quizz_app/feature/auth/presentation/update_password/change_password.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = "ProfileScreen";
  ProfileViewModel profileVm = getIt.get<ProfileViewModel>();
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileVm,
      child: BlocConsumer<ProfileViewModel, ProfileState>(
        listener: (context, state) {
          if(state is NavigateToChnagePassword)
            {
              Navigator.pushNamed(context, ChangePassword.route);
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                context.locals.profile,
                style: context.appText.labelLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body:   Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 50.w,
                    backgroundColor: Colors.indigoAccent,
                  ),
                  SizedBox(height: 20.h,),
                   TextField(
                     controller: profileVm.userName,
                     decoration: InputDecoration(
                       labelText: context.locals.userName,
                     ),
                  ),
                  SizedBox(height: 24.h,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: profileVm.firstName,
                          decoration: InputDecoration(
                            labelText: context.locals.firstName,
                          ),
                        ),
                      ),
                      SizedBox(width: 17.w,),
                      Expanded(
                        child: TextField(
                          controller: profileVm.lastName,
                          decoration: InputDecoration(
                            labelText: context.locals.lastName,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h,),
                  TextField(
                    controller: profileVm.email,
                    decoration: InputDecoration(
                      labelText: context.locals.email,
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  TextField(
                    controller: profileVm.password,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: (){
                          profileVm.doEvent(ChangeButtonClicked());
                        },
                        child: Text(
                          context.locals.change,
                          style: context.appText.labelLarge!.copyWith(
                            fontSize: 12.sp,
                            color: context.appColors?.primary,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                      labelText: context.locals.password,
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  TextField(
                    controller: profileVm.phoneNumber,
                    decoration: InputDecoration(
                      labelText: context.locals.phoneNumber,
                    ),
                  ),
                  SizedBox(
                    height: 48.h ,
                  ),
                  const UpdateButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
