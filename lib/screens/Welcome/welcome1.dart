import 'package:flutter/material.dart';
import 'package:recipe_app/commons/images.dart';
import 'package:recipe_app/screens/Welcome/welcome2.dart';

class Welcome1 extends StatefulWidget {
  const Welcome1({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome1> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 3 seconds before navigating to the second page
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,  
          height: size.height, 
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background1), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  mylogo,
                  width: size.width * 0.9,
                  height: size.height * 0.4,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
