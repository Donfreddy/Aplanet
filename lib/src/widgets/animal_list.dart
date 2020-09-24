//import 'package:aplanet/constant.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:flutter/material.dart';
//
//class AnimalsList extends StatefulWidget {
//  final AsyncSnapshot animalsSnapshot;
//  AnimalsList(this.animalsSnapshot);
//  @override
//  _AnimalsListState createState() => _AnimalsListState();
//}
//
//class _AnimalsListState extends State<AnimalsList> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 250.0,
//      child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//        itemCount: snapshot.data.length,
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            width: 180.0,
//            margin: EdgeInsets.symmetric(horizontal: 10.0),
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(20.0),
//              child: Stack(
//                fit: StackFit.expand,
//                children: [
//                  OctoImage(
//                    image: CachedNetworkImageProvider(
//                        '${snapshot.data[index]["images"][1]}'),
//                    placeholderBuilder: OctoPlaceholder.blurHash(
//                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
//                    ),
//                    errorBuilder: OctoError.icon(color: Colors.red),
//                    fit: BoxFit.cover,
//                  ),
//                  Positioned(
//                    //bottom: 0.0,
//                    child: Align(
//                      alignment: Alignment.bottomCenter,
//                      child: AnimatedContainer(
//                          duration: const Duration(milliseconds: 100),
//                          height: 100.0,
//                          decoration: BoxDecoration(
//                              gradient: LinearGradient(
//                            begin: Alignment.bottomCenter,
//                            end: Alignment(Alignment.bottomCenter.x,
//                                1 - Alignment.bottomCenter.y),
//                            colors: [Colors.black, Colors.black.withOpacity(0)],
//                          ))),
//                    ),
//                  ),
//                  Positioned(
//                    bottom: 6.0,
//                    left: 10,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Container(
//                          width: 170.0,
//                          child: Text(
//                            snapshot.data[index]['name'] ?? "N/A",
//                            style: TextStyle(fontSize: 16, color: whiteText),
//                            maxLines: 1,
//                            softWrap: false,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        ),
//                        Container(
//                          width: 150.0,
//                          child: Text(
//                            snapshot.data[index]["sciName"] ?? "N/A",
//                            style:
//                                TextStyle(color: orangeColor, fontSize: 10.0),
//                            maxLines: 1,
//                            softWrap: false,
//                            overflow: TextOverflow.ellipsis,
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
////                  Positioned(
////                    right: 12.0,
////                    child: Container(
////                        width: 20.0,
////                        child: CircleAvatar(
////                          backgroundColor: Colors.red.withOpacity(0.8),
////                        )),
////                  ),
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}
