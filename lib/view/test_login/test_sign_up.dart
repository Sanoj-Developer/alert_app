import 'package:flutter/material.dart';
import 'package:khatri_alter/data/controller/user_controller/user_controller.dart';


class RegistrationView extends StatelessWidget {
  final RegistrationController controller = RegistrationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: controller.setName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: controller.setEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
  onChanged: controller.setPassword,
  obscureText: true,
  decoration: InputDecoration(labelText: 'Password'),
),   SizedBox(height: 16),
            Row(
              children: [
                Text('User Type: '),
                Radio(
                  value: 'Student',
                  groupValue: controller.userType,
                  onChanged: controller.setUserType,
                ),
                Text('Student'),
                Radio(
                  value: 'Alumni',
                  groupValue: controller.userType,
                  onChanged: controller.setUserType,
                ),
                Text('Alumni'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await controller.registerUser();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}