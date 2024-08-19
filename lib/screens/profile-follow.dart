import 'package:recipe_app/constants/colors1.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/custom_button1.dart';
import 'package:recipe_app/widgets/custom_option.dart';
import 'package:recipe_app/widgets/navbar.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

class ProfilefollowScreen extends StatefulWidget {
  const ProfilefollowScreen({Key? key, this.showFollowButtonProfile = false})
      : super(key: key);

  final bool showFollowButtonProfile;

  @override
  _ProfilefollowScreenState createState() => _ProfilefollowScreenState();
}

class _ProfilefollowScreenState extends State<ProfilefollowScreen> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            /*child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),*/
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xffffb5607),
                          radius: 50,
                          backgroundImage: AssetImage(
                              "assets/maan.png"),
                        ),
                        InkWell(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xffffb5607),
                            child: Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Ali",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "32",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Recipes",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "5400",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Followers",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "50",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Following",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                      },
                      child: CustomButton(
                        text: isFollowing ? "Following" : "Follow",
                        color: isFollowing ? Colors.grey : primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  CustomTernaryOption(),
                  RecipeList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        initialIndex: 3,
        onIndexChanged: (index) {},
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  const RecipeList();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 1,
      shrinkWrap: true,
      childAspectRatio: 1 / 1.125,
      children: List.generate(
        9,
        (index) => const RecipeCard(
          recipeTitle: "salade",
          recipeImageUrl:
              "assets/salade.jpg",
          userProfileImageUrl: "assets/maan.png",
          username: "ali",
        ),
      ),
    );
  }
}
