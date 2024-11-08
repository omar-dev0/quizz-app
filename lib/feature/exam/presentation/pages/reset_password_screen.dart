import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset password"),
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
            // Current Password Field
            _buildPasswordTextField("Current password"),
            SizedBox(height: 10),
            // New Password Field
            _buildPasswordTextField("New password"),
            SizedBox(height: 10),
            // Confirm Password Field
            _buildPasswordTextField("Confirm password"),
            SizedBox(height: 30),
            // Update Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for updating the password
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

  Widget _buildPasswordTextField(String label) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
