import 'package:education_app/utils/color.dart';
import 'package:flutter/material.dart';

import 'featured_screen.dart';

class EducationAppMainPage extends StatefulWidget {
  const EducationAppMainPage({super.key});

  @override
  State<EducationAppMainPage> createState() => _EducationAppMainPageState();
}

class _EducationAppMainPageState extends State<EducationAppMainPage> {

  int selectedIndex = 0;

  static final List<Widget> _selectedPage = [
    FeaturedScreen(),
    Center(child: Text("Learning")),
    Center(child: Text("Wishlist")),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedPage[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor1,
        iconSize: 26,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.star),
            icon: Icon(Icons.star_border),
            label: "Featured",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.play_circle),
            icon: Icon(Icons.play_circle_outline),
            label: "Learning",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
