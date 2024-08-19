import 'package:flutter/material.dart';
import 'package:recipe_app/commons/colors.dart';
import 'package:recipe_app/screens/Signup/validators.dart';

class TextFieldWithIcon extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool hasEyeIcon;
  final VoidCallback? onEyeIconTap;

  const TextFieldWithIcon({
    Key? key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.hasEyeIcon = false,
    this.onEyeIconTap,
  }) : super(key: key);

  @override
  _TextFieldWithIconState createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  bool _isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(widget.icon),
            Expanded(
              child: TextFormField(
                obscureText: !_isPasswordVisible && widget.isPassword,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: widget.hasEyeIcon
                         ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: orangeColor),
                  ),
                    hintStyle: const TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
                validator: (value) {
                String? errorText;
                if (widget.isPassword) {
                 errorText = Validator.validatePassword(value);
                  } else {
                  errorText = Validator.validateEmail(value);
                  }
                   return errorText;  
                  },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

}
