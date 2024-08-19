import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/recipe_card.dart';
import 'package:recipe_app/widgets/home_search_bar.dart' as mySearchBar;
import 'package:recipe_app/widgets/navbar.dart'; // Importing CustomBottomNavigationBar

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Color.fromARGB(255, 255, 255, 255), // Color for the box
            width: double.infinity, // Full width of the screen
            height: 100, // Increased height for the box containing the search bar and image
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0), // Adjusted padding
            child: Stack(
              children: [
                Positioned(
                  top: 20.0, // Adjust the top position of the image
                  left: 8.0,
                  child: Image.asset(
                    'assets/Foody.png', // Replace 'your_logo.png' with your image path
                    width: 80, // Set the width of the image as needed
                    height: 80, // Set the height of the image as needed
                    // You can adjust other properties of the image widget as per your requirements
                  ),
                ),
                Positioned.fill(
                  left: 120, // Adjust the left position of the search bar
                  child: mySearchBar.SearchBar(
                    onSearch: (String searchTerm) {
                      // Implement your search logic here using the searchTerm
                      // For example, filter recipes based on the searchTerm
                      // Perform search/filter operations as needed
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: const Divider(
              thickness: 4.0,
              height: 1.0,
              color: Color.fromARGB(255, 216, 220, 226),
            ),
          ),
 
          Expanded(
            child: ListView(
              children: [
                RecipeCard(
                  recipeTitle: 'Shawerma',
                  recipeImageUrl: 'assets/shawarma.jpg',
                  userProfileImageUrl: 'assets/maan.png',
                  username: 'Ali',
                  isLiked: true,
                  likesCount: 25,
                  commentsCount: 10,
                ),
                RecipeCard(
                  recipeTitle: 'Burger',
                  recipeImageUrl: 'assets/FfastFood.jpg',
                  userProfileImageUrl: 'assets/woman.png',
                  username: 'Safiya',
                  isLiked: false,
                  likesCount: 15,
                  commentsCount: 5,
                ),
                // Add more RecipeCards as needed
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        initialIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
            // Implement navigation based on the index if needed
          });
        },
      ),
    );
  }
}
