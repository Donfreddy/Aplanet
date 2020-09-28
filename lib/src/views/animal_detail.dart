import 'package:aplanet/constant.dart';
import 'package:aplanet/src/widgets/home_bg_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:octo_image/octo_image.dart';

// ignore: must_be_immutable
class AnimalDetail extends StatefulWidget {
  var data;
  int index;

  AnimalDetail(this.data, this.index);

  @override
  _AnimalDetailState createState() => _AnimalDetailState();
}

class _AnimalDetailState extends State<AnimalDetail> {
  ScrollController scrollController;
  var animal;

  @override
  void initState() {
    animal = widget.data;
    print("this is my data");
    print(animal);
    print("this is my data");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeBackgroundColor(2.6),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Detail",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: Hero(
                    tag: "${widget.index}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(animal["images"][1]),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        ),
                        errorBuilder: OctoError.icon(color: Colors.red),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  animal["name"] ?? "Unknown",
                  style: TextStyle(
                    color: blackText,
                    fontSize: 24,
                  ),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  animal["sci_name"] ?? "Unknown",
                  style: TextStyle(color: greenText, fontSize: 16),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _characteristicCard("23K", "Population"),
                    _characteristicCard("200kg", "Weight"),
                    _characteristicCard("100cm", "Length"),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(width: 6.0),
                              Container(
                                  width: 20.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                  ))
                            ],
                          ),
                          Container(
                            width: screenWidth(context) / 2,
                            child: Text(
                              animal["status"] != null && animal["status"] != ""
                                  ? animal["status"].trim()
                                  : "Unknown",
                              softWrap: false,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Habitats",
                            style: TextStyle(fontSize: 24),
                          ),
                          Container(
                            width: screenWidth(context) / 2,
                            child: Text(
                              animal["babitats"] != null &&
                                      animal["babitats"] != ""
                                  ? animal["babitats"].trim()
                                  : "Unknown",
                              style: TextStyle(),
                              softWrap: false,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                animal["desc"] != ""
                    ? Text(
                        "Description",
                        style: TextStyle(fontSize: 24),
                      )
                    : Container(),
                SizedBox(height: 6),
                Container(
                  width: screenWidth(context),
                  child: Text(
                    animal["desc"] != null && animal["desc"] != ""
                        ? animal["desc"].trim()
                        : "Unknown",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _characteristicCard(String value, String name) {
    return Container(
      width: screenWidth(context) / 3.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: orangeColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(color: whiteText, fontSize: 18.0),
            ),
            Text(
              name,
              style: TextStyle(color: whiteText),
            ),
          ],
        ),
      ),
    );
  }
}
