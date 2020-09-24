import 'package:aplanet/constant.dart';
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
      showElevation: true,
      backgroundColor: Theme.of(context).primaryColor,
      selectedIndex: currentIndex,
      onItemSelected: onTap,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: whiteText,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.date_range),
          title: Text('Calendar'),
          activeColor: Colors.white,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.white,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.help),
          title: Text('Help'),
          activeColor: Colors.white,
        ),
      ],
    );
  }
}
