import 'package:flutter/material.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/text_field_with_icon.dart';
import 'package:recipe_app/screens/Login/login.dart';
 
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,  
      resizeToAvoidBottomInset: false, 
      body: SafeArea(
        child: SingleChildScrollView(
      child : Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Reset your password",
              style: TextStyle(
                color:grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
             const TextFieldWithIcon(
                    icon: Icons.lock,
                    hintText: 'Password',
                    isPassword: true,
                    hasEyeIcon: true,
                  ),
                  // Confirm Password Field
                  const TextFieldWithIcon(
                    icon: Icons.lock,
                    hintText: 'Confirm new password',
                    isPassword: true,
                    hasEyeIcon: true,
                  ),
                  const SizedBox(height: 30),
                   const Text('Your Password must contain:\n     •At least 8 characters\n     •Contains a special character\n     •Contains a number',
                  style:TextStyle(color:greyColor) ),
                  const SizedBox(height:40),
              CustomButton(
                  text: 'Done',
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const Login()),
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
