import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/reusable_widgets/animated_images.dart';
import 'package:stock_dashboard/reusable_widgets/login_button.dart';
import 'package:stock_dashboard/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.wb_sunny),
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedImages(),
            const Text(
              'Login\n using ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              textAlign: TextAlign.center,
            ),
           // login in using social networks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularImageButton(
                    imageUrl: 'assets/google.png',
                    onPressed: () {
                      AuthService().signInWithGoogle();
                    },
                    text: 'Google'),
                CircularImageButton(
                    imageUrl: 'assets/facebook.png',
                    onPressed: () {},
                    text: 'Facebook'),
                CircularImageButton(
                    imageUrl: 'assets/apple.png',
                    onPressed: () {},
                    text: 'Apple'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
