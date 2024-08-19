import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/screens/Upload_recipe_step_two/upload_step_two.dart';
import 'package:recipe_app/screens/Home/Home.dart';


class UploadStepOne extends StatefulWidget {
  @override
  _UploadStepOneState createState() => _UploadStepOneState();
}

class _UploadStepOneState extends State<UploadStepOne> {
  late final ImagePicker _imagePicker;
  late XFile? _imageFile = null;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

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
            Text('1/3', style: TextStyle(color: grey, fontSize: 20.0)),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: lightgreyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: _imageFile == null
                                  ? Text('Add cover photo',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: lightgreyColor,
                                          fontWeight: FontWeight.bold))
                                  : Image.file(File(_imageFile!.path)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(width: 22.0),
                        Text('Food Name',
                            style:
                                TextStyle(fontSize: 18.0, color: grey)),
                        SizedBox(height: 8.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter food name',
                            hintStyle: TextStyle(color: lightgreyColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: lightgreyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: orangeColor),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 16.0),
                          ),
                          maxLines: null,
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(width: 22.0),
                        Text('Description',
                            style:
                                TextStyle(fontSize: 18.0, color: grey)),
                        SizedBox(height: 8.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Tell a little about your food',
                            hintStyle: TextStyle(color: lightgreyColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: lightgreyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: orangeColor),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 16.0),
                          ),
                          maxLines: null,
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(width: 22.0),
                        Text('Cooking Duration',
                            style:
                                TextStyle(fontSize: 18.0, color: grey)),
                        SizedBox(height: 8.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter the duration',
                            hintStyle: TextStyle(color: lightgreyColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: lightgreyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: orangeColor),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                 child: Padding(
                 padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  text: 'Next',
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  onPressed: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => UploadStepTwo()),
                     );
                  },
                ),
              ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}
