import 'package:recipe_app/screens/Account.dart';
import 'package:recipe_app/widgets/custom_option.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/navbar.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
   ProfileScreen({ 
   Key? key ,
   this.showFollowButtonProfile = false ,
  })  :  super(key : key) ; 
   bool showFollowButtonProfile ;
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.white,
       elevation: 0 ,
       actions : [ 
        Padding(
          padding: const EdgeInsets.only(right: 20 ),
          child : IconButton(
            onPressed:(){
               Navigator.push(context, MaterialPageRoute(builder:(context) => const AccountScreen() ,
               )
               );
            } , 
            icon: const Icon(
              Icons.settings,
              color :Colors.black ,
            ),
           ),
         ) ,
        ],
        leading: Padding(  
          padding : const EdgeInsets.only(left : 20 ) , 
          child : IconButton(
            onPressed: () {} ,
            icon: const Icon(
              Icons.arrow_back , 
              color :Colors.black ,
            ),
          ),
        )
      ), 
      body: SingleChildScrollView( 
      child :Column (
        children : [ 
          Container(
            color: Colors.white  ,
            child : const Padding(
              padding: EdgeInsets.symmetric(horizontal: 55) ,
              child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children : [
                Stack(
                  alignment: Alignment.bottomRight, 
                  children : [
                     CircleAvatar(
                       radius: 50 ,
                       backgroundColor: const Color(0xffffb5607),
                       backgroundImage: AssetImage("assets/man.png"),
                    ),
                     InkWell( 
                       child : CircleAvatar(
                       radius: 12 ,
                       backgroundColor:Color(0xffffb5607 ) ,
                       child : Icon( Icons.edit,
                       size: 15 , 
                       color: Colors.white ,
                       ), 
                      ), 
                     ),
                   ],
                 ), 
                    Padding(
                     padding : EdgeInsets.all(20.0) , 
                     child : Text (
                      "houari lacoste" ,
                       style :TextStyle(fontSize: 15 ,color: Colors.black) ,
                  ),
                 ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children : [
                      Column(
                        children: [
                          Text(
                           "32" ,
                           style: TextStyle(fontSize: 20),
                           ),
                           SizedBox(height: 15 ,) ,
                           Text(
                            "Recipes" , 
                            style:TextStyle(fontSize: 15 ,color :  Colors.black),
                           ) 
                          ], 
                        ),
                      Column(
                        children: [
                          Text(
                           "5400" ,
                           style: TextStyle(fontSize: 20),
                           ),
                           SizedBox(height: 15 ,) ,
                           Text(
                            "Followers" , 
                             style :TextStyle(fontSize: 15 ,color : Colors.black),
                           ) 
                          ], 
                        ), 
                      Column(
                        children: [
                          Text(
                           "50" ,
                           style: TextStyle(fontSize: 20),
                           ),
                           SizedBox(height: 15 ,) ,
                           Text(
                            "Following" , 
                            style :TextStyle(fontSize: 15 ,color :  Colors.black),
                           ) 
                          ], 
                        ),
                      ] ,
                    ),
                    SizedBox(height: 20,) ,  
                   //CustomButton(//onTap : (){} , 
                   //text : "follow " )
               ],
            ),
          ),
         ),
         const SizedBox(height: 8, ) , 
         Container(
          color: Colors.white, 
          padding: const EdgeInsets.symmetric(horizontal: 20), 
          child: Column(
            children: [
             const CustomTernaryOption() ,
             GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 1 ,
              shrinkWrap: true, 
              childAspectRatio: 1/1.125,
              children: List.generate(9, (index) =>const RecipeCard(recipeTitle: "acai", 
               recipeImageUrl: "assets/acai.jpg",
               userProfileImageUrl:"assets/man.png", 
               username: "houwari") ),
             )
          ]
          ),
         )
        ], 
      ),
    ),
     bottomNavigationBar: CustomBottomNavigationBar(
        initialIndex: 3,
        onIndexChanged: (index) {},
     )
    );
  }
}
        /*child: Column(
          children: [
            // Profile picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/pictures/profile_image.jpg"),
            ),
            const SizedBox(height: 15),
            // User name
            const Text(
              'Zineb',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            // Number of recipes, followers, and following
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '100',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Recipes'),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      '500',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Followers'),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      '200',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Following'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Tabs for My Recipes, Saved, and Liked
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(
                        text: 'My Recipes',
                      ),
                      Tab(
                        text: 'Saved',
                      ),
                      Tab(
                        text: 'Liked',
                      ),
                    ],
                    indicatorColor: Colors.orange,
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.black,
                  ),
                  // TabBarView for displaying different sections
                  SizedBox(
                    height: 500, // Set the height as needed
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          RecipeList(),
                          RecipeList(),
                          RecipeList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        initialIndex: 3,
        onIndexChanged: (index) {
          // Handle index change if needed
        },
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1, // Adjust the number of recipes as needed
      itemBuilder: (context, index) {
        return const RecipeCard(
          // Provide the necessary details for each recipe
         recipeTitle: 'recipe 1',
                        recipeImageUrl:
                            'assets/pictures/yae_miko___genshin_impact__dark_version__by_chunyaan_df1mgo2-pre.jpg',
                        userProfileImageUrl:
                            "assets/pictures/'Verstappen vecht voor P3'.jpg",
                        username: 'zineb',
        );
      },
    );
  }
}*/

