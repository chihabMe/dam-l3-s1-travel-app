import 'dart:ffi';

import 'package:app/interfaces/i.filter.dart';
import 'package:app/widgets/filter.item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegionsListState();
}

class RegionsListState extends State<CategoriesList> {
  List<IFilter> regions = [
    IFilter(name: "cafe", iconPath: "assets/icons/cafe.png"),
    IFilter(name: "restaurants", iconPath: "assets/icons/desert.png"),
    IFilter(name: "museums", iconPath: "assets/icons/museum.png"),
    IFilter(name: "historical sites", iconPath: "assets/icons/coliseum.png"),
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
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
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
