import 'package:flutter/material.dart';
import 'screens/Home/Home.dart'; // Importing the Home widget
import 'package:recipe_app/screens/Welcome/welcome1.dart';
import 'package:recipe_app/screens/Password_recovery/reset_password.dart';
import 'package:recipe_app/screens/Upload_recipe_step_one/upload_step_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.white),
      ) ,
      home: Welcome1(), // Set the Home widget as the initial screen
    );
  }
}
