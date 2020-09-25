import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIvoiceList extends StatefulWidget {
  @override
  __ShimmerIvoiceListState createState() => __ShimmerIvoiceListState();
}

class __ShimmerIvoiceListState extends State<ShimmerIvoiceList> {
  double containerWidth;
  double containerHeight = 15;
  double shimmerWith = 0.60;
  int offset = 0;
  int time = 800;
  int timeAnimation = 6500;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 300.0,
          width: 200,
          child: Shimmer.fromColors(
            highlightColor: Colors.grey,
            baseColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 300.0,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 15,
                    width: 150,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 15,
                    width: 80,
                  )
                ],
              ),
            ),
            period: Duration(milliseconds: 805),
          ),
        );
      },
    );
  }
}
