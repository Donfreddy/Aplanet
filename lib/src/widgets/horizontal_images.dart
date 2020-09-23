import 'package:flutter/material.dart';

class HorizontalImages extends StatefulWidget {
  @override
  _HorizontalImagesState createState() => _HorizontalImagesState();
}

class _HorizontalImagesState extends State<HorizontalImages> {
  List<String> _imageList = [
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
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imageList.length,
        itemBuilder: (BuildContext cotext, int index) {
          return Container(
            width: 180.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    _imageList[index],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 14.0,
                    left: 10,
                    
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Africa Lion",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ), Text(
                        "South Africa",
                        style: TextStyle(color: Colors.orange),
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
