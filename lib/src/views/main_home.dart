import 'package:aplanet/constant.dart';
import 'package:aplanet/src/models/animal.dart';
import 'package:aplanet/src/services/api.dart';
import 'package:aplanet/src/widgets/ShimmerList.dart';
import 'package:aplanet/src/widgets/bottom_navigation_bar.dart';
import 'package:aplanet/src/widgets/category_list.dart';
import 'package:aplanet/src/widgets/home_bg_color.dart';
import 'package:aplanet/src/widgets/search_box.dart';
import 'package:aplanet/src/widgets/square_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

num offsetToOpacity(
    {double currentOffset, double returnMax = 1, double maxOffset}) {
  return (currentOffset * returnMax) / maxOffset;
}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {
  ////////////////////////Variable
  int _currentIndex = 0;
  PageController _pageController;

  var animals = new List<Animal>();

  ScrollController scrollController;
  AnimationController controller;
  AnimationController opacityController;
  Animation<double> opacity;
  API api = new API();
  Future animalsFuture;

  ///////////////////////////Methods
  getAnimal() {
//    API.getAnimals().then((res) {
//      print(res);
//      setState(() {
//        Iterable list = json.decode(res.body);
//        print(list);
//        animals = list.map((data) => Animal.fromJson(data)).toList();
//        print(animals.length);
//      });
//    }).catchError((onError) => print(onError.toString()));
  }

  @override
  void initState() {
    scrollController = ScrollController();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    opacityController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: opacityController,
    ));
    scrollController.addListener(() {
      opacityController.value = offsetToOpacity(
          currentOffset: scrollController.offset,
          maxOffset: scrollController.position.maxScrollExtent / 2);
    });
    animalsFuture = api.getAnimals();
//    getAnimal();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    opacityController.dispose();
    super.dispose();
  }

//  void viewEventDetail() {
//    Navigator.of(context).push(
//      PageRouteBuilder(
//        opaque: false,
//        barrierDismissible: true,
//        transitionDuration: Duration(milliseconds: 300),
//        pageBuilder: (BuildContext context, animation, __) {
//          return FadeTransition(
//            opacity: animation,
//            child: EventDetailPage(),
//          );
//        },
//      ),
//    );
//  }

  //////////////Screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/bg_t.jpg"), fit: BoxFit.cover)),
          child: Stack(
            children: [
              HomeBackgroundColor(opacity),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aplanet",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                "We love the planet",
                                style:
                                    TextStyle(fontSize: 10, color: orangeColor),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.notifications,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                HapticFeedback.vibrate();
                              }),
                        ],
                      ),
                    ),
                    //SizedBox(height: 20.0),
                    // Text(
                    //   "Explore Animals",
                    //   style: TextStyle(fontSize: 35, color: Colors.white),
                    // ),
                    SizedBox(height: 20.0),
                    SearchBox(onChanged: (value) {
                      HapticFeedback.vibrate();
                    }),
                    SizedBox(height: 20.0),
                    CategoryList(),
                    SizedBox(height: 20.0),
                    FutureBuilder(
                        future: animalsFuture,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Expanded(child: ShimmerIvoiceList());
                          } else {
                            if (snapshot.data.length <= 0) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("No Animal Available"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            } else {
                              return Expanded(
                                  child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 180.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          OctoImage(
                                            image: CachedNetworkImageProvider(
                                                '${snapshot.data[index]["images"][1]}'),
                                            placeholderBuilder:
                                                OctoPlaceholder.blurHash(
                                              'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                            ),
                                            errorBuilder: OctoError.icon(
                                                color: Colors.red),
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            //bottom: 0.0,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment(
                                                        Alignment
                                                            .bottomCenter.x,
                                                        1 -
                                                            Alignment
                                                                .bottomCenter
                                                                .y),
                                                    colors: [
                                                      Colors.black,
                                                      Colors.black
                                                          .withOpacity(0)
                                                    ],
                                                  ))),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 6.0,
                                            left: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 170.0,
                                                  child: Text(
                                                    snapshot.data[index]
                                                            ['name'] ??
                                                        "N/A",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: whiteText),
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  width: 150.0,
                                                  child: Text(
                                                    snapshot.data[index]
                                                            ["sciName"] ??
                                                        "N/A",
                                                    style: TextStyle(
                                                        color: orangeColor,
                                                        fontSize: 10.0),
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                  );
                                },
                              ));
                            }
                          }
                        }),
//                    Expanded(child: HorizontalImages(animals)),
                    SizedBox(height: 20.0),
                    SquareImages(),
                    // ListView.builder(itemBuilder: null)
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: HomePageButtonNavigationBar(
          onTap: (index) {
            HapticFeedback.vibrate();
            setState(() => _currentIndex = index);
          },
          currentIndex: _currentIndex,
        ));
  }
}
