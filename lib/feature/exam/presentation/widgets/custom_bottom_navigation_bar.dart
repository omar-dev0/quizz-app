import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:quizz_app/core/resources/colors.dart';
import 'package:quizz_app/feature/exam/presentation/manager/home_screen_actions.dart';
import 'package:quizz_app/feature/exam/presentation/manager/view_model.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            homeViewModel.setCurrentFragmentIndex(_currentIndex);
            homeViewModel.doAction(ChangeHomeCurrentFragmentAction());
          });
        },
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.grey10,
        selectedItemColor: AppColors.primary,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Elusive.home), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Elusive.edit), label: "Result"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
