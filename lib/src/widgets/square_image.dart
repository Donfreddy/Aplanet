import 'package:flutter/material.dart';

class SquareImages extends StatefulWidget {
  @override
  _SquareImagesState createState() => _SquareImagesState();
}

class _SquareImagesState extends State<SquareImages> {
  List<String> _circularImages = [
    "assets/img/1.jpg",
    "assets/img/2.jpg",
    "assets/img/1.jpg",
    "assets/img/2.jpg",
    "assets/img/1.jpg",
    "assets/img/2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: _circularImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage(_circularImages[index]),
                ),
                Text("Name $index")
              ],
            ),
          );
        },
      ),
    );
  }
}
