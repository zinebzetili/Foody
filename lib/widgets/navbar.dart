import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:recipe_app/screens/Search/search.dart'; // Import the SearchScreen
import 'package:recipe_app/screens/Home/Home.dart'; // Import the Home widget
import 'package:recipe_app/screens/Upload_recipe_step_one/upload_step_one.dart';
import 'package:recipe_app/screens/profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final Function(int) onIndexChanged;

  const CustomBottomNavigationBar({
    Key? key,
    required this.initialIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _currentIndex,
      height: 65,
      backgroundColor: Colors.transparent,
      color: const Color(0xffffb5607), // Change this to your desired active color
      buttonBackgroundColor:
          const Color(0xfffff9a6a), // Change this to your desired button color
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          widget.onIndexChanged(index);

          // Navigate to different screens based on index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
              break;
               case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadStepOne()),
              );
              break;
               case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
            // Add cases for other icons if needed
            default:
              break;
          }
        });
      },
      items: const <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.search, size: 30),
        Icon(Icons.file_upload, size: 30),
        Icon(Icons.person, size: 30),
      ],
    );
  }
}
