import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///this class help us to generate a list of all the operation in one bill
///@author Ndeme Yvan
///@date 20/02/2020
///Contributors : Ndeme yvan,
///
class ShimmerIvoiceList extends StatefulWidget {
  BuildContext context;
  ShimmerIvoiceList(this.context);
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
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;
        return Card(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.012,
              right: MediaQuery.of(context).size.width * 0.012,
              top: MediaQuery.of(context).size.height * 0.02),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300],
                child: Container(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.2,
                            color: Colors.grey,
                          ),
                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.grey,
                          ),
                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                period: Duration(milliseconds: 805),
              )),
        );
      },
    );
  }
}
