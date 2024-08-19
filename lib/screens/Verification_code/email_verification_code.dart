import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/handle_focus.dart';
import 'package:recipe_app/widgets/timer_manager.dart';
import 'package:recipe_app/screens/Home/Home.dart';

  

class EmailVerificationCode extends StatefulWidget {
  const EmailVerificationCode({Key? key}) : super(key: key);
  @override
  _EmailVerificationCodeState createState() => _EmailVerificationCodeState();
}

class _EmailVerificationCodeState extends State<EmailVerificationCode> {
  int minutes = 3;
  int seconds = 0;
  late Timer timer;
  late HandleFocus focusManager;
  late TimerManager timerManager;

  @override
  void initState() {
    super.initState();
    timerManager = TimerManager(onTick: _updateTimer, initialMinutes: 3, initialSeconds: 0);
    focusManager = HandleFocus(6);
  }

  @override
  void dispose() {
    timerManager.dispose();
    focusManager.dispose();
    super.dispose();
  }

   void _updateTimer(int newMinutes, int newSeconds) {
    setState(() {
      minutes = newMinutes;
      seconds = newSeconds;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,  
      resizeToAvoidBottomInset: false, 
      body: SafeArea(
        child: SingleChildScrollView(
        child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
    if (focusManager != null) {   
      if (event is RawKeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          focusManager.moveFocus(true);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          focusManager.moveFocus(false);
        }
      }
    }
  },
      child : Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Check your email",
              style: TextStyle(
                color:grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "We have sent the code to your email",
              style: TextStyle(
                color: grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 50),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40,
                  child: TextFormField(
                    focusNode: focusManager.focusNodes[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        focusManager.moveFocus(true);
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Code Expires in: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
              style: TextStyle(
                color: (minutes == 0 && seconds == 0) ? Colors.red : grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
             CustomButton(
                  text: 'Verify',
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    );
                },
                ),
                const SizedBox(height: 30),
              CustomButton(
                  text: 'Send again',
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                    //Navigator.push(
                    //context,
                   // MaterialPageRoute(builder: (context) => ThirdPage()),
                   // );
                },
                ),
          ],
        ),
      ),
    ),
    ),
    ),
    );
  }
}
