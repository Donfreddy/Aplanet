import 'package:aplanet/src/widgets/bottom_navigation_bar.dart';
import 'package:aplanet/src/widgets/category_list.dart';
import 'package:aplanet/src/widgets/home_bg_color.dart';
import 'package:aplanet/src/widgets/horizontal_images.dart';
import 'package:aplanet/src/widgets/search_box.dart';
import 'package:aplanet/src/widgets/square_image.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

num offsetToOpacity(
    {double currentOffset, double returnMax = 1, double maxOffset}) {
  return (currentOffset * returnMax) / maxOffset;
}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _pageController;

  ScrollController scrollController;
  AnimationController controller;
  AnimationController opacityController;
  Animation<double> opacity;

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

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  // void viewEventDetail(Event event) {
  //   Navigator.of(context).push(
  //     PageRouteBuilder(
  //       opaque: false,
  //       barrierDismissible: true,
  //       transitionDuration: Duration(milliseconds: 300),
  //       pageBuilder: (BuildContext context, animation, __) {
  //         return FadeTransition(
  //           opacity: animation,
  //          // child: EventDetailPage(event),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          
          children: [
            HomeBackgroundColor(opacity),
            SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Logo",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            height: 40,
                            child: VerticalDivider(
                              thickness: 2,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aplanet",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                "We love the planet",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.white),
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
                    HorizontalImages(),
                     SizedBox(height: 20.0),
                    SquareImages(),
                  
                    
                    // ListView.builder(itemBuilder: null)
                  ],
                ),
              ),
            ),
          ],
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
