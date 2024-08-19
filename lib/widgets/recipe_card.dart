import 'package:flutter/material.dart';
import 'package:recipe_app/screens/Recipe_details/Recipe_details.dart';
import 'package:recipe_app/screens/profile-follow.dart';

class RecipeCard extends StatelessWidget {
  final String recipeTitle;
  final String recipeImageUrl;
  final String userProfileImageUrl;
  final String username;
  final bool isLiked;
  final bool isSaved;
  final int likesCount;
  final int commentsCount;

  const RecipeCard({
    Key? key,
    required this.recipeTitle,
    required this.recipeImageUrl,
    required this.userProfileImageUrl,
    required this.username,
    this.isLiked = false,
    this.isSaved = false,
    this.likesCount = 0,
    this.commentsCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilefollowScreen(), // Replace ProfileFollow() with your intended screen
                  ),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xffffb5607),
                    backgroundImage: AssetImage(userProfileImageUrl),
                    radius: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetails(
                    recipeTitle: recipeTitle,
                    recipeImageUrl: recipeImageUrl,
                  ),
                ),
              );
            },
            child: Image.asset(
              recipeImageUrl,
              fit: BoxFit.cover,
              height: 200.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetails(
                          recipeTitle: recipeTitle,
                          recipeImageUrl: recipeImageUrl,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    recipeTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comments',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : null,
                          ),
                          onPressed: () {
                            // Implement like functionality here
                          },
                        ),
                        const SizedBox(width: 8.0),
                        IconButton(
                          icon: Icon(
                            Icons.comment,
                            // Use your own comment icon or replace it with the appropriate one
                          ),
                          onPressed: () {
                            // Implement comment functionality here
                          },
                        ),
                        const SizedBox(width: 1.0), // Equal spacing
                        IconButton(
                          icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                          ),
                          onPressed: () {
                            // Implement save functionality here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
