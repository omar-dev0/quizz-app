import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizz_app/core/resources/app_constant.dart';
import 'package:quizz_app/feature/auth/data/data_source/cached_token.dart';
import 'package:quizz_app/feature/auth/domain/model/login_response_entity.dart';
import 'package:quizz_app/feature/auth/domain/model/user.dart' as domain;
import 'package:quizz_app/feature/auth/presentation/logout/logout_button.dart';
import 'package:quizz_app/feature/exam/presentation/pages/reset_password_screen.dart';

import '../../../../core/resources/colors.dart';


class ProfileScreen extends StatelessWidget {
  final UserEntity user;
  ProfileScreen({required this.user});
  @override
  Widget build(BuildContext context) {

    var box = Hive.box<CachedToken>(AppConstant.ktoken);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture
              const Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://example.com/profile.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 16,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Username Field
              _buildTextField("User name", user.username??""),
              SizedBox(height: 10),
              // First Name and Last Name
              Row(
                children: [
                  Expanded(
                    child: _buildTextField("First name", user.firstName??""),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField("Last name", user.lastName??""),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Email Field
              _buildTextField("Email", user.email??""),
              SizedBox(height: 10),
              // Password Field with Change Button
              _buildPasswordField("Password", context),
              SizedBox(height: 10),
              // Phone Number Field
              _buildTextField("Phone number", user.phone??""),
              SizedBox(height: 30),
              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Update action
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ), backgroundColor: Colors.grey, // Button color
                  ),
                  child: Text("Update"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
               LogoutButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }


// Inside the _buildPasswordField method
  Widget _buildPasswordField(String label, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to the Reset Password screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ResetPasswordScreenUi()),
            );
          },
          child: Text("Change"),
        ),
      ],
    );
  }

}
