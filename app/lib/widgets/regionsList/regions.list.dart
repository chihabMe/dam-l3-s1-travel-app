import 'dart:ffi';

import 'package:app/widgets/regionsList/region.item.dart';
import 'package:flutter/material.dart';

class RegionsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegionsListState();
}

class RegionsListState extends State<RegionsList> {
  List<String> regions = ["all", "constantine", "oran", "biskra"];
  int currentIdx = 0;
  void handlePress(idx) {
    setState(() {
      currentIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RegionItem(
              name: regions[0],
              currentIdx: currentIdx,
              handlePress: handlePress,
              index: 0,
            ),
            RegionItem(
              name: regions[1],
              currentIdx: currentIdx,
              handlePress: handlePress,
              index: 1,
            ),
            RegionItem(
              name: regions[2],
              currentIdx: currentIdx,
              handlePress: handlePress,
              index: 2,
            ),
            RegionItem(
              name: regions[3],
              currentIdx: currentIdx,
              handlePress: handlePress,
              index: 3,
            ),
          ]),
    );
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   padding: EdgeInsets.all(10),
    //   itemBuilder: (context, index) =>
    //       Text("hi", style: TextStyle(color: Colors.black)),
    //   itemCount: 3,
    // );
  }
}
