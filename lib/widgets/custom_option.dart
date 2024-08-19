import 'package:recipe_app/constants/colors1.dart';
import 'package:flutter/material.dart';

class CustomTernaryOption extends StatefulWidget {
  const CustomTernaryOption({Key? key}) : super(key: key);

  @override
  State<CustomTernaryOption> createState() => _CustomTernaryOptionState();
}

class _CustomTernaryOptionState extends State<CustomTernaryOption> {
  late int selectedTab; // 0 for left, 1 for middle, 2 for right

  @override
  void initState() {
    super.initState();
    selectedTab = 0; // Set the default selected tab
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: Colors.white,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTab = 0;
                  });
                },
                child: _buildTab("My Recipes", selectedTab == 0),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTab = 1;
                  });
                },
                child: _buildTab("Saved", selectedTab == 1),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTab = 2;
                  });
                },
                child: _buildTab("Liked", selectedTab == 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: TextStyle(color: isSelected ? primary : secondarytext),
        ),
        Container(
          height: isSelected ? 3 : 1,
          color: isSelected ? primary : secondarytext,
        ),
      ],
    );
  }
}
