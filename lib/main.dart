import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/firebase_options.dart';
import 'package:stock_dashboard/screens/splash_screen.dart';

void main() async{
  // for using firebase for authentication
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // get material app for getx
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Dashboard',
      home: SplashScreen(),
    );
  }
}
