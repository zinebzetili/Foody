import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/text_field_with_icon.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/commons/images.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/screens/Login/login.dart';
import 'package:recipe_app/screens/Home/Home.dart';
import 'package:recipe_app/screens/Verification_code/email_verification_code.dart';


 

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                background2, // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          // Shadowed Box
          Positioned(
            top:120,
            bottom: 60,
            left: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       
                      // Toggle Button
                       CupertinoSlidingSegmentedControl(
                       children: const {
                       0: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                       child: Text(
                       'Signup',
                       style: TextStyle(
                       color: orangeColor,
                       ),
                       ),
                       ),
                       1: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                       child: Text('Login'),
                       ),
                         },
                      groupValue: 0, // Replace with actual logic
                      onValueChanged: (int? index) {
  
                      if (index == 1) {
    
                     Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => const Login()),
                           );
                              }
                        },
                         ),
                           GestureDetector(
                 onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) =>  Home()),
                 );
               },
               child:
                   const Text(
                        'Skip',
                        style: TextStyle(fontSize: 18,  color:Colors.grey),
                      ),
              ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Email Field
                  const TextFieldWithIcon(
                    icon: Icons.email,
                    hintText: 'Email or Phone Number',
                  ),
                
                  // Username Field
                  const TextFieldWithIcon(
                    icon: Icons.person,
                    hintText: 'Username',
                  ),
                  // Password Field
                  const TextFieldWithIcon(
                    icon: Icons.lock,
                    hintText: 'Password',
                    isPassword: true,
                    hasEyeIcon: true,
                  ),
                  // Confirm Password Field
                  const TextFieldWithIcon(
                    icon: Icons.lock,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    hasEyeIcon: true,
                  ),
                  const SizedBox(height:10),

                  // Password Conditions
                  const Text('Your Password must contain:\n     •At least 8 characters\n     •Contains a special character\n     •Contains a number',
                  style:TextStyle(color:greyColor) ),
                  const SizedBox(height:20),
                   
                  // Signup Button
                 CustomButton(
                  text: 'Sign Up',
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmailVerificationCode()),
                    );
                },
                ),
                  const SizedBox(height: 16),
                  const Text('or continue with'),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Google signup logic
                    },
                    
                    style: ElevatedButton.styleFrom(backgroundColor: grey,
                    minimumSize:const Size(200, 45),  
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    ),
                    ),
                    child:const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(FontAwesomeIcons.google,  size: 15, color:whiteColor),
                         SizedBox(width: 8),
                         Text('Google',
                         style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,    
                         color: whiteColor,  
                         ),
                         ),
                      ],
                    ),
                  ),
                 const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

 