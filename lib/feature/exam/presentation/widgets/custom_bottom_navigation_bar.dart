import 'package:flutter/material.dart';
import 'package:quizz_app/core/resources/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.grey10,
        selectedItemColor: AppColors.primary,
        currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Result"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]
      ),
    );
  }
}
