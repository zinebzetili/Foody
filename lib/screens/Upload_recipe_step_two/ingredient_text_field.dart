import 'package:flutter/material.dart';
import 'package:recipe_app/commons/colors.dart';

class IngredientTextField extends StatelessWidget {
  final TextEditingController controller;
  final int index;

  const IngredientTextField({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.0, // Adjust the width as needed
          child: Center(
            child: Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: grey,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter ingredient',
              hintStyle: TextStyle(color: lightgreyColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: lightgreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: orangeColor, width: 0.5),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            ),
            maxLines: null,
          ),
        ),
      ],
    );
  }
}
