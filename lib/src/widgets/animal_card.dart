import 'package:animations/animations.dart';
import 'package:aplanet/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

// ignore: must_be_immutable
class AnimalCard extends StatefulWidget {
  var animalsSnapshot;
  int index;
  VoidCallback openContainer;

  AnimalCard(this.animalsSnapshot, this.index, this.openContainer);
  @override
  _AnimalCardState createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.openContainer,
      child: Container(
        width: 180.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Hero(
          tag: "${widget.index}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                OctoImage(
                  image: CachedNetworkImageProvider(
                      '${widget.animalsSnapshot[widget.index]["images"][1]}'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  //bottom: 0.0,

                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 100.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment(Alignment.bottomCenter.x,
                              1 - Alignment.bottomCenter.y),
                          colors: [Colors.black, Colors.black.withOpacity(0)],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6.0,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170.0,
                        child: Text(
                          widget.animalsSnapshot[widget.index]['name'] ??
                              "Unknown",
                          style: TextStyle(fontSize: 16, color: whiteText),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 150.0,
                        child: Text(
                          widget.animalsSnapshot[widget.index]["sci_name"] ??
                              "Unknown",
                          style: TextStyle(color: orangeColor, fontSize: 10.0),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
//                  Positioned(
//                    right: 12.0,
//                    child: Container(
//                        width: 20.0,
//                        child: CircleAvatar(
//                          backgroundColor: Colors.red.withOpacity(0.8),
//                        )),
//                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
