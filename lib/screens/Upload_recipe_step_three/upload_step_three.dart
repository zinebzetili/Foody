import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/screens/Upload_recipe_step_three/step_text_field.dart';
import 'package:recipe_app/screens/Upload_recipe_step_two/upload_step_two.dart';
import 'package:recipe_app/screens/Home/Home.dart';


class UploadStepThree extends StatefulWidget {
  @override
  _UploadStepThreeState createState() => _UploadStepThreeState();
}

class _UploadStepThreeState extends State<UploadStepThree> {
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
            Text('3/3', style: TextStyle(color: grey, fontSize: 20.0)),
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
                    Text('Steps', style: TextStyle(color: grey, fontSize: 20.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30.0),
                    for (int i = 0; i < ingredientControllers.length; i++)
                      Column(
                        children: [
                          StepTextField(
                            controller: ingredientControllers[i],
                            index: i,
                          ),
                          SizedBox(height: 20.0),
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
                          '+ Step',
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
                                MaterialPageRoute(builder: (context) => UploadStepTwo()),
                               );
                              },
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: CustomButton(
                              text: 'Upload',
                              backgroundColor: orangeColor,
                              foregroundColor: whiteColor,
                              onPressed: () {
                                // Navigator.push(
                                // context,
                                // MaterialPageRoute(builder: (context) => RecipePage()),
                              //  );
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
