import 'package:flutter/material.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/text_field_with_icon.dart';
import 'package:recipe_app/screens/Password_recovery/password_recovery_verification_code.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});
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
              "Password Recovery",
              style: TextStyle(
                color:grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            const TextFieldWithIcon(
                    icon: Icons.email,
                    hintText: 'Email or Phone Number',
                  ),
            const SizedBox(height: 100),
              CustomButton(
                  text: 'Next',
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PasswordRecoveryVerificationCode()),
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
