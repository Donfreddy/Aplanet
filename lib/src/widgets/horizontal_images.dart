import 'package:flutter/material.dart';

class HorizontalImages extends StatefulWidget {
  final List<dynamic> animals;
  HorizontalImages(this.animals);
  @override
  _HorizontalImagesState createState() => _HorizontalImagesState();
}

class _HorizontalImagesState extends State<HorizontalImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.animals.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 180.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.animals[index].images[1],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 14.0,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.animals[index].name ?? "",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 2,
                        ),
                        Text(
                          widget.animals[index].sciName ?? "",
                          style: TextStyle(color: Colors.orange),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12.0,
                    child: Container(
                        width: 20.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
