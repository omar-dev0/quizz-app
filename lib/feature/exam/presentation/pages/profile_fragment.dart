import 'package:flutter/material.dart';

import '../../../auth/presentation/forget_password/widgets/reset_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
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
                        "https://example.com/profile.jpg"), // Replace with your image URL
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
            _buildTextField("User name", "Mohamed_Ahmed123"),
            SizedBox(height: 10),
            // First Name and Last Name
            Row(
              children: [
                Expanded(
                  child: _buildTextField("First name", "Mohamed"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildTextField("Last name", "Ahmed"),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Email Field
            _buildTextField("Email", "Mohamed098@gmail.com"),
            SizedBox(height: 10),
            // Password Field with Change Button
            _buildPasswordField("Password", context),
            SizedBox(height: 10),
            // Phone Number Field
            _buildTextField("Phone number", "1234567890987"),
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
          ],
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
          onPressed: () {// Change password action
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
            );
          },
          child: Text("Change"),
        ),
      ],
    );
  }
}
