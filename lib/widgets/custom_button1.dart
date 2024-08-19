import 'package:recipe_app/constants/colors1.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key  ,
    this.color = primary ,
    required this.text , 
   }) : super(key: key ); 
   String? text ; 
   Color? color ; 

  @override
  Widget build(BuildContext context) {
  return Container(
    height: 56,
    width: double.infinity,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
}