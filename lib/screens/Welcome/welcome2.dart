import 'package:flutter/material.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/commons/images.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/screens/Signup/signup.dart';
 

class Welcome2 extends StatelessWidget {
  const Welcome2({Key? key}) : super(key: key);

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
              image: AssetImage(background1),  
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  mylogo,
                  width: size.width * 1,
                  height: size.height * 0.3,
                  fit: BoxFit.contain,
                ),
               CustomButton(
                  text: 'Get started',
                  backgroundColor: goldColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                    Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => SignUp()),
                    );
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
