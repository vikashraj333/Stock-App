import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/screens/user_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool isBackButton;
  const CustomAppBar({super.key, required this.title, required this.isBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      // show back button only when isBackButton is true
      automaticallyImplyLeading: isBackButton,
       actions: [
        // theme change
          IconButton(
            icon: const Icon(Icons.wb_sunny ),
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());     
            },
          ),
          // user screen icon
          IconButton(
            icon: const Icon(Icons.person ),
            onPressed: () {
               Get.to(UserScreen(),transition: Transition.rightToLeft);
            },
          ),
        ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}