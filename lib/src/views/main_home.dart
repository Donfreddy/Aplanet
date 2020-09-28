import 'package:aplanet/constant.dart';
import 'package:aplanet/src/services/api.dart';
import 'package:aplanet/src/views/animal_detail.dart';
import 'package:aplanet/src/widgets/ShimmerList.dart';
import 'package:aplanet/src/widgets/animal_card.dart';
import 'package:aplanet/src/widgets/bottom_navigation_bar.dart';
import 'package:aplanet/src/widgets/category_list.dart';
import 'package:aplanet/src/widgets/home_bg_color.dart';
import 'package:aplanet/src/widgets/search_box.dart';
import 'package:aplanet/src/widgets/square_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  ////////////////////////Variable
  int _currentIndex = 0;
  PageController _pageController;

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
    animalsFuture = api.getAnimals();
//    getAnimal();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ////////////////////////Screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/bg_t.jpg"), fit: BoxFit.cover)),
          child: Stack(
            children: [
              HomeBackgroundColor(1.8),
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
                            },
                          ),
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
                            return Expanded(
                                child: Container(
                              height: 250.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimalCard(snapshot.data, index, () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AnimalDetail(
                                          snapshot.data[index], index);
                                    }));
                                  });
                                },
                              ),
                            ));
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
