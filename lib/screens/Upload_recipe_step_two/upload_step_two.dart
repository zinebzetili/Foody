import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/screens/Upload_recipe_step_two/ingredient_text_field.dart';
import 'package:recipe_app/screens/Upload_recipe_step_three/upload_step_three.dart';
import 'package:recipe_app/screens/Upload_recipe_step_one/upload_step_one.dart';
import 'package:recipe_app/screens/Home/Home.dart';

class UploadStepTwo extends StatefulWidget {
  @override
  _UploadStepTwoState createState() => _UploadStepTwoState();
}

class _UploadStepTwoState extends State<UploadStepTwo> {
  List<TextEditingController> ingredientControllers = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        toolbarHeight: 90.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              GestureDetector(
               onTap: () {
                 Navigator.push(
                 context,
                   MaterialPageRoute(builder: (context) =>  Home()),
                 );
               },
               child: const
            Text('Cancel', style: TextStyle(color: grey, fontSize: 20.0)),
             ),
            Text('2/3', style: TextStyle(color: grey, fontSize: 20.0)),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode()); // Dismiss keyboard
          },
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text('Ingredients', style: TextStyle(color: grey, fontSize: 20.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30.0),
                    for (int i = 0; i < ingredientControllers.length; i++)
                      Column(
                        children: [
                          IngredientTextField(
                            controller: ingredientControllers[i],
                            index: i,
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: _addIngredient,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          minimumSize: const Size(400, 60),
                          side: BorderSide(color: lightgreyColor, width: .5),
                        ),
                        child: Text(
                          '+ Ingredient',
                          style: TextStyle(
                            fontSize: 20,
                            color: grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Back',
                              backgroundColor: lightgrey,
                              foregroundColor: grey,
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UploadStepOne()),
                               );
                              },
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: CustomButton(
                              text: 'Next',
                              backgroundColor: orangeColor,
                              foregroundColor: whiteColor,
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UploadStepThree()),
                               );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addIngredient() {
    setState(() {
      ingredientControllers.add(TextEditingController());
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
