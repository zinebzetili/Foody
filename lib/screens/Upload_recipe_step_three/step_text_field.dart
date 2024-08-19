import 'package:flutter/material.dart';
import 'package:recipe_app/commons/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class StepTextField extends StatefulWidget {
  final TextEditingController controller;
  final int index;

  const StepTextField({required this.controller, required this.index});

  @override
  _StepTextFieldState createState() => _StepTextFieldState();
}

class _StepTextFieldState extends State<StepTextField> {
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
    return Column(
  children: [
    Row(
      children: [
        SizedBox(
          width: 30.0,
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
                  '${widget.index + 1}',
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
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: 'Enter step',
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
    ),
    SizedBox(height: 10.0),
  GestureDetector(
  onTap: _pickImage,
  child: Container(
    margin: EdgeInsets.only(left: 37.0),
    height: 100.0,
    decoration: BoxDecoration(
      border: Border.all(color: lightgreyColor),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: _imageFile == null
          ? Text(
              'Add a picture',
              style: TextStyle(
                fontSize: 16.0,
                color: lightgreyColor,
                fontWeight: FontWeight.bold,
              ),
            )
          :  Image.file(File(_imageFile!.path)),
            
    ),
  ),
),

  ],
);

  }
}
