import 'dart:ffi';

import 'package:app/interfaces/i.filter.dart';
import 'package:app/widgets/filter.item.dart';
import 'package:flutter/material.dart';

class RegionsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegionsListState();
}

class RegionsListState extends State<RegionsList> {
  List<IFilter> regions = [
    IFilter(name: "All", iconPath: "assets/icons/coast.png"),
    IFilter(name: "Coast", iconPath: "assets/icons/coast.png"),
    IFilter(name: "West", iconPath: "assets/icons/west.png"),
    IFilter(name: "East", iconPath: "assets/icons/east.png"),
    IFilter(name: "Desert", iconPath: "assets/icons/desert.png"),
  ];
  int currentIdx = 0;
  void handlePress(idx) {
    setState(() {
      currentIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          itemCount: regions.length,
          itemBuilder: (context, index) => FilterItem(
              text: regions[index].name,
              iconPath: regions[index].iconPath,
              index: index,
              currentIdx: currentIdx,
              handlePress: handlePress)),
    );
  }
}
