import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  final String recipeTitle;
  final String recipeImageUrl; // Add the recipe image URL or path

  // Constructor for the RecipeDetails
  const RecipeDetails({
    Key? key,
    required this.recipeTitle,
    required this.recipeImageUrl, // Receive the recipe image URL or path
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch recipe details from the database based on this.recipeTitle
    // For now, display default details

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recipe Title: $recipeTitle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Display recipe image
            Image.asset(
              recipeImageUrl,
              fit: BoxFit.cover,
              width: double.infinity, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 20),
            // Display other details such as ingredients, instructions, etc.
            // Add more widgets here to show recipe details fetched from the database
          ],
        ),
      ),
    );
  }
}
