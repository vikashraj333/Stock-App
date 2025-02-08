import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/controllers/stocks_controller.dart';
import 'package:stock_dashboard/screens/login_screen.dart';
import 'package:stock_dashboard/services/auth_service.dart';

class UserScreen extends StatelessWidget {
  final StockController userController = Get.put(StockController());

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
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
      body: Center(
        child: Obx(() {
          String photoUrl = userController.photoUrl.value;
          String displayName = userController.displayName.value;
          String email = userController.email.value;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the user's profile picture (if available)
              photoUrl.isNotEmpty
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(photoUrl),
                    )
                  : const Icon(Icons.account_circle, size: 100),
              const SizedBox(height: 20),
              Text("Welcome, $displayName!",
                  style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              Text(email,
                  style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
             //log out button
              ElevatedButton(
                onPressed: () {
                  AuthService().signOut();
                  Get.to(const LoginScreen(),
                      transition: Transition.rightToLeft);
                },
                child: const Text('LogOut'),
              )
            ],
          );
        }),
      ),
    );
  }
}
