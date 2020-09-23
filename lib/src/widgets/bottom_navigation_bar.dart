import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class HomePageButtonNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  HomePageButtonNavigationBar({this.onTap, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      itemCornerRadius: 10,
      selectedIndex: currentIndex,
      onItemSelected: onTap,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.date_range),
          title: Text('Calandar'),
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.help),
          title: Text('Help'),
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}
