import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['All', 'Carnivore', 'Herbivoire', 'Bird'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            HapticFeedback.vibrate();
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 20.0, // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? 20.0 : 0,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color:
                  index == selectedIndex ? Colors.orange : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
